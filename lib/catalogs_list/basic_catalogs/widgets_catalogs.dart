import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hidden_drawer_menu/controllers/simple_hidden_drawer_controller.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/simple_hidden_drawer.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';



class FlutterSpeedDial extends StatefulWidget {
  // final ValueNotifier<ThemeMode> theme;
  const FlutterSpeedDial({Key? key,}) : super(key: key);
  @override
  _FlutterSpeedDialState createState() => _FlutterSpeedDialState();
}

class _FlutterSpeedDialState extends State<FlutterSpeedDial> with TickerProviderStateMixin {
  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var mini = false;
  var rmicons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.up;
  var buttonSize = const Size(56.0, 56.0);
  var childrenButtonSize = const Size(56.0, 56.0);
  var selectedfABLocation = FloatingActionButtonLocation.endDocked;
  var items = [
    FloatingActionButtonLocation.startFloat,
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.startTop,
    FloatingActionButtonLocation.centerTop,
    FloatingActionButtonLocation.endTop,
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Speed Dial Example"),
        ),
        body: Center(child: Text("Flutter speed dial example")),
        floatingActionButtonLocation: selectedfABLocation,
        floatingActionButton: SpeedDial(
          // animatedIcon: AnimatedIcons.menu_close,
          // animatedIconTheme: IconThemeData(size: 22.0),
          // / This is ignored if animatedIcon is non null
          // child: Text("open"),
          // activeChild: Text("close"),
          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,
          mini: mini,
          openCloseDial: isDialOpen,
          childPadding: const EdgeInsets.all(5),
          spaceBetweenChildren: 4,
          dialRoot: customDialRoot
              ? (ctx, open, toggleChildren) {
            return ElevatedButton(
              onPressed: toggleChildren,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                padding: const EdgeInsets.symmetric(
                    horizontal: 22, vertical: 18),
              ),
              child: const Text(
                "Custom Dial Root",
                style: TextStyle(fontSize: 17),
              ),
            );
          }
              : null,
          buttonSize:
          buttonSize, // it's the SpeedDial size which defaults to 56 itself
          // iconTheme: IconThemeData(size: 22),
          label: extend
              ? const Text("Open")
              : null, // The label of the main button.
          /// The active label of the main button, Defaults to label if not specified.
          activeLabel: extend ? const Text("Close") : null,

          /// Transition Builder between label and activeLabel, defaults to FadeTransition.
          // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
          /// The below button size defaults to 56 itself, its the SpeedDial childrens size
          childrenButtonSize: childrenButtonSize,
          visible: visible,
          direction: speedDialDirection,
          switchLabelPosition: switchLabelPosition,

          /// If true user is forced to close dial manually
          closeManually: closeManually,

