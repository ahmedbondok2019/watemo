part of 'notifications_cubit.dart';

class NotificationsState {}

class NotificationsIdle extends NotificationsState {}

class NotificationsLoading extends NotificationsState {}

class NotificationsSuccess extends NotificationsState {}

class NotificationsFailed extends NotificationsState {
  final NetworkExceptions networkExceptions;
  NotificationsFailed({
    required this.networkExceptions,
  });
}
