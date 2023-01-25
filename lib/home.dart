import 'package:flutter/material.dart';
import 'package:voting_app/components/vote_widget.dart';
import 'package:voting_app/models/vote.dart';
import 'package:voting_app/Singleton/singleton_data_access_layer.dart';
import 'package:firebase_database/firebase_database.dart';

var dataAccessLayer = SingletonDataAccessLayer();
var voteList = dataAccessLayer.getVoteList();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 150,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Text(
              'Welcome !',
              style: theme.textTheme.headline1,
            ),
          )),
      body: ListView.builder(
        itemCount: voteList.length,
        itemBuilder: (context, index) => Vote(
          vote: VoteDetails(
              voteList[index].name, "10/10/2022", voteList[index].voteId),
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
      setState(() {
        dataAccessLayer = temporaryDataAccessLayer;
        voteList = dataAccessLayer.getVoteList();
      });
    });
  }
}
