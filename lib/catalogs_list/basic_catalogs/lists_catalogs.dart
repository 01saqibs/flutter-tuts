import 'package:flutter/material.dart';


class ListTileClass extends StatelessWidget {
  const ListTileClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListTile(
          tileColor: Colors.white,
          leading: Icon(Icons.account_circle_rounded),
          title: Text("Title Goes here"),
          subtitle: Text("Subtitle goes here"),
          trailing: Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }
}
const listTileClassCode = {
  '''
  
  import 'package:flutter/material.dart';
  
  class ListTileClass extends StatelessWidget {
  const ListTileClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListTile(
          tileColor: Colors.white,
          leading: Icon(Icons.account_circle_rounded),
          title: Text("Title Goes here"),
          subtitle: Text("Subtitle goes here"),
          trailing: Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }
}
  
  '''
};


class ListViewBuilderClass extends StatelessWidget {
  const ListViewBuilderClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    color: Colors.blue,
                    height: 80,
                    width: 220,
                    child: Text("$index ")),
              );
            }));
  }
}
const listViewBuilderClassCode = {
  '''
  
import 'package:flutter/material.dart';
  
  class ListViewBuilderClass extends StatelessWidget {
  const ListViewBuilderClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    color: Colors.blue,
                    height: 80,
                    width: 220,
                    child: Text("index")),
              );
            }));
  }
}
  
  '''
};


class GridListClass extends StatelessWidget {
  const GridListClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(crossAxisCount: 2,
      children: List.generate(20, (index) => Padding(
        padding: const EdgeInsets.only(left: 20,right: 20, top: 20),
        child: Container(
          color: Colors.blue,
          child: Center(child: Text("$index")),
        ),
      )),),
    );
  }
}
const gridListClassCode = {
  '''
  
import 'package:flutter/material.dart';
  
  class GridListClass extends StatelessWidget {
  const GridListClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(crossAxisCount: 2,
      children: List.generate(20, (index) => Padding(
        padding: const EdgeInsets.only(left: 20,right: 20, top: 20),
        child: Container(
          color: Colors.blue,
          child: Center(child: Text("index")),
        ),
      )),),
    );
  }
}
  
  '''
};


class ExpansionTileClass extends StatelessWidget {
  const ExpansionTileClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ExpansionTile(
        title: Text("Menu"),
        children: [
          ExpansionTile(
            title: Text("Burgers"),
            children: [
              ListTile(
                title: Text("Cheese Burger"),
              ),
              ListTile(
                title: Text("Chicken burger"),
              ),
            ],
          ),
          ExpansionTile(
            title: Text("Rice"),
          ),
          ExpansionTile(
            title: Text("Fries"),
          ),
        ],
      ),
    );
  }
}
const expansionTileClassCode = {
  '''
  
import 'package:flutter/material.dart';
  
  class ExpansionTileClass extends StatelessWidget {
  const ExpansionTileClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ExpansionTile(
        title: Text("Menu"),
        children: [
          ExpansionTile(
            title: Text("Burgers"),
            children: [
              ListTile(
                title: Text("Cheese Burger"),
              ),
              ListTile(
                title: Text("Chicken burger"),
              ),
            ],
          ),
          ExpansionTile(
            title: Text("Rice"),
          ),
          ExpansionTile(
            title: Text("Fries"),
          ),
        ],
      ),
    );
  }
}
  
  '''
};


class SwipeToDismissClass extends StatefulWidget {
  const SwipeToDismissClass({Key? key}) : super(key: key);

  @override
  State<SwipeToDismissClass> createState() => _SwipeToDismissClassState();
}
class _SwipeToDismissClassState extends State<SwipeToDismissClass> {
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final String item = items[index];
        return Dismissible(
          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify widgets.
          key: UniqueKey(),
          // Provide a function that tells the app
          // what to do after an item has been swiped away.
          onDismissed: (direction) {
            // Remove the item from the data source.
            setState(() {
              items.removeAt(index);
            });
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('$item dismissed')));
          },
          // Show a red background as the item is swiped away.
          background: Container(color: Colors.red),
          child: ListTile(
            title: Text(item),
          ),
        );
      },
    );
  }
}
const swipeToDismissClassCode = {
  '''
  
import 'package:flutter/material.dart';
  
  class SwipeToDismissClass extends StatefulWidget {
  const SwipeToDismissClass({Key? key}) : super(key: key);

  @override
  State<SwipeToDismissClass> createState() => _SwipeToDismissClassState();
}
class _SwipeToDismissClassState extends State<SwipeToDismissClass> {
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(20, (i) => 'Item {i + 1}');
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final String item = items[index];
        return Dismissible(
          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify widgets.
          key: UniqueKey(),
          // Provide a function that tells the app
          // what to do after an item has been swiped away.
          onDismissed: (direction) {
            // Remove the item from the data source.
            setState(() {
              items.removeAt(index);
            });
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('item dismissed')));
          },
          // Show a red background as the item is swiped away.
          background: Container(color: Colors.red),
          child: ListTile(
            title: Text(item),
          ),
        );
      },
    );
  }
}
  
  '''
};


class ListWheelClass extends StatelessWidget {
  const ListWheelClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
        itemExtent: 100, childDelegate: ListWheelChildBuilderDelegate(
      builder: (BuildContext context, int index){

        return ListTile(
          leading: Text("$index", style: const TextStyle(fontSize: 50),),
          title: const Text("Title goes here"),
        );
      }
    ));
  }
}
const listWheelClassCode = {
  '''
  
import 'package:flutter/material.dart';
  
  class ListWheelClass extends StatelessWidget {
  const ListWheelClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
        itemExtent: 100, childDelegate: ListWheelChildBuilderDelegate(
      builder: (BuildContext context, int index){

        return ListTile(
          leading: Text("index", style: const TextStyle(fontSize: 50),),
          title: const Text("Title goes here"),
        );
      }
    ));
  }
}
  
  '''
};









