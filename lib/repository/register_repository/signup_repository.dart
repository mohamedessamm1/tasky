abstract class SignupRepository {
  Future<void> signUp(
      {required String number,
      required String password,
      required context,
      required String name,
      required address,
      required yearsOfExperience,
      required exp});
}
