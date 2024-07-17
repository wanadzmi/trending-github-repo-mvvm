import 'package:etiqa_github_repo/app/assets/constants.dart';
import 'package:etiqa_github_repo/app/viewmodels/base_view_model.dart';

class MainPageViewModel extends BaseViewModel {
  String? deviceName;
  String? deviceIdentifier;
  int selectedBottomTabIndex = BottomTabBarItem.trending.index;

  void setSelectedBottomTabIndex(int index) {
    if (index >= BottomTabBarItem.values.length) {
      return;
    }
    selectedBottomTabIndex = index;
    notifyListeners();
  }
}
