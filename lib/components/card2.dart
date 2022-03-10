import 'package:flutter/material.dart';
import 'package:food_app/foodies_theme.dart';
import './author_card.dart';
import '../models/models.dart';

class Card2 extends StatelessWidget {
final ExploreRecipe recipe;
  const Card2({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      constraints: const BoxConstraints.expand(width: 350, height: 450),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/mag5.png'), fit: BoxFit.cover),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        children: [
         AuthorCard(
            authorName: recipe.authorName,
            title: recipe.role,
            imagePath: recipe.profileImage,
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Text(
                    recipe.title,
                    style: FoodiesTheme.lightTextTheme.headline1,
                  ),
                ),
                Positioned(
                    bottom: 70,
                    left: 16,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        recipe.subtitle,
                        style: FoodiesTheme.lightTextTheme.headline1,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
