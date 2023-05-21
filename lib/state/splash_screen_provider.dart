import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hispanosmobile/state/categories_provider.dart';
import 'package:hispanosmobile/state/podcast_provider.dart';

final splashScreenProvider =
    StateNotifierProvider<SplashScreenStateNotifier, bool>(
        (ref) => SplashScreenStateNotifier(ref));

class SplashScreenStateNotifier extends StateNotifier<bool> {
  final Ref ref;
  SplashScreenStateNotifier(this.ref) : super(true) {
    removeSplashScreen();
  }

  removeSplashScreen() {
    Timer(const Duration(seconds: 2), () {
      state = false;
      ref.read(categoryProvider.notifier).initialize();
      ref.read(podcastProvider.notifier).initialize();
    });
  }
}
