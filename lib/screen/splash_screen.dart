import 'package:chorus/animation/fade_route.dart';
import 'package:chorus/bloc/splash_bloc.dart';
import 'package:chorus/global/assets.dart';
import 'package:chorus/screen/insert_id_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashBloc splashBloc;

  @override
  void initState() {
    super.initState();
    splashBloc = SplashBloc();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      splashBloc.loadData(context).then((_) => Navigator.pushReplacement(
          context, FadeRoute(page: InsertIdScreen())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(kChorusLogo),
      ),
    );
  }
}
