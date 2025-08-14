import 'package:flutter/material.dart';
import 'package:sayurinaja/features/auth/presentation/sign_in_page.dart';
import 'package:sayurinaja/features/welcome/presentation/onboarding_page0.dart';
import 'package:sayurinaja/features/welcome/presentation/onboarding_page1.dart';
import 'package:sayurinaja/features/welcome/presentation/onboarding_page2.dart';
import 'package:sayurinaja/features/welcome/presentation/onboarding_page3.dart';
import 'package:sayurinaja/features/welcome/presentation/onboarding_page4.dart';
import 'package:sayurinaja/shared/widgets/onboarding_indicator_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomingPage extends StatefulWidget {
  static const nameRoute = '/welcoming';

  const WelcomingPage({super.key});

  @override
  State<WelcomingPage> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<WelcomingPage> {
  final PageController _pageController = PageController();

  final List<Widget> _onboardingPages = [
    const OnboardingPage0(),
    const OnboardingPage1(),
    const OnboardingPage2(),
    const OnboardingPage3(),
    const OnboardingPage4()
  ];

  final List<String> _buttonTexts = [
    'Mulai',
    'Selanjutnya',
    'Selanjutnya',
    'Selanjutnya',
    'Saya Mau jadi yang pertama!'
  ];

  int _currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isLastPage = _currentPageIndex == _onboardingPages.length - 1;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 24, horizontal: screenWidth * 0.06),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                  children: _onboardingPages,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              SmoothPageIndicator(
                controller: _pageController,
                count: _onboardingPages.length,
                effect: ExpandingDotsEffect(
                  dotColor: Colors.grey.shade300,
                  activeDotColor: const Color(0xFF3EA35D),
                  dotHeight: 9.0,
                  dotWidth: 26,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              OnboardingIndicatorButton(
                text: _buttonTexts[_currentPageIndex],
                textSize: 16,
                onPressed: () {
                  if (isLastPage) {
                    Navigator.of(context).pushNamed(SignInPage.nameRoute);    //NAVIGASI SIGN UP PAGE
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
