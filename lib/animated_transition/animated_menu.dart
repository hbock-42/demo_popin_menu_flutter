import 'package:flutter/material.dart';

class AnimatedMenu extends StatefulWidget {
  AnimatedMenu(
      {Key key,
      @required this.screenWidth,
      @required this.screenHeight,
      this.menuOpenChanged})
      : super(key: key);

  final ValueChanged<bool> menuOpenChanged;
  final double screenWidth;
  final double screenHeight;
  final TextStyle textStyle = TextStyle(
      color: Color.fromRGBO(221, 120, 105, 1.0),
      fontSize: 20,
      fontWeight: FontWeight.w700);

  _onMenuOpenChanged(bool isOpen) {
    menuOpenChanged(isOpen);
  }

  @override
  _AnimatedMenuState createState() => _AnimatedMenuState();
}

class _AnimatedMenuState extends State<AnimatedMenu>
    with SingleTickerProviderStateMixin {
  bool _isMenuOpen = false;
  AnimationController _controller;
  Animation _scaleAnimation;
  Animation _soloIconScaleAnimation;
  Animation _opacityAnimation;
  Animation _opacityTextAnimation;
  Animation _topOffsetAnimation;
  Animation _leftOffsetAnimation;

  @override
  void initState() {
    super.initState();
    final double delay = 0.3;
    final Curve translationCurve = Curves.easeInOutBack;
    final Curve opacityCurve = Curves.linear;
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));
    _scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(delay, 1.0, curve: translationCurve)));
    _soloIconScaleAnimation = Tween(begin: 1.0, end: 5.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Interval(delay, 1.0, curve: translationCurve)));
    _opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(delay, 1.0,
            curve: Interval(0.0, 0.55, curve: opacityCurve))));
    _opacityTextAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(delay, 1.0,
            curve: Interval(0.35, 1.0, curve: opacityCurve))));
    _topOffsetAnimation = Tween(begin: 0.0, end: 90.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(delay, 1.0, curve: translationCurve)));
    _leftOffsetAnimation = Tween(begin: 0.0, end: 70.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(delay, 1.0, curve: translationCurve)));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return GestureDetector(
          onTap: _onMenuClicked,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10),
            child: Container(
              color: Colors.transparent,
              child: Stack(
                children: [
                  Positioned(
                    left: _leftOffsetAnimation.value * 0.2,
                    top: _topOffsetAnimation.value * 0.16,
                    child: Transform.scale(
                      alignment: Alignment.topLeft,
                      scale: _soloIconScaleAnimation.value,
                      child: Container(
                        width: 25.0,
                        height: 25.0,
                        child: Image.asset(
                          'images/align_left.png',
                          color: Color.fromRGBO(
                              221, 120, 105, _opacityAnimation.value),
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: _opacityTextAnimation.value,
                    child: Transform.scale(
                      alignment: Alignment.topLeft,
                      scale: _scaleAnimation.value,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              width: 25.0,
                              height: 25.0,
                              child: Image.asset(
                                'images/cancel.png',
                                color: Color.fromRGBO(221, 120, 105, 1.0),
                              ),
                            ),
                            Positioned(
                              top: _topOffsetAnimation.value,
                              left: _leftOffsetAnimation.value,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 30.0),
                                    child: Text(
                                      'DASHBOARD',
                                      style: this.widget.textStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 30.0),
                                    child: Text(
                                      'HISTORY',
                                      style: this.widget.textStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 30.0),
                                    child: Text(
                                      'STATISTICS',
                                      style: this.widget.textStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 30.0),
                                    child: Text(
                                      'SETTINGS',
                                      style: this.widget.textStyle,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _onMenuClicked() {
    setState(() {
      if (_isMenuOpen) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      _isMenuOpen = !_isMenuOpen;
      this.widget._onMenuOpenChanged(_isMenuOpen);
    });
  }
}
