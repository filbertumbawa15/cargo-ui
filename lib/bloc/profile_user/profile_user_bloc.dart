import 'package:bloc/bloc.dart';
import 'package:cargo_ui/repo/auth_repo.dart';
import 'package:cargo_ui/response/profile_user_response.dart';
import 'package:meta/meta.dart';

part 'profile_user_event.dart';
part 'profile_user_state.dart';

class ProfileBloc extends Bloc<ProfileUserEvent, ProfileUserState> {
  final authRepository = AuthRepo();
  ProfileBloc() : super(ProfileUserInitial()) {
    on<ProfileIndexEvent>((event, emit) async {
      emit(ProfileUserLoading());
      try {
        ProfileUserResponse response = await authRepository.getProfile();
        emit(ProfileUserLoaded(profileUserResponse: response));
      } catch (e) {
        emit(ProfileUserError(message: e.toString()));
      }
    });
  }
}
