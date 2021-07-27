import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF000000),
            Color(0xFF26437B),
            Color(0xFF183060),
          ],
        ),
      ),
      child: Column(
        children: [
          _loginForm(),
        ],
      ),
    );
  }

  _loginForm() {
    return Center();
  }
}
