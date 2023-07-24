part of 'app_setting_bloc.dart';

@immutable
abstract class AppSettingState {}

class AppSettingLoading extends AppSettingState {}

class AppSettingAuthenticated extends AppSettingState {}

class AppSettingUnAuthenticated extends AppSettingState {}
