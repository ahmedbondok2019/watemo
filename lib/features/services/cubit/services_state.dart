part of 'services_cubit.dart';

class ServicesState {}
class ServicesIdle extends ServicesState {}
class ServicesLoading extends ServicesState {}
class SpokenLanguagesLoading extends ServicesState {}
class ChangeSelectServiceLoading extends ServicesState {}
class IncrementCounterLoading extends ServicesState {}
class DecrementCounterLoading extends ServicesState {}
class ChangeRelationsLoading extends ServicesState {}
class ChangeStatusGenderLoading extends ServicesState {}
class DateLoading extends ServicesState {}
class RelationsLoading extends ServicesState {}
class RelationsSuccess extends ServicesState {}
class ChangeStatusGender extends ServicesState {
  final bool gender;
  ChangeStatusGender({required this.gender});
}
class ChangeSelectServiceSuccess extends ServicesState {
  final List<ServicesModel> selectServicesList;
  ChangeSelectServiceSuccess({required this.selectServicesList});
}
class CounterSuccess extends ServicesState {
  final int counter;
  CounterSuccess({required this.counter});
}
class DateSuccess extends ServicesState {
  final String date;
  DateSuccess({required this.date});
}
class ChangeRelationsSuccess extends ServicesState {
 final TitleIdListModel relation;
  ChangeRelationsSuccess({required this.relation});
}
class ChangeStatusLangLoading extends ServicesState {}
class ChangeStatusLang extends ServicesState {
  final List<int> selectLang;
  ChangeStatusLang({required this.selectLang});
}
class ClearDataLoading extends ServicesState {}
class ClearDataSuccess extends ServicesState {}
class ServicesSuccess extends ServicesState {}
class LanguagesSuccess extends ServicesState {}
class ServicesFailed extends ServicesState {
  final NetworkExceptions networkExceptions;
  ServicesFailed({
    required this.networkExceptions,
  });
}
class SpokenLanguagesFailed extends ServicesState {
  final NetworkExceptions networkExceptions;
  SpokenLanguagesFailed({
    required this.networkExceptions,
  });
}
class RelationsFailed extends ServicesState {
  final NetworkExceptions networkExceptions;
  RelationsFailed({
    required this.networkExceptions,
  });
}