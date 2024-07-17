import 'package:etiqa_github_repo/app/assets/constants.dart';
import 'package:etiqa_github_repo/app/models/error/error_model.dart';
import 'package:etiqa_github_repo/app/models/network/my_response.dart';
import 'package:etiqa_github_repo/app/utils/error_handlers.dart';
import 'package:etiqa_github_repo/app/utils/util.dart';
import 'package:flutter/material.dart';

abstract class BaseStatefulPage extends StatefulWidget {
  const BaseStatefulPage({super.key});
}

abstract class BaseStatefulState<Page extends BaseStatefulPage>
    extends State<Page> {
  PreferredSizeWidget? appbar() => null;
  Widget body();
  Widget? floatingActionButton();
  ErrorModel? urgentError();
  bool topSafeAreaEnabled() => true;
  bool bottomSafeAreaEnabled() => true;
  Color backgroundColor() => CustomColors.white;

  bool isLoading(ResponseStatus status) => status == ResponseStatus.loading;

  Widget buildLoadingMoreIndicator() => Padding(
        padding: const EdgeInsets.all(5),
        child: Transform.scale(
          scale: 0.5,
          child: buildLoadingIndicator(),
        ),
      );

  Widget buildLoadingIndicator() => const Center(
        child: CircularProgressIndicator(color: CustomColors.primary),
      );

  void showSnackBarMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<T?> showErrorAlertDialog<T>({
    MyResponse<dynamic, dynamic>? response,
    String? errorMessage,
    String? doneButtonTitle,
    VoidCallback? onDoneButtonPressed,
  }) {
    List<Widget> actions(BuildContext context) => <Widget>[
          WidgetUtil.getDialogButton(doneButtonTitle ?? 'Okay', () {
            Navigator.of(context, rootNavigator: true).pop();
            onDoneButtonPressed?.call();
          }),
        ];

    return WidgetUtil.showAlertDialog(
      context,
      'Error',
      response != null ? ErrorHandler.getErrorMessage(response) : errorMessage,
      actions,
      false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        drawerEdgeDragWidth: 0.0,
        appBar: appbar(),
        body: SafeArea(
          top: topSafeAreaEnabled(),
          bottom: bottomSafeAreaEnabled(),
          child: body(),
        ),
        backgroundColor: backgroundColor(),
        floatingActionButton: floatingActionButton(),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
