import 'package:etiqa_github_repo/app/assets/app_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProviders extends StatelessWidget {
  const AppProviders({this.child, super.key});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providerAssets(),
      child: child,
    );
  }
}
