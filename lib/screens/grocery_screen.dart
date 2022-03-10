import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import './empty_grocery_screen.dart';
import 'grocery_list_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GroceryManager>(
        builder: (BuildContext context, GroceryManager manager, Widget? child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Provider.of<GroceryManager>(context, listen: false).createNewItem();
          },
        ),
        body: manager.groceryItems.isNotEmpty
            ? GroceryListScreen(manager: manager)
            : const EmptyGroceryScreen(),
      );
    });
  }
}
