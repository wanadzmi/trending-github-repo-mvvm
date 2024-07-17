import 'dart:developer';

import 'package:etiqa_github_repo/app/assets/constants.dart';
import 'package:etiqa_github_repo/app/models/network/my_response.dart';
import 'package:etiqa_github_repo/app/services/base_services.dart';

class HomeServices extends BaseServices {
  Future<MyResponse<dynamic, dynamic>> getTrendingRepos(
    String date,
    int page,
  ) async {
    log("Page no: ${page.toString()}");
    final path =
        '${EndPoint.baseURL}/search/repositories?q=created:%3E$date&sort=stars&order=desc&page=$page';
    return callAPI(HttpRequestType.get, path);
  }
}
