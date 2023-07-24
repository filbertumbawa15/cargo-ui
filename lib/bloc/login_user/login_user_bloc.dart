import 'package:cargo_ui/core/session_manager.dart';
import 'package:cargo_ui/params/login_user_params.dart';
import 'package:cargo_ui/repo/auth_repo.dart';
import 'package:cargo_ui/response/login_user_response.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_user_event.dart';
part 'login_user_state.dart';

class LoginUserBloc extends Bloc<LoginUserEvent, LoginUserState> {
  final authRepository = AuthRepo();
  final sessionManager = SessionManager();
  LoginUserBloc() : super(LoginUserInitial()) {
    on<LoggedInUserEvent>((event, emit) async {
      final params = LoginUserParam(event.username, event.password);
      emit(LoginUserLoading());
      try {
        LoginUserResponse response = await authRepository.loginUser(params);
        sessionManager.setSession(
          response.userLoginModel!.id!,
          response.userLoginModel!.token!,
          response.userLoginModel!.email!,
          response.userLoginModel!.firstName!,
          response.userLoginModel!.lastName!,
        );
        emit(LoginUserSuccess(loginUserResponse: response));
      } catch (e) {
        emit(LoginUserError(message: e.toString()));
      }
    });
  }
}
