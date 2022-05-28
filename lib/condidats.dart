import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:voting_app/components/condidat_widget.dart';
import 'package:voting_app/models/condidat.dart';

class Condidats extends StatefulWidget {
  final int vote_id;
  const Condidats({Key? key, required this.vote_id}) : super(key: key);

  @override
  State<Condidats> createState() => _CondidatsState();
}

class _CondidatsState extends State<Condidats> {
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
            padding: const EdgeInsets.symmetric(
              vertical: 50,
            ),
            child: RichText(
              text: TextSpan(style: theme.textTheme.headline1, children: [
                TextSpan(text: "Vote #"),
                TextSpan(text: widget.vote_id.toString())
              ]),
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
        itemCount: 20,
        itemBuilder: (context, index) => CondidatWidget(
          condidat: CondidatDetails(
              widget.vote_id, index + 1, 'bichou', 'chairwoman', ''),
        ),
      ),
    );
  }
}
