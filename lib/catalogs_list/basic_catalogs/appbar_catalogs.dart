import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

class BasicAppBarClass extends StatelessWidget {
  const BasicAppBarClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic AppBar"),
        centerTitle: true,
        leading: const Icon(Icons.star),
        actions: const [
          Icon(Icons.share),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: const Text("Body goes here"),
      ),
    );
  }
}
const basicAppBarClassCode = {
  '''
  
  import 'package:flutter/material.dart';
  
  class BasicAppBarClass extends StatelessWidget {
  const BasicAppBarClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic AppBar"),
        centerTitle: true,
        leading: const Icon(Icons.star),
        actions: const [
          Icon(Icons.share),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: const Text("Body goes here"),
      ),
    );
  }
}
  
  '''
};


class BottomBarClass extends StatefulWidget {
  const BottomBarClass({Key? key}) : super(key: key);

  @override
  State<BottomBarClass> createState() => _BottomBarClassState();
}
class _BottomBarClassState extends State<BottomBarClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          index == 2
              ? showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => Container(
                        height: 200,
                        color: Colors.blue,
                        child: const Center(child: Text("Bottom Sheet")),
                      ))
              : null;
        },
        items: const [
          BottomNavigationBarItem(
              label: "account", icon: Icon(Icons.account_circle_rounded)),
          BottomNavigationBarItem(label: "camera", icon: Icon(Icons.camera)),
          BottomNavigationBarItem(
            label: "menu",
            icon: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}
const bottomBarClassCode = {
  '''
  
  import 'package:flutter/material.dart';
  
  class BottomBarClass extends StatefulWidget {
  const BottomBarClass({Key? key}) : super(key: key);

  @override
  State<BottomBarClass> createState() => _BottomBarClassState();
}
class _BottomBarClassState extends State<BottomBarClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          index == 2
              ? showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => Container(
                        height: 200,
                        color: Colors.blue,
                        child: const Center(child: Text("Bottom Sheet")),
                      ))
              : null;
        },
        items: const [
          BottomNavigationBarItem(
              label: "account", icon: Icon(Icons.account_circle_rounded)),
          BottomNavigationBarItem(label: "camera", icon: Icon(Icons.camera)),
          BottomNavigationBarItem(
            label: "menu",
            icon: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}
  
  '''
};


class SliverAppbarClass extends StatelessWidget {
  const SliverAppbarClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: 150,
          forceElevated: true,
          elevation: 3,
          pinned: true,
          flexibleSpace: Container(
            alignment: Alignment.center,
            height: 150,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: const Text("to be Hidden",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (_, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Container(
                color: Colors.blue,
                height: 80,
                width: 200,
                child: Center(child: Text("Item: $index")),
              ),
            );
          },
          childCount: 20,
        ))
      ],
    );
  }
}
const sliverAppBarClassCode = {
  '''
  
  import 'package:flutter/material.dart';
  
  class SliverAppbarClass extends StatelessWidget {
  const SliverAppbarClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          expandedHeight: 150,
          forceElevated: true,
          elevation: 3,
          pinned: true,
          flexibleSpace: Container(
            alignment: Alignment.center,
            height: 150,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            ),
            child: const Text("to be Hidden",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (_, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Container(
                color: Colors.blue,
                height: 80,
                width: 200,
                child: Center(child: Text("Item: index")),
              ),
            );
          },
          childCount: 20,
        ))
      ],
    );
  }
}
  
  '''
};


class BackDropClass extends StatelessWidget {
  const BackDropClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
        appBar: BackdropAppBar(
          title: const Text("Backdrop App Bar"),
        ),
        headerHeight: 120,
        backLayer: const Center(
          child: Text("Back Layer"),
        ),
        frontLayer: const Center(child: Text("Front layer")));
  }
}
const backDropClassCode = {
  '''
  
  import 'package:flutter/material.dart';
  
  class BackDropClass extends StatelessWidget {
  const BackDropClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
        appBar: BackdropAppBar(
          title: const Text("Backdrop App Bar"),
        ),
        headerHeight: 120,
        backLayer: const Center(
          child: Text("Back Layer"),
        ),
        frontLayer: const Center(child: Text("Front layer")));
  }
}
  
  '''
};



