import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hispanosmobile/pages/index_page/home/components/highlighted_post.dart';
import 'package:hispanosmobile/pages/index_page/home/components/podcasts_section.dart';
import 'package:hispanosmobile/pages/index_page/home/mockup/ad_placeholder.dart';
import 'package:hispanosmobile/pages/index_page/home/mockup/mockup_magazine.dart';
import 'package:hispanosmobile/pages/index_page/home/mockup/mockup_podcast.dart';
import 'package:hispanosmobile/pages/index_page/home/mockup/mockup_post.dart';
import 'package:hispanosmobile/state/magazine_provider.dart';
import 'package:hispanosmobile/state/podcast_provider.dart';
import 'package:hispanosmobile/state/posts_provider.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsProvider);
    final podcasts = ref.watch(podcastProvider);
    final magazines = ref.watch(magazineProvider);

    return CustomScrollView(
      slivers: [
        const AdPlaceholder(),
        posts == null
            ? const MockupPostSection()
            : SliverFixedExtentList.builder(
                itemExtent: 180,
                itemCount: 4,
                itemBuilder: (ctx, i) => HighlightedPost(post: posts[i]),
              ),
        podcasts == null
            ? const MockupHighlightedPodcastSection()
            : PodcastsSection(podcasts: podcasts),
        magazines == null
            ? const MockupMagazineSection()
            : const MockupMagazineSection(),
        posts == null
            ? const MockupPostSection()
            : SliverFixedExtentList.builder(
                itemExtent: 180,
                itemCount: 4,
                itemBuilder: (ctx, i) => HighlightedPost(post: posts[i + 4]),
              ),
      ],
    );
  }
}
