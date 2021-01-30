import 'package:cocktailo/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

/// ### Dilemma because...it's obvious.
class Dilemma extends StatefulWidget {
  const Dilemma({
    @required this.height,
    @required this.width,
    @required this.leftWidget,
    @required this.rightWidget,
    this.leftTitle,
    this.rightTitle,
    this.rightSubtitle,
    this.leftSubtitle,
    this.leftTitleColor,
    this.rightTitleColor,
    this.onLeftTitleTap,
    this.onRightTitleTap,
    Key key,
  }) : super(key: key);

  final double width;
  final double height;

  // Left widget attributes
  final Widget leftWidget;
  final String leftTitle;
  final Color leftTitleColor;
  final String leftSubtitle;
  final Function onLeftTitleTap;

  // Right widget attributes
  final Widget rightWidget;
  final String rightTitle;
  final Color rightTitleColor;
  final String rightSubtitle;
  final Function onRightTitleTap;

  @override
  _DilemmaState createState() => _DilemmaState();
}

class _DilemmaState extends State<Dilemma> {
  // Left widget attributes
  double leftContainerWidth;
  double leftContainerOpacity = 1;
  double leftWidgetBorderWidth = 5;
  double leftWidgetShadowRadius = 5;
  Color leftWidgetBorderColor = const Color(0xffED1E79);

  // Right widget attributes
  double rightContainerWidth;
  double rightContainerOpacity = 1;
  double rightWidgetShadowRadius = 5;
  double rightWidgetBorderWidth = 5;
  Color rightWidgetBorderColor = const Color(0xffED1E79);

  double titleFontSize = 0;
  double subtitleFontSize = 0;
  @override
  void initState() {
    super.initState();
    leftContainerWidth = (widget.width / 2) - 10;
    rightContainerWidth = (widget.width / 2) - 10;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kColorDarkBlue,
            kColorPink,
            const Color(0xff302387),
          ],
          begin: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 2,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: widget.height,
            minHeight: widget.height,
            maxWidth: widget.width,
            minWidth: widget.width,
          ),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (leftContainerWidth == (widget.width - 20)) {
                      leftContainerWidth = (widget.width / 2) - 10;
                      rightContainerWidth = (widget.width / 2) - 10;
                      rightContainerOpacity = 1;
                      leftWidgetBorderWidth = 5;
                      rightWidgetShadowRadius = 5;
                      leftWidgetShadowRadius = 5;
                    } else {
                      leftContainerWidth = widget.width - 20;
                      rightContainerWidth = 0;
                      rightContainerOpacity = 0;
                      rightWidgetShadowRadius = 0;
                      leftWidgetShadowRadius = 0;
                      leftWidgetBorderWidth = 1;
                    }
                  });
                },
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: leftContainerOpacity,
                  child: AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 250,
                    ),
                    width: leftContainerWidth,
                    height: widget.height,
                    child: Stack(
                      children: [
                        Positioned(
                          child: AnimatedContainer(
                            curve: Curves.easeIn,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: leftWidgetBorderColor,
                                width: leftWidgetBorderWidth,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                  color: kColorDarkBlue.withOpacity(0.5),
                                  offset: const Offset(2, 0),
                                )
                              ],
                            ),
                            duration: const Duration(milliseconds: 700),
                            child: widget.leftWidget,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: rightContainerWidth == (widget.width - 20)
                                ? 0
                                : 1,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: GestureDetector(
                                onTap: widget.onLeftTitleTap,
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 300),
                                  child: Text(widget.leftTitle ?? ''),
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: leftContainerWidth ==
                                            (widget.width - 20)
                                        ? 22
                                        : 13,
                                    fontFamily: 'LEMONMILK',
                                    fontWeight: leftContainerWidth ==
                                            (widget.width - 20)
                                        ? FontWeight.w700
                                        : FontWeight.w100,
                                    shadows: [
                                      BoxShadow(
                                        blurRadius: 5,
                                        color: widget.rightTitleColor,
                                        spreadRadius: 5,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (rightContainerWidth == (widget.width - 20)) {
                      leftContainerWidth = (widget.width / 2) - 10;
                      rightContainerWidth = (widget.width / 2) - 10;
                      leftContainerOpacity = 1;
                      rightWidgetBorderWidth = 5;
                    } else {
                      leftContainerWidth = 0;
                      rightContainerWidth = widget.width - 20;
                      leftContainerOpacity = 0;
                      rightWidgetBorderWidth = 1;
                    }
                  });
                },
                child: AnimatedOpacity(
                  opacity: rightContainerOpacity,
                  duration: const Duration(milliseconds: 300),
                  child: AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 250,
                    ),
                    width: rightContainerWidth,
                    height: widget.height,
                    child: Stack(
                      children: [
                        Positioned(
                          child: AnimatedContainer(
                              duration: const Duration(milliseconds: 700),
                              curve: Curves.easeIn,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: rightWidgetBorderColor,
                                  width: rightWidgetBorderWidth,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    color: kColorDarkBlue.withOpacity(0.5),
                                    offset: const Offset(-2, 0),
                                  )
                                ],
                              ),
                              child: widget.rightWidget),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: GestureDetector(
                              onTap: widget.onRightTitleTap,
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 300),
                                child: Text(widget.rightTitle ?? ''),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: rightContainerWidth ==
                                          widget.width - 20
                                      ? 22
                                      : leftContainerWidth > rightContainerWidth
                                          ? 0
                                          : 13,
                                  fontFamily: 'LEMONMILK',
                                  fontWeight:
                                      rightContainerWidth == widget.width - 20
                                          ? FontWeight.w700
                                          : FontWeight.w100,
                                  shadows: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: widget.rightTitleColor,
                                      spreadRadius: 5,
                                    )
                                  ],
                                ),
                              ),
                            ),
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
  }
}
