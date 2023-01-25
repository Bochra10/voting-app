import 'package:flutter/material.dart';
import 'package:voting_app/components/condidat_widget.dart';
import 'package:voting_app/models/condidat.dart';
import 'package:voting_app/Singleton/singleton_data_access_layer.dart';
import 'package:firebase_database/firebase_database.dart';

var dataAccessLayer = SingletonDataAccessLayer();
List<dynamic> voteList = [];

class Condidats extends StatefulWidget {
  final String voteId;
  final String voteName;
  const Condidats({Key? key, required this.voteId, required this.voteName})
      : super(key: key);

  @override
  State<Condidats> createState() => _CondidatsState();
}

class _CondidatsState extends State<Condidats> {
  @override
  Widget build(BuildContext context) {
    voteList = dataAccessLayer.getCandidatelist(widget.voteId);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 150,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 50,
            ),
            child: RichText(
              text: TextSpan(
                  style: theme.textTheme.headline1,
                  children: [TextSpan(text: widget.voteName)]),
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset("assets/Home icon.png"))
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: voteList.length,
        itemBuilder: (context, index) => CondidatWidget(
          condidat: CondidatDetails(
              voteList[index].candidateId,
              widget.voteId,
              index + 1,
              voteList[index].firstName,
              voteList[index].description,
              voteList[index].photoUrl),
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
        voteList = dataAccessLayer.getCandidatelist(widget.voteId);
      });
    });
  }
}
