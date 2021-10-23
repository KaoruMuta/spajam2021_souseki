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
  // Region _region = null;

  @override
  void initState() {
    super.initState();

    Future(() async {
      final List<Region> regions = await ApiClient().loadRegions();
      setState(() {
        _regions = regions;
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
            TextFormField(
              decoration: const InputDecoration(
                labelText: "名前", // ラベル
              ),
              onChanged: (value) {
                _name = value;
              },
            ),
            // TODO: Add picker
            ElevatedButton(
              onPressed: () async {
                // トークン登録
                Token? token = await ApiClient().register(_name, 1);
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setString("token", token!.token!);
                Navigator.pushNamed(context, '/');
              },
              child: const Text(
                "登録",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

