import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

late WebSocket socket;
final ValueNotifier<List<String>> chat = ValueNotifier([]);
String value = '';
void addMessage(String message) {
  chat.value = List.from(chat.value)..add(message);
}

void main() async {
  socket = await WebSocket.connect('ws://localhost:8080/ws');

  socket.listen(
    (message) {
      log('Mensagem do servidor: $message');
      addMessage('Mensagem do servidor: $message');
    },
    onDone: () {
      addMessage('Conexão WebSocket fechada');
    },
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ValueListenableBuilder<List<String>>(
                  valueListenable: chat,
                  builder: (context, value, child) {
                    return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(value[index]),
                        );
                      },
                    );
                  },
                ),
              ),
              TextField(
                onChanged: (val) {
                  value = val;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // const value = 'Olá do Cliente 3:iPhone';
                  // Envie uma mensagem para o servidor (pode ser qualquer coisa)
                  socket.add(value);
                  addMessage(value);
                },
                child: const Text('Send Message to the server'),
              ),
              const SizedBox(height: 64)
            ],
          ),
        ),
      ),
    );
  }
}
