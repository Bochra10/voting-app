import 'package:flutter/material.dart';
import 'package:voting_app/condidats.dart';
import 'package:voting_app/models/condidat.dart';
import 'package:voting_app/profil.dart';

class CondidatWidget extends StatelessWidget {
  final CondidatDetails condidat;
  const CondidatWidget({Key? key, required this.condidat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: Container(
          height: 75,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
          //border: Border.all(color: Colors.white, width: 0.7)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                  backgroundImage: NetworkImage(condidat.photoUrl == ""
                      ? "https://img2.freepng.fr/20180624/yxv/kisspng-business-organization-computer-software-tom-clancy-unknown-person-5b2f72c6b16400.1895704715298362307266.jpg"
                      : condidat.photoUrl),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              style: theme.textTheme.subtitle2!.merge(TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 0.7))),
                              children: [
                                TextSpan(text: "Candidat #"),
                                TextSpan(text: condidat.numCondidat.toString())
                              ]),
                        ),
                        RichText(
                          text: TextSpan(
                              style:
                                  Theme.of(context).textTheme.bodyText2!.merge(
                                        TextStyle(
                                            color: const Color(0xFFFFFF)
                                                .withOpacity(0.4)),
                                      ),
                              children: [
                                TextSpan(text: condidat.name + "  :  "),
                                TextSpan(text: condidat.description)
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white.withOpacity(0.7),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => Profil(
                              condidat: CondidatDetails(
                                  condidat.candidatId,
                                  condidat.voteID,
                                  condidat.numCondidat,
                                  condidat.name,
                                  condidat.description,
                                  condidat.photoUrl)),
                        ),
                      );
                    })
              ],
            ),
          )),
    );
  }
}
