import 'package:flutter/material.dart';

class WidgetCard extends StatefulWidget {
  const WidgetCard({Key? key, required this.name, required this.isIndexEven}) : super(key: key);
  final String name;
  final bool isIndexEven;

  @override
  State<WidgetCard> createState() => _WidgetCardState();
}

class _WidgetCardState extends State<WidgetCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, left: 20, right: 20,top: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: widget.isIndexEven ? const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(25),) : const BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25),),
          boxShadow:  [
            BoxShadow(
              offset: const Offset(0,2),
              color: Colors.blue.withOpacity(0.20),
              blurRadius: 5, spreadRadius: 0,
            )
          ]
      ),
      padding: const EdgeInsets.fromLTRB(5,10,20,10),
      height: MediaQuery.of(context).size.height*0.08, width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(onPressed: (){},
                  icon: const Icon(Icons.bookmark_add_outlined, size: 25, color: Colors.blue,)),
              Text(widget.name,style: const TextStyle(fontSize: 14, color: Colors.black)),
            ],
          ),
          const Icon(Icons.arrow_forward_ios_rounded, size: 20, color: Colors.black,)
        ],
      ),
    );
  }
}