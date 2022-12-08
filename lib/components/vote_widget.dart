import 'package:flutter/material.dart';
import 'package:voting_app/condidats.dart';
import '../models/vote.dart' as v;

class Vote extends StatelessWidget {
  const Vote({Key? key, required this.vote}) : super(key: key);
  final v.VoteDetails vote;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: Container(
          height: 75,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white, width: 0.7)),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: RichText(
                          text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .merge(const TextStyle(
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.7))),
                              children: [
                                const TextSpan(text: "  Vote #"),
                                TextSpan(text: vote.numVote.toString())
                              ]),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2!.merge(
                                  TextStyle(
                                      color: const Color(0x00FFFFFF)
                                          .withOpacity(0.4)),
                                ),
                            children: [
                              const TextSpan(text: "  Deadline : "),
                              TextSpan(text: vote.deadline)
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                  width: 40,
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => Condidats(
                              vote_id: vote.numVote,
                            ),
                          ),
                        );
                      }))
            ],
          )),
    );
  }
}
