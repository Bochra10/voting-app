import 'package:flutter/material.dart';
import 'package:voting_app/sign_in.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  //PASSWORD VALIDATOR
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: "* Required"),
    MinLengthValidator(6, errorText: "Password should be atleast 6 characters"),
    MaxLengthValidator(15,
        errorText: "Password should not be greater than 15 characters"),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'Password must have at least one special character')
  ]);
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
                  padding: const EdgeInsets.all(35),
                  child: Text(
                    "Create an \naccount",
                    style: theme.textTheme.headline1,
                  ),
                ),
                //USERNAME FIELD + USERNAME VALIDATOR
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: TextFormField(
                      validator: (value) {
                        if ((value == null) |
                            (value.toString().trim().isEmpty)) {
                          return '* Required';
                        }
                        if (value.toString().trim().length < 4) {
                          return 'Username must be at least 4 characters in length';
                        }
                        if (!(RegExp('^[a-zA-Z]').hasMatch(value.toString()))) {
                          return 'Username must start with a letter';
                        }
                        if (value.toString().contains(' ')) {
                          return 'Username can\'t contain a space';
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
                //PASSWORD FIELD 
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: TextFormField(
                      validator: passwordValidator,
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
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(
                    "Disclaimer",
                    style: theme.textTheme.headline1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(35),
                  child: Text(
                    "Your vote is still anonymous. We will not, in any circumstances, share your personal information with other individuals or organizations without your permission, including public organizations, corporations or individuals.",
                    style:
                        theme.textTheme.bodyText2!.apply(color: Colors.white70),
                  ),
                ),
                //SIGN IN BUTTON ON PRESSED IT CHECKS VALIDATION TO WE CAN ADD THE CODE THAT ADDS THE USER TO DB HERE SO IT WILL BE
                //ADDED ONLY IF VALIDATION OF FIELDS IS TRUE
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const SignIn(),
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
                            Text('Continue', style: theme.textTheme.subtitle2),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
