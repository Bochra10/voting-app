import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

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
                  'assets/success.png',
                  width: 120,
                ),
              ),
            ),
            Text(
              "Successful!",
              style: theme.textTheme.headline2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 50),
              child: Text(
                "Welcome flen! \nYour vote has been registered",
                style: theme.textTheme.bodyText1,
              ),
            ),
            SizedBox(
                height: 60,
                width: 220,
                child: TextButton(
                  onPressed: () {},
                  child: Text("OK"),
                ))
          ],
        ),
      ),
    );
  }
}
