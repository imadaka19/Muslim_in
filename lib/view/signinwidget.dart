import 'package:flutter/material.dart';
import 'package:muslim_in/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signinwidget extends StatefulWidget {
  final Function() onClickedLogIn;

  const signinwidget({
    Key? key,
    required this.onClickedLogIn,
  }) : super(key: key);

  @override
  State<signinwidget> createState() => _signinwidgetState();
}

class _signinwidgetState extends State<signinwidget> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  bool _passwordVisible = false;
  bool _passwordVisible2 = false;
  String _password = '';
  String _confirmPassword = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _passwordVisible = false;
    _passwordVisible2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF272A35),
      resizeToAvoidBottomInset: true,
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          children: [
            Container(
              height: 20,
            ),
            Container(
              child: Text(
                'Please,',
                style: TextStyle(
                    color: Color(0xffD0E1F9),
                    fontSize: 20,
                    fontFamily: 'Segoe UI'),
              ),
            ),
            Container(
              height: 5,
            ),
            Container(
              child: Text(
                'Register',
                style: TextStyle(
                    color: Color(0xffD0E1F9),
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: usernameController,
              style: TextStyle(
                color: Color(0xffD0E1F9),
              ),
              autocorrect: false,
              // keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                filled: true,
                hoverColor: Color(0xffD0E1F9),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: Color(0xffD0E1F9),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(width: 2, color: Color(0xffD0E1F9))),
                // prefixIcon: Icon(
                //   Icons.email,
                //   color: Color(0xffD0E1F9),
                // )
              ),
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (email) =>
              //     email != null && !EmailValidator.validate(email)
              //         ? 'Enter a valid email'
              //         : null,
            ),
            SizedBox(
              height: 10,
            ),

            TextFormField(
              controller: emailController,
              style: TextStyle(
                color: Color(0xffD0E1F9),
              ),
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hoverColor: Color(0xffD0E1F9),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Color(0xffD0E1F9),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(width: 2, color: Color(0xffD0E1F9))),
                // prefixIcon: Icon(
                //   Icons.email,
                //   color: Color(0xffD0E1F9),
                // )
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Enter a valid email'
                      : null,
            ),
            SizedBox(
              height: 10,
            ),

            TextFormField(
              controller: passwordController,
              autocorrect: false,
              obscureText: !_passwordVisible,
              style: TextStyle(color: Color(0xffD0E1F9)),
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  iconSize: 20,
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xffD0E1F9),
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                hoverColor: Color(0xffD0E1F9),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Color(0xffD0E1F9),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xffD0E1F9),
                  ),
                ),
              ),
              onChanged: (value) {
                _password = value;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => value != null && value.length < 8
                  ? 'Enter min. 8 characters'
                  : null,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              // controller: TextEditingController(),
              autocorrect: false,
              obscureText: !_passwordVisible2,
              textInputAction: TextInputAction.done,
              style: TextStyle(color: Color(0xffD0E1F9)),
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  iconSize: 20,
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible2 ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xffD0E1F9),
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible2 = !_passwordVisible2;
                    });
                  },
                ),
                hoverColor: Color(0xffD0E1F9),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                labelText: 'Confirm Password',
                labelStyle: TextStyle(
                  color: Color(0xffD0E1F9),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xffD0E1F9),
                  ),
                ),
              ),
              onChanged: (value) {
                _confirmPassword = value;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Conform password is required please enter';
                }
                if (value != _password) {
                  return 'Password not match';
                }
              },
            ),

            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have?",
                      style: TextStyle(
                          color: Color(0xffD0E1F9),
                          fontSize: 14,
                          fontWeight: FontWeight.w100),
                      children: [
                        TextSpan(
                          text: " Log In",
                          style: TextStyle(
                              color: Color(0xffD0E1F9),
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                  // style: ElevatedButton.styleFrom(
                  //     primary: Color(0xffD0E1F9),
                  //     elevation: 0,
                  //     fixedSize: Size(300, 65),
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.all(Radius.circular(25)))),
                  onPressed: widget.onClickedLogIn,
                ),
                FilledButton(
                  child: Text(
                    "Register",
                    style: TextStyle(color: Color(0xff1E1F26), fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xffD0E1F9),
                      elevation: 0,
                      fixedSize: Size(130, 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                  onPressed: SignIn,
                ),
              ],
            ),
            //
          ],
        ),
      ),
    );
  }

  Future<void> SignIn() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    // if (_password != _confirmPassword){ // you can add your statements here
    //   showSnackBar(context,
    //       "Password does not match. Please re-type again.");
    // } else {
    //   FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
    //     email: emailController.text,
    //     password: passwordController.text,
    //     context: context,
    //   );
    // }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // get user id
      String userID = credential.user!.uid;

      // creating user profile on db
      await db.collection("users").doc(userID).set({
        "id": userID,
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "username": usernameController.text.trim(),

        // ... other params
      });

      print("Signed up successfully!");
    } on FirebaseAuthException catch (error) {
      print("Something is wrong: $error");
    }
    // try {

    // } on FirebaseAuthException catch (e) {
    //   print(e);

    //   Utils.showSnackBar(e.message);
    // }
    // await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //   email: emailController.text.trim(),
    //   password: passwordController.text.trim(),
    // );
    // await FirebaseFirestore.instance.collection('users').add({
    //   'username': usernameController.text.trim(),
    //   'email': emailController.text.trim(),
    // }).then((value) {});

    // addUsername(usernameController.text.trim(), emailController.text.trim());

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  // Future addUsername(String username, String email) async {
  //   await FirebaseFirestore.instance.collection('users').doc(username).set({
  //     'username': username,
  //     'email': email,
  //   }).then((value) {});
  // }
}
