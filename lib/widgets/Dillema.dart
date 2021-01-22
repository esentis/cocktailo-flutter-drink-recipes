import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
    leftContainerWidth = (widget.width / 2) - 5;
    rightContainerWidth = (widget.width / 2) - 5;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 2,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: widget.height,
            minHeight: widget.height,
            maxWidth: widget.width + 30,
            minWidth: widget.width,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (leftContainerWidth == (widget.width - 5)) {
                        leftContainerWidth = (widget.width / 2) - 5;
                        rightContainerWidth = (widget.width / 2) - 5;
                        rightContainerOpacity = 1;
                      } else {
                        leftContainerWidth = widget.width - 5;
                        rightContainerWidth = 0;
                        rightContainerOpacity = 0;
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
                          Positioned.fill(child: widget.leftWidget),
                          AnimatedOpacity(
                            opacity: leftContainerWidth == (widget.width - 5)
                                ? 1
                                : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                          const BoxShadow(
                                            blurRadius: 5,
                                            color: Colors.black,
                                            spreadRadius: 5,
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
                                            color: Colors.black,
                                            spreadRadius: 5,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (rightContainerWidth == (widget.width - 5)) {
                        leftContainerWidth = (widget.width / 2) - 5;
                        rightContainerWidth = (widget.width / 2) - 5;
                        leftContainerOpacity = 1;
                      } else {
                        leftContainerWidth = 0;
                        rightContainerWidth = widget.width - 5;
                        leftContainerOpacity = 0;
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
                          Positioned.fill(child: widget.rightWidget),
                          AnimatedOpacity(
                            opacity: rightContainerWidth == (widget.width - 5)
                                ? 1
                                : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                            color: Colors.black,
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
                                          const BoxShadow(
                                            blurRadius: 5,
                                            color: Colors.black,
                                            spreadRadius: 5,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
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
