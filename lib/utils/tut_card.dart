import 'package:flutter/material.dart';

class TutContainer extends StatefulWidget {
  const TutContainer({Key? key, required this.title, required this.image, required this.press, required this.kCatalogs}) : super(key: key);
  final String title;
  final String image;
  final Function press;
  final int kCatalogs;
  @override
  State<TutContainer> createState() => _TutContainerState();
}

class _TutContainerState extends State<TutContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
      child: InkWell(
        onTap: (){
          widget.press();
        },
        splashColor: Colors.black,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: MediaQuery.of(context).size.height*0.17,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.center,
                  colors: [
                    Colors.white.withOpacity(0.90),
                    Colors.white,
                  ]),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 20,
                  color: Colors.blue.withOpacity(0.5),
                  offset: const Offset(0, 10),
                ),
              ]
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.center,
                  colors: [
                    Colors.blue.withOpacity(0.75),
                    Colors.blue.withOpacity(0.0),
                  ]),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                Image(image: AssetImage(widget.image),fit: BoxFit.cover,),
                Positioned(
                  left: 3,
                  top: -2,
                  child: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white
                  ),),
                ),
                Positioned(
                  right: 3,
                  bottom: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("Catalogs: ",style: TextStyle( fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold
                      ),),
                      Text(widget.kCatalogs.toString(),style: const TextStyle( fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}