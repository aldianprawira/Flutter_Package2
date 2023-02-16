import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import './login_page.dart';
import 'package:lottie/lottie.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Title of first page",
            body: "Welcome to the app! This is a description of how it works.",
            image: Center(
              child: Lottie.asset("assets/lotties/cloud.json"),
            ),
          ),
          PageViewModel(
            title: "Title of second page",
            body: "Welcome to the app! This is a description of how it works.",
            image: Center(
              child: Lottie.asset("assets/lotties/login.json"),
            ),
          ),
        ],
        showNextButton: true,
        next: const Text("Next"),
        done: const Text("Login"),
        onDone: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        ),
      ),
    );
  }
}
