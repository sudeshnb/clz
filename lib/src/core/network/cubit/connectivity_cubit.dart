import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connectivity_state.dart';
part "connectivity_cubit.freezed.dart";

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(ConnectivityInitial());

  void updateConnection(bool isConnected) {
    isConnected ? emit(Connected()) : emit(Disconnected());
  }
}
