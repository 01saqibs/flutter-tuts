
import 'package:flutter/material.dart';

class TabsClass extends StatelessWidget {
  const TabsClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.camera),
            ),
            Tab(
              icon: Icon(Icons.account_circle_rounded),
            ),
            Tab(
              icon: Icon(Icons.share),
            ),
          ]),
        ),
        body: const TabBarView(children: [
          Center(child: Text("Camera Icon")),
          Center(child: Text("Account Icon")),
          Center(child: Text("Share Icon")),
        ]),
      ),
    );
  }
}

const tabsClassCode = {
  '''
  
  import 'package:flutter/material.dart';
  
  class TabsClass extends StatelessWidget {
  const TabsClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.camera),),
              Tab(icon: Icon(Icons.account_circle_rounded),),
              Tab(icon: Icon(Icons.share),),
            ]),
          ),
          body: const TabBarView(children: [
            Center(child: Text("Camera Icon")),
            Center(child: Text("Account Icon")),
            Center(child: Text("Share Icon")),
          ]),
        ),
    );
  }
}
  
  '''
};




class RouteClass extends StatefulWidget {
  const RouteClass({Key? key}) : super(key: key);

  @override
  State<RouteClass> createState() => _RouteClassState();
}

class _RouteClassState extends State<RouteClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.topCenter,
          child: TextButton(
            child: const Text("Go to Next Page"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Page(),
                  ));
            },
          )),
    );
  }
}

class Page extends StatelessWidget {
  const Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Wer are in next page"),
              TextButton(
                child: const Text("Go Back"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          )),
    );
  }
}

final routeClassCode = {
  '''
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';


  class RouteClass extends StatefulWidget {
  const RouteClass({Key? key}) : super(key: key);

  @override
  State<RouteClass> createState() => _RouteClassState();
}
class _RouteClassState extends State<RouteClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        child: TextButton(
          child: const Text("Go to Next Page"),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Page(),));
          },
        )
      ),
    );
  }
}
class Page extends StatelessWidget {
  const Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Wer are in next page"),
            TextButton(
              child: const Text("Go Back"),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        )
      ),
    );
  }
}
  
  '''
};

class NavigationDrawerClass extends StatelessWidget {
  const NavigationDrawerClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      drawer: const Drawer(
        backgroundColor: Colors.blue,
        child: Text("this is a drawer"),
      ),
      body: Container(
        color: Colors.white,
        child: const Text("Navigation Drawer"),
      ),
    );
  }
}
final navigationClassCode = {
  '''
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';


  class NavigationDrawerClass extends StatelessWidget {
  const NavigationDrawerClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      drawer: const Drawer(
        backgroundColor: Colors.blue,
        child: Text("this is a drawer"),
      ),
      body: Container(
        color: Colors.white,
        child: const Text("Navigation Drawer"),
      ),
    );
  }
}
  
  '''
};


class PageSelectorClass extends StatelessWidget {
  const PageSelectorClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3, child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: const [
              TabPageSelector(),
              Expanded(
                child: TabBarView(children: [
                  Icon(Icons.home),
                  Icon(Icons.text_rotation_angledown),
                  Icon(Icons.stop),
                ]),
              ),
            ],
          ),
        )
    );
  }
}

final pageSelectorClassCode = {
  '''
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';


  class PageSelectorClass extends StatelessWidget {
  const PageSelectorClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3, child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: const [
              TabPageSelector(),
              Expanded(
                child: TabBarView(children: [
                  Icon(Icons.home),
                  Icon(Icons.text_rotation_angledown),
                  Icon(Icons.stop),
                ]),
              ),
            ],
          ),
        )
    );
  }
}
  
  '''
};

