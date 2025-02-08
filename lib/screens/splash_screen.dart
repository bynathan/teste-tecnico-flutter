import 'package:flutter/material.dart';
import 'package:flutter_technical_test_motel_list/constants/colors_constants.dart';
import 'package:flutter_technical_test_motel_list/constants/images_constants.dart';
import 'package:flutter_technical_test_motel_list/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showSplashScreen();
    });
  }

  void _showSplashScreen() {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.6), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 0.6, end: 1.4), weight: 60),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.4, 1.0, curve: Curves.easeOut)),
    );

    overlayEntry = OverlayEntry(
      builder: (context) => AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Opacity(
          opacity: _opacityAnimation.value,
          child: Container(
            color: AppColors.primary,
            child: Center(
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: Image.asset(
                  AppImages.splashLogo,
                  width: 220,
                  height: 220,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlayState.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 3), () {
      _controller.forward();

      Future.delayed(const Duration(milliseconds: 1000), () {
        overlayEntry.remove();
        _controller.dispose();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}