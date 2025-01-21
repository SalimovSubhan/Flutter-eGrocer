part of 'them_mode_bloc.dart';

@immutable
sealed class ThemModeEvent {}

class ChengThemeMode extends ThemModeEvent{
  ThemeMode themeMode;
  ChengThemeMode(this.themeMode);
}
