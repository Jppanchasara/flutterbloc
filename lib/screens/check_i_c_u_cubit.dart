// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/cubits/internet_cubit.dart';

class CheckInternetConnectionUsingCubit extends StatelessWidget {
  const CheckInternetConnectionUsingCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          builder: (context, state) {
            if (state == InternetState.Gained) {
              return Text("Connected");
            } else if (state == InternetState.Lost) {
              return Text("Not Connected");
            } else {
              return Text("loading....");
            }
          },
          listener: (context, state) {
            if (state == InternetState.Gained) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Connected"),
                backgroundColor: Colors.green,
              ));
            }else if(state == InternetState.Lost){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(" Not Connected"),
                backgroundColor: Colors.red,
              ));
            }else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Loding..."),
                backgroundColor: Colors.blue,
              ));

            }
          },
        ),
      )),
    );
  }
}