          /// If false, backgroundOverlay will not be rendered.
          renderOverlay: renderOverlay,
          // overlayColor: Colors.black,
          // overlayOpacity: 0.5,
          onOpen: () => debugPrint('OPENING DIAL'),
          onClose: () => debugPrint('DIAL CLOSED'),
          useRotationAnimation: useRAnimation,
          tooltip: 'Open Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          // foregroundColor: Colors.black,
          // backgroundColor: Colors.white,
          // activeForegroundColor: Colors.red,
          // activeBackgroundColor: Colors.blue,
          elevation: 8.0,
          animationCurve: Curves.elasticInOut,
          isOpenOnStart: false,
          shape: customDialRoot
              ? const RoundedRectangleBorder()
              : const StadiumBorder(),
          // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          children: [
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.accessibility) : null,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: 'First',
              onTap: () => setState(() => rmicons = !rmicons),
              onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.brush) : null,
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              label: 'Second',
              onTap: () => debugPrint('SECOND CHILD'),
            ),
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.margin) : null,
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              label: 'Show Snackbar',
              visible: true,
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(("Third Child Pressed")))),
              onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: selectedfABLocation ==
                FloatingActionButtonLocation.startDocked
                ? MainAxisAlignment.end
                : selectedfABLocation == FloatingActionButtonLocation.endDocked
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ValueListenableBuilder<bool>(
                  valueListenable: isDialOpen,
                  builder: (ctx, value, _) => IconButton(
                    icon: const Icon(Icons.open_in_browser),
                    tooltip: (!value ? "Open" : "Close") + (" Speed Dial"),
                    onPressed: () => {isDialOpen.value = !isDialOpen.value},
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

extension EnumExt on FloatingActionButtonLocation {
  /// Get Value of The SpeedDialDirection Enum like Up, Down, etc. in String format
  String get value => toString().split(".")[1];
}

final FlutterSpeedDialCode = {
  '''
  """""""" Start """""""""
  class FlutterSpeedDial extends StatefulWidget {
  // final ValueNotifier<ThemeMode> theme;
  const FlutterSpeedDial({Key? key,}) : super(key: key);
  @override
  _FlutterSpeedDialState createState() => _FlutterSpeedDialState();
}

class _FlutterSpeedDialState extends State<FlutterSpeedDial> with TickerProviderStateMixin {
  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var mini = false;
  var rmicons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.up;
  var buttonSize = const Size(56.0, 56.0);
  var childrenButtonSize = const Size(56.0, 56.0);
  var selectedfABLocation = FloatingActionButtonLocation.endDocked;
  var items = [
    FloatingActionButtonLocation.startFloat,
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.startTop,
    FloatingActionButtonLocation.centerTop,
    FloatingActionButtonLocation.endTop,
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Speed Dial Example"),
        ),
        body: Center(child: Text("Flutter speed dial example")),
        floatingActionButtonLocation: selectedfABLocation,
        floatingActionButton: SpeedDial(
          // animatedIcon: AnimatedIcons.menu_close,
          // animatedIconTheme: IconThemeData(size: 22.0),
          // / This is ignored if animatedIcon is non null
          // child: Text("open"),
          // activeChild: Text("close"),
          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,
          mini: mini,
          openCloseDial: isDialOpen,
          childPadding: const EdgeInsets.all(5),
          spaceBetweenChildren: 4,
          dialRoot: customDialRoot
              ? (ctx, open, toggleChildren) {
            return ElevatedButton(
              onPressed: toggleChildren,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                padding: const EdgeInsets.symmetric(
                    horizontal: 22, vertical: 18),
              ),
              child: const Text(
                "Custom Dial Root",
                style: TextStyle(fontSize: 17),
              ),
            );
          }
              : null,
          buttonSize:
          buttonSize, // it's the SpeedDial size which defaults to 56 itself
          // iconTheme: IconThemeData(size: 22),
          label: extend
              ? const Text("Open")
              : null, // The label of the main button.
          /// The active label of the main button, Defaults to label if not specified.
          activeLabel: extend ? const Text("Close") : null,

          /// Transition Builder between label and activeLabel, defaults to FadeTransition.
          // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
          /// The below button size defaults to 56 itself, its the SpeedDial childrens size
          childrenButtonSize: childrenButtonSize,
          visible: visible,
          direction: speedDialDirection,
          switchLabelPosition: switchLabelPosition,

          /// If true user is forced to close dial manually
          closeManually: closeManually,

          /// If false, backgroundOverlay will not be rendered.
          renderOverlay: renderOverlay,
          // overlayColor: Colors.black,
          // overlayOpacity: 0.5,
          onOpen: () => debugPrint('OPENING DIAL'),
          onClose: () => debugPrint('DIAL CLOSED'),
          useRotationAnimation: useRAnimation,
          tooltip: 'Open Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          // foregroundColor: Colors.black,
          // backgroundColor: Colors.white,
          // activeForegroundColor: Colors.red,
          // activeBackgroundColor: Colors.blue,
          elevation: 8.0,
          animationCurve: Curves.elasticInOut,
          isOpenOnStart: false,
          shape: customDialRoot
              ? const RoundedRectangleBorder()
              : const StadiumBorder(),
          // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          children: [
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.accessibility) : null,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: 'First',
              onTap: () => setState(() => rmicons = !rmicons),
              onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.brush) : null,
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              label: 'Second',
              onTap: () => debugPrint('SECOND CHILD'),
            ),
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.margin) : null,
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              label: 'Show Snackbar',
              visible: true,
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(("Third Child Pressed")))),
              onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: selectedfABLocation ==
                FloatingActionButtonLocation.startDocked
                ? MainAxisAlignment.end
                : selectedfABLocation == FloatingActionButtonLocation.endDocked
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              ValueListenableBuilder<bool>(
                  valueListenable: isDialOpen,
                  builder: (ctx, value, _) => IconButton(
                    icon: const Icon(Icons.open_in_browser),
                    tooltip: (!value ? "Open" : "Close") + (" Speed Dial"),
                    onPressed: () => {isDialOpen.value = !isDialOpen.value},
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

extension EnumExt on FloatingActionButtonLocation {
  /// Get Value of The SpeedDialDirection Enum like Up, Down, etc. in String format
  String get value => toString().split(".")[1];
}

  """""""" End """""""""
  
  '''

};


///
///
///
///
class ExpansionTileClass2 extends StatelessWidget {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();

  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("ExpansionTile"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              key: cardA,
              leading: const CircleAvatar(child: Text('A')),
              title: const Text('Tap me!'),
              subtitle: const Text('I expand!'),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      """Hi there, I'm a drop-in replacement for Flutter's ExpansionTile.

Use me any time you think your app could benefit from being just a bit more Material.

These buttons control the next card down!""",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardB.currentState?.expand();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.arrow_downward),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Open'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardB.currentState?.collapse();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.arrow_upward),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Close'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardB.currentState?.toggleExpansion();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.swap_vert),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Toggle'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              key: cardB,
              expandedTextColor: Colors.red,
              leading: const CircleAvatar(child: Text('B')),
              title: const Text('Tap me!'),
              subtitle: const Text('I expand, too!'),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      """Hi there, I'm a drop-in replacement for Flutter's ExpansionTile.

Use me any time you think your app could benefit from being just a bit more Material.

These buttons control the card above!""",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.expand();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.arrow_downward),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Open'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.collapse();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.arrow_upward),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Close'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.toggleExpansion();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.swap_vert),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Toggle'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final ExpansionTileCode = {
  '''
  """""" Start """""
  class ExpansionTile extends StatelessWidget {


  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();

  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("ExpansionTile"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              key: cardA,
              leading: const CircleAvatar(child: Text('A')),
              title: const Text('Tap me!'),
              subtitle: const Text('I expand!'),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      """Hi there, I'm a drop-in replacement for Flutter's ExpansionTile.

Use me any time you think your app could benefit from being just a bit more Material.

These buttons control the next card down!""",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardB.currentState?.expand();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.arrow_downward),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Open'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardB.currentState?.collapse();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.arrow_upward),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Close'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardB.currentState?.toggleExpansion();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.swap_vert),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Toggle'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ExpansionTileCard(
              key: cardB,
              expandedTextColor: Colors.red,
              leading: const CircleAvatar(child: Text('B')),
              title: const Text('Tap me!'),
              subtitle: const Text('I expand, too!'),
              children: <Widget>[
                const Divider(
                  thickness: 1.0,
                  height: 1.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      """Hi there, I'm a drop-in replacement for Flutter's ExpansionTile.

Use me any time you think your app could benefit from being just a bit more Material.

These buttons control the card above!""",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceAround,
                  buttonHeight: 52.0,
                  buttonMinWidth: 90.0,
                  children: <Widget>[
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.expand();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.arrow_downward),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Open'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.collapse();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.arrow_upward),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Close'),
                        ],
                      ),
                    ),
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {
                        cardA.currentState?.toggleExpansion();
                      },
                      child: const Column(
                        children: <Widget>[
                          Icon(Icons.swap_vert),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Text('Toggle'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

  """""" End """""
  '''
};

