import 'package:cargo_ui/core/session_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_setting_event.dart';
part 'app_setting_state.dart';

class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
  final sessionManager = SessionManager();
  AppSettingBloc() : super(AppSettingLoading()) {
    on<SettingAppEvent>((event, emit) {
      final activeSession = sessionManager.anyActiveSession();
      if (activeSession) {
        emit(AppSettingAuthenticated());
      } else {
        emit(AppSettingUnAuthenticated());
      }
    });
  }
}
