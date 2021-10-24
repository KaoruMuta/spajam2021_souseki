// 投稿作成問題
import 'package:flutter/material.dart';
import 'package:spajam2021_souseki/api/api_client.dart';
import 'package:spajam2021_souseki/ui/receive_screen.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         const TextField(
    //           keyboardType: TextInputType.multiline,
    //           maxLines: null,
    //         ),
    //         ElevatedButton(
    //           onPressed: () {
    //             Navigator.pushNamed(context, '/send');
    //           },
    //           child: const Text(
    //             "送信",
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
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
                  title: '送る',
                ),
                Stack(alignment: Alignment.center, children: [
                  Image.asset(
                    'images/letter.png',
                    width: 280,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextField(
                      // TODO: この辺をいい感じにする
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: 5,
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
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
                    IconButton(
                      icon: Image.asset('images/send.png'),
                      iconSize: 140,
                      onPressed: () {
                        Navigator.pushNamed(context, '/send');
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
