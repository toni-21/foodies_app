import 'package:flutter/material.dart';
import '../api/mock_foodies_service.dart';
import '../components/components.dart';
import '../models/models.dart';

class RecipeScreen extends StatelessWidget {
  final exploreService = MockFoodiesService();

  RecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: exploreService.getRecipes(),
        builder:
            (BuildContext context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final recipeList = snapshot.data ?? [];
            return RecipesGridView(recipes: recipeList);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
