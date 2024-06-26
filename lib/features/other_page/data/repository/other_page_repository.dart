import 'dart:developer';
import '../../../../core/src/app_export.dart';
import '../data_source/other_page_data_source.dart';
import '../models/about/about_model.dart';
import '../models/support/contact_model.dart';

class OtherPageRepository {
  final OtherPageDataSource _dataSource;

  OtherPageRepository(this._dataSource);

  /// <<--- send Contact request --->>
  Future<NetworkService<ContactModel>> sendContact(
      {required String type, required String message}) async {
    try {
      Response? responseData = await _dataSource.sendContact(type: type, message: message);
      ContactModel contact = ContactModel.fromJson(responseData.data);
      log("error =====>>>>>>>${contact.error}");
      return NetworkService.succeed(contact);
    } on DioException catch (error) {
      log("first step =====>>>>>>>${error}");
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- get About Us request --->>
  Future<NetworkService<AboutModel>> getAboutUs() async {
    try {
      Response response = await _dataSource.getAboutUs();
      AboutModel about = AboutModel.fromJson(response.data);
      return NetworkService.succeed(about);
    } catch (error) {
      return NetworkService.failure(
          NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- get Terms request --->>
  Future<NetworkService<AboutModel>> getTerms() async {
    try {
      Response response = await _dataSource.getTerms();
      AboutModel about = AboutModel.fromJson(response.data);
      return NetworkService.succeed(about);
    } catch (error) {
      return NetworkService.failure(
          NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- get Privacy request --->>
  Future<NetworkService<AboutModel>> getPrivacy() async {
    try {
      Response response = await _dataSource.getPrivacy();
      AboutModel about = AboutModel.fromJson(response.data);
      return NetworkService.succeed(about);
    } catch (error) {
      return NetworkService.failure(
          NetworkExceptions.getDioException(error));
    }
  }
}