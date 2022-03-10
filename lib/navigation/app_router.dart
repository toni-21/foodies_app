import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final GroceryManager groceryManager;
  final ProfileManager profileManager;
  final AppStateManager appStateManager;

  AppRouter(
      {required this.appStateManager,
      required this.groceryManager,
      required this.profileManager})
      : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    groceryManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    groceryManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateManager.isInitialized) SplashScreen.page(),
        if (appStateManager.isInitialized && !appStateManager.isLoggedIn)
          LoginScreen.page(),
        if (appStateManager.isLoggedIn && !appStateManager.isOnboardingComplete)
          OnboardingScreen.page(),
        if (appStateManager.isOnboardingComplete)
          Home.page(appStateManager.getSelectedTab),
        if (groceryManager.isCreatingNewItem)
          GroceryItemScreen.page(onCreate: (item) {
            groceryManager.addItem(item);
          }, onUpdate: (item, index) {
            //no update
          }),
        if (groceryManager.selectedIndex != -1)
          GroceryItemScreen.page(
              item: groceryManager.selectedGroceryItem,
              index: groceryManager.selectedIndex,
              onUpdate: (item, index) {
                groceryManager.updateItem(item, index);
              },
              onCreate: (_) {}
              //no create
              ),
        if (profileManager.didSelectUser)
          ProfileScreen.page(profileManager.getUser),
        //TODO: Add WebView Screen
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    if (route.settings.name == FoodiesPages.onboardingPath) {
      appStateManager.logout();
    }
    if (route.settings.name == FoodiesPages.groceryItemDetails) {
      groceryManager.groceryItemTapped(-1);
    }
    if (route.settings.name == FoodiesPages.profilePath){
      profileManager.tapOnProfile(false);
    }
    //TODO: Handle state when user closes WebView screen
    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    return;
  }
}
