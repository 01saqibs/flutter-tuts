import 'package:flutter/material.dart';
import 'package:flutty_tut/lists/data_list.dart';
import 'package:flutty_tut/screens/code_preview_page.dart';
import 'package:flutty_tut/utils/widget_card.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetListPage extends StatelessWidget {
  const WidgetListPage({Key? key, required this.cardItems, required this.title}) : super(key: key);
  final List<ListOfItems> cardItems;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(title),
        titleTextStyle: GoogleFonts.openSans(
          textStyle: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: (ListView.builder(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: cardItems.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Get.to(CodePreviewPage(
                        title: cardItems[index].name,
                        pageWidget: cardItems[index].preview,
                        codeOfItem: cardItems[index].code,
                        doc: cardItems[index].doc,
                      ));
                    },
                    child: WidgetCard(
                      name: cardItems[index].name,
                      isIndexEven: index % 2 == 0 ? true : false,
                    ),
                  )))),
    );
  }
}
