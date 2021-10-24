// ユーザ一覧画面
import 'package:flutter/material.dart';
import 'package:spajam2021_souseki/api/api_client.dart';
import 'package:spajam2021_souseki/entity/region.dart';
import 'package:spajam2021_souseki/entity/user.dart';
import 'package:spajam2021_souseki/ui/receive_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> _users = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    Future(() async {
      setState(() {
        _isLoading = true;
      });
      // final List<User> users = await ApiClient().loadPublishedUser();
      final List<User> users = [
        User(
          id: "1",
          name: "名前",
          region: Region(id: 1, name: "東京"),
        ),
      ];
      setState(() {
        _users = users;
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
          image: AssetImage('images/background2.png'),
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
                  title: '募集一覧',
                ),
                _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Flexible(
                        child: ListView.builder(
                          itemCount: _users.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/create',
                                    arguments: _users[index]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: TitleYellow(
                                  title: _users[index].name,
                                  region: _users[index].region.name,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Image.asset('images/keiji.png'),
                      iconSize: 140,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset('images/mailbox.png'),
                      iconSize: 140,
                      onPressed: () {
                        Navigator.pushNamed(context, '/receive');
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

class TitleYellow extends StatelessWidget {
  final String title;
  final String region;

  const TitleYellow({Key? key, required this.title, required this.region})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Image.asset(
        'images/title_yellow.png',
        width: 320,
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 18.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 26),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Text(
          region,
          style: TextStyle(fontSize: 15),
        ),
      )
    ]);
  }
}
