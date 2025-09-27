import 'package:flutter_dotenv/flutter_dotenv.dart';

class Limiter {
  final int maxMessages = int.tryParse(dotenv.env['MESSAGE_LIMIT'] ?? '10') ?? 10;
  final int windowSeconds = int.tryParse(dotenv.env['MESSAGE_WINDOW_SECONDS'] ?? '10') ?? 10;
  final int cooldownSeconds = int.tryParse(dotenv.env['MESSAGE_COOLDOWN_SECONDS'] ?? '5') ?? 5;

  final List<DateTime> _timestamps = [];
  DateTime? _cooldownStart;

  bool isAllowed() {
    final now = DateTime.now();

    if (_cooldownStart != null &&
        now.difference(_cooldownStart!).inSeconds < cooldownSeconds) {
      return false;
    }

    _timestamps.removeWhere((t) => now.difference(t).inSeconds > windowSeconds);
    _timestamps.add(now);

    if (_timestamps.length > maxMessages) {
      _cooldownStart = now;
      _timestamps.clear();
      return false;
    }

    return true;
  }

  int secondsRemaining() {
    if (_cooldownStart == null) return 0;
    final diff = DateTime.now().difference(_cooldownStart!).inSeconds;
    return cooldownSeconds - diff;
  }
}