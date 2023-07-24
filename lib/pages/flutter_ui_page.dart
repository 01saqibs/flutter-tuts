import 'package:flutter/material.dart';

class FlutterUIPage extends StatefulWidget {
  const FlutterUIPage({Key? key}) : super(key: key);

  @override
  State<FlutterUIPage> createState() => _FlutterUIPageState();
}

class _FlutterUIPageState extends State<FlutterUIPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text("Flutter UI",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemBuilder: (context, index) => FlutterUICard(
            title: "E-Commerce UI",
            image: "assets/images/latestdesign.png",
            press: () {
            },),
      ),
    );
  }
}


class FlutterUICard extends StatefulWidget {
  const FlutterUICard({Key? key, required this.title, required this.image, required this.press}) : super(key: key);
  final String title;
  final String image;
  final Function press;
  @override
  State<FlutterUICard> createState() => _TutContainerState();
}

class _TutContainerState extends State<FlutterUICard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black
      )),
          const SizedBox(height: 10,),
          InkWell(
            onTap: (){
              widget.press();
            },
            splashColor: Colors.black,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: MediaQuery.of(context).size.height*0.25,
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
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}