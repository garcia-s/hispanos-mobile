import 'package:flutter/material.dart';
import 'package:hispanosmobile/models/podcast.dart';
import 'package:hispanosmobile/widgets/renderers/html_custom_widget.dart';

class PodcastPage extends StatelessWidget {
  const PodcastPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Podcast podcast =
        ModalRoute.of(context)!.settings.arguments as Podcast;
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: theme.canvasColor,
            expandedHeight: 300,
            flexibleSpace: Hero(
              tag: podcast.id,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                      child: Image.network(
                        podcast.imageUri!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    podcast.title,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: HtmlCustomWidget(podcast.content),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
