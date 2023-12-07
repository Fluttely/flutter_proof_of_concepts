import 'dart:io';

void main() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  print('Servidor WebSocket escutando na porta ${server.port}');

  List<WebSocket> clients = [];

  await for (HttpRequest req in server) {
    if (req.uri.path == '/ws') {
      var socket = await WebSocketTransformer.upgrade(req);
      clients.add(socket);
      print('Cliente conectado. Total de clientes: ${clients.length}');

      socket.listen((message) {
        print('Mensagem recebida: $message');
        for (var client in clients) {
          if (client != socket) {
            client.add('Mensagem de outro cliente: $message');
          }
        }
      }, onDone: () {
        clients.remove(socket);
        print('Cliente desconectado. Total de clientes: ${clients.length}');
      });
    } else {
      req.response
        ..write(
            'Este servidor suporta apenas conexões WebSocket no caminho /ws')
        ..close();
    }
  }
}
