import 'package:flutter/material.dart';
import './components.dart';
import '../models/models.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> friendPosts;

  const FriendPostListView({Key? key, required this.friendPosts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Text('Social Chefs 👩‍🍳', style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 16),
          ListView.separated(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final post = friendPosts[index];
                return FriendPostTile(post: post);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16);
              },
              itemCount: friendPosts.length),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
