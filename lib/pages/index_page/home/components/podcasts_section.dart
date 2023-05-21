import 'package:flutter/material.dart';
import 'package:hispanosmobile/l10n/get_localization.dart';
import 'package:hispanosmobile/models/podcast.dart';
import './podcast_item.dart';

class PodcastsSection extends StatelessWidget {
  final List<Podcast> podcasts;
  const PodcastsSection({super.key, required this.podcasts});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localization = getLocalization(context);

    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: theme.textTheme.headlineSmall!.fontSize!,
        ),
        height: 330,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.1, color: Colors.white),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localization!.indexPodcastsHeadline,
              style: theme.textTheme.headlineSmall,
            ),
            SizedBox(height: theme.textTheme.headlineSmall!.fontSize! / 2),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i < 5 && i < podcasts.length; i++)
                    PodcastItem(podcast: podcasts[i])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
