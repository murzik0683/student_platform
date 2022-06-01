import 'package:flutter/material.dart';
import 'package:platform/helpers/colors.dart';
import 'package:platform/models/onboarding_info.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = OnboardingController();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPageIndex,
              itemCount: _controller.onboardingPage.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildSpacer(15),
                      ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(150),
                          child: Image.asset(
                            _controller.onboardingPage[index].image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      _buildSpacer(15),
                      Text(
                        _controller.onboardingPage[index].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      _buildSpacer(15),
                      Text(
                        _controller.onboardingPage[index].description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 40,
              left: 175,
              child: Row(
                children: List.generate(
                  _controller.onboardingPage.length,
                  (index) => Obx(() {
                    return Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: _controller.selectedPageIndex.value == index
                              ? ThemeColors.themeColor
                              : CustomColors.greyColor,
                          shape: BoxShape.circle),
                      margin: const EdgeInsets.all(4),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 120,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  fixedSize: MaterialStateProperty.all(
                    const Size(160, 40),
                  ),
                ),
                child: Obx(() {
                  return Text(
                    _controller.isLastPage ? 'Понятно' : 'Далее',
                    style: const TextStyle(
                        color: CustomColors.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  );
                }),
                onPressed: _controller.forwardElevation,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSpacer(double space) {
  return SizedBox(
    height: space,
  );
}
