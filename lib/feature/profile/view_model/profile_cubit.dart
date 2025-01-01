import 'package:flutter_bloc/flutter_bloc.dart';
import '../profile_repository/profile_api.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  var dataProfile;

  getProfileData({required context}) async {
    emit(GetProfileLoadingState());
    ProfileApi().getProfile(context: context).then(
      (value) {
        dataProfile = value;
        emit(GetProfileSuccessState());
      },
    );
  }
}
