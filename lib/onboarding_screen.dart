import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding_screen/my_custom_scroll_behaviour.dart';
import 'package:onboarding_screen/onboarding_image.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var data = [
    OnBoardingImageData("assets/onboarding_1.svg", "Organize your business",
        "Manage your customer orders,\nschedule appointments and much more!"),
    OnBoardingImageData("assets/onboarding_2.svg", "Amaze your customers",
        "Easily create beautiful documents\nto share with your customers"),
    OnBoardingImageData("assets/onboarding_3.svg", "Control your finance",
        "Know how much and when each\ncustomer has to pay and much more!"),
  ];

  late PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    _controller = PageController(
      initialPage: _currentPage,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints(
            maxWidth: 500,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // logo
              SvgPicture.asset(
                "assets/logo.svg",
                height: 150,
              ),

              // onboarding images
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyCustomScrollBehavior(),
                  child: PageView(
                    children: [
                      OnBoardingImage(
                        data: data[0],
                      ),
                      OnBoardingImage(
                        data: data[1],
                      ),
                      OnBoardingImage(
                        data: data[2],
                      )
                    ],
                    onPageChanged: (pageIndex) {
                      setState(() {
                        _currentPage = pageIndex;
                      });
                    },
                    controller: _controller,
                  ),
                ),
              ),

              const SizedBox(height: 40),
              // dots
              DotsIndicator(
                dotsCount: data.length,
                position: _currentPage.toDouble(),
                decorator: const DotsDecorator(
                  color: Color(0xFFD1D1D1),
                  activeColor: Color(0xFF47C0FC),
                ),
              ),
              const SizedBox(height: 40),
              // buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {}, child: const Text("log in"))),
                  const SizedBox(width: 32),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("sign up")))
                ],
              ),
              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}
