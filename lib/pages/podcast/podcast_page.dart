import 'package:flutter/material.dart';
import 'package:hispanosmobile/models/podcast.dart';

import 'package:flutter_html/flutter_html.dart';

class PodcastPage extends StatelessWidget {
  const PodcastPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Podcast post = ModalRoute.of(context)!.settings.arguments as Podcast;
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: theme.canvasColor,
            expandedHeight: 300,
            flexibleSpace: Hero(
              tag: post.id,
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
                        post.imageUri!,
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
                    post.title,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Html(
                    data: post.content.replaceAll(
                        RegExp('<style>(.*?)</style>', dotAll: true), ''),
                    doNotRenderTheseTags: const {
                      'div',
                      'style',
                      'ul',
                      'script'
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
