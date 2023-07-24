import 'package:flutter/material.dart';
import 'package:flutty_tut/latest_designs/latest_designs.dart';
import 'package:flutty_tut/lists/data_list.dart';
import 'package:flutty_tut/pages/catalog_page.dart';
import 'package:flutty_tut/pages/flutter_ui_page.dart';
import 'package:flutty_tut/utils/tut_card.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.blue.withOpacity(0.5),
      drawer: const Padding(
        padding: EdgeInsets.only(bottom: 200, top: 40, left: 20),
        child: Drawer(
          backgroundColor: Colors.white,
          width: 180,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(5),
                topLeft: Radius.circular(50),
                topRight: Radius.circular(5)),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 3,
                            blurRadius: 25,
                            color: Colors.blue.withOpacity(0.5),
                            offset: const Offset(0, 4),
                          )
                        ]),
                    child: Builder(builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                          size: 22,
                        ),
                      );
                    }),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Text(
                    'Flutty Tut',
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    onPageChanged: (index) {
                      setState(() {
                        selectIndex = index;
                      });
                    },
                    itemCount: latestDesign.length,
                    itemBuilder: (context, index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: selectIndex == index
                          ? const EdgeInsets.symmetric(
                              vertical: 45, horizontal: 20
                            )
                          : const EdgeInsets.only(
                              top: 70, bottom: 45,
                            ),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 2),
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(
                                latestDesign[index].image,
                              ),
                              fit: BoxFit.cover),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 5,
                              blurRadius: 25,
                              color: Colors.blue.withOpacity(0.5),
                              offset: const Offset(0, 10),
                            )
                          ]),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  top: -5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Flutter UI",
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          )),
                      TextButton(
                        onPressed: (){
                          Get.to(const FlutterUIPage());
                        },
                        child: Text("View All",
                            style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            )),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                        latestDesign.length,
                        (index) => Indicator(
                            isActive: selectIndex == index ? true : false),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Tutorials",
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  )),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: mainList.length,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemBuilder: (context, index) => TutContainer(
                    title: mainList[index].name,
                    image: mainList[index].image,
                    press: () {
                      Get.to(CatalogPage(
                        name: mainList[index].name,
                        list: mainList[index].subList,
                      ));
                    },
                    kCatalogs: mainList[index].subList.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: AnimatedContainer(
        width: isActive ? 22 : 8,
        height: 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isActive ? Colors.blue : Colors.blue.withOpacity(0.3),
        ),
        duration: const Duration(milliseconds: 200),
      ),
    );
  }
}
