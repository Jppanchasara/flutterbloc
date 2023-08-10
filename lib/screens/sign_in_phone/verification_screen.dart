// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterbloc/screens/Home/home_screen.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController otpcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify Phone Number"),
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
              controller: otpcontroller,
              maxLength: 6,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "6-Digit OTP"),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    child: Center(child: Text("Verify"))))
          ],
        ),
      ),
    );
  }
}
