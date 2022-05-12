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
              borderRadius: BorderRadius.circular(16),),
              //border: Border.all(color: Colors.white, width: 0.7)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                  backgroundImage: AssetImage('assets/condidat.jpg'),
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
                              TextSpan(text: "Condidat #"),
                              TextSpan(text: condidat.numCondidat.toString())
                            ]),
                      ),
                      RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2!.merge(
                                  TextStyle(
                                      color: const Color(0xFFFFFF)
                                          .withOpacity(0.4)),
                                ),
                            children: [
                              TextSpan(text: condidat.name+"  :  "),
                              TextSpan(text: condidat.state)
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
                          builder: (BuildContext context) => Profil(condidat: CondidatDetails(0,0,"Amina Sirat","chairwoman",
    "I believe in community and ensuring everyone is catered for, in justice, kindness and Humanitymost of all I believe in YOU. It takes YOU to change the narrative. Join me and we’d create an unstoppable Force driving positive change.")),
                        ),
                      );
                    })
              ],
            ),
          )),
    );
  }
}