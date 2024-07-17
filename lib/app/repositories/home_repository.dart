import 'package:etiqa_github_repo/app/assets/constants.dart';
import 'package:etiqa_github_repo/app/models/github_response_model.dart';
import 'package:etiqa_github_repo/app/models/network/my_response.dart';
import 'package:etiqa_github_repo/app/services/home_services.dart';

class HomeRepository {
  final HomeServices _homeServices = HomeServices();

  Future<MyResponse<dynamic, dynamic>> getTrendingRepos(
    String date,
    int page,
  ) async {
    final response = await _homeServices.getTrendingRepos(date, page);
    if (response.status == ResponseStatus.complete) {
      final githubResponseModel =
          GithubResponseModel.fromMap(response.data as Json);
      return MyResponse.complete(githubResponseModel);
    }
    return response;
  }
}
