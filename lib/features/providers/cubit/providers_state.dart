part of 'providers_cubit.dart';

class ProvidersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProvidersInitial extends ProvidersState {}

class ProvidersLoading extends ProvidersState {}
class ChangeProviderLoading extends ProvidersState {}
class ProvidersSuccess extends ProvidersState {}
class ChangeProviderSuccess extends ProvidersState {
  final int? provider;
  ChangeProviderSuccess({
    required this.provider,
  });
}
class ProvidersFailed extends ProvidersState {
  final NetworkExceptions networkExceptions;
  ProvidersFailed({
    required this.networkExceptions,
  });
}