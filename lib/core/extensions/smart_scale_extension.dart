import 'package:flutter/material.dart';
import 'package:marketi/core/utils/smart_scaler.dart';

extension SmartScaleExtension on num {
  double w(
    BuildContext context, {
    bool useBreakpoints = false,
    double? lowerLimitRatio,
    double? upperLimitRatio,
  }) => SmartScaler.w(
    toDouble(),
    context,
    useBreakpoints: useBreakpoints,
    lowerLimitRatio: lowerLimitRatio,
    upperLimitRatio: upperLimitRatio,
  );
  double h(
    BuildContext context, {
    bool useBreakpoints = false,
    double? lowerLimitRatio,
    double? upperLimitRatio,
  }) => SmartScaler.h(
    toDouble(),
    context,
    useBreakpoints: useBreakpoints,
    lowerLimitRatio: lowerLimitRatio,
    upperLimitRatio: upperLimitRatio,
  );
  double r(
    BuildContext context, {
    bool useBreakpoints = false,
    double? lowerLimitRatio,
    double? upperLimitRatio,
  }) => SmartScaler.r(
    toDouble(),
    context,
    useBreakpoints: useBreakpoints,
    lowerLimitRatio: lowerLimitRatio,
    upperLimitRatio: upperLimitRatio,
  );
}
