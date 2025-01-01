abstract class HomeRepository {
  Future<void> getAllTasks({context});

  Future<void> refreshToken({
    context,
  });

  Future<void> logOut({context});
}
