import 'package:dio/dio.dart';
import 'package:etiqa_github_repo/app/assets/constants.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.badResponse:
        message =
            HttpErrorCode.getHttpErrorMsg(dioException.response?.statusCode);
        break;

      case DioExceptionType.unknown:
        message = dioException.message ?? "null";
        break;
      default:
        message = "Default";
        break;
    }
  }
  late String message;

  @override
  String toString() => message;
}
