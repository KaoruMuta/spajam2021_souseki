// 受信ボックス画面
import 'package:flutter/material.dart';
import 'package:spajam2021_souseki/api/api_client.dart';
import 'package:spajam2021_souseki/entity/message.dart';

class ReceiveScreen extends StatefulWidget {
  const ReceiveScreen({Key? key}) : super(key: key);

  @override
  State<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  List<Message> _messages = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    Future(() async {
      setState(() {
        _isLoading = true;
      });
      final List<Message> messages = await ApiClient().loadReceivedMessage();
      print('AAAAAAAA called');
      setState(() {
        _messages = messages;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return MessageItem(message: Message());
                  }),
      //     ElevatedButton(
      //       onPressed: () {
      //         Navigator.pushNamed(context, '/message');
      //       },
      //       child: const Text(
      //         "内容を見る",
      //       ),
      //     ),
      //     Image.asset('images/mail'),
      //     ElevatedButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       child: const Text(
      //         "ホームへ",
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final Message message;

  const MessageItem({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('AAAAAAAAAAAAAAA');
  }
}
