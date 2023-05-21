import 'package:flutter/material.dart';
import 'package:hispanosmobile/models/post.dart';
import 'package:jiffy/jiffy.dart';

class HighlightedPost extends StatelessWidget {
  final Post post;
  const HighlightedPost({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RawMaterialButton(
      onPressed: () =>
          Navigator.of(context).pushNamed('/post', arguments: post),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: theme.dividerColor,
              width: 1,
            ),
          ),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: theme.textTheme.headlineLarge!.fontSize! / 2,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: theme.textTheme.bodyMedium!.fontSize! / 2,
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.title, style: theme.textTheme.titleMedium!),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Text(post.author.name,
                          style: theme.textTheme.bodyMedium!),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 8),
                        decoration: BoxDecoration(
                            color: theme.colorScheme.background,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                            Jiffy.parseFromDateTime(post.date).fromNow(),
                            style: theme.textTheme.bodyMedium!),
                      )
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 160,
                  width: 160,
                  child: Container(
                    color: theme.colorScheme.background,
                    child: Hero(
                      tag: post.id,
                      child: Image.network(
                        post.imageUri,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
