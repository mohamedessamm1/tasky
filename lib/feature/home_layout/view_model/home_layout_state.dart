part of 'home_layout_cubit.dart';

sealed class HomeLayoutState {}

final class HomeLayoutInitial extends HomeLayoutState {}

final class GetAllTasksSuccessState extends HomeLayoutState {}

final class GetAllTasksLoadingState extends HomeLayoutState {}

final class GetAllTasksErrorState extends HomeLayoutState {}

final class RefreshTokenState extends HomeLayoutState {}

final class LogoutSuccessState extends HomeLayoutState {}
