import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../constants/image_path.dart';
import '../widgets/eden_primary_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  static final routeName = "/onboarding";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController(viewportFraction: 1, keepPage: true);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 48),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count:  3,
                    axisDirection: Axis.horizontal,
                    onDotClicked: (index) => controller.jumpToPage(index),
                    effect: ExpandingDotsEffect(
                        activeDotColor: Theme.of(context).primaryColor,
                        dotWidth: 15,
                        dotHeight: 4
                    ),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    child: PageView(
                      controller: controller,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pay your way Globally',
                              style: Theme.of(context).textTheme.headlineLarge,
                              textAlign: TextAlign.left,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0, bottom: 48.0),
                              child: Text(
                                'Low fees, accepted anywhere. Create multiple cards for shopping, subscription & travel.',
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Center(
                              child: SvgPicture.asset(
                                  ImagePath.imageOne,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pay Bills with Ease',
                              style: Theme.of(context).textTheme.headlineLarge,
                              textAlign: TextAlign.left,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0, bottom: 48.0),
                              child: Text(
                                'Pay all of your your bills effortlessly with Shilling and get super awesome cashbacks.',
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Center(
                              child: SvgPicture.asset(
                                  ImagePath.imageTwo,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gift your Loved Ones',
                              style: Theme.of(context).textTheme.headlineLarge,
                              textAlign: TextAlign.left,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0, bottom: 48.0),
                              child: Text(
                                'There is always love in sharing. With Shilling you can gift a virtual card.',
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Center(
                              child: SvgPicture.asset(
                                  ImagePath.imageThree,
                                  semanticsLabel: 'Gift your Loved Ones'
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(),
                EdenPrimaryButton(
                  label: "Get Started",
                  // onTap: ()=> EdenNavigator.clearAndNavigateTo(context, SignUpPhoneScreen.routeName),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}