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
    Key key,
  }) : super(key: key);

  final double width;
  final double height;
  final Widget leftWidget;
  final Widget rightWidget;
  final String leftTitle;
  final String leftSubtitle;
  final String rightTitle;
  final String rightSubtitle;

  @override
  _DilemmaState createState() => _DilemmaState();
}

class _DilemmaState extends State<Dilemma> {
  double leftContainerWidth;
  double leftContainerOpacity = 1;
  double rightContainerWidth;
  double rightContainerOpacity = 1;
  double titleFontSize = 0;
  double subtitleFontSize = 0;
  double rightWidgetBorderWidth = 5;
  double leftWidgetBorderWidth = 5;
  Color leftWidgetBorderColor = const Color(0xffED1E79);
  Color rightWidgetBorderColor = const Color(0xffED1E79);
  double leftWidgetShadowRadius = 5;
  double rightWidgetShadowRadius = 5;
  @override
  void initState() {
    super.initState();
    leftContainerWidth = (widget.width / 2) - 20;
    rightContainerWidth = (widget.width / 2) - 20;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff0f1123),
            Color(0xffff3796),
            Color(0xff302387),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (leftContainerWidth == (widget.width - 20)) {
                      leftContainerWidth = (widget.width / 2) - 20;
                      rightContainerWidth = (widget.width / 2) - 20;
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
                                  color:
                                      const Color(0xff1a1a2e).withOpacity(0.5),
                                  offset: const Offset(2, 0),
                                )
                              ],
                            ),
                            duration: const Duration(milliseconds: 700),
                            child: widget.leftWidget,
                          ),
                        ),
                        AnimatedOpacity(
                          opacity:
                              leftContainerWidth == (widget.width - 20) ? 1 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  widget.leftTitle ?? '',
                                  maxLines: 1,
                                  style: GoogleFonts.robotoCondensed(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      BoxShadow(
                                        blurRadius: leftWidgetShadowRadius,
                                        color: Colors.white,
                                        spreadRadius: leftWidgetShadowRadius,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  widget.leftSubtitle ?? '',
                                  maxLines: 1,
                                  style: GoogleFonts.robotoCondensed(
                                    color: Colors.white,
                                    fontSize: 18,
                                    shadows: [
                                      const BoxShadow(
                                        blurRadius: 5,
                                        color: Colors.white,
                                        spreadRadius: 5,
                                      )
                                    ],
                                  ),
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (rightContainerWidth == (widget.width - 20)) {
                      leftContainerWidth = (widget.width / 2) - 20;
                      rightContainerWidth = (widget.width / 2) - 20;
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
                                    color: const Color(0xff1a1a2e)
                                        .withOpacity(0.5),
                                    offset: const Offset(-2, 0),
                                  )
                                ],
                              ),
                              child: widget.rightWidget),
                        ),
                        AnimatedOpacity(
                          opacity: rightContainerWidth == (widget.width - 20)
                              ? 1
                              : 0,
                          duration: const Duration(milliseconds: 300),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  widget.rightTitle ?? '',
                                  maxLines: 1,
                                  style: GoogleFonts.robotoCondensed(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      const BoxShadow(
                                        blurRadius: 5,
                                        color: Colors.white,
                                        spreadRadius: 5,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  widget.rightSubtitle ?? '',
                                  style: GoogleFonts.robotoCondensed(
                                    color: Colors.white,
                                    fontSize: 18,
                                    shadows: [
                                      BoxShadow(
                                        blurRadius: rightWidgetShadowRadius,
                                        color: Colors.white,
                                        spreadRadius: rightWidgetShadowRadius,
                                      )
                                    ],
                                  ),
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
  }
}
