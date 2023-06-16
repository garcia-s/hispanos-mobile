import 'package:flutter/material.dart';
import 'package:hispanosmobile/models/post.dart';
import 'package:hispanosmobile/widgets/renderers/html_custom_widget.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Post post = ModalRoute.of(context)!.settings.arguments as Post;
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
                        post.imageUri,
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
                    style: theme.textTheme.headlineMedium,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: HtmlCustomWidget(post.content),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
