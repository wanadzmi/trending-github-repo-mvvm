import 'package:etiqa_github_repo/app/models/error/error_model.dart';
import 'package:etiqa_github_repo/app/models/network/my_response.dart';
import 'package:flutter/material.dart';

class BaseViewModel with ChangeNotifier {
  ErrorModel urgentError = ErrorModel();
  MyResponse<dynamic, dynamic> response = MyResponse.initial();

  void notify(MyResponse<dynamic, dynamic> newResponse) {
    _resetUrgent();

    response = newResponse;
    notifyListeners();
  }

  void _resetUrgent() {
    urgentError = ErrorModel();
  }

  void consumed() {
    response = MyResponse.initial();
    _resetUrgent();
  }
}
