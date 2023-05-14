import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hispanosmobile/l10n/get_localization.dart';
import 'package:hispanosmobile/pages/index_page/mockup/mockup_index_content.dart';
import 'package:hispanosmobile/state/state_provider.dart';
import 'package:hispanosmobile/widgets/posts_grid.dart';

class BlogPage extends ConsumerWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localization = getLocalization(context)!;
    final appState = ref.watch(appStateProvider);
    return Scaffold(
      body: appState.posts == null
          ? const MockupIndexContent()
          : PostsGrid(
              appstate: appState,
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
      ),
    );
  }
}
