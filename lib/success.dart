import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  final String userName;
  const Success({Key? key, required this.userName}) : super(key: key);

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
            Text(
              "Successful!",
              style: theme.textTheme.headline2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 50),
              child: RichText(
                text: TextSpan(
                  text: 'Welcome ',
                  style: theme.textTheme.bodyText1,
                  children: <TextSpan>[
                    TextSpan(text: userName),
                    const TextSpan(text: '! \nYour vote has been registered'),
                  ],
                ),
              ),
            ),
            SizedBox(
                height: 60,
                width: 220,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("OK"),
                ))
          ],
        ),
      ),
    );
  }
}
