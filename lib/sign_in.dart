import 'package:flutter/material.dart';
import 'package:voting_app/home.dart';
import 'package:voting_app/sign_up.dart';
import 'package:voting_app/success.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  //USERNAME AND PASSWORD ARE JUST FOR TESTING THE CODE LATER WE WILL TAKE THEM FROM THE DB
  final username = "bechbech";
  final password = "bechbech@@@";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover),
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 35, 35, 60),
                  child: Text(
                    "Sign in to \nyour account",
                    style: theme.textTheme.headline1,
                  ),
                ),
                //USERNAME
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: TextFormField(
                      validator: (value) {
                        if ((value == null) |
                            (value.toString().trim().isEmpty)) {
                          return '* Required';
                        }
                        if (value.toString().trim().compareTo(username) != 0) {
                          return 'Incorrect Username';
                        }
                        return null;
                      },
                      controller: _userNameController,
                      textInputAction: TextInputAction.next,
                      style: theme.textTheme.subtitle2,
                      decoration: const InputDecoration(
                        labelText: "First name",
                        labelStyle: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                        fillColor: Colors.black,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: Color(0xFFFFB61D),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: Color(0xFFFF2F88),
                          ),
                        ),
                        suffix: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(
                            Icons.check,
                            color: Colors.white70,
                            size: 16,
                          ),
                        ),
                      )),
                ),
                //PASSWORD
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 50),
                  child: TextFormField(
                      validator: (value) {
                        if ((value == null) |
                            (value.toString().trim().isEmpty)) {
                          return '* Required';
                        }
                        if (value.toString().trim().compareTo(password) != 0) {
                          return 'Incorrect Password';
                        }
                        return null;
                      },
                      controller: _passwordController,
                      obscureText: true,
                      style: theme.textTheme.subtitle2,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                        fillColor: Colors.black,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: Color(0xFFFFB61D),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: Color(0xFFFF2F88),
                          ),
                        ),
                      )),
                ),
                //SIGN IN REDIRECT TO HOME
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const Home(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: 200,
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
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Sign In', style: theme.textTheme.subtitle2),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(35, 35, 35, 20),
                    child: Text(
                      "Don't have an account ? \n Click bellow to join us ",
                      style: theme.textTheme.bodyText2!
                          .apply(color: Colors.white70),
                    ),
                  ),
                ),
                //SIGN UP REDIRECT TO CREATE ACCOUNT
                Center(
                    child: SizedBox(
                        height: 50,
                        width: 150,
                        child: TextButton(
                          onPressed: () {
                          Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SignUp(),
                      ),
                    );
                          },
                          child: Text(
                            "Sign Up",
                            style: theme.textTheme.bodyText2,
                          ),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
