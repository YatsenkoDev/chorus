import 'package:chorus/global/assets.dart';
import 'package:chorus/global/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenBaseWidget extends StatelessWidget {
  final Widget child;

  const ScreenBaseWidget({this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(flex: 123),
        Flexible(
          flex: 608,
          child: Container(
            margin: const EdgeInsets.only(
              left: 35,
              right: 31,
            ),
            color: kContentBackgroundColor,
            child: Center(child: child),
          ),
        ),
        const Spacer(flex: 103),
        SvgPicture.asset(
          kChorusLogo,
          color: kDividerColor,
        ),
        const SizedBox(height: 16),
        const Divider(
          thickness: 5,
          color: kDividerColor,
          height: 0,
        ),
      ],
    );
  }
}
