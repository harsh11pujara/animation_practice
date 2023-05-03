import 'package:flutter/material.dart';

class DefaultAnimationWidgets extends StatefulWidget {
  const DefaultAnimationWidgets({Key? key}) : super(key: key);

  @override
  State<DefaultAnimationWidgets> createState() => _DefaultAnimationWidgetsState();
}

class _DefaultAnimationWidgetsState extends State<DefaultAnimationWidgets> {
  bool flag = false;
  double height = 200;
  double width = 300;
  double turn = 0;
  BoxDecoration decoration = const BoxDecoration(color: Colors.orangeAccent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 1500),
              height: height,
              width: width,
              decoration: decoration,
            ),
            ElevatedButton(
                onPressed: () {
                  flag = !flag;
                  turn = turn+1;
                  setState(() {
                    if (flag) {
                      height = 350;
                      width = 150;
                      decoration = BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(20));
                    } else {
                      height = 200;
                      width = 300;
                      decoration = BoxDecoration(color: Colors.orangeAccent, borderRadius: BorderRadius.circular(0));
                    }
                  });

                },
                child: const Text("On Change")),
            AnimatedRotation(turns: turn, curve: Curves.easeInOutCubicEmphasized,duration: Duration(seconds: 2),child: Container(height: width-100,width: 50,color: Colors.blueAccent,),)
          ],
        ),
      ),
    );
  }
}
