
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';



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
      'headline 1' : textTheme.displayLarge!,
      'headline 2' : textTheme.displayMedium!,
      'headline 3' : textTheme.displaySmall!,
      'headline 4' : textTheme.headlineMedium!,
      'headline 5' : textTheme.headlineSmall!,
      'headline 6' : textTheme.titleLarge!,
    };

    return ListView(
      children: [
        for(final i in styles.entries)
          ListTile(title: Text(i.key, style: i.value,),),
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
                Text("Images from Assets", style: TextStyle(fontSize: 18,),),
              ],
            ),
            const SizedBox(height: 20,),
            const Divider(),
            const ListTile(title: Text('Cached network image:')),
            CachedNetworkImage(
              imageUrl: 'https://images.pexels.com/photos/3201768/pexels-photo-3201768.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
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
                              .displaySmall!
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
          label: '${_slider2Val.round()}',
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


