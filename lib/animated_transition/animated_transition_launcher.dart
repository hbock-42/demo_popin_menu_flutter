import 'package:demo_poping_menu/animated_transition/animated_transition_page.dart';
import 'package:flutter/material.dart';

class AnimatedTransitionLauncher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Container(
        color: Color.fromRGBO(82, 58, 90, 1.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Stack(children: [
            AnimatedTransitionPage(screenWidth: screenWidth,
          screenHeight: screenHeight,),
            Positioned(
              right: 20,
              top: 20,
              width: 100,
              height: 70,
              child: GestureDetector(
                onTap: () => {Navigator.pop(context)}, // Back launcher
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
