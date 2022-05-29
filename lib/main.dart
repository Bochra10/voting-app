import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:voting_app/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:voting_app/Singleton/SingletonDataAccessLayer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 35,
              color: Colors.white),
          headline2: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 28,
              color: Colors.white),
          // headline3: for texts inside GestureDetector
          headline3: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Colors.white),
          subtitle1: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 25,
              color: Colors.white),
          subtitle2: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.white),
          bodyText1: TextStyle(
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
              fontSize: 17.5,
              color: Colors.white),
          bodyText2: TextStyle(
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 24, 23, 23),
        scaffoldBackgroundColor: Color.fromARGB(255, 24, 23, 23),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 35, 33, 33),
            alignment: AlignmentDirectional.center,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            textStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.white),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: Color(0x00FFB61D)),
          ),
          hintStyle: TextStyle(
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.white),
          contentPadding: EdgeInsets.only(top: 16, left: 20),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    _activateListeners();
  }

  void _activateListeners() {
    FirebaseDatabase.instance.reference().onValue.listen((event) {
      var data = event.snapshot.value;
      var dataAccessLayer = SingletonDataAccessLayer();
      dataAccessLayer.setData(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Onboarding();
  }
}