class FancyHiddenDrawer extends StatelessWidget {
  const FancyHiddenDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SimpleHiddenDrawer(
        menu: const HiddenDrawer(),
        screenSelectedBuilder: (position, controller) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                leading: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      controller.toggle();
                    }),
              ),
              body: Center(
                child: Text("Tap the menu icon"),
              ));
        },
      ),
    );
  }
}

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  late SimpleHiddenDrawerController controller;

  @override
  void didChangeDependencies() {
    controller = SimpleHiddenDrawerController.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.cyan,
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                controller.setSelectedMenuPosition(0);
              },
              child: Text("Menu 1"),
            ),
            ElevatedButton(
              onPressed: () {
                controller.setSelectedMenuPosition(1);
              },
              child: Text("Menu 2"),
            )
          ],
        ),
      ),
    );
  }
}

final FancyHiddenDrawerCode = {
  '''
  """""""" Start """""""""
  
class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  late SimpleHiddenDrawerController controller;

  @override
  void didChangeDependencies() {
    controller = SimpleHiddenDrawerController.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.cyan,
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                controller.setSelectedMenuPosition(0);
              },
              child: Text("Menu 1"),
            ),
            ElevatedButton(
              onPressed: () {
                controller.setSelectedMenuPosition(1);
              },
              child: Text("Menu 2"),
            )
          ],
        ),
      ),
    );
  }
}
  """""""" End """""""""
  '''
};

