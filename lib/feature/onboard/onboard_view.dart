import 'package:flutter/material.dart';
import 'package:onboarding_covid/core/init/design/text_style.dart';
import 'package:onboarding_covid/core/widget_size_constant.dart';
import 'package:onboarding_covid/feature/login/login_view.dart';
import '../../core/init/design/color.dart';
import '../../product/custom_button.dart';
import 'onboard_model.dart';

class OnboardView extends StatefulWidget {
  OnboardView({Key? key}) : super(key: key);

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcLightColor,
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: contents.length,
        itemBuilder: (_, i) {
          return Column(children: [
            Expanded(flex: 6, child: Image.asset(contents[i].image)),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                    color: kcPrimaryColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BuildDot(currentIndex: currentIndex),
                      Text(
                        contents[i].title,
                        style: subheadingStyle.copyWith(color: kcLightColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          contents[i].discription,
                          style: bodyStyle.copyWith(color: kcLightColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ]),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  color: kcPrimaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          title: 'Skip',
                          color: kcLightGreyColor,
                          ontap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginView(),
                              ),
                            );
                          }),
                      SizedBox(
                        width: WidgetSizeConstant.medium,
                      ),
                      CustomButton(
                          title: 'Continue',
                          color: kcAmberColor,
                          ontap: () {
                            if (contents.length - 1 == currentIndex) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginView(),
                                ),
                              );
                            } else {
                              _controller?.nextPage(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.bounceIn,
                              );
                            }
                          }),
                    ],
                  ),
                ))
          ]);
        },
      ),
    );
  }
}

class BuildDot extends StatelessWidget {
  const BuildDot({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        contents.length,
        (index) => Container(
          height: 10,
          width: 10,
          margin: EdgeInsets.only(right: WidgetSizeConstant.normal),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(WidgetSizeConstant.xLarge2x),
            color: index == currentIndex ? kcAmberColor : kcLightGreyColor,
          ),
        ),
      ),
    );
  }
}
