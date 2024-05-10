// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:source_code/pages/signing/login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            children: [
              _buildPage("images/need1-removebg.png",
                  "Quickly identify objects in your Camera"),
              _buildPage("images/need1-removebg.png",
                  "Quickly identify objects in your Camera"),
              _buildPage("images/need1-removebg.png",
                  "Quickly identify objects in your Camera"),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: _buildPageDots(),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                if (currentPage < 2) {
                  pageController.animateToPage(
                    currentPage + 1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => loginScreen(),
                    ),
                  );
                }
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(  
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPageDots() {
    List<Widget> dots = [];
    for (int i = 0; i < 3; i++) {
      dots.add(
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Container(
            width:
                i == currentPage ? 12 : 8, // Adjust size based on currentPage
            height: i == currentPage ? 12 : 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == currentPage
                  ? Colors.black
                  : const Color.fromARGB(255, 99, 99, 99),
            ),
          ),
        ),
      );
    }
    return dots;
  }

  Widget _buildPage(String imagePath, String text) {
    return Column(
      children: [
        const SizedBox(height: 170),
        Image.asset(imagePath),
        const SizedBox(height: 40),
        Center(
          child: Text(
            text,
          ),
        ),
        const SizedBox(height: 200),
      ],
    );
  }
}
