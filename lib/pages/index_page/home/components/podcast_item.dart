import 'package:flutter/material.dart';
import 'package:hispanosmobile/models/podcast.dart';

class PodcastItem extends StatelessWidget {
  final Podcast podcast;
  const PodcastItem({super.key, required this.podcast});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 300,
      width: 350,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: theme.colorScheme.background,
          ),
        ),
        child: RawMaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(15),
          onPressed: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: podcast.imageUri != null
                      ? Image.network(
                          podcast.imageUri.toString(),
                          fit: BoxFit.cover,
                        )
                      : const Placeholder(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: theme.textTheme.titleMedium!.fontSize! / 2,
                ),
                child: Text(podcast.title, style: theme.textTheme.titleMedium!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
