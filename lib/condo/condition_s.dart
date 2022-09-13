// import 'package:flutter/material.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:websocket/condo/main_page.dart';

// class Circular extends StatelessWidget {
//   final _channel = WebSocketChannel.connect(
//     // Uri.parse('wss://echo.websocket.events'),
//     Uri.parse('ws://10.0.2.2:5000'),
//   );

//   Circular({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: StreamBuilder(
//         stream: _channel.stream,
//         builder: (context, snapshot) {
//           print(
//               'This is snapshot connection state ${snapshot.connectionState}');

//           /// We are waiting for incoming data data
//           ///
//           /// We have an active connection and we have received data
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (snapshot.hasData) {
//             print(snapshot.data);
//             return Center(
//               child: Text('data is there'),
//             );
//           }

//           /// When we have closed the connection
//           if (snapshot.connectionState == ConnectionState.done) {
//             Text('nope');
//           }

//           /// For all other situations, we display a simple "No data"
//           /// message
//           return const Center(
//             child: Text('No data'),
//           );
//         },
//       ),
//     );
//   }
// }
