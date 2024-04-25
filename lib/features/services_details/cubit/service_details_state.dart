part of 'service_details_cubit.dart';

class ServiceDetailsState {}

class ServiceDetailsIdle extends ServiceDetailsState {}

class ServiceDetailsLoading extends ServiceDetailsState {}
class SpokenLanguagesLoading extends ServiceDetailsState {}
class RelationsLoading extends ServiceDetailsState {}
class DateLoading extends ServiceDetailsState {}
class ChangeRelationsLoading extends ServiceDetailsState {}

class ServiceDetailsSuccess extends ServiceDetailsState {}
class RelationsSuccess extends ServiceDetailsState {}

class DateState extends ServiceDetailsState {
  final String date;
  DateState({
    required this.date,
  });
}

class ChangeRelationsSuccess extends ServiceDetailsState {
  final TitleIdListModel relation;
  ChangeRelationsSuccess({
    required this.relation,
  });
}

class ServiceDetailsFailed extends ServiceDetailsState {
  final NetworkExceptions networkExceptions;
  ServiceDetailsFailed({
    required this.networkExceptions,
  });
}

class RelationsFailed extends ServiceDetailsState {
  final NetworkExceptions networkExceptions;
  RelationsFailed({
    required this.networkExceptions,
  });
}
