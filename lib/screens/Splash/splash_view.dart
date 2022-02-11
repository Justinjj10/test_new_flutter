import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_cashrich/constants/color_constants.dart';
// Package imports:
import 'package:provider/provider.dart';
import '../../constants/typography.dart';
import '../../constants/app_constants.dart';
import '../../view_model/splash_view_model.dart';

class Splash extends StatefulWidget {
  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => SplashViewModel(),
      child: const Splash(),
    );
  }

  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _scaleAnimationController;
  late AnimationController _textAnimationController;

  late Animation<double> scaleAnim;
  late Animation<double> textFadeAnim;

  @override
  void initState() {
    super.initState();

    _scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    scaleAnim = Tween<double>(
      begin: 1.4,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _scaleAnimationController,
        curve: Curves.decelerate,
      ),
    );

    textFadeAnim = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _textAnimationController,
      curve: Curves.fastOutSlowIn,
    ));

    _scaleAnimationController.forward();

    _scaleAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration.zero, () {
          _textAnimationController.forward();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scaleAnimationController.dispose();
    _textAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      context
          .read<SplashViewModel>()
          .initializeSplash(context); // executes after build
    });
    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Container(
                margin: const EdgeInsets.only(
                    left: AppConstants.kSpacingUnit * 2.0,
                    right: AppConstants.kSpacingUnit * 2.0),
                child: ScaleTransition(
                  scale: scaleAnim,
                  child: Text(
                    "Lé Stoic",
                    style: StoicTypography.textStyleAppNameSplash(),
                  ),
                ),
              ),
            ),
            Positioned(
              top: isLandscape
                  ? MediaQuery.of(context).size.height / 1.6
                  : MediaQuery.of(context).size.height / 1.8,
              child: Container(
                margin: const EdgeInsets.only(
                  left: AppConstants.kSpacingUnit * 2.0,
                  right: AppConstants.kSpacingUnit * 2.0,
                ),
                child: FadeTransition(
                  opacity: textFadeAnim,
                  child: Text(
                    "«finding inner peace\namidst chaos»",
                    textAlign: TextAlign.center,
                    style: StoicTypography.textStyleAppMotto(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}