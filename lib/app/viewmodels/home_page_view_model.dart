import 'dart:developer';

import 'package:etiqa_github_repo/app/models/github_response_model.dart';
import 'package:etiqa_github_repo/app/models/network/my_response.dart';
import 'package:etiqa_github_repo/app/repositories/home_repository.dart';
import 'package:etiqa_github_repo/app/viewmodels/base_view_model.dart';
import 'package:intl/intl.dart';

class HomePageViewModel extends BaseViewModel {
  int _pageNumber = 1;
  bool _canLoadMore = false;
  DateTime now = DateTime.now();
  List<ItemsModel> itemList = [];
  bool get canLoadMore => _canLoadMore;

  void resetPagination() {
    _pageNumber = 1;
    _canLoadMore = false;
  }

  void increasePageNumber() {
    _pageNumber += 1;
  }

  void decreasePageNumber() {
    if (_pageNumber > 1) {
      _pageNumber -= 1;
    }
  }

  Future<MyResponse<dynamic, dynamic>> getTrendingRepos() async {
    DateTime tenDaysAgo = now.subtract(const Duration(days: 10));
    String date = DateFormat('yyyy-MM-dd').format(tenDaysAgo);

    notify(MyResponse.loading());
    final response = await HomeRepository().getTrendingRepos(date, _pageNumber);

    if (response.status == ResponseStatus.error) {
      decreasePageNumber();
    }

    if (response.data is GithubResponseModel) {
      GithubResponseModel githubResponseModel =
          response.data as GithubResponseModel;
      if (githubResponseModel.items != null) {
        if (_pageNumber <= 1) {
          itemList = githubResponseModel.items!;
        } else {
          itemList.addAll(githubResponseModel.items!);
        }
      }
    }

    log("List length: ${itemList.length.toString()}");

    notify(response);
    return response;
  }
}
