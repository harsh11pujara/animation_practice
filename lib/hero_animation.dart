import 'package:flutter/material.dart';

class HeroAnimation extends StatefulWidget {
  const HeroAnimation({Key? key}) : super(key: key);

  @override
  State<HeroAnimation> createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[200],
      body: Hero(
        tag: "img",
        child: Container(
          margin: EdgeInsets.all(20),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
               image: const DecorationImage(fit: BoxFit.cover,image: AssetImage("asset/img.jpg"))),
        ),
      ),
    );
  }
}

