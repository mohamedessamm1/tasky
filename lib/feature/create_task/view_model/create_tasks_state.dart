part of 'create_tasks_cubit.dart';

@immutable
sealed class CreateTasksState {}

final class CreateTasksInitial extends CreateTasksState {}

final class DropDownValueState extends CreateTasksState {}

final class CreateTaskLoadingState extends CreateTasksState {}

final class CreateTaskSuccessState extends CreateTasksState {}

final class CreateTaskErrorState extends CreateTasksState {}

final class ImageUploading extends CreateTasksState {}

final class ImageUploadSuccess extends CreateTasksState {}

final class ImageUploadError extends CreateTasksState {}

final class ProfileimgSuccess extends CreateTasksState {}

final class ProfileimgError extends CreateTasksState {}
