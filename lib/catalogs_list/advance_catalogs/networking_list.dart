import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchingDataClass extends StatefulWidget {
  const FetchingDataClass({Key? key}) : super(key: key);

  @override
  State<FetchingDataClass> createState() => _FetchingDataClassState();
}

class _FetchingDataClassState extends State<FetchingDataClass> {
  List  users=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: users.length,
        itemBuilder: (context, index)
        {
          final user = users[index];
          final name = user['name']['first'];
          final email = user['email'];
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white70,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 3, spreadRadius: 1,
                    )
                  ]
              ),
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                  leading: CircleAvatar(child: Text('${index+1}')),
                  title: Text(name),
                  subtitle: Text(email)
              ),
            ),
          );
        },),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchUser();
        },
        child: const Icon(Icons.add),),
    );
  }

  void fetchUser() async{

    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response =await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });

  }
}

const fetchingDataCode = {
'''
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchingDataClass extends StatefulWidget {
  const FetchingDataClass({Key? key}) : super(key: key);

  @override
  State<FetchingDataClass> createState() => _FetchingDataClassState();
}

class _FetchingDataClassState extends State<FetchingDataClass> {
  List  users=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: users.length,
        itemBuilder: (context, index)
        {
          final user = users[index];
          final name = user['name']['first'];
          final email = user['email'];
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white70,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 3, spreadRadius: 1,
                    )
                  ]
              ),
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                  leading: CircleAvatar(child: Text('{index+1}')),
                  title: Text(name),
                  subtitle: Text(email)
              ),
            ),
          );
        },),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchUser();
        },
        child: const Icon(Icons.add),),
    );
  }

  void fetchUser() async{

    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response =await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });

  }
}

'''

};


class GoogleBooksClass extends StatefulWidget {
  const GoogleBooksClass({super.key});

  @override
  GoogleBooksClassState createState() =>
      GoogleBooksClassState();
}

class GoogleBooksClassState extends State<GoogleBooksClass> {
  late TextEditingController _queryController;
  List<_MyBook> _books = [];
  bool _pending = false;

  @override
  void initState() {
    super.initState();
    _queryController = TextEditingController()..text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _queryController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 4),
            ElevatedButton(
              onPressed:
              _pending ? null : () => _search(_queryController.text),
              child: const Text('Search'),
            ),
            if (_books.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _books.length,
                  itemBuilder: (ctx, i) => _bookToListTile(_books[i]),
                ),
              ),
          ],
        ),
      ),
    );
  }

  ListTile _bookToListTile(_MyBook book) {
    return ListTile(
      title: Text(book.title),
      subtitle: Text(book.authors),
      trailing: Hero(tag: book.id, child: book.thumbnail),
    );
  }

  Future<List<_MyBook>> _getBooksList(String query) async {
    // Uri is a less error-prone way to represent the URL
    final uri = Uri(
      scheme: 'https',
      host: 'www.googleapis.com',
      path: 'books/v1/volumes',
      queryParameters: {'q': query},
    );
    print('uri=$uri'); // https://www.googleapis.com/books/v1/volumes?q=$query
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return _MyBook.parseFromJsonStr(response.body);
    } else {
      throw response;
    }
  }

  Future<void> _search(String query) async {
    setState(() => _pending = true);
    try {
      _books = await _getBooksList(query);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Center(child: Text('Successfully found ${_books.length} books.'))),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Center(child: Text('No book Found'))),
      );
    }
    setState(() => _pending = false);
  }
}

// Data class to convert from the json response.
class _MyBook {
  final String id;
  final String title;
  final String authors;
  final String description;
  final String? thumbnailUrl;

  _MyBook(
      this.id, this.title, this.authors, this.description, this.thumbnailUrl);

  Widget get thumbnail => thumbnailUrl != null
      ? Image.network(thumbnailUrl!)
      : CircleAvatar(child: Text(title[0]));

  _MyBook.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] as String,
        title = jsonMap['volumeInfo']['title'] as String,
        authors = (jsonMap['volumeInfo']['authors'] as List).join(', '),
        description = jsonMap['volumeInfo']['description'] as String? ??
            '<missing description>',
        thumbnailUrl =
        jsonMap['volumeInfo']['imageLinks']['smallThumbnail'] as String?;

  static List<_MyBook> parseFromJsonStr(String jsonStr) {
    final json = jsonDecode(jsonStr);
    final jsonList = json['items'] as List<dynamic>;
    print('${jsonList.length} items in json');
    return [
      for (final jsonMap in jsonList)
        _MyBook.fromJson(jsonMap as Map<String, dynamic>)
    ];
  }
}

const googleBooksCode = {
  '''
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GoogleBooksClass extends StatefulWidget {
  const GoogleBooksClass({super.key});

  @override
  GoogleBooksClassState createState() =>
      GoogleBooksClassState();
}

class GoogleBooksClassState extends State<GoogleBooksClass> {
  late TextEditingController _queryController;
  List<_MyBook> _books = [];
  bool _pending = false;

  @override
  void initState() {
    super.initState();
    _queryController = TextEditingController()..text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _queryController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 4),
            ElevatedButton(
              onPressed:
              _pending ? null : () => _search(_queryController.text),
              child: const Text('Search'),
            ),
            if (_books.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _books.length,
                  itemBuilder: (ctx, i) => _bookToListTile(_books[i]),
                ),
              ),
          ],
        ),
      ),
    );
  }

  ListTile _bookToListTile(_MyBook book) {
    return ListTile(
      title: Text(book.title),
      subtitle: Text(book.authors),
      trailing: Hero(tag: book.id, child: book.thumbnail),
    );
  }

  Future<List<_MyBook>> _getBooksList(String query) async {
    // Uri is a less error-prone way to represent the URL
    final uri = Uri(
      scheme: 'https',
      host: 'www.googleapis.com',
      path: 'books/v1/volumes',
      queryParameters: {'q': query},
    );
    print('uri=uri'); // https://www.googleapis.com/books/v1/volumes?q=query
    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return _MyBook.parseFromJsonStr(response.body);
    } else {
      throw response;
    }
  }

  Future<void> _search(String query) async {
    setState(() => _pending = true);
    try {
      _books = await _getBooksList(query);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Center(child: Text('Successfully found {_books.length} books.'))),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Center(child: Text('No book Found'))),
      );
    }
    setState(() => _pending = false);
  }
}

// Data class to convert from the json response.
class _MyBook {
  final String id;
  final String title;
  final String authors;
  final String description;
  final String? thumbnailUrl;

  _MyBook(
      this.id, this.title, this.authors, this.description, this.thumbnailUrl);

  Widget get thumbnail => thumbnailUrl != null
      ? Image.network(thumbnailUrl!)
      : CircleAvatar(child: Text(title[0]));

  _MyBook.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'] as String,
        title = jsonMap['volumeInfo']['title'] as String,
        authors = (jsonMap['volumeInfo']['authors'] as List).join(', '),
        description = jsonMap['volumeInfo']['description'] as String? ??
            '<missing description>',
        thumbnailUrl =
        jsonMap['volumeInfo']['imageLinks']['smallThumbnail'] as String?;

  static List<_MyBook> parseFromJsonStr(String jsonStr) {
    final json = jsonDecode(jsonStr);
    final jsonList = json['items'] as List<dynamic>;
    print('{jsonList.length} items in json');
    return [
      for (final jsonMap in jsonList)
        _MyBook.fromJson(jsonMap as Map<String, dynamic>)
    ];
  }
}
'''

};