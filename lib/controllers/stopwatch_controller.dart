import 'dart:async';
import 'package:flutter/material.dart';

class StopWatchController extends ChangeNotifier {
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  bool get isRunning => _stopwatch.isRunning;

  String get formattedTime {
    final elapsed = _stopwatch.elapsed;
    final minutes = elapsed.inMinutes.toString().padLeft(2, '0');
    final seconds = (elapsed.inSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  void start() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      notifyListeners();
    });
    notifyListeners();
  }

  void stop() {
    _stopwatch.stop();
    _timer?.cancel();
    notifyListeners();
  }

  void reset() {
    _stopwatch.reset();
    _stopwatch.stop();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
