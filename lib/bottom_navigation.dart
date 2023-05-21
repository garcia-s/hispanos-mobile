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
    return BottomNavigationBar(
      currentIndex: index,
      onTap: onTabChange,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.abc),
          label: localization.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.abc),
          label: localization.blog,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.abc),
          label: localization.magazine,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.abc),
          label: localization.podcasts,
        )
      ],
    );
  }
}
