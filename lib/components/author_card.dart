import 'package:flutter/material.dart';
import '../foodies_theme.dart';
import './circle_image.dart';

class AuthorCard extends StatefulWidget {
  final String? authorName;
  final String? title;
  final String? imagePath;
  const AuthorCard({Key? key, this.authorName, this.title, this.imagePath})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(
                imagePath: widget.imagePath,
                imageRadius: 28,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName!,
                    style: FoodiesTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    widget.title!,
                    style: FoodiesTheme.lightTextTheme.headline3,
                  )
                ],
              )
            ],
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
            icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
            iconSize: 30,
            color: Colors.red[400],
          ),
        ],
      ),
    );
  }
}
