part of 'one_task_details_cubit.dart';

@immutable
sealed class OneTaskDetailsState {}

final class OneTaskDetailsInitial extends OneTaskDetailsState {}

final class GetTaskDetailsSuccessState extends OneTaskDetailsState {}

final class GetTaskDetailsLoadingState extends OneTaskDetailsState {}
