import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:websocket/condo/condition_s.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  bool isshow = false;
  final _channel = WebSocketChannel.connect(
    // Uri.parse('wss://echo.websocket.events'),
    Uri.parse('ws://10.0.2.2:5000'),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  child: TextFormField(
                    controller: _controller,
                    decoration:
                        const InputDecoration(labelText: 'Send a message'),
                  ),
                ),
                const SizedBox(height: 24),
                StreamBuilder(
                  stream: _channel.stream,
                  builder: (context, snapshot) {
                    setState(() {
                      isshow = false;
                    });
                    return Text(snapshot.hasData ? '${snapshot.data}' : '');
                  },
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _sendMessage,
            tooltip: 'Send message',
            child: const Icon(Icons.send),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
        isshow
            ? Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.withOpacity(0.5),
                child: Center(child: CircularProgressIndicator()),
              )
            : Container()
      ],
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add("start ${Uri.parse(_controller.text)}");
    }
    setState(() {
      isshow = true;
    });
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }
}
