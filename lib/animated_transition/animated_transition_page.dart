import 'package:demo_poping_menu/animated_transition/animated_menu.dart';
import 'package:flutter/material.dart';

class AnimatedTransitionPage extends StatefulWidget {
  AnimatedTransitionPage({
    Key key,
    @required this.screenWidth,
    @required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  _AnimatedTransitionPageState createState() => _AnimatedTransitionPageState();
}

class _AnimatedTransitionPageState extends State<AnimatedTransitionPage>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _circleTranslation;
  Animation _splitBarTranslation;
  Animation _yellowPaperTranslation;
  Animation _purplePaperTranslation;
  Animation _greenPaperTranslation;

  @override
  void initState() {
    super.initState();
    final double intervalEnd = 0.8;
    final Curve translationCurve = Curves.easeInOutBack;
    final Curve opacityCurve = Curves.linear;
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));
    _circleTranslation = Tween(begin: 0.0, end: this.widget.screenHeight / 2.0)
        .animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.0, intervalEnd,
                curve: Interval(0.39, 1.0, curve: translationCurve))));
    _splitBarTranslation =
        Tween(begin: 0.0, end: this.widget.screenHeight / 2.0).animate(
            CurvedAnimation(
                parent: _controller,
                curve: Interval(0.0, intervalEnd,
                    curve: Interval(0.26, 1.0, curve: translationCurve))));
    _yellowPaperTranslation =
        Tween(begin: 0.0, end: this.widget.screenHeight / 2.0).animate(
            CurvedAnimation(
                parent: _controller,
                curve: Interval(0.0, intervalEnd,
                    curve: Interval(0.13, 1.0, curve: translationCurve))));
    _purplePaperTranslation =
        Tween(begin: 0.0, end: this.widget.screenHeight / 2.0).animate(
            CurvedAnimation(
                parent: _controller,
                curve: Interval(0.0, intervalEnd,
                    curve: Interval(0.05, 1.0, curve: translationCurve))));
    _greenPaperTranslation =
        Tween(begin: 0.0, end: this.widget.screenHeight / 2.0).animate(
            CurvedAnimation(
                parent: _controller,
                curve: Interval(0.0, intervalEnd,
                    curve: Interval(0.05, 1.0, curve: translationCurve))));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Stack(
          children: [
            // Second half
            Positioned(
              child: Align(
                child: Container(
                  margin: EdgeInsets.only(top: 70),
                  width: this.widget.screenWidth,
                  height: this.widget.screenHeight,
                  color: Color.fromRGBO(82, 58, 90, 1.0),
                  child: Column(
                    children: [
                      // Circle
                      Transform(
                        transform: Matrix4.translationValues(
                            0, _circleTranslation.value, 0),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 45),
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(221, 120, 105, 1.0),
                                borderRadius: BorderRadius.circular(40)),
                          ),
                        ),
                      ),
                      // Splitted line
                      Transform(
                        transform: Matrix4.translationValues(
                            0, _splitBarTranslation.value, 0),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 45),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  width: 70,
                                  height: 14,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(180, 102, 101, 1.0),
                                      borderRadius: BorderRadius.circular(7)),
                                ),
                              ),
                              Container(
                                width: 130,
                                height: 14,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(180, 102, 101, 1.0),
                                    borderRadius: BorderRadius.circular(7)),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Bottom papers
                      Transform(
                        transform: Matrix4.translationValues(
                            0, _yellowPaperTranslation.value, 0),
                        child: Stack(
                          children: [
                            // purple
                            Positioned(
                              top: 30,
                              left: 0,
                              child: Container(
                                width: 40,
                                height: screenHeight - 390,
                                color: Color.fromRGBO(148, 90, 122, 1.0),
                              ),
                            ),
                            // green
                            Positioned(
                              top: 30,
                              right: 0,
                              child: Container(
                                width: 40,
                                height: screenHeight - 390,
                                color: Color.fromRGBO(148, 140, 111, 1.0),
                              ),
                            ),
                            // yellow
                            Positioned(
                              left: 30,
                              child: Container(
                                width: screenWidth - 140,
                                height: screenHeight - 330,
                                color: Color.fromRGBO(245, 192, 136, 1.0),
                              ),
                            ),
                            Container(
                              width: screenWidth - 80,
                              height: screenHeight - 330,
                              color: Colors.red.withOpacity(0.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // First half
            Container(
              height: screenHeight / 2.0,
              child: AnimatedMenu(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                menuOpenChanged: _onMenuOpenChanged,
              ),
            ),
          ],
        );
      },
    );
  }

  _onMenuOpenChanged(bool isOpen) {
    setState(() {
      if (isOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
}
