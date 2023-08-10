// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/screens/Home/home_screen.dart';
import 'package:flutterbloc/screens/sign_in_email/bloc/sign_in_bloc.dart';
import 'package:flutterbloc/screens/sign_in_email/sign_in_Screen.dart';
import 'package:flutterbloc/screens/sign_in_phone/sign_in_phone_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
                child: Center(
                    child: Text(
              "Welcome",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue),
            ))),
            SizedBox(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                    create: (context) => SignInBloc(),
                                    child: SignInScreen(),
                                  )));
                    },
                    child: Center(
                      child: Text("Sign in with Email"),
                    ))),
            SizedBox(
              height: 8,
            ),
            SizedBox(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInWithPhone()));
                    },
                    child: Center(
                      child: Text("Sign in with Phone"),
                    )))
          ],
        ),
      ),
    );
  }
}
