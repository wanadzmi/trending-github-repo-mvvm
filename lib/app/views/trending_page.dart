import 'dart:async';
import 'package:etiqa_github_repo/app/assets/constants.dart';
import 'package:etiqa_github_repo/app/models/error/error_model.dart';
import 'package:etiqa_github_repo/app/models/network/my_response.dart';
import 'package:etiqa_github_repo/app/utils/mixin/loading_handler.dart';
import 'package:etiqa_github_repo/app/viewmodels/home_page_view_model.dart';
import 'package:etiqa_github_repo/app/views/base_stateful_page.dart';
import 'package:etiqa_github_repo/app/widgets/repo_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrendingPage extends BaseStatefulPage {
  const TrendingPage({super.key});

  @override
  State<TrendingPage> createState() => TrendingPageState();
}

class TrendingPageState extends BaseStatefulState<TrendingPage>
    with LoadingHandler {
  Timer? _debounce;

  Widget buildRepoList() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        final itemList = context.watch<HomePageViewModel>().itemList;

        if (isFiltering) {
          return SliverFillRemaining(child: buildLoadingIndicator());
        }

        if (!isFiltering && itemList.isEmpty) {
          return SliverToBoxAdapter(
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              child: Column(
                children: [
                  Text(
                    "Empty",
                    style: theme.textTheme.labelLarge!.copyWith(
                      color: CustomColors.grey50,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index == itemList.length) {
                if (isLoadingMore) {
                  return buildLoadingMoreIndicator();
                } else {
                  return const SizedBox.shrink();
                }
              }

              return RepoListItem(itemsModel: itemList[index]);
            },
            childCount: itemList.length + 1,
          ),
        );
      },
    );
  }

  bool onNotification(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.maxScrollExtent - scrollInfo.metrics.pixels <= 200) {
      if (isLoadingMore) return false;

      if (_debounce?.isActive ?? false) _debounce!.cancel();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _debounce = Timer(const Duration(milliseconds: 1000), () {
          final viewModel = context.read<HomePageViewModel>();
          if (!isLoadingMore) {
            setIsLoadingMore();
            viewModel.increasePageNumber();
            viewModel
                .getTrendingRepos()
                .then((value) => setIsLoadingMore(loading: false));
          }
        });
      });
    }
    return false;
  }

  Future<void> onRefresh() async {
    final viewModel = context.read<HomePageViewModel>()..resetPagination();
    await Future.wait([viewModel.getTrendingRepos()]);
  }

  Widget buildScreen() {
    return NotificationListener<ScrollNotification>(
      onNotification: onNotification,
      child: RefreshIndicator(
        color: Theme.of(context).primaryColor,
        onRefresh: onRefresh,
        child: CustomScrollView(
          key: PageStorageKey<String>(BottomTabBarItem.trending.name),
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: <Widget>[buildRepoList()],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context
          .read<HomePageViewModel>()
          .getTrendingRepos()
          .then((value) => setIsFirstLoad(isFirst: false));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget body() {
    final viewModel = context.read<HomePageViewModel>();
    final response = context.read<HomePageViewModel>().response;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (response.status == ResponseStatus.complete) {
        viewModel.consumed();
      } else if (response.status == ResponseStatus.error) {
        await showErrorAlertDialog<dynamic>(response: response);
        viewModel.consumed();
      }
    });
    return isFirstLoad ? buildLoadingIndicator() : buildScreen();
  }

  @override
  PreferredSizeWidget? appbar() {
    final theme = Theme.of(context);
    return AppBar(
      elevation: 0,
      title: Text(
        "Trending Repos",
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: CustomColors.white,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Widget? floatingActionButton() => null;

  @override
  bool topSafeAreaEnabled() => false;

  @override
  ErrorModel? urgentError() => null;
}
