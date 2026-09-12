import 'package:flutter/material.dart';

import '../l10n/l10n_ext.dart';
import '../services/app_scope.dart';
import '../widgets/mini_player.dart';
import 'ascolta_screen.dart';
import 'oasi_screen.dart';
import 'oggi_screen.dart';
import 'respira_screen.dart';

class HomeShell extends StatelessWidget {
  const HomeShell({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = AppScope.of(context).nav;
    final l = context.l10n;
    return ListenableBuilder(
      listenable: nav,
      builder: (context, _) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: nav.tabIndex,
                  children: const [
                    OggiScreen(),
                    RespiraScreen(),
                    AscoltaScreen(),
                    OasiScreen(),
                  ],
                ),
              ),
              const MiniPlayer(),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: nav.tabIndex,
            onDestinationSelected: nav.goTo,
            height: 64,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.wb_twilight_outlined),
                selectedIcon: const Icon(Icons.wb_twilight),
                label: l.tabToday,
              ),
              NavigationDestination(
                icon: const Icon(Icons.crop_square_outlined),
                selectedIcon: const Icon(Icons.crop_square),
                label: l.tabBreathe,
              ),
              NavigationDestination(
                icon: const Icon(Icons.headphones_outlined),
                selectedIcon: const Icon(Icons.headphones),
                label: l.tabListen,
              ),
              NavigationDestination(
                icon: const Icon(Icons.spa_outlined),
                selectedIcon: const Icon(Icons.spa),
                label: l.tabOasis,
              ),
            ],
          ),
        );
      },
    );
  }
}
