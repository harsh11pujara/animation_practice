import 'package:animation_practice/default_animation_widgets.dart';
import 'package:animation_practice/hero_animation.dart';
import 'package:animation_practice/tween_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Try Different Animation")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DefaultAnimationWidgets(),
                      ));
                },
                child: const Text("Animated Container")),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TweenAnimationTrial(),
                      ));
                },
                child: const Text("Tween Animation")),
            const SizedBox(
              height: 10,
            ),
            Hero(
              tag: "img",
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HeroAnimation(),
                      ));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                      image: const DecorationImage(fit: BoxFit.cover,image: AssetImage("asset/img.jpg"))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
