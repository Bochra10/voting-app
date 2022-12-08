import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            'assets/background.png',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: screensize.height / 12,
                ),
                Center(
                  child: Image.asset(
                    'assets/floating.png',
                    scale: 1.5,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: SizedBox(
                    width: screensize.width / 2 + 12,
                    child: Text(
                      "Vote from your comfort zone, fair and square with fingerprint recognition technology.",
                      style: theme.textTheme.bodyText2,
                    ),
                  ),
                ),
                SizedBox(
                  height: screensize.height / 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(255, 29, 182, 1),
                              Color.fromRGBO(255, 136, 47, 1),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(5, 5),
                                blurRadius: 10)
                          ],
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Get Started',
                                style: theme.textTheme.headline3,
                              ),
                              const Icon(Icons.arrow_forward_ios,
                                  color: Colors.white, size: 10)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
