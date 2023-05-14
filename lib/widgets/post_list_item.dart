import 'package:flutter/material.dart';
import 'package:hispanosmobile/models/post.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Color.fromARGB(255, 207, 207, 207),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Text(post.author.name)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 170,
            width: 170,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: const Color.fromARGB(255, 70, 69, 69),
                child: Image.network(
                  post.imageUri,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