// class FancyHiddenDrawer extends StatefulWidget {
//   FancyHiddenDrawer({required Key key}) : super(key: key);
//
//   @override
//   _FancyHiddenDrawerState createState() => _FancyHiddenDrawerState();
// }
//
// class _FancyHiddenDrawerState extends State<FancyHiddenDrawer> {
//   List<ScreenHiddenDrawer> itens = List();
//
//   @override
//   void initState() {
//     itens.add(new ScreenHiddenDrawer(
//         new ItemHiddenMenu(
//           name: "Screen 1",
//           baseStyle: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
//           colorLineSelected: Colors.teal,
//         ),
//         FirstSreen()));
//
//     itens.add(new ScreenHiddenDrawer(
//         new ItemHiddenMenu(
//           name: "Screen 2",
//           baseStyle: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 28.0),
//           colorLineSelected: Colors.orange,
//         ),
//         SecondSreen()));
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return HiddenDrawerMenu(
//       backgroundColorMenu: Colors.blueGrey,
//       backgroundColorAppBar: Colors.cyan,
//       screens: itens,
//       //    typeOpen: TypeOpen.FROM_RIGHT,
//       //    disableAppBarDefault: false,
//       //    enableScaleAnimin: true,
//       //    enableCornerAnimin: true,
//       //    slidePercent: 80.0,
//       //    verticalScalePercent: 80.0,
//       //    contentCornerRadius: 10.0,
//       //    iconMenuAppBar: Icon(Icons.menu),
//       //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
//       //    whithAutoTittleName: true,
//       //    styleAutoTittleName: TextStyle(color: Colors.red),
//       //    actionsAppBar: <Widget>[],
//       //    backgroundColorContent: Colors.blue,
//       //    elevationAppBar: 4.0,
//       //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
//       //    enableShadowItensMenu: true,
//       //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
//     );
//   }
// }

class LiquidPullRefresh extends StatefulWidget {
  const LiquidPullRefresh({
    Key? key,
  }) : super(key: key);

  @override
  _LiquidPullRefreshState createState() => _LiquidPullRefreshState();
}

class _LiquidPullRefreshState extends State<LiquidPullRefresh> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey = GlobalKey<LiquidPullToRefreshState>();

  static int refreshNum = 10; // number that changes when refreshed
  Stream<int> counterStream = Stream<int>.periodic(const Duration(seconds: 3), (x) => refreshNum);

  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  static final List<String> _items = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N'];

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    setState(() {
      refreshNum = Random().nextInt(100);
    });
    return completer.future.then<void>((_) {
      ScaffoldMessenger.of(_scaffoldKey.currentState!.context).showSnackBar(
        SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
            label: 'RETRY',
            onPressed: () {
              _refreshIndicatorKey.currentState!.show();
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(-1.0, 0.0),
              child: Icon(Icons.reorder),
            ),
            Align(
              alignment: Alignment(-0.3, 0.0),
              child: Text('Liquid Pull Refresh'),
            ),
          ],
        ),
      ),
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        showChildOpacityTransition: false,
        child: StreamBuilder<int>(
          stream: counterStream,
          builder: (context, snapshot) {
            return ListView.builder(
              padding: kMaterialListPadding,
              itemCount: _items.length,
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                final String item = _items[index];
                return ListTile(
                  isThreeLine: true,
                  leading: CircleAvatar(child: Text(item)),
                  title: Text('This item represents $item.'),
                  subtitle: Text('Even more additional list item information appears on line three. ${snapshot.data}'),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

final liquidPullRefreshCode = {
  '''
  """""""""""""""start""""""""""
  Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Stack(
          children: <Widget>[
            const Align(
              alignment: Alignment(-1.0, 0.0),
              child: Icon(Icons.reorder),
            ),
            Align(
              alignment: const Alignment(-0.3, 0.0),
              child: Text(widget.title!),
            ),
          ],
        ),
      ),
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        showChildOpacityTransition: false,
        child: StreamBuilder<int>(
          stream: counterStream,
          builder: (context, snapshot) {
            return ListView.builder(
              padding: kMaterialListPadding,
              itemCount: _items.length,
              controller: _scrollController,
              itemBuilder: (BuildContext context, int index) {
                final String item = _items[index];
                return ListTile(
                  isThreeLine: true,
                  leading: CircleAvatar(child: Text(item)),
                  title: Text('This item represents  %item.'),
                  subtitle: Text(
                      'Even more additional list item information appears on line three. {snapshot.data}}'),
                );
              },
            );
          },
        ),
      ),
    ); 
    """"""""""End"""""""""
  '''
};

class IconClass extends StatelessWidget {
  const IconClass({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Icon(Icons.book),
    );
  }
}

final iconCode = {
  ''' Start =>  import 'package:flutter/material.dart';  
  
void main() => runApp(MyApp());  
  
class MyApp extends StatelessWidget {  
  // This widget is the root of your application.  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      theme: ThemeData(  
        primarySwatch: Colors.blue,  
      ),  
      home: MyIconPage(),  
    );  
  }  
}  
  
class MyIconPage extends StatefulWidget {  
  @override  
  _MyIconPageState createState() => _MyIconPageState();  
}  
  
class _MyIconPageState extends State<MyIconPage> {  
  @override  
  Widget build(BuildContext context) {  
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Icon(Icons.book),
    );
  }  
} <= End '''
};

class TextClass extends StatelessWidget {
  const TextClass({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Here are texts"));
  }
}

final textClassCode = {
  ''' Start =>  import 'package:flutter/material.dart';  
  
void main() => runApp(MyApp());  
  
class MyApp extends StatelessWidget {  
  // This widget is the root of your application.  
  @override  
  Widget build(BuildContext context) {  
    return return const Center(child: Text("Here are texts"));
  }  
}  
  
class MyIconPage extends StatefulWidget {  
  @override  
  _MyIconPageState createState() => _MyIconPageState();  
}  
  
class _MyIconPageState extends State<MyIconPage> {  
  @override  
  Widget build(BuildContext context) {  
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Icon(Icons.book),
    );
  }  
} <= End '''
};

class TypographyClass extends StatelessWidget {
  const TypographyClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final styles = <String, TextStyle>{
      'headline 1': textTheme.displayLarge!,
      'headline 2': textTheme.displayMedium!,
      'headline 3': textTheme.displaySmall!,
      'headline 4': textTheme.headlineMedium!,
      'headline 5': textTheme.headlineSmall!,
      'headline 6': textTheme.titleLarge!,
    };

    return ListView(
      children: [
        for (final i in styles.entries)
          ListTile(
            title: Text(
              i.key,
              style: i.value,
            ),
          ),
      ],
    );
  }
}

final typographyCode = {
  '''

import 'package:flutter/material.dart';  
  
void main() => runApp(MyApp());  
  
class MyApp extends StatelessWidget {  
  // This widget is the root of your application.  
  @override  
   Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final styles = <String, TextStyle>{
      'headline 1' : textTheme.headline1!,
      'headline 2' : textTheme.headline2!,
      'headline 3' : textTheme.headline3!,
      'headline 4' : textTheme.headline4!,
      'headline 5' : textTheme.headline5!,
      'headline 6' : textTheme.headline6!,
    };

    return ListView(
      children: [
        for(final i in styles.entries)
          ListTile(title: Text(i.key, style: i.value,),),
      ],
    );
  }  
}

'''
};

class TextFieldClass extends StatefulWidget {
  const TextFieldClass({Key? key}) : super(key: key);

  @override
  State<TextFieldClass> createState() => _TextFieldClassState();
}

class _TextFieldClassState extends State<TextFieldClass> {
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const TextField(
            decoration: InputDecoration(labelText: "User name", hintText: "Enter username"),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Description",
              hintText: "Enter max lines 10",
              alignLabelWithHint: true,
            ),
            maxLines: 10,
          ),
          TextField(
            obscureText: showPass,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter password",
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showPass = !showPass;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: showPass ? Colors.black38 : Colors.blue,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

final textFieldClassCode = {
  ''' Start =>  import 'package:flutter/material.dart';  
  
void main() => runApp(MyApp());  
  
class TextFieldClass extends StatefulWidget {
  const TextFieldClass({Key? key}) : super(key: key);

  @override
  State<TextFieldClass> createState() => _TextFieldClassState();
}
class _TextFieldClassState extends State<TextFieldClass> {
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const TextField(
            decoration: InputDecoration(
                labelText: "User name",
                hintText: "Enter username"
            ),
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: "Description",
              hintText: "Enter max lines 10",
              alignLabelWithHint: true,
            ),
            maxLines: 10,
          ),
          TextField(
            obscureText: showPass,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter password",
              suffixIcon: IconButton(onPressed: (){
                setState(() {
                  showPass =!showPass;
                });
              }, icon:  Icon(
                Icons.remove_red_eye, color: showPass ? Colors.black38 : Colors.blue,
              )),
            ),
          ),
        ],
      ),
    );
  }
}

 <= End '''
};

class TextFormFieldExample extends StatefulWidget {
  const TextFormFieldExample({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _TextFormFieldExampleState();
}

class _TextFormFieldExampleState extends State<TextFormFieldExample> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 24.0),
          // "Name" form.
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.person),
              hintText: 'What do people call you?',
              labelText: 'Name *',
            ),
          ),
          const SizedBox(height: 24.0),
          // "Phone number" form.
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.phone),
              hintText: 'Where can we reach you?',
              labelText: 'Phone Number *',
              prefixText: '+86',
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 24.0),
          // "Email" form.
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.email),
              hintText: 'Your email address',
              labelText: 'E-mail',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 24.0),
          // "Life story" form.
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Tell us about yourself',
              helperText: 'Keep it short, this is just a demo.',
              labelText: 'Life story',
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 24.0),
          // "Salary" form.
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Salary',
              prefixText: '\$',
              suffixText: 'USD',
              suffixStyle: TextStyle(color: Colors.green),
            ),
          ),
          const SizedBox(height: 24.0),
          TextFormField(
            obscureText: _obscureText,
            maxLength: 8,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              filled: true,
              hintText: "Enter Password",
              labelText: "Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final textFormFieldClassCode = {
  ''' Start =>  import 'package:flutter/material.dart';  
  
void main() => runApp(MyApp());  
  
class TextFormFieldExample extends StatefulWidget {
  const TextFormFieldExample({super.key,});



  @override
  State<StatefulWidget> createState() => _TextFormFieldExampleState();
}
class _TextFormFieldExampleState extends State<TextFormFieldExample> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 24.0),
          // "Name" form.
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.person),
              hintText: 'What do people call you?',
              labelText: 'Name *',
            ),
          ),
          const SizedBox(height: 24.0),
          // "Phone number" form.
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.phone),
              hintText: 'Where can we reach you?',
              labelText: 'Phone Number *',
              prefixText: '+86',
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 24.0),
          // "Email" form.
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.email),
              hintText: 'Your email address',
              labelText: 'E-mail',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 24.0),
          // "Life story" form.
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Tell us about yourself',
              helperText: 'Keep it short, this is just a demo.',
              labelText: 'Life story',
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 24.0),
          // "Salary" form.
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Salary',
              prefixText: '\$',
              suffixText: 'USD',
              suffixStyle: TextStyle(color: Colors.green),
            ),
          ),
          const SizedBox(height: 24.0),
          TextFormField(
            obscureText: _obscureText,
            maxLength: 8,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              filled: true,
              hintText: "Enter Password",
              labelText: "Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

 <= End '''
};

