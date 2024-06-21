import 'package:flutter/material.dart';

import '../../services/splash_services.dart';
import '../../utils/constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    _splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SplashImage(),
            const SizedBox(
              height: defaultPadding / 1.5,
            ),
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 2000),
              builder: (context, value, child) {
                return Column(
                  children: [
                    SizedBox(
                      height: 3,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: LinearProgressIndicator(
                          value: value,
                          color: Colors.orange,
                          backgroundColor: neviBlue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: defaultPadding / 3,
                    ),
                    Text(
                      '${(value * 100).toInt()}%',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class SplashImage extends StatefulWidget {
  const SplashImage({super.key});

  @override
  State<SplashImage> createState() => _SplashImageState();
}

class _SplashImageState extends State<SplashImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _controller.value * 10),
          child: Container(
            height: 110,
            width: 110,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(colors: [
                darkOrange,
                Colors.pinkAccent,
                Colors.amber,
              ]),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 2),
                    color: darkOrange.withOpacity(.5),
                    blurRadius: 10),
                BoxShadow(
                    offset: const Offset(0, -2),
                    color: Colors.pink.withOpacity(.5),
                    blurRadius: 10),
                BoxShadow(
                    offset: const Offset(2, 0),
                    color: lightOrange.withOpacity(.5),
                    blurRadius: 10),
                BoxShadow(
                    offset: const Offset(-2, 0),
                    color: lightOrange.withOpacity(.5),
                    blurRadius: 10),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Image.asset(
                'assets/images/splashImage.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
