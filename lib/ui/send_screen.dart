// 送信完了画面（アニメーションのところ）
import 'package:flutter/material.dart';
import 'package:spajam2021_souseki/api/api_client.dart';
import 'package:spajam2021_souseki/response/send_message_response.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({Key? key}) : super(key: key);

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {

  int _waitingPeriod = 0;

  @override
  void initState() {
    super.initState();

    Future(() async {
      // TODO: テキストと送信者idいれる
      final SendMessageResponse? response = await ApiClient().sendMessage("", 1);
      setState(() {
        _waitingPeriod = response!.waitingPeriod;
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
            Text("$_waitingPeriod日かかるでしょう"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text(
                "戻る",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
