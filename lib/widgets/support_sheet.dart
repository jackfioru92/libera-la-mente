import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config.dart';
import '../l10n/l10n_ext.dart';
import '../theme.dart';
import 'breathing_box.dart';

/// "Paga quanto vuoi", mostrato una sola volta dopo la prima sessione
/// completata: prima si prova l'app, poi si parla di contributi.
Future<void> showSupportSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (_) => const _SupportSheet(),
  );
}

class _SupportSheet extends StatelessWidget {
  const _SupportSheet();

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const BoxGlyph(size: 26),
                const SizedBox(width: 12),
                Text(
                  l.supportTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              l.welcomeIndie,
              style: const TextStyle(fontSize: 14.5, height: 1.5),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () async {
                await launchUrl(
                  Uri.parse(kDonateUrl),
                  mode: LaunchMode.externalApplication,
                );
                if (context.mounted) Navigator.of(context).maybePop();
              },
              icon: const Icon(Icons.coffee),
              label: Text(l.buyMeCoffee),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => Navigator.of(context).maybePop(),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.text.withValues(alpha: 0.85),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(l.continueFree),
            ),
          ],
        ),
      ),
    );
  }
}
