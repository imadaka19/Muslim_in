import 'package:muslim_in/view/loginwidget.dart';
import 'package:muslim_in/view/signinwidget.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? loginwidget(
          onClickedSignUp: toggle,
        )
      : signinwidget(
          onClickedLogIn: toggle,
        );

  void toggle() => setState(() => isLogin = !isLogin);
}
