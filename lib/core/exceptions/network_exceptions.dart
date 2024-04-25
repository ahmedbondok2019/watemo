import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../common/models/error/error_model.dart';
part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorizedRequest(String reason) =
  UnauthorizedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.unprocessableEntity(String reason) =
  UnprocessableEntity;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions handleResponse(Response? response) {
    log("message =======>>>>> }");
    ErrorModel listOfErrors = ErrorModel.fromJson(response?.data);
    String allErrors = "";
    if(listOfErrors.error != null){
      allErrors = listOfErrors.error!;
    }
    log("message =======>>>>> ${allErrors}");
    int statusCode = response?.statusCode ?? 0;
    if (response != null) {
      switch (statusCode) {
        case 400:
        case 401:
        case 403:
          log("message =======>>>>> ${statusCode}");
          return NetworkExceptions.unauthorizedRequest(allErrors.toString());
        case 404:
          return NetworkExceptions.notFound(allErrors);
        case 409:
          return const NetworkExceptions.conflict();
        case 408:
          return const NetworkExceptions.requestTimeout();
        case 422:
          try {
            return NetworkExceptions.unprocessableEntity(allErrors);
          } catch (_) {
            return const NetworkExceptions.unprocessableEntity("Unknown error occurred");
          }
        case 500:
          return const NetworkExceptions.internalServerError();
        case 503:
          return const NetworkExceptions.serviceUnavailable();
        default:
          var responseCode = statusCode;
          return NetworkExceptions.defaultError(
            "Received invalid status code: $responseCode",
          );
      }
    }
    // Handle other cases or return a default error
    return const NetworkExceptions.unexpectedError();
  }

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout();
              break;
            case DioExceptionType.connectionError:
              networkExceptions =
              const NetworkExceptions.noInternetConnection();
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.badResponse:
              print("DioExceptionType.badResponse >>>>>>>>>>>>>>>>");
              networkExceptions =
                  NetworkExceptions.handleResponse(error.response);
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout();
              break;
            case DioExceptionType.badCertificate:
              networkExceptions =
              const NetworkExceptions.noInternetConnection();
              break;
            case DioExceptionType.unknown:
              networkExceptions =
              const NetworkExceptions.noInternetConnection();
              break;
          }
        }
        else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        }
        else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (_) {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    }
    else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkExceptions.unableToProcess();
      } else {
        return const NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(
        notImplemented: () {
          errorMessage = "Not Implemented";
        },
        requestCancelled: () {
          errorMessage = "Request Cancelled";
        },
        internalServerError: () {
          errorMessage = "Internal Server Error";
        },
        notFound: (String reason) {
          errorMessage = reason;
        },
        serviceUnavailable: () {
          errorMessage = "Service unavailable";
        },
        methodNotAllowed: () {
          errorMessage = "Method Allowed";
        },
        badRequest: () {
          errorMessage = "Bad request";
        },
        unauthorizedRequest: (String error) {
          errorMessage = error;
        },
        unprocessableEntity: (String error) {
          errorMessage = error;
        },
        unexpectedError: () {
          errorMessage = "Unexpected error occurred";
        },
        requestTimeout: () {
          errorMessage = "Connection request timeout";
        },
        noInternetConnection: () {
          errorMessage = "No internet connection";
        },
        conflict: () {
          errorMessage = "Error due to a conflict";
        },
        sendTimeout: () {
          errorMessage = "Send timeout in connection with API server";
        },
        unableToProcess: () {
          errorMessage = "Unable to process the data";
        },
        defaultError: (String error) {
          errorMessage = error;
        },
        formatException: () {
          errorMessage = "Unexpected error occurred";
        },
        notAcceptable: () {
          errorMessage = "Not acceptable";
        });
    return errorMessage;
  }
}