import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class TransformTo extends StatelessWidget {
  const TransformTo({
    @required this.firstPage,
    @required this.secondPage,
    Key key,
  }) : super(key: key);
  final Widget firstPage;
  final Widget secondPage;
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        transitionType: ContainerTransitionType.fade,
        transitionDuration: const Duration(
          milliseconds: 500,
        ),
        openElevation: 10,
        // First Widget
        closedBuilder: (_, openContainer) {
          return GestureDetector(
            onTap: openContainer,
            child: firstPage,
          );
        },
        closedElevation: 5.0,
        // closedShape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20),
        // ),
        // Second widget
        openBuilder: (_, closeContainer) {
          return GestureDetector(
            onTap: closeContainer,
            child: secondPage,
          );
        });
  }
}