class ImageClass extends StatelessWidget {
  const ImageClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: [
            Row(
              children: const [
                Image(image: AssetImage("assets/images/basic.png"), width: 120),
                Spacer(),
                Text(
                  "Images from Assets",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const ListTile(title: Text('Cached network image:')),
            CachedNetworkImage(
              imageUrl:
                  'https://images.pexels.com/photos/3201768/pexels-photo-3201768.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const Divider(),
            const ListTile(
              title: Text('ExtendedImage:'),
              subtitle: Text(
                'provides more functionalities like image caching and shape and borderRadius',
              ),
            ),
            // Extended image
            ExtendedImage.network(
              'https://images.unsplash.com/photo-1515488764276-beab7607c1e6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1895&q=80',
              // cache: true, (by default caches image)
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            ),
          ],
        ),
      ),
    );
  }
}

final imageClassCode = {
  ''' Start =>  import 'package:flutter/material.dart';  
  
void main() => runApp(MyApp());  
  
class ImageClass extends StatelessWidget {
  const ImageClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: [
            Row(
              children: const [
                Image(image: AssetImage("assets/images/flutter.png"), width: 120),
                Spacer(),
                Text("Images from Assets", style: TextStyle(fontSize: 18,),),
              ],
            ),
            const SizedBox(height: 20,),
            Card(
              child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: "https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg")
            ),
            const Divider(),
            const ListTile(title: Text('Cached network image:')),
            CachedNetworkImage(
              imageUrl: 'https://picsum.photos/id/7/250/250',
              placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const Divider(),
            const ListTile(title: Text('GIF from asset:')),
            Image.asset(
              'assets/images/flutter.gif',
              scale: 1.0,
              height: 300,
            ),
            const Divider(),
            const ListTile(
              title: Text('ExtendedImage:'),
              subtitle: Text(
                'provides more functionalities like image caching and shape and borderRadius',
              ),
            ),
            // Extended image
            ExtendedImage.network(
              'https://images.unsplash.com/photo-1515488764276-beab7607c1e6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1895&q=80',
              // cache: true, (by default caches image)
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            ),
          ],
        ),
      ),
    );
  }
}

 <= End '''
};

class CardInkwellClass extends StatefulWidget {
  const CardInkwellClass({Key? key}) : super(key: key);

  @override
  State<CardInkwellClass> createState() => _CardInkwellClassState();
}

