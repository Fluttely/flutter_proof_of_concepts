import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Future<File> _downloadAndSavePdf(String url, String filename) async {
    var response = await http.get(Uri.parse(url));
    var dir = await getApplicationDocumentsDirectory();
    File file = File("${dir.path}/$filename");
    await file.writeAsBytes(response.bodyBytes, flush: true);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: Center(
        child: FutureBuilder<File>(
            future: _downloadAndSavePdf(
                'https://api-sandbox.transfeera.com/pub/receipt/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0cmFuc2Zlcl9pZCI6IjEyOTQwNDgiLCJyZWNlaXB0X3R5cGUiOiJ0cmFuc2ZlZXJhIiwiYmF0Y2hfdHlwZSI6IlRSQU5TRkVSRU5DSUEiLCJpYXQiOjE3MDE2MjA3NjIsImV4cCI6MTcwNjgwNDc2Mn0.Zw6k2Ge6UKq6MKKKxUaoWjhEvBZK5hPY5ft8tyxK_i0',
                'localfile.pdf'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return PDFView(
                    filePath: snapshot.data!.path,
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
