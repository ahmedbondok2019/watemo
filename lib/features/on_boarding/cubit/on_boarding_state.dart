import 'package:equatable/equatable.dart';

class OnBoardingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnBoardingInitial extends OnBoardingState {}

class UpDateIndexLoading extends OnBoardingState {}
class UpDateIndex extends OnBoardingState {
  final int currentIndex;
  UpDateIndex({required this.currentIndex});
}
