abstract class OneTaskRepository {
  Future<void> getOneTask({context, required id});

  Future<void> refreshToken({context});
}
