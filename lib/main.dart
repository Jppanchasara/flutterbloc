
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/blocs/internet_bloc/internet_bloc.dart';
import 'package:flutterbloc/cubits/internet_cubit.dart';
import 'package:flutterbloc/screens/check_i_c_u_cubit.dart';
import 'package:flutterbloc/screens/check_internet_connection.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const CheckInternetConnectionUsingBloc()),
    );
  }
}
