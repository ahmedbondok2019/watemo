part of 'home_cubit.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}
class HomeSuccess extends HomeState {}
class HomeFailed extends HomeState {
  final NetworkExceptions networkExceptions;
  HomeFailed({
    required this.networkExceptions,
  });
}

class LoadUserDataLoading extends HomeState {}
class LoadUserDataSuccess extends HomeState {}