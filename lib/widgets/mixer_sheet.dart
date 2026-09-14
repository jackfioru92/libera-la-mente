import 'package:flutter/material.dart';

import '../l10n/l10n_ext.dart';
import '../services/app_scope.dart';
import '../services/sound_mixer.dart';
import '../theme.dart';

/// Foglio del mixer: preset, uno slider per suono, avvia/ferma.
Future<void> showMixerSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (_) => const _MixerSheet(),
  );
}

class _MixerSheet extends StatelessWidget {
  const _MixerSheet();

  @override
  Widget build(BuildContext context) {
    final mixer = AppScope.of(context).mixer;
    final l = context.l10n;
    return ListenableBuilder(
      listenable: mixer,
      builder: (context, _) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.muted.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    const Icon(Icons.tune, color: AppColors.accent),
                    const SizedBox(width: 10),
                    Text(
                      l.mixerTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: mixer.active.isEmpty ? null : mixer.clear,
                      child: Text(l.mixerClear),
                    ),
                  ],
                ),
                Text(
                  l.mixerSubtitle,
                  style: const TextStyle(
                    color: AppColors.muted,
                    fontSize: 12.5,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    for (final id in mixerPresets.keys)
                      ActionChip(
                        label: Text(l.mixerPresetName(id)),
                        onPressed: () => mixer.applyPreset(id),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                for (final s in mixerSounds)
                  Row(
                    children: [
                      Icon(
                        s.icon,
                        size: 20,
                        color: mixer.volume(s.id) > 0
                            ? AppColors.accent
                            : AppColors.muted,
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 104,
                        child: Text(
                          l.mixerSoundName(s.id),
                          style: const TextStyle(fontSize: 13.5),
                        ),
                      ),
                      Expanded(
                        child: Slider(
                          value: mixer.volume(s.id),
                          onChanged: (v) => mixer.setVolume(s.id, v),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 6),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: mixer.active.isEmpty && !mixer.playing
                        ? null
                        : mixer.toggle,
                    style: mixer.playing
                        ? FilledButton.styleFrom(
                            backgroundColor: AppColors.surface2,
                            foregroundColor: AppColors.text,
                          )
                        : null,
                    icon: Icon(mixer.playing ? Icons.stop : Icons.play_arrow),
                    label: Text(mixer.playing ? l.mixerStop : l.mixerPlay),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
