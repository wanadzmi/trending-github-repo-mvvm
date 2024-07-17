import 'package:etiqa_github_repo/app/assets/theme.dart';
import 'package:etiqa_github_repo/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.defaultTheme,
      home: const MainPage(),
      builder: EasyLoading.init(),
    );
  }
}
