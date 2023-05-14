import 'package:flutter/material.dart';
import 'package:hispanosmobile/state/state_provider.dart';

class PostsGrid extends StatelessWidget {
  final AppState appstate;

  const PostsGrid({super.key, required this.appstate});

  List<Widget> _constructGrid() {
    List<Widget> slivers = [];
    // int i = 0;
    // int j = 0;
    // int k = 0;
    // while (i < posts.length && j < podcasts.length && k < magazine.length) {
    //   slivers.add(SliverToBoxAdapter(
    //     child: Container(
    //       height: 300,
    //       color: const Color.fromARGB(255, 102, 21, 16),
    //       child: const Center(
    //         child: Text(
    //           "AD SPACE",
    //           style: TextStyle(fontSize: 40),
    //         ),
    //       ),
    //     ),
    //   ));
    //   slivers.add(SliverFixedExtentList.builder(
    //     itemExtent: 200,
    //     itemCount: 4,
    //     itemBuilder: (_, index) => PostListItem(post: posts[i]),
    //   ));
    //   // Increment by 4
    //   i += 4;
    // }
    return slivers;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _constructGrid());
  }
}


// SliverToBoxAdapter(
//           child: SizedBox(
//             height: 260,
//             child: ListView(scrollDirection: Axis.horizontal, children: [
//               Container(
//                 width: 400,
//                 height: 260,
//                 color: Colors.white,
//                 margin: const EdgeInsets.all(10),
//               ),
//               Container(
//                 width: 400,
//                 height: 280,
//                 color: Colors.white,
//                 margin: const EdgeInsets.all(10),
//               ),
//               Container(
//                 width: 400,
//                 height: 280,
//                 color: Colors.white,
//                 margin: const EdgeInsets.all(10),
//               ),
//             ]),
//           ),
//         )