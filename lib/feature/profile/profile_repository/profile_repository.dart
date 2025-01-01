abstract class ProfileRepository {
  Future<void> getProfile();

  Future<void> refreshToken({
    context,
  });
}
