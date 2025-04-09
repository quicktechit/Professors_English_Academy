import 'dart:async';

import 'package:professors_english_academy/pages/auth_page/quick_tech_phone_number_input.dart';

import '../../../consts/consts.dart';
import '../../widgets/quick_tech_custom_button.dart';
import 'onBord_page/quick_tech_onboard_page.dart';

class QuickTechSplashPage2nd extends StatefulWidget {
  const QuickTechSplashPage2nd({super.key});

  @override
  State<QuickTechSplashPage2nd> createState() => _QuickTechSplashPage2ndState();
}

class _QuickTechSplashPage2ndState extends State<QuickTechSplashPage2nd> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final page = _controller.page;
      if (page != null) {
        setState(() {
          _currentPage = page.toInt();
        });
      }
    });

    // Start the timer to change the page every second
    _startAutomaticPageChange();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel(); // Cancel the timer when the screen is disposed
    super.dispose();
  }

  void _startAutomaticPageChange() {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (_currentPage < 2) {
        _controller.nextPage(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeIn,
        );
      } else {
        // When it reaches the last page (index 2), jump back to the first page (index 0)
        _controller.animateToPage(
          0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.bounceOut,
        );
      }
    });
  }

  Widget buildDotIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Positioned(
          //   top: 45,
          //   left: 20,
          //   right: 20,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       Spacer(),
          //       // Skip button
          //       // TextButton(
          //       //   onPressed: () {
          //       //     // Directly navigate to the home screen when Skip is pressed
          //       //     Navigator.pushReplacement(
          //       //       context,
          //       //       MaterialPageRoute(builder: (context) => QuickTechDashboard()),
          //       //     );
          //       //   },
          //       //   child: Text("Skip", style: TextStyle(fontSize: 16)),
          //       // ),
          //       // Next/Done button
          //       TextButton(
          //         onPressed: () {
          //           if (_currentPage == 2) {
          //             // Done, go to the home screen
          //             Navigator.pushReplacement(
          //               context,
          //               MaterialPageRoute(builder: (context) => QuickTechDashboard()),
          //             );
          //           } else {
          //             // Go to the next page
          //             _controller.nextPage(
          //               duration: const Duration(milliseconds: 300),
          //               curve: Curves.easeIn,
          //             );
          //           }
          //         },
          //         child: Text(
          //           _currentPage == 2 ? "Done" : "Next",
          //           style: TextStyle(fontSize: 16),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          PageView(
            controller: _controller,
            children: const [
              OnboardingPage(
                image: 'assets/images/book.png',
                title: 'Connect & Learn, Anytime, Anywhere!',
                description:
                    'Welcome to the Ultimate English Speaking Experience! Connect with partners around the world, practice English, and improve your Quality 24/7.',
              ),
              OnboardingPage(
                image: 'assets/images/book.png',
                title: 'Speak Confidently, Anytime You Want!',
                description:
                    'Join Thousands of Learners Practicing English Every Day! Discover speaking topics, connect with partners, and track your progress in real-time.',
              ),
              OnboardingPage(
                image: 'assets/images/book.png',
                title: 'Find Your Perfect English Skill',
                description:
                    'Meet Your Perfect English Partner! Start conversations, learn new topics, and boost your Learning skills with real-time interactions.',
              ),
            ],
          ).h(context.screenHeight / 1.4),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) => buildDotIndicator(index)),
          ),
          20.heightBox,
          Column(

            children: [
              customButtonWithIcon(
                  title: 'Start With Google',
                  txtColor: Colors.white,
                  onPressed: () {},
                  backgroundColor: mainColor,icons: "assets/images/google.png").w(context.screenWidth - 50),
              10.heightBox,
              customButton(
                      title: 'Phone Number',
                      onPressed: () {
                        Get.to(()=>QuickTechPhoneNumberInput());
                      },
                      color: Colors.white)
                  .w(context.screenWidth - 50)
            ],
          ),
        ],
      ),
    );
  }
}
