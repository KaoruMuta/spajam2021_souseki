import 'package:flutter/material.dart';
import 'package:spajam2021_souseki/ui/create_screen.dart';
import 'package:spajam2021_souseki/ui/home_screen.dart';
import 'package:spajam2021_souseki/ui/message_screen.dart';
import 'package:spajam2021_souseki/ui/receive_screen.dart';
import 'package:spajam2021_souseki/ui/send_screen.dart';
import 'package:spajam2021_souseki/ui/signup_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO: ログインステータス(tokenの有無)に対してinitial Routeを変える
      initialRoute: '/signup',
      title: 'Flutter Demo',
      routes: <String, WidgetBuilder>{
        '/': (context) => const HomeScreen(),
        '/signup': (context) => const SignupScreen(),
        '/create': (context) => const CreateScreen(),
        '/send': (context) => const SendScreen(),
        '/receive': (context) => const ReceiveScreen(),
        '/message': (context) => const MessageScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
