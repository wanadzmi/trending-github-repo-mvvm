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
  Timer? _throttleTimer;
  final ScrollController _scrollController = ScrollController();
  bool _dialogShown = false;
  bool _showScrollToTopButton = false;

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
      if (isLoadingMore || (_throttleTimer?.isActive ?? false)) {
        return false;
      }

      setIsLoadingMore(loading: true);
      final viewModel = context.read<HomePageViewModel>();

      viewModel.increasePageNumber();
      viewModel.getTrendingRepos().then((value) {
        setIsLoadingMore(loading: false);

        _throttleTimer = Timer(const Duration(seconds: 1), () {});
      }).catchError((error) {
        setIsLoadingMore(loading: false);
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
          controller: _scrollController,
          slivers: <Widget>[buildRepoList()],
        ),
      ),
    );
  }

  void _scrollListener() {
    if (_scrollController.position.pixels > 300) {
      setState(() {
        _showScrollToTopButton = true;
      });
    } else {
      setState(() {
        _showScrollToTopButton = false;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
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
    _scrollController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final viewModel = context.read<HomePageViewModel>();
    final response = viewModel.response;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (response.status == ResponseStatus.complete) {
        viewModel.consumed();
      } else if (response.status == ResponseStatus.error && !_dialogShown) {
        setState(() {
          _dialogShown = true;
        });
        await showErrorAlertDialog<dynamic>(response: response);
        viewModel.consumed();
        setState(() {
          _dialogShown = false;
        });
      }
    });
  }

  @override
  Widget body() {
    return isFirstLoad ? buildLoadingIndicator() : buildScreen();
  }

  @override
  PreferredSizeWidget? appbar() {
    final theme = Theme.of(context);
    final viewModel = context.watch<HomePageViewModel>();
    return AppBar(
      elevation: 0,
      title: Text(
        "Trending Repos (${viewModel.itemList.length})",
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: CustomColors.white,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Widget? floatingActionButton() {
    if (!_showScrollToTopButton) return null;

    return FloatingActionButton(
      onPressed: _scrollToTop,
      child: const Icon(Icons.arrow_upward),
    );
  }

  @override
  bool topSafeAreaEnabled() => false;

  @override
  ErrorModel? urgentError() => null;
}
