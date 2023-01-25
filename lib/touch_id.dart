import 'package:flutter/material.dart';
import 'package:voting_app/api/finger_print_authentification_api.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:voting_app/success.dart';
import 'package:voting_app/fail.dart';
import 'package:voting_app/models/condidat.dart';
import 'package:voting_app/Singleton/singleton_data_access_layer.dart';
import 'package:platform_device_id/platform_device_id.dart';

var dataAccessLayer = SingletonDataAccessLayer();
String fakeDeviceId = '02662E79-E342-521C-98EA-D4C18B61FEF3';

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
            String deviceId =
                await PlatformDeviceId.getDeviceId ?? fakeDeviceId;
            if (dataAccessLayer.alreadyVoted(widget.candidate, deviceId)) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const Fail(),
                ),
              );
            } else {
              dataAccessLayer.addPhoneVote(widget.candidate, deviceId);
              dataAccessLayer.incrementVote(widget.candidate);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const Success(),
                  ));
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
                    TextStyle(color: const Color(0x00FFFFFF).withOpacity(0.76)),
                  ),
                ),
              ),
              Center(
                child: Image.asset("assets/reader.png"),
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
      ),
    );
  }

  @override
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
