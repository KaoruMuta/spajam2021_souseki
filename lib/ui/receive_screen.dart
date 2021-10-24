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
      setState(() {
        _messages = messages;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/background5.png'),
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
                const TitleRed(title: '受信箱'),
                _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Flexible(
                        child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    mainAxisSpacing: 0),
                            itemCount: _messages.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/message',
                                      arguments: _messages[index]);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Stack(
                                    children: <Widget>[
                                      Image.asset('images/mail.png'),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 80, top: 60),
                                          child: Text(
                                            _messages[index].senderUser.name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 80, top: 60),
                                            child: Text(
                                              _messages[index].publicationDate,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset('images/keiji.png'),
                      iconSize: 140,
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                    ),
                    IconButton(
                      icon: Image.asset('images/mailbox.png'),
                      iconSize: 140,
                      onPressed: () {},
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

class MessageItem extends StatelessWidget {
  final Message message;

  const MessageItem({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(message.text);
  }
}

class TitleRed extends StatelessWidget {
  final String title;

  const TitleRed({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Image.asset(
        'images/title_red.png',
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
