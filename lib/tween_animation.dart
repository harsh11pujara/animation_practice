import 'package:flutter/material.dart';

class TweenAnimationTrial extends StatefulWidget {
  const TweenAnimationTrial({Key? key}) : super(key: key);

  @override
  State<TweenAnimationTrial> createState() => _TweenAnimationTrialState();
}

class _TweenAnimationTrialState extends State<TweenAnimationTrial> with SingleTickerProviderStateMixin {
  late Animation animation;
  late Animation colorAnimation;
  late Animation borderRadiusAnimation;
  late AnimationController animationController;
  double height = 0;
  double width = 0;
  Color customColor = Colors.redAccent;
  BorderRadius radius = BorderRadius.circular(0);

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0.0, end: 200.0).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.redAccent, end: Colors.orangeAccent).animate(animationController);
    borderRadiusAnimation =
        BorderRadiusTween(begin: BorderRadius.circular(0), end: BorderRadius.circular(100)).animate(animationController);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    animation.removeListener(() {});
    colorAnimation.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[600],
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: RadialGradient(radius: 0.7 + height / 200, colors: [Colors.black87, Colors.purple[900]!])),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100 + height,
                  width: 100 + width,
                  decoration: BoxDecoration(color: customColor, borderRadius: radius),
                ),
                ElevatedButton(
                    onPressed: () {
                      loopAnimation();
                      animationController.addListener(() {
                        setState(() {
                          height = animation.value;
                          width = animation.value;
                          customColor = colorAnimation.value;
                          radius = borderRadiusAnimation.value;
                        });
                      });
                    },
                    child: Text("Animate")),
                ElevatedButton(
                    onPressed: () {
                      animationController.stop();
                      // animationController.notifyListeners();
                    },
                    child: Text("Stop"))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void loopAnimation() {
    animationController.forward().then((value) {
      animationController.reverse().then((value) {
        loopAnimation();
      });
    });
  }
}