class _CardInkwellClassState extends State<CardInkwellClass> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: <Widget>[
        const Card(
          color: Colors.red,
          // The elevation determines shade.
          elevation: 10.0,
          child: SizedBox(
            height: 100.0,
            child: Center(child: Text('Card 1')),
          ),
        ),
        Card(
          color: Colors.green,
          margin: const EdgeInsets.all(20.0),
          elevation: 0.0,
          child: SizedBox(
            height: 100.0,
            child: InkWell(
              splashColor: Colors.deepOrange,
              onTap: () {},
              child: const Center(child: Text('Card 2 (with Inkwell effect on tap)')),
            ),
          ),
        ),
        const Card(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30),
            ),
          ),
          child: SizedBox(
            height: 100.0,
            child: Center(child: Text('Card 3 (with custom border radius)')),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 180.0,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/basic.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 16.0,
                      left: 16.0,
                      right: 16.0,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.center,
                        child: Text(
                          'Card 4 (complex example)',
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: const Text('SHARE'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('EXPLORE'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

final cardInkWellCassCode = {
  ''' Start =>  import 'package:flutter/material.dart';  
  
class CardInkwellClass extends StatefulWidget {
  const CardInkwellClass({Key? key}) : super(key: key);

  @override
  State<CardInkwellClass> createState() => _CardInkwellClassState();
}
class _CardInkwellClassState extends State<CardInkwellClass> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: <Widget>[
        const Card(
          color: Colors.red,
          // The elevation determines shade.
          elevation: 10.0,
          child: SizedBox(
            height: 100.0,
            child: Center(child: Text('Card 1')),
          ),
        ),
        Card(
          color: Colors.green,
          margin: const EdgeInsets.all(20.0),
          elevation: 0.0,
          child: SizedBox(
            height: 100.0,
            child: InkWell(
              splashColor: Colors.deepOrange,
              onTap: () {},
              child: const Center(child: Text('Card 2 (with Inkwell effect on tap)')),
            ),
          ),
        ),
        const Card(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30),
            ),
          ),
          child: SizedBox(
            height: 100.0,
            child: Center(child: Text('Card 3 (with custom border radius)')),
          ),
        ),
        const SizedBox(height: 20,),
        Card(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 180.0,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/basic.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 16.0,
                      left: 16.0,
                      right: 16.0,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.center,
                        child: Text(
                          'Card 4 (complex example)',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: const Text('SHARE'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('EXPLORE'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

 <= End '''
};

class GradientClass extends StatelessWidget {
  const GradientClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtStyle = Theme.of(context).textTheme.headlineMedium;
    return ListView(
      padding: const EdgeInsets.all(25),
      children: [
        Container(
          height: 300,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.6, 0.9],
              colors: [Colors.yellow, Colors.indigo, Colors.teal],
            ),
          ),
          child: Center(child: Text('LinearGradient', style: txtStyle)),
        ),
        const Divider(),
        Container(
          height: 300,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              radius: 0.7,
              colors: [Colors.blue, Colors.red],
            ),
          ),
          child: Center(child: Text('RadialGradient', style: txtStyle)),
        ),
        const Divider(),
        Container(
          height: 300,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: SweepGradient(
              startAngle: pi / 6,
              endAngle: pi * 1.8,
              colors: [Colors.blue, Colors.yellow, Colors.red],
            ),
          ),
          child: Center(child: Text('SweepGradient', style: txtStyle)),
        ),
        const Divider(),
      ],
    );
  }
}

final gradientClassCode = {
  ''' Start =>  import 'package:flutter/material.dart';  
  
void main() => runApp(MyApp());  
  
class GradientClass extends StatelessWidget {
  const GradientClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtStyle = Theme.of(context).textTheme.headline4;
    return ListView(
      padding: const EdgeInsets.all(25),
      children: [
        Container(
          height: 300,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.6, 0.9],
              colors: [Colors.yellow, Colors.indigo, Colors.teal],
            ),
          ),
          child: Center(child: Text('LinearGradient', style: txtStyle)),
        ),
        const Divider(),
        Container(
          height: 300,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              radius: 0.7,
              colors: [Colors.blue, Colors.red],
            ),
          ),
          child: Center(child: Text('RadialGradient', style: txtStyle)),
        ),
        const Divider(),
        Container(
          height: 300,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: SweepGradient(
              startAngle: pi / 6,
              endAngle: pi * 1.8,
              colors: [Colors.blue, Colors.yellow, Colors.red],
            ),
          ),
          child: Center(child: Text('SweepGradient', style: txtStyle)),
        ),
        const Divider(),
      ],
    );
  }
}

 <= End '''
};

class DropMenuClass extends StatefulWidget {
  const DropMenuClass({Key? key}) : super(key: key);

  @override
  State<DropMenuClass> createState() => _DropMenuClassState();
}

class _DropMenuClassState extends State<DropMenuClass> {
  static const menuItems = <String>[
    'One',
    'Two',
    'Three',
    'Four',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  final List<PopupMenuItem<String>> _popUpMenuItems = menuItems
      .map(
        (String value) => PopupMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String _btn1SelectedVal = 'One';
  String? _btn2SelectedVal;
  late String _btn3SelectedVal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('DropDownButton with default:'),
            trailing: DropdownButton<String>(
              // Must be one of items.value.
              value: _btn1SelectedVal,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() => _btn1SelectedVal = newValue);
                }
              },
              items: _dropDownMenuItems,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text('DropDownButton with hint:'),
            trailing: DropdownButton(
              value: _btn2SelectedVal,
              hint: const Text('Choose'),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() => _btn2SelectedVal = newValue);
                }
              },
              items: _dropDownMenuItems,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text('Popup menu button:'),
            trailing: PopupMenuButton<String>(
              onSelected: (String newValue) {
                _btn3SelectedVal = newValue;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(_btn3SelectedVal),
                  ),
                );
              },
              itemBuilder: (BuildContext context) => _popUpMenuItems,
            ),
          ),
        ],
      ),
    );
  }
}

