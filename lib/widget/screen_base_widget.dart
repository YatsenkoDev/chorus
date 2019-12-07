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
        const Spacer(),
        Flexible(
          flex: 6,
          child: Container(
            margin: const EdgeInsets.only(
              left: 35,
              right: 31,
            ),
            color: kContentBackgroundColor,
            child: Center(child: child),
          ),
        ),
        const Spacer(),
        SvgPicture.asset(
          kChorusLogo,
          color: kChorusColor,
        ),
        const SizedBox(height: 16),
        const Divider(
          thickness: 5,
          color: kChorusColor,
          height: 0,
        ),
      ],
    );
  }
}
