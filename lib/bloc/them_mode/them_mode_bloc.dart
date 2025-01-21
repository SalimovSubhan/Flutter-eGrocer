import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'them_mode_event.dart';
part 'them_mode_state.dart';

class ThemModeBloc extends Bloc<ThemModeEvent, ThemModeState> {
  ThemModeBloc() : super(ThemModeInitial()) {
    on<ChengThemeMode>((event, emit) {
       emit(ThemModeGet(event.themeMode));
    });
  }
}
