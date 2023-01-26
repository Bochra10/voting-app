import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:voting_app/touch_id.dart';
import 'package:voting_app/models/condidat.dart';

class Profil extends StatefulWidget {
  final CondidatDetails condidat;
  const Profil({Key? key, required this.condidat}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
              child: Image.network(
                  widget.condidat.photoUrl == ""
                      ? "https://img2.freepng.fr/20180624/yxv/kisspng-business-organization-computer-software-tom-clancy-unknown-person-5b2f72c6b16400.1895704715298362307266.jpg"
                      : widget.condidat.photoUrl,
                  fit: BoxFit.cover),
            ),
            Positioned(
                top: 10,
                left: 15,
                child: GestureDetector(
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )),
            Positioned(
              bottom: 40,
              child: ExpandableNotifier(
                child: ScrollOnExpand(
                  child: ExpandablePanel(
                    theme: const ExpandableThemeData(
                        tapBodyToCollapse: true, tapBodyToExpand: true),
                    builder: (_, collapsed, expanded) {
                      return Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      );
                    },
                    collapsed: Container(
                      height: 100,
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            child: Text(
                              widget.condidat.name,
                              style: theme.textTheme.subtitle1!.merge(
                                  const TextStyle(
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.7))),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                              ),
                              child: Text(
                                "Description: " + widget.condidat.description,
                                style: theme.textTheme.bodyText1!.merge(
                                  TextStyle(
                                      color: const Color(0x00FFFFFF)
                                          .withOpacity(0.4)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFF181717),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                    ),
                    expanded: Container(
                      height: size.height / 2,
                      width: size.width,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                widget.condidat.name,
                                style: theme.textTheme.subtitle1!.merge(
                                    const TextStyle(
                                        color: Color.fromRGBO(
                                            255, 255, 255, 0.7))),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Description: ",
                                style: theme.textTheme.bodyText1!.merge(
                                  TextStyle(
                                      color: const Color(0x00FFFFFF)
                                          .withOpacity(0.4)),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                widget.condidat.description,
                                style: theme.textTheme.bodyText1!.merge(
                                  TextStyle(
                                      color: const Color(0x00FFFFFF)
                                          .withOpacity(0.4)),
                                ),
                              ),
                            ),
                          ]),
                      decoration: const BoxDecoration(
                        color: Color(0xFF181717),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Stack(children: [
                  Container(
                    height: 50,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    bottom: 10,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                TouchID(candidate: widget.condidat),
                          ),
                        );
                      },
                      child: Row(
                        children: const [
                          Text("vote"),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.check,
                            size: 10,
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        fixedSize: const Size(20, 15),
                        backgroundColor: const Color(0xFF181717),
                        alignment: AlignmentDirectional.center,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        textStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    ),
                  )
                ])),
          ],
        ),
      ),
    );
  }
}
