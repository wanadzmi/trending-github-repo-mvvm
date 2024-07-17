import 'package:flutter/material.dart';

class EndPoint {
  static const String baseURL = "https://api.github.com";
}

class HttpErrorCode {
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int internalServerError = 500;
  static const int badGateway = 502;
  static const int none = 0;
  static const int tooManyRequest = 1105;

  static String getHttpErrorMsg(int? statusCode) {
    switch (statusCode) {
      case badRequest:
        return "Bad Request";
      case unauthorized:
        return "Unauthorized";
      case forbidden:
        return "Forbidden";
      case notFound:
        return "Resources Not Found";
      case internalServerError:
        return "Internal Server Error";
      case badGateway:
        return "Bad Gateway";
      case tooManyRequest:
        return "Too Many Request";
      default:
        return "Error";
    }
  }
}

class CustomColors {
  static const Color primary = Color(0xFFf9bf01);
  static const Color grey = Color(0xFFD8E5EC);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF2A2A2A);
  static const Color deepError = Color(0xFFCB231E);
  static const Color grey10 = Color(0xFFF8FAFC);
  static const Color grey20 = Color(0xFFEDF1F5);
  static const Color grey30 = Color(0xFFD2DDEC);
  static const Color grey40 = Color(0xFF9CB0C9);
  static const Color grey50 = Color(0xFF617692);
}

enum HttpRequestType { get, post, put, delete }

enum CustomTextFormFieldTheme { display, edit }

enum ExpandedButtonTheme { white, blue, gold, approved, reject, cancel }

typedef Json = Map<String, dynamic>;
typedef DialogActions = List<Widget> Function(BuildContext context);

class ServerError {
  ServerError._();

  static String defaultErrorMessage = 'defaultErrorMessage';

  static String translateErrorMessage(String errorMessage) {
    if (errorMessage == ServerError.defaultErrorMessage) {
      return "Default Error Message";
    }

    return errorMessage;
  }
}

enum BottomTabBarItem { trending, settings }
