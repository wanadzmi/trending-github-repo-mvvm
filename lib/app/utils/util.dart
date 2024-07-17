import 'dart:convert';
import 'dart:io';
import 'package:etiqa_github_repo/app/assets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class WidgetUtil {
  static Future<T?> showAlertDialog<T>(
    BuildContext context,
    String? title,
    String? content,
    DialogActions actions,
    bool dismissible,
  ) {
    return showDialog<T>(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) => PopScope(
        canPop: dismissible,
        child: Platform.isAndroid
            ? getMaterialDialog(title, content, actions(context))
            : getCupertinoDialog(title, content, actions(context)),
      ),
    );
  }

  static Widget getCupertinoDialog(
      String? title, String? content, List<Widget> actions) {
    return CupertinoAlertDialog(
      title: Text(title ?? ''),
      content: Text(content ?? ''),
      actions: actions,
    );
  }

  static Widget getMaterialDialog(
      String? title, String? content, List<Widget> actions) {
    return AlertDialog(
      title: Text(title ?? ''),
      content: Text(content ?? ''),
      actions: actions,
    );
  }

  static Widget getDialogButton(String text, VoidCallback? onPressed) {
    return Platform.isAndroid
        ? TextButton(onPressed: onPressed, child: Text(text))
        : CupertinoDialogAction(
            onPressed: onPressed,
            child: Text(text),
          );
  }

  static void showFullScreenRoundedBottomSheet(
    BuildContext context,
    Widget child,
  ) =>
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        enableDrag: false,
        backgroundColor: Colors.transparent,
        builder: (_) => FractionallySizedBox(
          heightFactor: 0.95,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: ColoredBox(
              color: Colors.white,
              child: child,
            ),
          ),
        ),
      );

  static Future<bool?> showRoundedBottomSheet(
    BuildContext context, {
    required Widget Function(BuildContext) builder,
  }) =>
      showModalBottomSheet<bool?>(
        context: context,
        isScrollControlled: false,
        enableDrag: false,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        builder: (context) => SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: builder.call(context),
          ),
        ),
      );

  static void copyToClipboard(String text) {
    Clipboard.setData(
      ClipboardData(text: text),
    );
  }

  static void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: CustomColors.primary,
      textColor: Colors.white,
      timeInSecForIosWeb: 10,
    );
  }
}

class GroupListUtil {
  static bool shouldShowGroupHeader(
    int index,
    String? previousItemDate,
    String? currentItemDate,
  ) {
    if (index == 0) {
      return true;
    }

    if (previousItemDate == null || currentItemDate == null) {
      return false;
    }

    if (previousItemDate != currentItemDate) {
      return true;
    }

    return false;
  }
}

extension DynamicParsing on dynamic {
  String parseString() => this != null ? toString() : '';

  int parseInt(TextEditingValue value) =>
      this != null ? (int.tryParse(toString()) ?? 0) : 0;

  double parseDouble() =>
      this != null ? (double.tryParse(toString()) ?? 0.0) : 0.0;

  bool parseBool() {
    if (this != null) {
      return this as bool;
    } else {
      return false;
    }
  }
}

extension StringExtension on String? {
  bool isNotEmptyOrNull() {
    return this != null && this!.isNotEmpty;
  }
}

extension JsonParsing on dynamic {
  String toJson() => jsonEncode(this);
  Map<String, dynamic> fromJson() =>
      jsonDecode(toString()) as Map<String, dynamic>;
}

extension NumberParsing on String {
  bool isNumeric() {
    return double.tryParse(this) != null;
  }

  double? getDoubleOrNull() {
    if (isEmpty) {
      return null;
    }
    return double.parse(this);
  }
}

extension StringCurrencyConversion on String {
  double? getBaseCurrencyAmount(double baseCurrency) {
    final amount = getDoubleOrNull();

    if (amount == null) {
      return null;
    }
    return amount.getBaseCurrencyAmount(baseCurrency);
  }

  double? getQuoteCurrencyAmount(double baseCurrency) {
    final amount = getDoubleOrNull();

    if (amount == null) {
      return null;
    }
    return amount.getQuoteCurrencyAmount(baseCurrency);
  }
}

extension Conversion on double {
  double getBaseCurrencyAmount(double baseCurrency) {
    return this * baseCurrency;
  }

  double getQuoteCurrencyAmount(double baseCurrency) {
    return this / baseCurrency;
  }
}

extension DateTimeParsing on DateTime {
  String withFormat(String formatString) {
    return DateFormat(formatString).format(this);
  }

  DateTime getEarliestTimeWithDate() {
    return DateTime(year, month, day);
  }
}

extension StringDateTimeParsing on String {
  String toUtcString() {
    return '${this}z';
  }

  String? withDateFormat(
    String formatString, {
    bool convertToLocal = true,
    bool toUTC = true,
  }) {
    final parsed = DateTime.tryParse(toUTC ? toUtcString() : this);
    if (parsed != null) {
      return DateFormat(formatString)
          .format(convertToLocal ? parsed.toLocal() : parsed);
    }
    return null;
  }

  String? withTimeAgo({
    String? formatString,
    Locale? locale,
    int? timeAgoThreshold,
    bool convertToLocal = true,
    bool toUTC = true,
  }) {
    final parsed = DateTime.tryParse(toUTC ? toUtcString() : this);
    if (parsed != null) {
      if (timeAgoThreshold != null) {
        if (DateTime.now().difference(parsed).inSeconds > timeAgoThreshold) {
          return DateFormat(formatString)
              .format(convertToLocal ? parsed.toLocal() : parsed);
        }
      }
      return timeago.format(parsed, locale: locale?.languageCode);
    }
    return null;
  }
}

extension UrlValidator on String {
  bool isValidUrl() {
    return Uri.tryParse(this)?.isAbsolute ?? false;
  }
}

extension GetOrNull<T> on List<T> {
  T? getOrNull(int index) {
    if (index >= 0 && index <= length - 1) {
      return this[index];
    }
    return null;
  }
}

extension NullableStringExtensions on String? {
  bool isEmptyOrNull() {
    return (this ?? '').isEmpty;
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension CustomTextInputFormatter on String {
  bool shouldFormatLeadingZero() {
    return length > 1 && this[0] == '0' && this[1].isNumeric();
  }

  bool shouldFormatLeadingDecimal() {
    if (length == 1) {
      return this[0] == '.';
    }
    return false;
  }

  String formatLeadingDecimal() {
    return '0.';
  }

  String removeLeadingZero() {
    if (isNotEmpty && this[0] == '0') {
      return substring(1);
    }
    return this;
  }
}
