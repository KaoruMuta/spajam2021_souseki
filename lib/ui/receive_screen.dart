// 受信ボックス画面
import 'package:flutter/material.dart';
import 'package:spajam2021_souseki/api/api_client.dart';
import 'package:spajam2021_souseki/entity/message.dart';
import 'package:spajam2021_souseki/response/send_message_response.dart';

class ReceiveScreen extends StatefulWidget {
  const ReceiveScreen({Key? key}) : super(key: key);

  @override
  State<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  List<Message>? _messages;

  @override
  void initState() {
    super.initState();

    Future(() async {
      final List<Message>? messages = await ApiClient().loadReceivedMessage();
      setState(() {
        _messages = messages;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/message');
              },
              child: const Text(
                "内容を見る",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "ホームへ",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
