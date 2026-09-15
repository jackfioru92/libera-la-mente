import 'dart:io';

import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

/// Vibrazioni della respirazione guidata.
///
/// Su iOS usa il Taptic Engine ([HapticFeedback]), che è preciso e delicato.
/// Su Android [HapticFeedback] dipende dal "feedback al tocco" di sistema,
/// spesso disattivato o impercettibile: qui si usa il motore di vibrazione
/// vero (`Vibrator`, permesso VIBRATE) con durata e intensità esplicite.
class Haptics {
  Haptics._();

  static bool? _hasVibrator;
  static bool _hasAmplitude = false;

  static Future<bool> _android() async {
    if (!Platform.isAndroid) return false;
    if (_hasVibrator == null) {
      try {
        _hasVibrator = await Vibration.hasVibrator();
        _hasAmplitude = await Vibration.hasAmplitudeControl();
      } catch (_) {
        _hasVibrator = false;
      }
    }
    return _hasVibrator!;
  }

  static Future<void> _vibrate(int ms, int amplitude) async {
    try {
      await Vibration.vibrate(
        duration: ms,
        amplitude: _hasAmplitude ? amplitude : -1,
      );
    } catch (_) {}
  }

  /// Tic leggero: un secondo di Inspira/Espira.
  static Future<void> tick() async {
    if (await _android()) return _vibrate(18, 70);
    return HapticFeedback.selectionClick();
  }

  /// Inizio di Inspira o Espira: un colpo deciso.
  static Future<void> strong() async {
    if (await _android()) return _vibrate(70, 230);
    return HapticFeedback.heavyImpact();
  }

  /// Inizio di Trattieni: doppio tocco medio.
  static Future<void> double_() async {
    if (await _android()) {
      try {
        await Vibration.vibrate(
          pattern: const [0, 45, 90, 45],
          intensities: _hasAmplitude ? const [0, 160, 0, 160] : const [],
        );
      } catch (_) {}
      return;
    }
    await HapticFeedback.mediumImpact();
    await Future<void>.delayed(const Duration(milliseconds: 130));
    await HapticFeedback.mediumImpact();
  }

  /// Conferma di un'azione (es. riattivata la vibrazione).
  static Future<void> confirm() async {
    if (await _android()) return _vibrate(40, 150);
    return HapticFeedback.mediumImpact();
  }
}
