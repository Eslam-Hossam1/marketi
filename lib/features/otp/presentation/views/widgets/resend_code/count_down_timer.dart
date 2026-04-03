import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/otp_cubit/otp_cubit.dart';

class CountdownTimer extends StatefulWidget {
  final int seconds;
  final TextStyle timertextStyle;
  const CountdownTimer(
      {super.key, required this.seconds, required this.timertextStyle});

  @override
  State<CountdownTimer> createState() => CountdownTimerState();
}

class CountdownTimerState extends State<CountdownTimer> {
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.seconds;
    _startTimer(_remainingSeconds);
  }

  void _startTimer(int initialSeconds) {
    _timer?.cancel();

    _remainingSeconds = initialSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        if (mounted) {
          setState(() {
            _remainingSeconds--;
          });
        }
      } else {
        _onFinish(timer);
      }
    });
  }

  void _onFinish(Timer timer) {
    timer.cancel();
    context.read<OtpCubit>().showResendButton();
  }

  String _formatTime(int seconds) {
    int remainingSeconds = seconds % 60;
    return "${remainingSeconds}s";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatTime(_remainingSeconds),
      style: widget.timertextStyle,
    );
  }
}
