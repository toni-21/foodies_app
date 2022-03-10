import '../models/models.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

//Mock service that grabs sample json data to mock request/response
class MockFoodiesService {
  //Batch request that gets todays recipes and friend's feed
  Future<ExploreData> getExploreData() async {
    final todayRecipes = await _getTodayRecipes();
    final friendPosts = await _getFriendFeed();

    return ExploreData(todayRecipes, friendPosts);
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }

  //Get sample explore recipes json to display in ui
  Future<List<ExploreRecipe>> _getTodayRecipes() async {
    //Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 300));
    //Load json from file system
    final datastring =
        await _loadAsset('assets/sample_data/sample_explore_recipes.json');

    //Decode to json
    final Map<String, dynamic> json = jsonDecode(datastring);

    //Go through each recipe and convert json to ExploreRecipe object.
    if (json['recipes'] != null) {
      final recipes = <ExploreRecipe>[];
      json['recipes'].forEach((v) {
        recipes.add(ExploreRecipe.fromJson(v));
      });
      return recipes;
    } else {
      debugPrint('sampleExploreRecipes is null bro!!!');
      return [];
    }
  }

  //Get the sample friend json posts to disply in ui
  Future<List<Post>> _getFriendFeed() async {
    //Simulate api request time
    await Future.delayed(const Duration(milliseconds: 300));

    //Load json from file system
    final dataString =
        await _loadAsset('assets/sample_data/sample_friends_feed.json');

    //Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    //Go through each post and convert json to post object
    if (json['feed'] != null) {
      final posts = <Post>[];
      json['feed'].forEach((v) {
        posts.add(Post.fromJson(v));
      });
      return posts;
    } else {
      return [];
    }
  }

  //Get the sample recipe json to dislpay in ui
  Future<List<SimpleRecipe>> getRecipes() async {
    //simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 300));

    //Load json from file system
    final dataString =
        await _loadAsset('assets/sample_data/sample_recipes.json');

    //Decode to json;
    final Map<String, dynamic> json = jsonDecode(dataString);

    //Go through each recipe and converts to SimpleRecipe object
    if (json['recipes'] != null) {
      final recipes = <SimpleRecipe>[];
      json['recipes'].forEach((v) {
        recipes.add(SimpleRecipe.fromJson(v));
      });
      return recipes;
    } else {
      return [];
    }
  }
}
