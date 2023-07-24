import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomCard extends StatelessWidget {
  const CustomCard({
  super.key, required this.index, required this.name, required this.image, required this.kNum,
  });
  final bool index;
  final String name;
  final SvgPicture image;
  final int kNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index ? const EdgeInsets.only(left: 20) : const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        image: const DecorationImage(
          alignment: Alignment.bottomCenter,
          opacity: 0.3,
          image: AssetImage(
            "assets/images/basic.png",
          ),
        ),
        gradient: RadialGradient(
            radius: 0.7,
            colors: [
              Colors.blue.withOpacity(0.0),
              Colors.blue,
            ]),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0,
            blurRadius: 15,
            color: Colors.blue.withOpacity(0.4),
            offset: index ? const Offset(-3, 15) : const Offset(3, 15),
          ),],
        borderRadius: index ? const BorderRadius.horizontal(left: Radius.circular(20)) : const BorderRadius.horizontal(right: Radius.circular(20)),
      ),
      child: ClipRRect(
        borderRadius: index ? const BorderRadius.horizontal(left: Radius.circular(20)) : const BorderRadius.horizontal(right: Radius.circular(20)),
        child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0, right: 0, left: 0,
                child: Container(
                  height: 40,
                  color: Colors.blue,
                  child: Center(child: Text(name,style: GoogleFonts.openSans(
                      color: Colors.white, textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 18
                  )
                  ))),
                ),
              ),
              Center(
                child: SizedBox(
                    height: 80, width: 80,
                    child: image),
              ),
              Positioned(
                  bottom: 5, right: 10,
                  child: Text(kNum.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)),
            ]
        ),
      ),
    );
  }
}