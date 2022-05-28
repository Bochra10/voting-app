import 'package:flutter/material.dart';
import 'package:voting_app/success.dart';

class TouchID extends StatefulWidget {
  const TouchID({Key? key}) : super(key: key);

  @override
  State<TouchID> createState() => _TouchIDState();
}

class _TouchIDState extends State<TouchID> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Touch ID",
                style: theme.textTheme.headline1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60, left: 20, right: 20),
              child: Text(
                'Place and hold your finger on the fingerprint reader ',
                style: theme.textTheme.bodyText1!.merge(
                  TextStyle(color: const Color(0xFFFFFF).withOpacity(0.76)),
                ),
              ),
            ),
            //FUNCTION ONLONG PRESS FOR FINGERPRINT DISCOVERY AND TO TAKE A DECISION REDIRECT TO SUCCESS OR FAIL
            GestureDetector(
              child: Center(
                child: Image.asset("assets/reader.png"),
              ),
              onLongPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Success(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              "One moment...",
              style: theme.textTheme.subtitle2,
            ))
          ],
        ),
      ),
    );
  }
}
