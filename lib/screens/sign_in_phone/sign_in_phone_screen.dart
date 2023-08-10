// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/screens/sign_in_phone/verification_screen.dart';

class SignInWithPhone extends StatelessWidget {
  const SignInWithPhone({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phonecontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in with Phone"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: phonecontroller,
              maxLength: 10,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Phone Number"),
            ),
            SizedBox(
              height: 16,
            ),

            SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          // String phoneNumber =
                          //     '+91' + phonecontroller.text.toString();
                          // BlocProvider.of<AuthCubit>(context)
                          //     .sendOTP(phoneNumber);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerificationScreen()));
                        },
                        child: Center(child: Text("Sign In"))))
            // BlocConsumer<AuthCubit, AuthState>(
            //   builder: (context, state) {
            //     if (state is AuthLoadingState) {
            //       return Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //     return SizedBox(
            //         height: 50,
            //         child: ElevatedButton(
            //             onPressed: () {
            //               String phoneNumber =
            //                   '+91' + phonecontroller.text.toString();
            //               BlocProvider.of<AuthCubit>(context)
            //                   .sendOTP(phoneNumber);
            //               // Navigator.push(
            //               //     context,
            //               //     MaterialPageRoute(
            //               //         builder: (context) => VerificationScreen()));
            //             },
            //             child: Center(child: Text("Sign In"))));
            //   },
            //   listener: (context, state) {
            //     if (state is AuthCodeVerification) {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => VerificationScreen(),
            //           ));
            //     }
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
