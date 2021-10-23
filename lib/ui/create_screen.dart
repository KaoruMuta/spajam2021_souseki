import 'package:flutter/material.dart';
import 'package:spajam2021_souseki/api/api_client.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/send');
              },
              child: const Text(
                "送信",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
