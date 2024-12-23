abstract class EditTaskRepository {
  Future<void> editTask(
      {required String dropDownValue, required context, required id});

  Future<void> deleteTask({required context, required id});

  Future<void> refreshToken({context});
}
