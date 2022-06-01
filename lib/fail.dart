import 'package:flutter/material.dart';
import 'package:voting_app/home.dart';

class Fail extends StatelessWidget {
  const Fail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0x00181717),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Image.asset(
                  'assets/vote.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: RichText(
                text: TextSpan(
                  style: theme.textTheme.headline2,
                  children: const <TextSpan>[
                    TextSpan(text: 'Already voted'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 50),
              child: Text(
                "You can only vote once",
                style: theme.textTheme.bodyText1,
              ),
            ),
            SizedBox(
                height: 60,
                width: 220,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const Home(),
                      ),
                    );
                  },
                  child: Text("OK"),
                ))
          ],
        ),
      ),
    );
  }
}
