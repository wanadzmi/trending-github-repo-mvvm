import 'package:etiqa_github_repo/app/models/error/error_model.dart';
import 'package:etiqa_github_repo/app/views/base_stateful_page.dart';
import 'package:flutter/material.dart';

class SettingPage extends BaseStatefulPage {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => SettingPageState();
}

class SettingPageState extends BaseStatefulState<SettingPage> {
  Widget buildScreen() {
    return const Center(child: Text('Settings'));
  }

  @override
  Widget body() {
    return buildScreen();
  }

  @override
  Widget? floatingActionButton() => null;

  @override
  bool topSafeAreaEnabled() => false;

  @override
  ErrorModel? urgentError() => null;
}
