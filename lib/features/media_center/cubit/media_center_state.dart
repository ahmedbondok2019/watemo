part of 'media_center_cubit.dart';

class MediaCenterState {}

class MediaCenterInitial extends MediaCenterState {}

class GetAllFaqsLoading extends MediaCenterState {}
class GetAllVideosLoading extends MediaCenterState {}
class HadithLoading extends MediaCenterState {}
class GetAllFaqsSuccess extends MediaCenterState {}
class GetAllVideosSuccess extends MediaCenterState {}
class HadithSuccess extends MediaCenterState {}
class HadithFailed extends MediaCenterState {
  final NetworkExceptions networkExceptions;
  HadithFailed({
    required this.networkExceptions,
  });
}
class GetAllVideosFailed extends MediaCenterState {
  final NetworkExceptions networkExceptions;
  GetAllVideosFailed({
    required this.networkExceptions,
  });
}
class GetAllFaqsFailed extends MediaCenterState {
  final NetworkExceptions networkExceptions;
  GetAllFaqsFailed({
    required this.networkExceptions,
  });
}
