import 'package:flutter/material.dart';
import 'package:hispanosmobile/l10n/get_localization.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final Function(int) onTabChange;
  final int index;
  const AppBottomNavigationBar({
    super.key,
    required this.onTabChange,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    final localization = getLocalization(context)!;
    final theme = Theme.of(context);
    return BottomNavigationBar(
      useLegacyColorScheme: false,
      currentIndex: index,
      onTap: onTabChange,
      selectedIconTheme: theme.iconTheme,
      unselectedLabelStyle: theme.textTheme.labelSmall,
      selectedLabelStyle: theme.textTheme.labelSmall,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_rounded),
          backgroundColor: theme.primaryColor,
          label: localization.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.newspaper),
          label: localization.blog,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.abc),
          label: localization.magazine,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.podcasts),
          label: localization.podcasts,
        )
      ],
    );
  }
}
