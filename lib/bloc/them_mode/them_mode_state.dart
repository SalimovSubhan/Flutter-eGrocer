part of 'them_mode_bloc.dart';

@immutable
sealed class ThemModeState {}

final class ThemModeInitial extends ThemModeState {}

final class ThemModeGet extends ThemModeState {
  ThemeMode themeMode;
  ThemModeGet(this.themeMode);
}
