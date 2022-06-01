import 'dart:math';
import 'package:flutter/material.dart';
import 'package:voting_app/api/FingerPrintAuthentificationApi.dart';
import 'package:device_id/device_id.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:voting_app/success.dart';
import 'package:voting_app/fail.dart';
import 'package:voting_app/models/condidat.dart';
import 'package:voting_app/Singleton/SingletonDataAccessLayer.dart';

var dataAccessLayer = SingletonDataAccessLayer();

class TouchID extends StatefulWidget {
  final CondidatDetails candidate;
  const TouchID({Key? key, required this.candidate}) : super(key: key);

  @override
  State<TouchID> createState() => _TouchIDState();
}

class _TouchIDState extends State<TouchID> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: GestureDetector(
        onTap: () async {
          final isAuthenticated = await LocalAuthApi.authenticate();
          if (isAuthenticated) {
            String deviceid = await DeviceId.getID;
            if (dataAccessLayer.alreadyVoted(widget.candidate, deviceid)) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => Fail(),
                ),
              );
            } else {
              dataAccessLayer.addPhoneVote(widget.candidate, deviceid);
              dataAccessLayer.incrementVote(widget.candidate);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => Success(),
                ),
              );
            }
          }
        },
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
              Center(
                child: Image.asset("assets/reader.png"),
              ),
              SizedBox(
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
      ),
    );
  }

  void initState() {
    super.initState();
    _activateListeners();
  }

  void _activateListeners() {
    FirebaseDatabase.instance.reference().onValue.listen((event) {
      var data = event.snapshot.value;
      var temporaryDataAccessLayer = SingletonDataAccessLayer();
      temporaryDataAccessLayer.setData(data);
    });
  }
}
