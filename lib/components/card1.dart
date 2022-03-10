import 'package:flutter/material.dart';
import '../foodies_theme.dart';
import '../models/models.dart';

class Card1 extends StatelessWidget {
  final ExploreRecipe recipe;
  const Card1({Key? key, required this.recipe}) : super(key: key);

  // final String category = "Editor's Choice";
  // final String title = 'The Art of Dough';
  // final String description = 'Learn to make the perfect bread.';
  // final String chef = 'Ray Wenderlich';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: <Widget>[
            Text(recipe.subtitle, style: FoodiesTheme.darkTextTheme.bodyText1),
            Positioned(
              child: Text(recipe.title, style: FoodiesTheme.darkTextTheme.headline6),
              top: 20,
            ),
            Positioned(
              child: Text(recipe.message,
                  style: FoodiesTheme.darkTextTheme.bodyText1),
              bottom: 30,
              right: 0,
            ),
            Positioned(
              child: Text(recipe.authorName, style: FoodiesTheme.darkTextTheme.bodyText1),
              bottom: 10,
              right: 0,
            ),
          ],
        ),
      ),
    );
  }
}
