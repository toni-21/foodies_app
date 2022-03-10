import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class SplashScreen extends StatefulWidget {
  //SplashScreen MaterialPage Helper
  static MaterialPage page() {
    return MaterialPage(
      name: FoodiesPages.splashPath,
      key: ValueKey(FoodiesPages.splashPath),
      child: const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //Initialize App
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            height: 200,
            image: AssetImage('assets/misc_assets/rw_logo.png'),
          ),
          Text('Initializing .......')
        ],
      )),
    );
  }
}
