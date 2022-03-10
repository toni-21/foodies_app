import 'package:flutter/material.dart';
import 'package:food_app/models/explore_data.dart';
import '../api/mock_foodies_service.dart';
import '../components/components.dart';

class ExploreScreen extends StatefulWidget {
  final mockService = MockFoodiesService();
  ExploreScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ExploreScreenState();
  }
}

class _ExploreScreenState extends State<ExploreScreen> {
  final controller = ScrollController();

  void scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent ) {
      debugPrint('I am at the bottom');
    }
    if (controller.offset <= controller.position.minScrollExtent &&
        !controller.position.outOfRange) {
      debugPrint('I am at the top');
    }
  }

  @override
  void initState() {
    debugPrint("This shit work");
    controller.addListener(() {
      scrollListener();
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(() { 
      scrollListener();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.mockService.getExploreData(),
      builder: (BuildContext context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == null) {
            debugPrint('no data');
          }
          final recipes = snapshot.data?.todayRecipes ?? [];
          return ListView(
            controller: controller,
            children: [
            TodayRecipeListView(recipes: recipes),
            const SizedBox(height: 16),
            FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? []),
          ]);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
