import 'package:etiqa_github_repo/app/assets/constants.dart';
import 'package:etiqa_github_repo/app/models/error/error_model.dart';
import 'package:etiqa_github_repo/app/models/network/my_response.dart';
import 'package:etiqa_github_repo/app/viewmodels/main_page_view_model.dart';
import 'package:etiqa_github_repo/app/views/base_stateful_page.dart';
import 'package:etiqa_github_repo/app/views/setting_page.dart';
import 'package:etiqa_github_repo/app/views/trending_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends BaseStatefulPage {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends BaseStatefulState<MainPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  void onBottomTabTapped(int index) {
    setSelectedBottomtab(index);
  }

  void setSelectedBottomtab(int index) {
    context.read<MainPageViewModel>().setSelectedBottomTabIndex(index);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this,
        length: 2,
        animationDuration: const Duration(milliseconds: 500));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<MainPageViewModel>()
          .setSelectedBottomTabIndex(BottomTabBarItem.trending.index);
    });
  }

  Widget buildScreen() {
    final theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.1),
              ),
            ),
            child: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(
                    iconMargin: EdgeInsets.only(bottom: 5),
                    text: 'Trending',
                    icon: Icon(Icons.star),
                  ),
                  Tab(
                    iconMargin: EdgeInsets.only(bottom: 5),
                    text: 'Settings',
                    icon: Icon(Icons.settings),
                  ),
                ],
                onTap: onBottomTabTapped,
                splashFactory: NoSplash.splashFactory,
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  return states.contains(MaterialState.focused)
                      ? null
                      : Colors.transparent;
                }),
                labelColor: CustomColors.primary,
                unselectedLabelColor: CustomColors.black,
                labelStyle: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                ),
                unselectedLabelStyle: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 10,
                ),
                indicator: const BoxDecoration(),
              ),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          TrendingPage(),
          SettingPage(),
        ],
      ),
    );
  }

  @override
  Widget body() {
    final viewModel = context.read<MainPageViewModel>();
    final response = context.watch<MainPageViewModel>().response;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (response.status == ResponseStatus.complete) {
        viewModel.consumed();
      } else if (response.status == ResponseStatus.error) {
        showErrorAlertDialog<dynamic>(response: response);
        viewModel.consumed();
      }
    });

    return buildScreen();
  }

  @override
  bool topSafeAreaEnabled() => false;

  @override
  bool bottomSafeAreaEnabled() => false;

  @override
  Widget? floatingActionButton() => null;

  @override
  ErrorModel? urgentError() => null;
}
