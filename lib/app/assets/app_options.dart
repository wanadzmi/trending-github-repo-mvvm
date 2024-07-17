import 'package:etiqa_github_repo/app/viewmodels/base_view_model.dart';
import 'package:etiqa_github_repo/app/viewmodels/home_page_view_model.dart';
import 'package:etiqa_github_repo/app/viewmodels/main_page_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providerAssets() => [
      ChangeNotifierProvider.value(value: BaseViewModel()),
      ChangeNotifierProvider(create: (_) => MainPageViewModel()),
      ChangeNotifierProvider(create: (_) => HomePageViewModel()),
    ];
