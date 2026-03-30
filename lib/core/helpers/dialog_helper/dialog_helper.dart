import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:go_router/go_router.dart';
import 'get_custom_awesome_dialog.dart';
import 'package:flutter/material.dart';

abstract class DialogHelper {
  static void showErrorDialog(
    BuildContext context, {
    required String errorMessage,
    String? title,
    String? btnOkText,
    void Function()? btnOkOnPress,
    void Function(DismissType)? onDismissCallback,
    Widget? btnOk,
  }) {
    getCustomAwesomeDialog(
      context,
      dialogType: DialogType.error,
      title: "خطأ",
      desc: errorMessage,
      btnOkOnPress: btnOkOnPress ?? () {},
      btnOkText: btnOkText ?? "حسنا",
      btnOk: btnOk,
      onDismissCallback: onDismissCallback ?? (DismissType _) {},
    ).show();
  }

  static void showWarningDialog(
    BuildContext context, {
    required String errorMessage,
    String? title,
    String? btnOkText,
    void Function()? btnOkOnPress,
    void Function(DismissType)? onDismissCallback,
    Widget? btnOk,
    Color? btnOkColor,
    Color? btnCancelColor,
    String? btnCanceltext,
  }) {
    getCustomAwesomeDialog(
      context,
      dialogType: DialogType.warning,
      title: "تحذير",
      desc: errorMessage,
      btnOkOnPress: btnOkOnPress,
      btnOkText: btnOkText ?? "حسنا",
      btnOk: btnOk,
      btnOkColor: btnOkColor,
      onDismissCallback: onDismissCallback,
      btnCancelColor: btnCancelColor,
      btnCancelText: btnCanceltext ?? "الغاء",
      btnCancelOnPress: () {},
    ).show();
  }

  static void showEndSessionDialog(
    BuildContext context, {
    String? title,
    String? btnOkText,
    void Function()? btnOkOnPress,
    void Function(DismissType)? onDismissCallback,
    Widget? btnOk,
    Color? btnOkColor,
    Color? btnCancelColor,
    String? btnCanceltext,
  }) {
    getCustomAwesomeDialog(
      context,
      dialogType: DialogType.warning,
      title: title ?? 'انتهت الجلسة',
      desc: 'انتهت الجلسة، يرجى تسجيل الدخول مرة أخرى',
      btnOkOnPress: btnOkOnPress,
      btnOkText: btnOkText ?? 'حسنا',
      btnOk: btnOk,
      btnOkColor: btnOkColor,
      onDismissCallback: onDismissCallback,
      btnCancelColor: btnCancelColor,
      btnCancelText: btnCanceltext,
    ).show();
  }

  static void showSuccessDialog(
    BuildContext context, {
    required String message,
    String? title,
    String? btnOkText,
    void Function()? btnOkOnPress,
    void Function(DismissType)? onDismissCallback,
    Widget? btnOk,
    Color? btnOkColor,
  }) {
    getCustomAwesomeDialog(
      context,
      dialogType: DialogType.success,
      title: "نجاح",
      desc: message,
      btnOkOnPress: btnOkOnPress ?? () {},
      btnOkText: btnOkText ?? "حسنا",
      btnOk: btnOk,
      btnOkColor: btnOkColor,
      onDismissCallback: onDismissCallback,
    ).show();
  }

  static void showCustomExitConfirmationDialog(
    BuildContext context, {
    String? errorMessage,
    void Function()? btnOkOnPress,
  }) {
    DialogHelper.showWarningDialog(
      context,
      errorMessage: errorMessage ?? _warningExitConfirmationMessage,
      btnOkOnPress: btnOkOnPress ?? () => context.pop(),
      btnOkColor: Colors.red,
      btnOkText: 'خروج',
      btnCancelColor: Colors.green,
      btnCanceltext: "البقاء",
    );
  }

  static const String _warningExitConfirmationMessage =
      "هل انت متاكد من الخروج؟ لم تكمل التحقق بعد وقد تفقد تقدمك.";

  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
  }
}
