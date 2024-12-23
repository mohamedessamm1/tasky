part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetProfileSuccessState extends ProfileState {}

final class GetProfileLoadingState extends ProfileState {}
