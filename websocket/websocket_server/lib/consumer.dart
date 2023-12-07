import 'dart:io';

void main(List<String> arguments) async {
  var socket = await WebSocket.connect('ws://localhost:8080/ws');

  socket.listen(
    (message) {
      print('Mensagem do servidor: $message');
    },
    onDone: () {
      print('Conexão WebSocket fechada');
    },
  );

  // Envie uma mensagem para o servidor (pode ser qualquer coisa)
  socket.add('Olá do Cliente ${arguments[0]}: Terminal ${arguments[0]}');
}
