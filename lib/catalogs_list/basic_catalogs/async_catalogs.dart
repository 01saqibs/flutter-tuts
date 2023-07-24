import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FutureBuilderClass extends StatefulWidget {
  const FutureBuilderClass({Key? key}) : super(key: key);

  @override
  State<FutureBuilderClass> createState() => _FutureBuilderClassState();
}
class _FutureBuilderClassState extends State<FutureBuilderClass> {

  Future<ByteData> futureImageFunction() async {
    await Future.delayed(const Duration(seconds: 2));
    return rootBundle.load("assets/images/basic.png");
  }

  Future<String> futureFunction() async {
    await Future.delayed(const Duration(seconds: 1));
    return "Future String Value";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TextButton(onPressed: (){
            futureFunction();
            setState(() {
            });
          }, child: const Text("Press here to re Build Future Function")),
          Center(child: FutureBuilder(
              future: futureFunction(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                }
                else{
                  return Center(child: Text(snapshot.data.toString()));
                }
              }
          ),),
          const SizedBox(height: 50,),
          FutureBuilder(
          future: futureImageFunction(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            else
              {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 150, width: 150,
                        child: Image.memory(snapshot.data!.buffer.asUint8List())),
                    const Text("Future Image")
                  ],
                );
              }
    }),
        ],
      ),
    );
  }
}
const futureBuilderClassCode = {
  ''' 
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FutureBuilderClass extends StatefulWidget {
  const FutureBuilderClass({Key? key}) : super(key: key);

  @override
  State<FutureBuilderClass> createState() => _FutureBuilderClassState();
}
class _FutureBuilderClassState extends State<FutureBuilderClass> {

  Future<ByteData> futureImageFunction() async {
    await Future.delayed(const Duration(seconds: 2));
    return rootBundle.load("assets/images/flutter.png");
  }

  Future<String> futureFunction() async {
    await Future.delayed(const Duration(seconds: 1));
    return "Future String Value";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(onPressed: (){
            futureFunction();
            setState(() {
            });
          }, child: const Text("Press here to re Build Future Function")),
          Center(child: FutureBuilder(
              future: futureFunction(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                }
                else{
                  return Center(child: Text(snapshot.data.toString()));
                }
              }
          ),),
          const SizedBox(height: 50,),
          FutureBuilder(
          future: futureImageFunction(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            else
              {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 150, width: 150,
                        child: Image.memory(snapshot.data!.buffer.asUint8List())),
                    const Text("Future Image")
                  ],
                );
              }
    }),
        ],
      ),
    );
  }
}
  
  '''
};


class StreamBuilderClass extends StatefulWidget {
  const StreamBuilderClass({Key? key}) : super(key: key);

  @override
  State<StreamBuilderClass> createState() => _StreamBuilderClassState();
}
class _StreamBuilderClassState extends State<StreamBuilderClass> {
  Stream<int> getNum() async*{
    for(int a = 1; a <= 5; a++){
      await Future.delayed(const Duration(seconds: 1));
      yield a;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: StreamBuilder(
              stream: getNum(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(height: 20,),
                      Text("Waiting"),
                    ],
                  );
                }
                else if(snapshot.connectionState == ConnectionState.active){
                  return Text(snapshot.data.toString());
                }
                else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("You waited for 5 seconds"),
                      TextButton(onPressed: (){
                        getNum();
                        setState(() {

                        });
                      }, child: const Text("Start Again")),
                    ],
                  );
                }
              },
            ),
      ),
      );
  }
}
const streamBuilderClassCode = {
  ''' 
class StreamBuilderClass extends StatefulWidget {
  const StreamBuilderClass({Key? key}) : super(key: key);

  @override
  State<StreamBuilderClass> createState() => _StreamBuilderClassState();
}
class _StreamBuilderClassState extends State<StreamBuilderClass> {
  Stream<int> getNum() async*{
    for(int a = 1; a <= 5; a++){
      await Future.delayed(const Duration(seconds: 1));
      yield a;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
              stream: getNum(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(height: 20,),
                      Text("Waiting"),
                    ],
                  );
                }
                else if(snapshot.connectionState == ConnectionState.active){
                  return Text(snapshot.data.toString());
                }
                else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("You waited for 5 seconds"),
                      TextButton(onPressed: (){
                        getNum();
                        setState(() {

                        });
                      }, child: const Text("Start Again")),
                    ],
                  );
                }
              },
            ),
      ),
      );
  }
}
  
  '''
};

