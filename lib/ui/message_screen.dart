// いらないです
import 'package:flutter/material.dart';
import 'package:spajam2021_souseki/context.dart';
import 'package:spajam2021_souseki/entity/message.dart';
import 'package:spajam2021_souseki/ui/receive_screen.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  Message? get _message => context.args<Message>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final message = _message;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/background3.png'),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                const TitleRed(
                  title: 'お手紙',
                ),
                Stack(alignment: Alignment.center, children: [
                  Image.asset(
                    'images/letter.png',
                    width: 320,
                  ),
                  if (message != null) Text(message.text), //TODO: マルチラインにしたい
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset('images/back.png'),
                      iconSize: 140,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
