// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/blocs/internet_bloc/internet_bloc.dart';
import 'package:flutterbloc/blocs/internet_bloc/internet_state.dart';
import 'package:flutterbloc/screens/welcome/welcome_screen.dart';

class CheckInternetConnectionUsingBloc extends StatelessWidget {
  const CheckInternetConnectionUsingBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: BlocConsumer<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is InternetGainedState) {
            return WelcomeScreen();
            //return Text("Connected!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),);
          } else if (state is InternetLostState) {
            return Text(
              "Not Connected!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            );
          } else {
            return Text(
              "Loading...",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            );
          }
        },
        listener: (context, state) {
          if (state is InternetGainedState) {
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: Text(
            //     "Internet Connected",
            //     style: TextStyle(
            //       fontSize: 15,
            //       fontWeight: FontWeight.w700,
            //     ),
            //   ),
            //   backgroundColor: Colors.green,
            // ));
          } else if (state is InternetLostState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "Internet Not Connected!",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              backgroundColor: Colors.red,
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "Internet Loding...",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              backgroundColor: Colors.blue,
            ));
          }
        },
      ))),
    );
  }
}


// Display in not ui create.this is only backside like snakbar,dialog ,pageroute..
//  BlocListener<InternetBloc,InternetState(
//         listener: (context, state) {},
//         child: Container(),
//       )


//Only display ui
// BlocBuilder<InternetBloc, InternetState>(builder: (context, state) {
//         if (state is InternetGainedState) {
//           return Text("Connected!");
//         } else if (state is InternetLostState) {
//           return Text("Not Connected!");
//         }else{
//           return Text("Loading...");
//         }
//       })