part of 'task_details_cubit.dart';

@immutable
sealed class TaskDetailsState {}

final class TaskDetailsInitial extends TaskDetailsState {}

final class DropDownValueState extends TaskDetailsState {}

final class DropDownPriorityValueState extends TaskDetailsState {}

final class DeleteLoadingTaskState extends TaskDetailsState {}

final class DeleteTaskSuccessState extends TaskDetailsState {}

final class GenerateDataMatrixState extends TaskDetailsState {}

final class EditLoadingTaskState extends TaskDetailsState {}
