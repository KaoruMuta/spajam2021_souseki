import 'package:flutter/material.dart';
import 'package:spajam2021_souseki/api/api_client.dart';
import 'package:spajam2021_souseki/entity/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> _publishedUser = [];

  @override
  void initState() {
    super.initState();

    // Load all posts
    // Future(() async {
    //   List<User> publishedUser = await ApiClient().loadPublishedUser();
    //   setState(() {
    //     _publishedUser = publishedUser;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            ElevatedButton(
              // style: ElevatedButton.styleFrom(
              //   primary: Colors.white,
              //   onPrimary: Colors.black,
              //   shape: const CircleBorder(),
              // ),
              onPressed: () {
                Navigator.pushNamed(context, '/create');
              },
              child: const Text(
                "投稿画面へ",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/receive');
              },
              child: const Text(
                "受信ボックスへ",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
