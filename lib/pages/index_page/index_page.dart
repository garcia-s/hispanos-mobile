import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hispanosmobile/bottom_navigation.dart';
import 'package:hispanosmobile/pages/index_page/home/home_tab.dart';
import 'package:hispanosmobile/state/splash_screen_provider.dart';
import 'package:hispanosmobile/widgets/loading_screen.dart';

class IndexPage extends ConsumerStatefulWidget {
  const IndexPage({super.key});

  @override
  ConsumerState<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends ConsumerState<IndexPage> {
  int _index = 0;

  final Map<int, Widget> tabs = {
    0: const HomeTab(),
    1: Container(),
    2: Container(),
    3: Container(),
  };
  @override
  Widget build(BuildContext context) {
    final splashScreen = ref.watch(splashScreenProvider);
    if (splashScreen) return const LoadingScreen();
    return Scaffold(
      bottomNavigationBar: AppBottomNavigationBar(
        onTabChange: (i) => setState(() => _index = i),
        index: _index,
      ),
      body: tabs[_index],
    );
  }
}
