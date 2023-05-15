import 'package:flutter/material.dart';
import 'package:muslim_in/view/forgotpassword.dart';
import 'package:muslim_in/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:muslim_in/util/utils.dart';
import 'package:muslim_in/view/guesthome.dart';

class loginwidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const loginwidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<loginwidget> createState() => _loginwidgetState();
}

class _loginwidgetState extends State<loginwidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF272A35),
      // resizeToAvoidBottomInset: true,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        children: [
          Container(
            height: 30,
          ),
          Container(
            child: Text(
              'Welcome',
              style: TextStyle(
                  color: Color(0xffD0E1F9),
                  fontSize: 20,
                  fontFamily: 'Segoe UI'),
            ),
          ),
          Container(
            height: 10,
          ),
          Container(
            child: Text(
              'Back!',
              style: TextStyle(
                  color: Color(0xffD0E1F9),
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          TextField(
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
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: passwordController,
            style: TextStyle(color: Color(0xffD0E1F9)),
            // autocorrect: false,
            obscureText: !_passwordVisible,
            textInputAction: TextInputAction.done,
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
              // fillColor: Color(0xffD0E1F9),
              // hoverColor: Color(0xffD0E1F9),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              hintText: 'Password',
              hintStyle: TextStyle(
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
          ),
          SizedBox(
            height: 10,
          ),
          // SizedBox(
          //   height: 5,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Color(0xffD0E1F9),
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                // style: ElevatedButton.styleFrom(
                //     primary: Color(0xffD0E1F9),
                //     elevation: 0,
                //     fixedSize: Size(300, 65),
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(25)))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ForgotPassword()));
                },
              ),
              FilledButton(
                child: Text(
                  "Log in",
                  style: TextStyle(color: Color(0xff1E1F26), fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xffD0E1F9),
                    elevation: 0,
                    fixedSize: Size(130, 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)))),
                onPressed: logIn,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            height: 15,
            thickness: 1,
            // indent: 20,
            // endIndent: 0,
            color: Color(0xffD0E1F9),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child: Text(
                  "Login as a guest",
                  style: TextStyle(
                      color: Color(0xffD0E1F9),
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                // style: ElevatedButton.styleFrom(
                //     primary: Color(0xffD0E1F9),
                //     elevation: 0,
                //     fixedSize: Size(300, 65),
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(25)))),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => GuestHomePage()));
                },
              ),
              TextButton(
                child: Text(
                  "Register.",
                  style: TextStyle(color: Color(0xffD0E1F9), fontSize: 16),
                ),
                // style: ElevatedButton.styleFrom(
                //     primary: Color(0xffD0E1F9),
                //     elevation: 0,
                //     fixedSize: Size(300, 65),
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(25)))),
                onPressed: widget.onClickedSignUp,
                // () {
                //   StreamBuilder<User?>(
                //     stream: FirebaseAuth.instance.authStateChanges(),
                //     builder: (context, snapshot) => signinwidget(),
                //   );
                // },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future logIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
