import 'package:flutter/material.dart';

class ContainerClass extends StatelessWidget {
  const ContainerClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        margin: const EdgeInsets.all(50),
        height: 300,
        color: Colors.purple,
        child: Container(
          transformAlignment: Alignment.center,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30),
          ),
          transform: Matrix4.rotationZ(0.1),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
const containerClassCode = {
  '''
  
  import 'package:flutter/material.dart';
  
  class ContainerClass extends StatelessWidget {
  const ContainerClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        margin: const EdgeInsets.all(50),
        height: 300,
        color: Colors.purple,
        child: Container(
          transformAlignment: Alignment.center,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30),
          ),
          transform: Matrix4.rotationZ(0.1),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
  
  '''
};



class RowColumnClass extends StatefulWidget {
  const RowColumnClass({Key? key}) : super(key: key);

  @override
  State<RowColumnClass> createState() => _RowColumnClassState();
}
class _RowColumnClassState extends State<RowColumnClass> {
  final elements = [
    const Icon(
      Icons.star,
      size: 50,
      color: Colors.blue,
    ),
    const Icon(
      Icons.star,
      size: 50,
      color: Colors.blue,
    ),
    const Icon(
      Icons.star,
      size: 50,
      color: Colors.blue,
    ),
  ];

  bool isRow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.40,
            child: isRow
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: elements,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: elements,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Radio(
                      value: true,
                      groupValue: isRow,
                      onChanged: ((value) {
                        if (value != null) {
                          setState(() => isRow = value);
                        }
                      })),
                  const Text("Row"),
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: false,
                      groupValue: isRow,
                      onChanged: ((value) {
                        if (value != null) {
                          setState(() => isRow = value);
                        }
                      })),
                  const Text("Column"),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
const rowColumnClassCode = {
  '''
  
import 'package:flutter/material.dart';
  
class RowColumnClass extends StatefulWidget {
  const RowColumnClass({Key? key}) : super(key: key);

  @override
  State<RowColumnClass> createState() => _RowColumnClassState();
}
class _RowColumnClassState extends State<RowColumnClass> {
  final elements = [
    const Icon(
      Icons.star,
      size: 50,
      color: Colors.blue,
    ),
    const Icon(
      Icons.star,
      size: 50,
      color: Colors.blue,
    ),
    const Icon(
      Icons.star,
      size: 50,
      color: Colors.blue,
    ),
  ];

  bool isRow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.40,
            child: isRow
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: elements,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: elements,
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Radio(
                      value: true,
                      groupValue: isRow,
                      onChanged: ((value) {
                        if (value != null) {
                          setState(() => isRow = value);
                        }
                      })),
                  const Text("Row"),
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: false,
                      groupValue: isRow,
                      onChanged: ((value) {
                        if (value != null) {
                          setState(() => isRow = value);
                        }
                      })),
                  const Text("Column"),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
  
  '''
};


class WrapClass extends StatelessWidget {
  const WrapClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Wrap(
        spacing: 5.0,
        runSpacing: 4.0,
        children: [
          "Cars",
          "bikes",
          "Animals",
          "Humans",
          "Birds",
          "Machines",
        ]
            .map((String name) => Chip(
                  label: Text(name),
                  backgroundColor: Colors.black12,
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(name.substring(0, 1)),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
const wrapClassCode = {
  '''
  
import 'package:flutter/material.dart';
  
class WrapClass extends StatelessWidget {
  const WrapClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Wrap(
        spacing: 5.0,
        runSpacing: 4.0,
        children: [
          "Cars",
          "bikes",
          "Animals",
          "Humans",
          "Birds",
          "Machines",
        ]
            .map((String name) => Chip(
                  label: Text(name),
                  backgroundColor: Colors.black12,
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(name.substring(0, 1)),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
  
  '''
};


class FractionallySizedBoxClass extends StatelessWidget {
  const FractionallySizedBoxClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
              "Fractionally SizedBox is a widget that sizes its child to a fraction of the total available space."),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 300,width: 300,
            color: Colors.purple,
            child: FractionallySizedBox(
                heightFactor: 0.5,
                widthFactor: 0.5,
                child: Container(
                  color: Colors.blue,
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
              "The blue container takes 50% of width & height of the purple container"),
        ],
      ),
    ));
  }
}
const fractionalClassCode = {
  '''
  
import 'package:flutter/material.dart';
  
class FractionallySizedBoxClass extends StatelessWidget {
  const FractionallySizedBoxClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
              "Fractionally SizedBox is a widget that sizes its child to a fraction of the total available space."),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 300,width: 300,
            color: Colors.purple,
            child: FractionallySizedBox(
                heightFactor: 0.5,
                widthFactor: 0.5,
                child: Container(
                  color: Colors.blue,
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
              "The blue container takes 50% of width & height of the purple container"),
        ],
      ),
    ));
  }
}
  
  '''
};

class ExpandedClass extends StatelessWidget {
  const ExpandedClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(color: Colors.blue, height: 200, width: 200,),
          Expanded(child: Container(
            color: Colors.purple, width: 200,
          )),
          Container(
            color: Colors.blue,
            width: 200, height: 200,
          )
        ],
      ),
    );
  }
}
const expandedClassCode = {
  '''
  
import 'package:flutter/material.dart';
  
class ExpandedClass extends StatelessWidget {
  const ExpandedClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(color: Colors.blue, height: 200, width: 200,),
          Expanded(child: Container(
            color: Colors.purple, width: 200,
          )),
          Container(
            color: Colors.blue,
            width: 200, height: 200,
          )
        ],
      ),
    );
  }
}  
  '''
};

class SizedBoxClass extends StatelessWidget {
  const SizedBoxClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(
            height: 200, width: 300,
            child: Center(child: Text("SizedBox with specific size")),
          ),
          SizedBox(height: 20,child: Text("can be used to give gap between widgets."),),
        ],
      ),
    );
  }
}
const sizedBoxClassCode = {
  '''
  
import 'package:flutter/material.dart';
  
class SizedBoxClass extends StatelessWidget {
  const SizedBoxClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(
            height: 200, width: 300,
            child: Center(child: Text("SizedBox with specific size")),
          ),
          SizedBox(height: 20,child: Text("can be used to give gap between widgets."),),
        ],
      ),
    );
  }
}  
  '''
};

class StackClass extends StatelessWidget {
  const StackClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Container(color: Colors.blue,height: 400,width: 400,),
          Positioned(
              top: 20,
              left: 30,
              child: Container(color: Colors.white,height: 50, width: 100,)),
          const Positioned(
              top: 100, left: 0, right: 0,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text("A widget can be added on top of another widget with the help of stack.", textAlign: TextAlign.center,),
              ))
        ],
      ),
    );
  }
}
const stackClassCode = {
  '''
  
import 'package:flutter/material.dart';
  
class StackClass extends StatelessWidget {
  const StackClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Container(color: Colors.blue,height: 400,width: 400,),
          Positioned(
              top: 20,
              left: 30,
              child: Container(color: Colors.white,height: 50, width: 100,)),
          const Positioned(
              top: 100, left: 0, right: 0,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text("A widget can be added on top of another widget with the help of stack.", textAlign: TextAlign.center,),
              ))
        ],
      ),
    );
  }
}  
  '''
};



