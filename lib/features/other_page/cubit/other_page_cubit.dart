import 'dart:developer';
import '../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../core/src/app_export.dart';
import '../data/models/about/about_model.dart';
import '../data/models/support/contact_model.dart';
part 'other_page_state.dart';

class OtherPageCubit extends Cubit<OtherPageState> {
  final OtherPageRepository _repository;
  OtherPageCubit(
      this._repository,
      ) : super(OtherPageIdle());

  static OtherPageCubit get(context) =>
      BlocProvider.of<OtherPageCubit>(context);

  var formKey = GlobalKey<FormState>();
  TextEditingController messageController = TextEditingController();
  TitleIdListModel type = TitleIdListModel(
    id: 1,
    title: "website_error",
  );
  String? aboutUsContent;
  String? termsContent;

  List<TitleIdListModel> contactTypeList = [
    TitleIdListModel(
      id: 1,
      title: "website_error",
    ),
    TitleIdListModel(
      id: 2,
      title: "partner_request",
    ),
    TitleIdListModel(
      id: 3,
      title: "complaint",
    ),
    TitleIdListModel(
      id: 4,
      title: "question",
    ),
    TitleIdListModel(
      id: 5,
      title: "contact",
    ),
  ];

  void changeContactType(TitleIdListModel? ty) {
    emit(ChangeContactTypeLoading());
    type = ty!;
    emit(ChangeContactType(type: ty));
  }

  /// <<--- send request --->>
  Future sendContact() async {
    emit(ContactLoading());
    final NetworkService<ContactModel> data = await _repository.sendContact(
      type: type.id.toString(),
      message: messageController.text.isEmpty
          ? " "
          : messageController.text.trim(),
    );
    data.when(
      succeed: (responseData) {
        emit(ContactSuccess());
      },
      failure: (error) {
        emit(ContactFailure(networkExceptions: error));
      },
    );
  }

  /// <<--- get About Us --->>
  Future<void> getAboutUs() async {
    log("getAboutUs ======================>>>>>>>>>>>>333");
    emit(AboutUsLoading());
    final NetworkService<AboutModel> data = await _repository.getAboutUs();
    switch (data) {
      case Succeed<AboutModel>(data: AboutModel data):
        emit(AboutUsSuccess());
        aboutUsContent = data.data.content;
      case Failure<AboutModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(AboutUsFailure(networkExceptions: error));
    }
  }

  /// <<--- get terms --->>
  Future<void> getTerms() async {
    log("getTerms ======================>>>>>>>>>>>>333");
    emit(TermsLoading());
    final NetworkService<AboutModel> data = await _repository.getTerms();
    switch (data) {
      case Succeed<AboutModel>(data: AboutModel data):
        emit(TermsSuccess());
        termsContent = data.data.content;
      case Failure<AboutModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(TermsFailure(networkExceptions: error));
    }
  }
}