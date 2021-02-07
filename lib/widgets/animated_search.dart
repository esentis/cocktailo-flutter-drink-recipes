import 'package:cocktailo/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedSearchBar extends StatefulWidget {
  /// The width cannot be null
  final double width;

  /// The textController cannot be null
  final TextEditingController textController;
  final IconData suffixIcon;
  final IconData prefixIcon;
  final String helpText;
  final int animationDurationInMilli;

  final Color prefixIconColor;

  /// The onSuffixTap cannot be null
  final onSuffixTap;
  final bool rtl;

  final Function onTapArrow;

  /// The function that will run after submitting the search [value]
  /// is the  typed text.
  final onSubmit;
  const AnimatedSearchBar(
      {@required this.onSuffixTap,
      @required this.width,
      @required this.onSubmit,
      @required this.textController,
      @required this.onTapArrow,
      this.prefixIconColor = Colors.black,
      this.suffixIcon = Icons.close,
      this.prefixIcon = Icons.search,
      this.helpText = 'Search...',
      this.animationDurationInMilli = 375,
      Key key,

      /// make the search bar to open from right to left
      this.rtl = false})
      : assert(
          /// The width cannot be null and double.infinity
          width != null && width != double.infinity,

          /// The textController cannot be null
          textController != null,
        ),
        super(key: key);
  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

///toggle - 0 => false or closed
///toggle 1 => true or open
int toggle = 0;

class _AnimatedSearchBarState extends State<AnimatedSearchBar>
    with SingleTickerProviderStateMixin {
  ///initializing the AnimationController
  AnimationController _con;
  @override
  void initState() {
    super.initState();

    ///Initializing the animationController which is responsible for the expanding and shrinking of the search bar
    _con = AnimationController(
      vsync: this,

      /// animationDurationInMilli is optional, the default value is 375
      duration: Duration(milliseconds: widget.animationDurationInMilli),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,

      ///if the rtl is true, search bar will be from right to left
      alignment:
          widget.rtl ? Alignment.centerRight : const Alignment(-1.0, 0.0),

      ///Using Animated container to expand and shrink the widget
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDurationInMilli),
        height: 48.0,
        width: (toggle == 0) ? 48.0 : widget.width,
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: toggle == 0 ? kColorPink : kColorDarkBlue,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            const BoxShadow(
              color: Colors.black26,
              spreadRadius: -10.0,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Stack(
          children: [
            ///Using Animated Positioned widget to expand and shrink the widget
            AnimatedPositioned(
              duration: Duration(milliseconds: widget.animationDurationInMilli),
              top: 6.0,
              right: 7.0,
              curve: Curves.easeOut,
              child: AnimatedOpacity(
                opacity: (toggle == 0) ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F3F7),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: AnimatedBuilder(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          ///if the search bar is closed
                          if (toggle == 0) {
                            toggle = 1;

                            ///forward == expand
                            _con.forward();
                          } else {
                            ///if the search bar is expanded
                            toggle = 0;

                            ///reverse == close
                            _con.reverse();
                          }
                        });
                      },
                      child: Icon(
                        widget.suffixIcon,
                        size: 20.0,
                        color: kColorPink,
                      ),
                    ),
                    builder: (context, widget) {
                      ///Using Transform.rotate to rotate the suffix icon when it gets expanded
                      return Transform.rotate(
                        angle: _con.value * 2.0 * pi,
                        child: widget,
                      );
                    },
                    animation: _con,
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: widget.animationDurationInMilli),
              left: (toggle == 0) ? 20.0 : 40.0,
              curve: Curves.easeOut,
              top: 11.0,

              ///Using Animated opacity to change the opacity of th textField while expanding
              child: AnimatedOpacity(
                opacity: (toggle == 0) ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  height: 23.0,
                  width: 180.0,
                  child: TextField(
                    ///Text Controller. you can manipulate the text inside this textField by calling this controller.
                    controller: widget.textController,
                    cursorRadius: const Radius.circular(10.0),
                    cursorWidth: 4.0,
                    cursorColor: kColorPink,
                    onSubmitted: widget.onSubmit,
                    style: kBasicStyle.copyWith(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: widget.helpText,
                      labelStyle: kBasicStyle.copyWith(
                        fontSize: 12,
                        color: kColorPink,
                      ),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /// Prefix icon
            IconButton(
              splashRadius: 19.0,
              icon: Icon(
                toggle == 1 ? Icons.arrow_back_ios : widget.prefixIcon,
                size: 35,
                color: toggle == 1 ? kColorPink : Colors.white,
              ),
              onPressed: () {
                setState(
                  () {
                    ///if the search bar is closed
                    if (toggle == 0) {
                      toggle = 1;

                      ///forward == expand
                      _con.forward();
                    } else {
                      ///if the search bar is expanded
                      widget.onTapArrow();
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
