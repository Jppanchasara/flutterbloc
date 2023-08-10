import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/blocs/internet_bloc/internet_event.dart';
import 'package:flutterbloc/blocs/internet_bloc/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetLoseEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    connectivitySubscription=_connectivity.onConnectivityChanged.listen((rseult) {
      if (rseult == ConnectivityResult.mobile ||
          rseult == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLoseEvent());
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    // TODO: implement close
    return super.close();
  }
}
