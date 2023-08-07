import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutty_tut/lists/data_list.dart';
import 'package:flutty_tut/screens/widget_list_page.dart';
import 'package:flutty_tut/utils/gridview_card.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key, required this.name, required this.list}) : super(key: key);
  final String name;
  final List<CatalogData> list;

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          centerTitle: true,
          title: Text(widget.name,
              style: GoogleFonts.openSans(
                textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: widget.list.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            crossAxisSpacing: 12,
            mainAxisSpacing: 30,
          ),
          itemBuilder: (context, index) => InkWell(
            splashColor: Colors.blue,
            onTap: () {
              Get.to(WidgetListPage(
                title: widget.list[index].name,
                cardItems: widget.list[index].subListOfCat,
              ));
            },
            child: CustomCard(
                kNum: widget.list[index].subListOfCat.length,
                index: index % 2 == 0 ? true : false,
                name: widget.list[index].name,
                image: SvgPicture.asset(
                  widget.list[index].svg,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                )),
          ),
        ),
      ),
    );
  }
}