final dropDownClassCode = {
  ''' Start =>  import 'package:flutter/material.dart';  
  
void main() => runApp(MyApp());  
  
class DropMenuClass extends StatefulWidget {
  const DropMenuClass({Key? key}) : super(key: key);

  @override
  State<DropMenuClass> createState() => _DropMenuClassState();
}
class _DropMenuClassState extends State<DropMenuClass> {
  static const menuItems = <String>[
    'One',
    'Two',
    'Three',
    'Four',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) =>
        DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
  ).toList();

  final List<PopupMenuItem<String>> _popUpMenuItems = menuItems
      .map(
        (String value) =>
        PopupMenuItem<String>(
          value: value,
          child: Text(value),
        ),
  ).toList();

  String _btn1SelectedVal = 'One';
  String? _btn2SelectedVal;
  late String _btn3SelectedVal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('DropDownButton with default:'),
            trailing: DropdownButton<String>(
              // Must be one of items.value.
              value: _btn1SelectedVal,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() => _btn1SelectedVal = newValue);
                }
              },
              items: _dropDownMenuItems,
            ),
          ),
          const SizedBox(height: 20,),
          ListTile(
            title: const Text('DropDownButton with hint:'),
            trailing: DropdownButton(
              value: _btn2SelectedVal,
              hint: const Text('Choose'),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() => _btn2SelectedVal = newValue);
                }
              },
              items: _dropDownMenuItems,
            ),
          ),
          const SizedBox(height: 20,),
          ListTile(
            title: const Text('Popup menu button:'),
            trailing: PopupMenuButton<String>(
              onSelected: (String newValue) {
                _btn3SelectedVal = newValue;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(_btn3SelectedVal),
                  ),
                );
              },
              itemBuilder: (BuildContext context) => _popUpMenuItems,
            ),
          ),
        ],
      ),
    );
  }
}
 <= End '''
};

class ImageFilteredClass extends StatefulWidget {
  const ImageFilteredClass({Key? key}) : super(key: key);

  @override
  State<ImageFilteredClass> createState() => _ImageFilteredClassState();
}

class _ImageFilteredClassState extends State<ImageFilteredClass> {
  double _sigmaX = 0, _sigmaY = 0;
  double _rotZ = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
            child: Image.asset('assets/images/basic.png'),
          ),
          const Divider(),
          ..._controlWidgets(),
          const Divider(),
          ImageFiltered(
            imageFilter: ImageFilter.matrix(Matrix4.rotationZ(_rotZ).storage),
            child: const Text(
              'Not only can images be "filtered", in fact any widget '
              'can be placed under ImageFiltered!',
            ),
          ),
        ],
      ),
    );
  }

  /// Widgets to control the parameters.
  List<Widget> _controlWidgets() {
    return [
      Row(
        children: [
          const Text('sigmaX:'),
          Expanded(
            child: Slider(
              max: 20,
              value: _sigmaX,
              onChanged: (val) {
                setState(() => _sigmaX = val);
              },
            ),
          ),
          Text(_sigmaX.toStringAsFixed(1)),
        ],
      ),
      Row(
        children: [
          const Text('sigmaY:'),
          Expanded(
            child: Slider(
              max: 20,
              value: _sigmaY,
              onChanged: (val) {
                setState(() => _sigmaY = val);
              },
            ),
          ),
          Text(_sigmaY.toStringAsFixed(1)),
        ],
      ),
      Row(
        children: [
          const Text('rotationZ:'),
          Expanded(
            child: Slider(
              min: -1.6,
              max: 1.6,
              value: _rotZ,
              onChanged: (val) {
                setState(() => _rotZ = val);
              },
            ),
          ),
          Text(_rotZ.toStringAsFixed(1)),
        ],
      )
    ];
  }
}

final imageFilteredClassCode = {
  ''' Start =>  import 'package:flutter/material.dart';  
  
void main() => runApp(MyApp());  
  
class ImageFilteredClass extends StatefulWidget {
  const ImageFilteredClass({Key? key}) : super(key: key);

  @override
  State<ImageFilteredClass> createState() => _ImageFilteredClassState();
}
class _ImageFilteredClassState extends State<ImageFilteredClass> {
  double _sigmaX = 0, _sigmaY = 0;
  double _rotZ = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
          child: Image.asset('assets/images/img.png'),
        ),
        const Divider(),
        ..._controlWidgets(),
        const Divider(),
        ImageFiltered(
          imageFilter: ImageFilter.matrix(Matrix4.rotationZ(_rotZ).storage),
          child: const Text(
            'Not only can images be "filtered", in fact any widget '
                'can be placed under ImageFiltered!',
          ),
        ),

      ],
    );
  }

  /// Widgets to control the parameters.
  List<Widget> _controlWidgets() {
    return [
      Row(
        children: [
          const Text('sigmaX:'),
          Expanded(
            child: Slider(
              max: 20,
              value: _sigmaX,
              onChanged: (val) {
                setState(() => _sigmaX = val);
              },
            ),
          ),
          Text(_sigmaX.toStringAsFixed(1)),
        ],
      ),
      Row(
        children: [
          const Text('sigmaY:'),
          Expanded(
            child: Slider(
              max: 20,
              value: _sigmaY,
              onChanged: (val) {
                setState(() => _sigmaY = val);
              },
            ),
          ),
          Text(_sigmaY.toStringAsFixed(1)),
        ],
      ),
      Row(
        children: [
          const Text('rotationZ:'),
          Expanded(
            child: Slider(
              min: -1.6,
              max: 1.6,
              value: _rotZ,
              onChanged: (val) {
                setState(() => _rotZ = val);
              },
            ),
          ),
          Text(_rotZ.toStringAsFixed(1)),
        ],
      )
    ];
  }
}
 <= End '''
};

