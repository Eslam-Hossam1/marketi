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
      title: "Error",
      desc: errorMessage,
      btnOkOnPress: btnOkOnPress ?? () {},
      btnOkText: btnOkText ?? "Ok",
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
      title: "Warning",
      desc: errorMessage,
      btnOkOnPress: btnOkOnPress,
      btnOkText: btnOkText ?? "Ok",
      btnOk: btnOk,
      btnOkColor: btnOkColor,
      onDismissCallback: onDismissCallback,
      btnCancelColor: btnCancelColor,
      btnCancelText: btnCanceltext ?? "Cancel",
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
      title: title ?? 'Session Ended',
      desc: 'Session Ended, please login again',
      btnOkOnPress: btnOkOnPress,
      btnOkText: btnOkText ?? 'Ok',
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
      title: "Success",
      desc: message,
      btnOkOnPress: btnOkOnPress ?? () {},
      btnOkText: btnOkText ?? "Ok",
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
      btnOkText: 'Exit',
      btnCancelColor: Colors.green,
      btnCanceltext: "Stay",
    );
  }

  static const String _warningExitConfirmationMessage =
      "Are you sure you want to exit? You haven't completed the verification yet and may lose your progress.";

  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
  }
}
