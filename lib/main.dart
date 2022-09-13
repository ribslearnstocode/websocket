import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'condo/condition_s.dart';
import 'condo/main_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'WebSocket Demo';
    return const MaterialApp(
      title: title,
      home: MyHomePage(
        title: title,
      ),
    );
  }
}
