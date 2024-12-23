abstract class CreateTaskRepository {
  Future<void> createTask({title, description, dropDownValue});

  Future<void> refreshToken({context});

  Future<void> pickImage({context});

  Future<void> uploadImage({context});
}
