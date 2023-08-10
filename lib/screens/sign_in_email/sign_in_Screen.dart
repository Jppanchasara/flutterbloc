// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/screens/Home/home_screen.dart';
import 'package:flutterbloc/screens/check_internet_connection.dart';
import 'package:flutterbloc/screens/sign_in_email/bloc/sign_in_bloc.dart';
import 'package:flutterbloc/screens/sign_in_email/bloc/sign_in_event.dart';
import 'package:flutterbloc/screens/sign_in_email/bloc/sign_in_state.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in with Email"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMessage,
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailcontroller,
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                    emailcontroller.text, passwordcontroller.text));
              },
              decoration: InputDecoration(hintText: "Email Address"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordcontroller,
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                    emailcontroller.text, passwordcontroller.text));
              },
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                return CupertinoButton(
                  child: Text("Sign In"),
                  onPressed: () {
                    if (state is SingInValidState) {
                      
                      BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmmitedEvent(
                              emailcontroller.text, passwordcontroller.text));

                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HomeScreen(),
                          ));
                    }
                  },
                  color:
                      (state is SingInValidState) ? Colors.blue : Colors.grey,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
