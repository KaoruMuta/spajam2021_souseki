// 送信完了画面（アニメーションのところ）
import 'package:flutter/material.dart';
import 'package:spajam2021_souseki/api/api_client.dart';
import 'package:spajam2021_souseki/response/send_message_response.dart';
import 'package:spajam2021_souseki/ui/receive_screen.dart';

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
      final SendMessageResponse? response =
          await ApiClient().sendMessage("", 1);
      setState(() {
        _waitingPeriod = response!.waitingPeriod;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/background1.png'),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SendRed(
                  title: '2日かかります',
                ),
                InkWell(
                  child: Image.asset(
                    'images/post.png',
                    width: 130,
                  ),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SendRed extends StatelessWidget {
  final String title;

  const SendRed({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Image.asset(
        'images/title.png',
        width: 360,
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 26),
        ),
      )
    ]);
  }
}
