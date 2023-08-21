import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream getLoadingMessages() {
    final List messages = <String>[
      'Loading movies ...',
      'Shoping popcorn !',
      'Loading popular movies',
      'OjDå jag väntar så mycket...',
      'Jag är ledsen.'
    ];
    return Stream.periodic(const Duration(milliseconds: 1200),
        (computationCount) {
      return messages[computationCount];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Wait please...'),
      const SizedBox(height: 10),
      const CircularProgressIndicator(
        strokeWidth: 2,
      ),
      const SizedBox(
        height: 10,
      ),
      StreamBuilder(
        stream: getLoadingMessages(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('loading ..');
          return Text(snapshot.data!);
        },
      ),
    ]));
  }
}
