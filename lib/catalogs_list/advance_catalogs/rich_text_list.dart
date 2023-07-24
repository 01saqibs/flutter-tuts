import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/theme_map.dart';

class SelectableClass extends StatelessWidget {
  const SelectableClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(height: 40,),
            Text("Below are are selectable text"),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: SelectableText("Hey, I am selectable you can copy me",style: TextStyle(fontSize: 24),textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}

const selectableCode = {
  '''
class SelectableClass extends StatelessWidget {
  const SelectableClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(height: 40,),
            Text("Below are are selectable text"),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: SelectableText("Hey, I am selectable you can copy me",style: TextStyle(fontSize: 24),textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}
  
  '''
};

class HighlightCodeClass extends StatefulWidget {
  const HighlightCodeClass({super.key});

  @override
  State<HighlightCodeClass> createState() => _HighlightCodeClassState();
}

const kLangToCodeSample = <String, String>{
  'dart': '''
main() {
  print("Hey How are you!");
}''',
  'button': '''
ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
              CodeHighlightExample()));
            },
                child: const Text("HighLight Views")),
}''',
  'SQL': "SELECT Country FROM Customers WHERE Country <> 'USA'",
};

class _HighlightCodeClassState extends State<HighlightCodeClass> {
  String _themeName = 'github';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          for (final entry in kLangToCodeSample.entries)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'language=${entry.key}',
                  // strutStyle: Theme.of(context).textTheme.headline2,
                ),
                HighlightView(
                  entry.value,
                  language: entry.key,
                  //! The themeMap contains all built-in themes in the package.
                  //`import 'package:flutter_highlight/theme_map.dart'`
                  theme: themeMap[_themeName] ?? {},
                ),
                const Divider(),
              ],
            ),
        ],
      ),
      bottomNavigationBar: _buildThemeSelUI(),
    );
  }

  Widget _buildThemeSelUI() {
    return Card(
      elevation: 3,
      color: Colors.white54,
      child: ListTile(
        title: const Text('Select your favorite theme:'),
        trailing: DropdownButton<String>(
          value: _themeName,
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() => _themeName = newValue);
            }
          },
          items: [
            for (final name in themeMap.keys)
              DropdownMenuItem<String>(value: name, child: Text(name))
          ],
        ),
      ),
    );
  }
}

const highlightCode = {
  '''
class HighlightCodeClass extends StatefulWidget {
  const HighlightCodeClass({super.key});

  @override
  State<HighlightCodeClass> createState() => _HighlightCodeClassState();
}

const kLangToCodeSample = <String, String>{
  'dart':
main() {
print("Hey How are you!");
}
  'button': 
ElevatedButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>
CodeHighlightExample()));
},
child: const Text("HighLight Views")),
},
  'SQL': "SELECT Country FROM Customers WHERE Country <> 'USA'",
};

class _HighlightCodeClassState extends State<HighlightCodeClass> {
  String _themeName = 'github';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          for (final entry in kLangToCodeSample.entries)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'language={entry.key}',
                  // strutStyle: Theme.of(context).textTheme.headline2,
                ),
                HighlightView(
                  entry.value,
                  language: entry.key,
                  //! The themeMap contains all built-in themes in the package.
                  //`import 'package:flutter_highlight/theme_map.dart'`
                  theme: themeMap[_themeName] ?? {},
                ),
                const Divider(),
              ],
            ),
        ],
      ),
      bottomNavigationBar: _buildThemeSelUI(),
    );
  }

  Widget _buildThemeSelUI() {
    return Card(
      elevation: 3,
      color: Colors.white54,
      child: ListTile(
        title: const Text('Select your favorite theme:'),
        trailing: DropdownButton<String>(
          value: _themeName,
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() => _themeName = newValue);
            }
          },
          items: [
            for (final name in themeMap.keys)
              DropdownMenuItem<String>(value: name, child: Text(name))
          ],
        ),
      ),
    );
  }
}

  '''
};