class OtherStatefulClass extends StatefulWidget {
  const OtherStatefulClass({Key? key}) : super(key: key);

  @override
  State<OtherStatefulClass> createState() => _OtherStatefulClassState();
}

class _OtherStatefulClassState extends State<OtherStatefulClass> {
  bool _switchVal = true;
  bool _checkBoxVal = true;
  double _slider1Val = 0.5;
  double _slider2Val = 50.0;
  int _radioVal = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Switch'),
            Switch(
              onChanged: (bool value) {
                setState(() => _switchVal = value);
              },
              value: _switchVal,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Disabled Switch'),
            Switch(
              onChanged: null,
              value: false,
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Checkbox'),
            Checkbox(
              onChanged: (bool? value) {
                if (value != null) {
                  setState(() => _checkBoxVal = value);
                }
              },
              value: _checkBoxVal,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Disabled Checkbox'),
            Checkbox(
              tristate: true,
              onChanged: null,
              value: null,
            ),
          ],
        ),

        const Divider(),
        const Text('Slider'),
        Slider(
          onChanged: (double value) {
            setState(() => _slider1Val = value);
          },
          value: _slider1Val,
        ),
        const Text('Slider with Divisions and Label'),
        Slider(
          value: _slider2Val,
          max: 100.0,
          divisions: 5,
          label: '${_slider2Val.round()}',
          onChanged: (double value) {
            setState(() => _slider2Val = value);
          },
        ),
        const Divider(),
        const Text('LinearProgressIndicator'),
        const SizedBox(
          height: 5,
        ),
        // *When value=null, progress indicators become stateless.*
        const LinearProgressIndicator(),
        const SizedBox(
          height: 10,
        ),
        const Text('CircularProgressIndicator'),
        const Center(child: CircularProgressIndicator()),
        const SizedBox(
          height: 10,
        ),
        const Text('Radio'),
        Row(
          children: [0, 1, 2, 3]
              .map(
                (int index) => Radio<int>(
                  value: index,
                  groupValue: _radioVal,
                  onChanged: (int? value) {
                    if (value != null) {
                      setState(() => _radioVal = value);
                    }
                  },
                ),
              )
              .toList(),
        ),
        const Divider(),
      ],
    );
  }
}

final otherStatefulClassCode = {
  ''' Start =>  import 'package:flutter/material.dart';  
  
void main() => runApp(MyApp());  
  
class OtherStatefulClass extends StatefulWidget {
  const OtherStatefulClass({Key? key}) : super(key: key);

  @override
  State<OtherStatefulClass> createState() => _OtherStatefulClassState();
}
class _OtherStatefulClassState extends State<OtherStatefulClass> {
  bool _switchVal = true;
  bool _checkBoxVal = true;
  double _slider1Val = 0.5;
  double _slider2Val = 50.0;
  int _radioVal = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Switch'),
            Switch(
              onChanged: (bool value) {
                setState(() => _switchVal = value);
              },
              value: _switchVal,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Disabled Switch'),
            Switch(
              onChanged: null,
              value: false,
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            const Text('Checkbox'),
            Checkbox(
              onChanged: (bool? value) {
                if (value != null) {
                  setState(() => _checkBoxVal = value);
                }
              },
              value: _checkBoxVal,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  const [
            Text('Disabled Checkbox'),
            Checkbox(
              tristate: true,
              onChanged: null,
              value: null,
            ),
          ],
        ),

        const Divider(),
        const Text('Slider'),
        Slider(
          onChanged: (double value) {
            setState(() => _slider1Val = value);
          },
          value: _slider1Val,
        ),
        const Text('Slider with Divisions and Label'),
        Slider(
          value: _slider2Val,
          max: 100.0,
          divisions: 5,
  
          onChanged: (double value) {
            setState(() => _slider2Val = value);
          },
        ),
        const Divider(),
        const Text('LinearProgressIndicator'),
        const SizedBox(height: 5,),
        // *When value=null, progress indicators become stateless.*
        const LinearProgressIndicator(),
        const SizedBox(height: 10,),
        const Text('CircularProgressIndicator'),
        const Center(child: CircularProgressIndicator()),
        const SizedBox(height: 10,),
        const Text('Radio'),
        Row(
          children: [0, 1, 2, 3]
              .map(
                (int index) => Radio<int>(
              value: index,
              groupValue: _radioVal,
              onChanged: (int? value) {
                if (value != null) {
                  setState(() => _radioVal = value);
                }
              },
            ),
          )
              .toList(),
        ),
        const Divider(),
      ],
    );
  }
}
 <= End '''
};
