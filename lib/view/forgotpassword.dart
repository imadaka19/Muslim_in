import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:muslim_in/util/utils.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF272A35),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Reset Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Receive an email\nto reset your password',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  style: TextStyle(
                    color: Color(0xffD0E1F9),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.done,
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
                        borderSide:
                            BorderSide(width: 2, color: Color(0xffD0E1F9))),
                    // prefixIcon: Icon(
                    //   Icons.email,
                    //   color: Color(0xffD0E1F9),
                    // )
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid Email'
                          : null,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xffD0E1F9),
                      elevation: 0,
                      fixedSize: Size(230, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                  icon: Icon(
                    Icons.email_outlined,
                    color: Color(0xFF272A35),
                  ),
                  label: Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 18, color: Color(0xFF272A35)),
                  ),
                  onPressed: resetPassword,
                )
              ],
            )),
      ),
    );
  }

  Future resetPassword() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      Utils.showSnackBar('Password Reset Email Sent');
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      // TODO
      print(e);
      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}
