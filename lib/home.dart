import 'package:flutter/material.dart';
import 'package:voting_app/components/vote_widget.dart';
import 'package:voting_app/data/dummy_votes.dart';

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
        itemCount: listOfVotes.length,
        itemBuilder: (context, index) => Vote(
          vote: listOfVotes[index],
        ),
      ),
    );
  }
}
