import 'package:flutter/material.dart';
import 'explore_screen.dart';
import 'recipe_screen.dart';
import 'grocery_screen.dart';
import '../models/models.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
        name: FoodiesPages.home,
        key: ValueKey(FoodiesPages.home),
        child: Home(
          currentTab: currentTab,
          //current tab here
        ));
  }

  final int currentTab;
  const Home({Key? key, required this.currentTab}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipeScreen(),
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
        builder: (context, appStateManager, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: Text(
            'Foodies',
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: [
            profileButton(),
          ],
        ),
        body: IndexedStack(
          index: widget.currentTab,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: widget.currentTab,
          onTap: (index) {
            Provider.of<AppStateManager>(context, listen: false).goToTab(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Recipes'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'To Buy'),
          ],
        ),
      );
    });
  }

  Widget profileButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        child: const CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage:
                AssetImage('assets/profile_pics/person_stef.jpeg')),
        onTap: () {
          Provider.of<ProfileManager>(context, listen: false).tapOnProfile(true);
        },
      ),
    );
  }
}
