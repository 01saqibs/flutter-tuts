import 'package:flutter/material.dart';

class HeroClass extends StatelessWidget {
  const HeroClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50, width: 50,
      padding: const EdgeInsets.all(100),
      color: Colors.white,
      child: PhotoHero(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Container(
              alignment: Alignment.topLeft,
              color: Colors.white,
              padding: const EdgeInsets.all(50),
              child: PhotoHero(
                width: 50,
                onTap: (){
                  Navigator.pop(context);
                },
                photo: "assets/images/flutter.png",
              ),
            );
          },));
        },
        photo: "assets/images/flutter.png",
        width: 30,
      ),
    );

  }
}
class PhotoHero extends StatelessWidget {
  const PhotoHero({Key? key, required this.photo, required this.onTap, required this.width}) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
const heroClassCode = {
  '''
  
import 'package:flutter/material.dart';

class HeroClass extends StatelessWidget {
  const HeroClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50, width: 50,
      padding: const EdgeInsets.all(100),
      color: Colors.white,
      child: PhotoHero(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Container(
              alignment: Alignment.topLeft,
              color: Colors.white,
              padding: const EdgeInsets.all(50),
              child: PhotoHero(
                width: 50,
                onTap: (){
                  Navigator.pop(context);
                },
                photo: "assets/images/flutter.png",
              ),
            );
          },));
        },
        photo: "assets/images/flutter.png",
        width: 30,
      ),
    );

  }
}
class PhotoHero extends StatelessWidget {
  const PhotoHero({Key? key, required this.photo, required this.onTap, required this.width}) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
  
  '''
};

class OpacityClass extends StatefulWidget {
  const OpacityClass({Key? key}) : super(key: key);

  @override
  State<OpacityClass> createState() => _OpacityClassState();
}
class _OpacityClassState extends State<OpacityClass> {
  double opacity = 1.0, opacity1 = 1.0, opacity2 = 1.0;
  @override
  Widget build(BuildContext context) {

    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                opacity = 1.0 - opacity;
              });
            },
            child: Opacity(
                opacity: opacity,
                child: customContainer(Colors.black26)),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                opacity1 = 1.0 - opacity1;
              });
            },
            child: AnimatedOpacity(
                opacity: opacity1,
                duration: const Duration(milliseconds: 200),
                child: customContainer(Colors.red),),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                opacity2 = 1.0 - opacity2;
              });
            },
            child: AnimatedOpacity(
              opacity: opacity2,
              duration: const Duration(milliseconds: 200),
              child: customContainer(Colors.blue),),
          ),
        ],
      ),
    );
  }
  Widget customContainer(Color color) {
    return Container(
      color: color,
      width: 200, height: 200,
    );
  }
}
const opacityClassCode = {
  '''
  
import 'package:flutter/material.dart';

class OpacityClass extends StatefulWidget {
  const OpacityClass({Key? key}) : super(key: key);

  @override
  State<OpacityClass> createState() => _OpacityClassState();
}
class _OpacityClassState extends State<OpacityClass> {
  double opacity = 1.0, opacity1 = 1.0, opacity2 = 1.0;
  @override
  Widget build(BuildContext context) {

    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                opacity = 1.0 - opacity;
              });
            },
            child: Opacity(
                opacity: opacity,
                child: customContainer(Colors.black26)),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                opacity1 = 1.0 - opacity1;
              });
            },
            child: AnimatedOpacity(
                opacity: opacity1,
                duration: const Duration(milliseconds: 200),
                child: customContainer(Colors.red),),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                opacity2 = 1.0 - opacity2;
              });
            },
            child: AnimatedOpacity(
              opacity: opacity2,
              duration: const Duration(milliseconds: 200),
              child: customContainer(Colors.blue),),
          ),
        ],
      ),
    );
  }
  Widget customContainer(Color color) {
    return Container(
      color: color,
      width: 200, height: 200,
    );
  }
}
  
  '''
};

class AnimatedIconClass extends StatefulWidget {
  const AnimatedIconClass({Key? key}) : super(key: key);
  @override
  State<AnimatedIconClass> createState() => _AnimatedIconClassState();
}
class _AnimatedIconClassState extends State<AnimatedIconClass> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController (
        duration: const Duration(seconds: 1), vsync: this)
    ..forward()
    ..repeat(reverse: true);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController);

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
       customIcon(AnimatedIcons.home_menu),
        customIcon(AnimatedIcons.search_ellipsis,),
        customIcon(AnimatedIcons.home_menu),
      ],
    );
  }
  Widget customIcon(AnimatedIconData icon){
    return AnimatedIcon(
      size: 75,
      color: Colors.blue,
      progress: animationController,
      icon: icon,
    );
  }
}
const animatedIconClassCode = {
  '''
  
import 'package:flutter/material.dart';

class AnimatedIconClass extends StatefulWidget {
  const AnimatedIconClass({Key? key}) : super(key: key);
  @override
  State<AnimatedIconClass> createState() => _AnimatedIconClassState();
}
class _AnimatedIconClassState extends State<AnimatedIconClass> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController (
        duration: const Duration(seconds: 1), vsync: this)
    ..forward()
    ..repeat(reverse: true);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController);

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
       customIcon(AnimatedIcons.home_menu),
        customIcon(AnimatedIcons.search_ellipsis,),
        customIcon(AnimatedIcons.home_menu),
      ],
    );
  }
  Widget customIcon(AnimatedIconData icon){
    return AnimatedIcon(
      size: 75,
      color: Colors.blue,
      progress: animationController,
      icon: icon,
    );
  }
}
  
  '''
};

class AnimatedContainerClass extends StatefulWidget {
  const AnimatedContainerClass({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerClass> createState() => _AnimatedContainerClassState();
}
class _AnimatedContainerClassState extends State<AnimatedContainerClass> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AnimatedContainer(
          height: selected ? 200 : 150,
          width: selected ? 150 : 200,
          color: selected ? Colors.amber : Colors.purple,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 500),),
        GestureDetector(
          onTap: (){
            setState(() {
              selected =! selected;
            });
          },
          child: AnimatedContainer(
            height: selected ? 150 : 200,
            width: selected ? 200 : 150,
            color: selected ? Colors.red : Colors.blue,
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 500),
          child: const Center(child: Text("Touch Me"),),),
        ),
        AnimatedContainer(
          height: selected ? 200 : 150,
          width: selected ? 150 : 200,
          color: selected ? Colors.blue : Colors.red,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 500),),
      ],
    );
  }
}
const animatedContainerClassCode = {
  '''
  
import 'package:flutter/material.dart';

class AnimatedContainerClass extends StatefulWidget {
  const AnimatedContainerClass({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerClass> createState() => _AnimatedContainerClassState();
}
class _AnimatedContainerClassState extends State<AnimatedContainerClass> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AnimatedContainer(
          height: selected ? 200 : 150,
          width: selected ? 150 : 200,
          color: selected ? Colors.amber : Colors.purple,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 500),),
        GestureDetector(
          onTap: (){
            setState(() {
              selected =! selected;
            });
          },
          child: AnimatedContainer(
            height: selected ? 150 : 200,
            width: selected ? 200 : 150,
            color: selected ? Colors.red : Colors.blue,
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 500),
          child: const Center(child: Text("Touch Me"),),),
        ),
        AnimatedContainer(
          height: selected ? 200 : 150,
          width: selected ? 150 : 200,
          color: selected ? Colors.blue : Colors.red,
          curve: Curves.fastOutSlowIn,
          duration: const Duration(milliseconds: 500),),
      ],
    );
  }
}  
  '''
};


