import 'package:flutter/material.dart';
import './foodies_theme.dart';
import './models/models.dart';
import 'package:provider/provider.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatefulWidget {
  const RecipeApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _RecipeAppState();
  }
}

class _RecipeAppState extends State<RecipeApp> {
  final _appStateManager = AppStateManager();
  final _groceryManager = GroceryManager();
  final _profileManager = ProfileManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
        appStateManager: _appStateManager,
        groceryManager: _groceryManager,
        profileManager: _profileManager);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => _profileManager),
          ChangeNotifierProvider(
              create: (BuildContext context) => _groceryManager),
          ChangeNotifierProvider(
              create: (BuildContext context) => _appStateManager)
        ],
        child:
            Consumer<ProfileManager>(builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = FoodiesTheme.dark();
          } else {
            theme = FoodiesTheme.light();
          }

          return MaterialApp(
            theme: theme,
            title: 'Foodies',
            home: Router(
              routerDelegate: _appRouter,
              backButtonDispatcher: RootBackButtonDispatcher(),
            ),
          );
        }));
  }
}
