import 'package:bloc/bloc.dart';
import 'package:cargo_ui/params/register_user_params.dart';
import 'package:cargo_ui/repo/auth_repo.dart';
import 'package:cargo_ui/response/register_user_response.dart';
import 'package:meta/meta.dart';

part 'register_user_event.dart';
part 'register_user_state.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  final authRepository = AuthRepo();
  RegisterUserBloc() : super(RegisterUserInitial()) {
    on<CreateUserEvent>(_registerUser);
  }

  void _registerUser(
      CreateUserEvent event, Emitter<RegisterUserState> emit) async {
    final params = RegisterUserParam(
      event.username,
      event.email,
      event.isActive,
      event.isCustomer,
      event.firstName,
      event.lastName,
      event.password1,
      event.password2,
    );
    emit(RegisterUserLoading());
    try {
      RegisterUserResponse response = await authRepository.registerUser(params);
      emit(RegisterUserSuccess(registerUserResponse: response));
    } catch (e) {
      emit(RegisterUserError(message: e.toString()));
    }
  }
}
