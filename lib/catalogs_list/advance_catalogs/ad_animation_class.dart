import 'dart:math';
import 'package:flutter/material.dart';

class LowLevelAnimation extends StatefulWidget {
  const LowLevelAnimation({Key? key}) : super(key: key);

  @override
  State<LowLevelAnimation> createState() => _LowLevelAnimationState();
}
class _LowLevelAnimationState extends State<LowLevelAnimation> with TickerProviderStateMixin{
  late AnimationController animationController;
  late AnimationController animationController2;
  late bool isSelect = false;
  @override
  void initState(){
    animationController = AnimationController(vsync: this,
    duration: const Duration(seconds: 5),
    );
    animationController2 = AnimationController(vsync: this,
    duration: const Duration(seconds: 300),
    );
    animationController.repeat();
    animationController2.repeat();
    animationController.addListener(() {
      setState(() {
      });
    });
    super.initState();
  }
  
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.rotate(angle: animationController.value*2*pi,
            child: Center(
              child: Container(
                height: 300, width: 300,
                color: Colors.purple,
              ),
            ),
          ),
          Transform.rotate(
              angle: animationController2.value*-2*pi,
              child: const Center(child: Text("Animated Container", style: TextStyle(color: Colors.white),))),
        ]
      ),
    );
  }
}

const lowLevelAnimationCode = {
  '''
import 'dart:math';
import 'package:flutter/material.dart';

class LowLevelAnimation extends StatefulWidget {
  const LowLevelAnimation({Key? key}) : super(key: key);

  @override
  State<LowLevelAnimation> createState() => _LowLevelAnimationState();
}
class _LowLevelAnimationState extends State<LowLevelAnimation> with SingleTickerProviderStateMixin{
  late AnimationController animationController;

  @override
  void initState(){
    animationController = AnimationController(vsync: this,
    duration: const Duration(seconds: 1),
    );
    animationController.repeat();
    animationController.addListener(() {
      setState(() {
      });
    });
    super.initState();
  }
  
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(angle: animationController.value*2*pi,
      child: Container(
        height: 300, width: 300,
        color: Colors.purple,
      ),
    );
  }
}
  '''

};

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({super.key, required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(size: 100,),
      ),
    );
  }
}
class AnimatedWidgetClass extends StatefulWidget {
  const AnimatedWidgetClass({super.key});
  @override
  AnimatedWidgetClassState createState() => AnimatedWidgetClassState();

}
class AnimatedWidgetClassState extends State<AnimatedWidgetClass> with SingleTickerProviderStateMixin {
  late Animation<double> sizeAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    sizeAnimation =
        Tween<double>(begin: 50, end: 100).animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedLogo(
          animation: sizeAnimation,
        ),
        ElevatedButton(
          onPressed: () => controller.forward(),
          child: const Text('Forward animation'),
        ),
        ElevatedButton(
          onPressed: () => controller.reverse(),
          child: const Text('Reverse animation'),
        ),
      ],
    );
  }
}

const animatedWidgetCode = {
  '''
import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({super.key, required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        height: animation.value,
        width: animation.value,
        child: const FlutterLogo(size: 100,),
      ),
    );
  }
}
class AnimatedWidgetClass extends StatefulWidget {
  const AnimatedWidgetClass({super.key});
  @override
  AnimatedWidgetClassState createState() => AnimatedWidgetClassState();

}
class AnimatedWidgetClassState extends State<AnimatedWidgetClass> with SingleTickerProviderStateMixin {
  late Animation<double> sizeAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    sizeAnimation =
        Tween<double>(begin: 50, end: 100).animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedLogo(
          animation: sizeAnimation,
        ),
        ElevatedButton(
          onPressed: () => controller.forward(),
          child: const Text('Forward animation'),
        ),
        ElevatedButton(
          onPressed: () => controller.reverse(),
          child: const Text('Reverse animation'),
        ),
      ],
    );
  }
}
  '''
};





