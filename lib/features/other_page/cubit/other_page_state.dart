part of 'other_page_cubit.dart';

class OtherPageState {}

class OtherPageIdle extends OtherPageState {}

class OtherPageLoading extends OtherPageState {}

class OtherPageSuccess extends OtherPageState {}
class ContactLoading extends OtherPageState {}
class AboutUsLoading extends OtherPageState {}
class TermsLoading extends OtherPageState {}
class ContactSuccess extends OtherPageState {}
class AboutUsSuccess extends OtherPageState {}
class TermsSuccess extends OtherPageState {}
class ContactInitial extends OtherPageState {}

class ContactFailure extends OtherPageState {
  final NetworkExceptions networkExceptions;
  ContactFailure({
    required this.networkExceptions,
  });
}
class AboutUsFailure extends OtherPageState {
  final NetworkExceptions networkExceptions;
  AboutUsFailure({
    required this.networkExceptions,
  });
}
class TermsFailure extends OtherPageState {
  final NetworkExceptions networkExceptions;
  TermsFailure({
    required this.networkExceptions,
  });
}
class OtherPageError extends OtherPageState {
  final NetworkExceptions networkExceptions;
  OtherPageError({
    required this.networkExceptions,
  });
}

class ChangeContactTypeLoading extends OtherPageState {}
class ChangeContactType extends OtherPageState {
  final ContactTypeModel? type;
  ChangeContactType({
    required this.type,
  });
}

