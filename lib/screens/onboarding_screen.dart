import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../models/models.dart';

class OnboardingScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: FoodiesPages.onboardingPath,
        key: ValueKey(FoodiesPages.onboardingPath),
        child: const OnboardingScreen());
  }

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OnboardingScreenState();
  }
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  final Color rwColor = const Color.fromRGBO(64, 143, 77, 1);

  Widget buildActionButtons() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      MaterialButton(
        child: const Text('Skip'),
        onPressed: () {
          Provider.of<AppStateManager>(context, listen: false)
              .completeOnboarding();
        },
      )
    ]);
  }

  Widget onboardPageView(ImageProvider imageProvider, String text) {
    return Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Image(image: imageProvider, fit: BoxFit.fitWidth),
            ),
            const SizedBox(height: 16),
            Text(
              text,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
          ],
        ));
  }

  Widget buildPages() {
    return PageView(
      controller: controller,
      children: <Widget>[
        onboardPageView(const AssetImage('assets/misc_assets/recommend.png'),
            '''Check out weekly recommended recipes and what your friends are cooking!'''),
        onboardPageView(const AssetImage('assets/misc_assets/sheet.png'),
            'Cook with step by step instructions!'),
        onboardPageView(const AssetImage('assets/misc_assets/list.png'),
            'Keep track of what you need to buy'),
      ],
    );
  }

  Widget buildIndicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: WormEffect(dotColor: rwColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Getting Started'),
        leading: GestureDetector(
          child: const Icon(Icons.chevron_left, size: 35),
          onTap: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: buildPages(),
            ),
            buildIndicator(),
            buildActionButtons(),
          ],
        ),
      ),
    );
  }
}
