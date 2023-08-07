import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/googlecode.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';



class CodePreviewPage extends StatefulWidget {
  const CodePreviewPage({Key? key, required this.codeOfItem, required this.pageWidget, required this.title, required this.doc}) : super(key: key);
  final String title;
  final String codeOfItem;
  final Widget pageWidget;
  final String doc;

  @override
  State<CodePreviewPage> createState() => _CodePreviewPageState();
}

class _CodePreviewPageState extends State<CodePreviewPage> {

  Future<bool> launchUrl(
      Uri url, {
        LaunchMode mode = LaunchMode.platformDefault,
        WebViewConfiguration webViewConfiguration = const WebViewConfiguration(),
        String? webOnlyWindowName,
      }) async {
    if (mode == LaunchMode.inAppWebView &&
        !(url.scheme == 'https' || url.scheme == 'http')) {
      throw ArgumentError.value(url, 'url',
          'To use an in-app web view, you must provide an http(s) URL.');
    }
    return UrlLauncherPlatform.instance.launchUrl(
      url.toString(),
      LaunchOptions(
        webOnlyWindowName: webOnlyWindowName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: Text(widget.title,
              style: GoogleFonts.openSans(
                textStyle:
                const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.blue,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            indicator: BoxDecoration(
                border: Border.all(width: 1.5, color: Colors.white),
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue,
                      Colors.white,
                    ]),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 15,
                    color: Colors.blue.withOpacity(0.5),
                    offset: const Offset(0, 5),
                  )
                ]
            ),
            tabs: [
              Tab(
                child: Text("Preview", style: GoogleFonts.openSans(
            textStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
              ),),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.code,size: 25,
                    ),
                    const SizedBox(width: 20,),
                  Text("Code", style: GoogleFonts.openSans(
                    textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: TabBarView(children: [
            widget.pageWidget,
            Scaffold(
              backgroundColor: Colors.white,
              floatingActionButton: SpeedDial(
                elevation: 5,
                spacing: 8,
                spaceBetweenChildren: 5,
                overlayColor: Colors.blue,
                overlayOpacity: 0.2,
                children: [
                  SpeedDialChild(
                      child: const Icon(Icons.copy,color: Colors.blue,),
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Code copied"),
                            duration: Duration(milliseconds: 200),
                          ),
                        );
                        Clipboard.setData(ClipboardData(text:widget.codeOfItem));
                      }
                  ),
                  SpeedDialChild(
                      child: const Icon(Icons.share,color: Colors.blue,),
                      onTap: (){
                        Share.share(widget.codeOfItem);
                      }
                  ),
                  SpeedDialChild(
                      child: const Icon(Icons.article_outlined,color: Colors.blue,),
                      onTap: (){
                        launchUrl(Uri.parse(widget.doc));
                      },
                  ),

                ],child: const Icon(Icons.menu_rounded),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    child: HighlightView(
                      widget.codeOfItem,
                      language: 'dart',
                      theme: googlecodeTheme,
                      textStyle: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),

            ),
          ]),
        ),
      ),
    );
  }
}

