import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:etiqa_github_repo/app/assets/constants.dart';
import 'package:etiqa_github_repo/app/models/error/error_model.dart';
import 'package:etiqa_github_repo/app/models/network/my_response.dart';
import 'package:etiqa_github_repo/app/utils/dio_exceptions.dart';

class ErrorHandler {
  static bool _isDecodableError(MyResponse<dynamic, dynamic> response) {
    return response.error is String &&
        response.error != null &&
        response.status == ResponseStatus.error;
  }

  static bool _isDioError(MyResponse<dynamic, dynamic> response) {
    return response.error is DioException &&
        response.error != null &&
        response.status == ResponseStatus.error;
  }

  static String _getErrorModelMessage(ErrorModel error) {
    const defaultErrorMsg = "Error";
    var errorMessage = defaultErrorMsg;

    if (error.message?.isNotEmpty ?? false) {
      errorMessage = error.message!;
    } else if (error.message?.isNotEmpty ?? false) {
      errorMessage = error.message!;
    }
    return errorMessage;
  }

  static String getErrorMessage(MyResponse<dynamic, dynamic> response) {
    var errorMessage = "Error";
    if (_isDecodableError(response)) {
      final decodedError = jsonDecode(response.error as String);
      if (decodedError is Json) {
        final error = ErrorModel.fromJson(
          decodedError,
        );
        errorMessage = _getErrorModelMessage(error);
      } else {
        errorMessage = decodedError.toString();
      }
      return ServerError.translateErrorMessage(errorMessage);
    } else if (_isDioError(response)) {
      return DioExceptions.fromDioError(response.error as DioException).message;
    }
    return errorMessage;
  }
}
