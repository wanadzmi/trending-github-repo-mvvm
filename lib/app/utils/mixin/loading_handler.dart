import 'package:flutter/material.dart';

mixin LoadingHandler<T extends StatefulWidget> on State<T> {
  bool isFirstLoad = true;
  bool isFiltering = false;
  bool isLoadingMore = false;

  void setIsFirstLoad({bool isFirst = true}) {
    setState(() {
      isFirstLoad = isFirst;
    });
  }

  void setIsFiltering({bool isFilter = true}) {
    setState(() {
      isFiltering = isFilter;
    });
  }

  void setIsLoadingMore({bool loading = true}) {
    setState(() {
      isLoadingMore = loading;
    });
  }
}
