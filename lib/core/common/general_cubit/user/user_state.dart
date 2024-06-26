part of 'user_cubit.dart';

class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}
class LoadUserDataLoading extends UserState {}
class ClearUserDataLoading extends UserState {}
class LoadUserDataSuccess extends UserState {}
class ClearUserDataSuccess extends UserState {}
