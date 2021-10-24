// 登録画面
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spajam2021_souseki/api/api_client.dart';
import 'package:spajam2021_souseki/entity/region.dart';
import 'package:spajam2021_souseki/entity/token.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  List<Region> _regions = [];
  String _name = "";
  int _regionID = 1;
  // Region _region = null;

  @override
  void initState() {
    super.initState();

    pushHomeIfTokenExists();

    Future(() async {
      final List<Region> regions = await ApiClient().loadRegions();
      setState(() {
        _regions = regions;
      });
    });
  }

  void pushHomeIfTokenExists() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final _token = await pref.getString('token');
    if (_token != null && _token.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/background4.png'),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: "名前", // ラベル
                    focusColor: Colors.yellow,
                    // fillColor: Colors.orange,
                    // filled: true,
                  ),
                  // decoration: InputDecoration(fillColor: Colors.orange, filled: true),
                  onChanged: (value) {
                    _name = value;
                  },
                ),
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: "地域ID", // ラベル
                    focusColor: Colors.yellow,
                  ),
                  onChanged: (value) {
                    _regionID = 1;
                  },
                ),
                SizedBox(
                  height: 100,
                ),
                // TODO: Add picker
                InkWell(
                  onTap: () async {
                    Token? token = await ApiClient().register(_name, _regionID);
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    await pref.setString("token", token!.token!);
                    Navigator.pushNamed(context, '/');
                  },
                  child: Stack(alignment: Alignment.center, children: [
                    Image.asset(
                      'images/start.png',
                      width: 320,
                    ),
                    Text(
                      '文通をはじめる',
                      style: TextStyle(fontSize: 26),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
