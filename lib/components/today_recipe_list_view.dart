import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';

class TodayRecipeListView extends StatelessWidget {
  final List<ExploreRecipe> recipes;
  const TodayRecipeListView({Key? key, required this.recipes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildCard(ExploreRecipe recipe) {
      if (recipe.cardType == RecipeCardType.card1) {
        return Card1(recipe: recipe);
      } else if (recipe.cardType == RecipeCardType.card2) {
        return Card2(recipe: recipe);
      } else if (recipe.cardType == RecipeCardType.card3) {
        return Card3(recipe: recipe);
      } else {
        throw Exception("This card doesn't exist yet");
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Recipes of the Day 🍳',
              style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 15),
          Container(
            height: 400,
            color: Colors.transparent,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recipes.length,
              itemBuilder: (BuildContext context, int index) {
                final recipe = recipes[index];
                return buildCard(recipe);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 16);
              },
            ),
          )
        ],
      ),
    );
  }
}
