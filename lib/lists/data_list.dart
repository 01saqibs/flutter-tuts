import 'package:flutter/material.dart';
import 'package:flutty_tut/catalogs_list/advance_catalogs/multimedia_list.dart';
import 'package:flutty_tut/catalogs_list/advance_catalogs/plugins_list.dart';
import 'package:flutty_tut/catalogs_list/basic_catalogs/animation_catalogs.dart';
import 'package:flutty_tut/catalogs_list/basic_catalogs/appbar_catalogs.dart';
import 'package:flutty_tut/catalogs_list/basic_catalogs/async_catalogs.dart';
import 'package:flutty_tut/catalogs_list/basic_catalogs/layouts_catalogs.dart';
import 'package:flutty_tut/catalogs_list/basic_catalogs/navigation_catalogs.dart';
import 'package:flutty_tut/catalogs_list/basic_catalogs/widgets_catalogs.dart';

import '../catalogs_list/advance_catalogs/ad_animation_class.dart';
import '../catalogs_list/advance_catalogs/networking_list.dart';
import '../catalogs_list/advance_catalogs/persistence_list.dart';
import '../catalogs_list/advance_catalogs/rich_text_list.dart';
import '../catalogs_list/basic_catalogs/lists_catalogs.dart';

class MainTut {
  final String image;
  final String name;
  List<CatalogData> subList = [];
  MainTut({required this.image, required this.name, required this.subList});
}

List<MainTut> mainList = [
  MainTut(image: "assets/images/basic.png", name: "Basics", subList: basics),
  MainTut(image: "assets/images/advance.png", name: "Advance", subList: advance),
];

class CatalogData {
  final String name;
  final String svg;
  List<ListOfItems> subListOfCat = [];
  CatalogData({required this.name, required this.subListOfCat, required this.svg, });
}

List<CatalogData> basics = [
  CatalogData(name: "Widgets", svg: "assets/svgs/widget.svg",subListOfCat: widgetsList),
  CatalogData(name: "Layouts", svg: "assets/svgs/layout.svg",subListOfCat: layoutList),
  CatalogData(name: "Lists", svg: "assets/svgs/lists.svg",subListOfCat: listList),
  CatalogData(name: "AppBar", svg: "assets/svgs/appbar.svg",subListOfCat: appBarList),
  CatalogData(name: "Navigation", svg: "assets/svgs/navigation.svg",subListOfCat: navigationList),
  CatalogData(name: "Async", svg: "assets/svgs/future.svg",subListOfCat: asyncList),
  CatalogData(name: "Animation", svg: "assets/svgs/animated.svg",subListOfCat: animationListBasic),
];

List<CatalogData> advance = [
  CatalogData(name: "Animation", svg: "assets/svgs/animated.svg", subListOfCat: advAnimationList),
  CatalogData(name: "Multimedia", svg: "assets/svgs/multimedia.svg",subListOfCat: multimediaList),
  CatalogData(name: "Plugins", svg: "assets/svgs/future.svg",subListOfCat: pluginsList),
  CatalogData(name: "Networking", svg: "assets/svgs/networking.svg",subListOfCat: networkingList),
];

class ListOfItems {
  final Widget preview;
  final String name;
  final String code;
  bool isBookmark = false;
  String doc;
  ListOfItems({required this.preview, required this.name, required this.code, this.doc = ""});
}

final List<ListOfItems> widgetsList = [

  ListOfItems(preview: const IconClass(), name: "Icon", code: iconCode.toString(), doc: "https://api.flutter.dev/flutter/material/Icons-class.html"),
  ListOfItems(preview: const TextClass() , name: "Text", code: textClassCode.toString(), doc: "https://api.flutter.dev/flutter/widgets/Text-class.html"),
  ListOfItems(preview: const TypographyClass(), name: "Typography", code: typographyCode.toString(),doc: "https://api.flutter.dev/flutter/material/Typography-class.html"),
  ListOfItems(name: "TextField", preview: const TextFieldClass(), code: textFieldClassCode.toString(), ),
  ListOfItems(name: "TextFormField", preview: const TextFormFieldExample(), code: textFormFieldClassCode.toString(), ),
  ListOfItems(name: "Image", preview: const ImageClass(), code: imageClassCode.toString(), ),
  ListOfItems(name: "Card, Inkwell", preview: const CardInkwellClass(), code: cardInkWellCassCode.toString(), ),
  ListOfItems(name: "Gradient", preview: const GradientClass(), code: gradientClassCode.toString(), ),

  ListOfItems(name: "DropDownButton, MenuButton", preview: const DropMenuClass(), code: dropDownClassCode.toString(), ),
  ListOfItems(name: "ImageFiltered", preview: const ImageFilteredClass(), code: imageFilteredClassCode.toString(), ),
  ListOfItems(name: "Other Stateful Widgets", preview: const OtherStatefulClass(), code: otherStatefulClassCode.toString(),),

];

final List<ListOfItems> layoutList = [

  ListOfItems(preview: const ContainerClass(), name: "Container", code: containerClassCode.toString(),),
  ListOfItems(preview: const RowColumnClass(), name: "Row & Column", code: rowColumnClassCode.toString(), ),
  ListOfItems(preview: const WrapClass(), name: "Wrap", code: wrapClassCode.toString(),),
  ListOfItems(name: "Fractionally SizedBox", preview: const FractionallySizedBoxClass(), code: fractionalClassCode.toString(),),
  ListOfItems(name: "Expanded", preview: const ExpandedClass(), code: expandedClassCode.toString(), ),
  ListOfItems(name: "SizedBox", preview: const SizedBoxClass(), code: sizedBoxClassCode.toString(),),
  ListOfItems(name: "Stack", preview: const StackClass(), code: stackClassCode.toString(),),
];

final List<ListOfItems> listList = [

  ListOfItems(name: "ListTile", preview: const ListTileClass(), code: listTileClassCode.toString()),
  ListOfItems(name: "ListView.builder", preview: const ListViewBuilderClass(), code: listViewBuilderClassCode.toString(),),
  ListOfItems(name: "GridList", preview: const GridListClass(), code: gridListClassCode.toString(),),
  ListOfItems(name: "ExpansionTile", preview: const ExpansionTileClass(), code: expansionTileClassCode.toString(),),
  ListOfItems(name: "Swipe to Dismiss", preview: const SwipeToDismissClass(), code: swipeToDismissClassCode.toString(), ),
  ListOfItems(name: "List Wheel Scroll View", preview: const ListWheelClass(), code: listWheelClassCode.toString(), ),
];


final List<ListOfItems> appBarList = [
  ListOfItems(name: "Basic AppBar", preview: const BasicAppBarClass(), code: basicAppBarClassCode.toString(), ),
  ListOfItems(name: "Bottom Bar", preview: const BottomBarClass(), code: bottomBarClassCode.toString(), ),
  ListOfItems(name: "Sliver AppBar", preview: const SliverAppbarClass(), code: sliverAppBarClassCode.toString(),),
  ListOfItems(name: "BackDrop", preview: const BackDropClass(), code: backDropClassCode.toString(), ),

];


final List<ListOfItems> navigationList = [
  ListOfItems(name: "Tabs", preview: const TabsClass(), code: tabsClassCode.toString(), ),
  ListOfItems(name: "Routes", preview: const RouteClass(), code: routeClassCode.toString(), ),
  ListOfItems(name: "Navigation Drawer", preview: const NavigationDrawerClass(), code: navigationClassCode.toString(), ),
  ListOfItems(name: "Page Selector", preview: const PageSelectorClass(), code: pageSelectorClassCode.toString(), ),
];

final List<ListOfItems> asyncList = [
  ListOfItems(name: "Future Builder", preview: const FutureBuilderClass(), code: futureBuilderClassCode.toString(), ),
  ListOfItems(name: "Stream Builder", preview: const StreamBuilderClass(), code: streamBuilderClassCode.toString(),),
];

final List<ListOfItems> animationListBasic = [
  ListOfItems(name: "Hero Animation", preview: const HeroClass(), code: heroClassCode.toString(), ),
  ListOfItems(name: "Opacity", preview: const OpacityClass(), code: opacityClassCode.toString(),),
  ListOfItems(name: "Animated Icon", preview: const AnimatedIconClass(), code: animatedIconClassCode.toString(), ),
  ListOfItems(name: "Animated Container", preview: const AnimatedContainerClass(), code: animatedContainerClassCode.toString(), ),
];

List<ListOfItems> advAnimationList = [
  ListOfItems(preview: const LowLevelAnimation(), name: "Low Level Animation", code: lowLevelAnimationCode.toString(),),
  ListOfItems(preview: const AnimatedWidgetClass(), name: "Animated Widget", code: animatedWidgetCode.toString(), ),

];

List<ListOfItems> multimediaList = [
  ListOfItems(preview: const ImagePickerClass(), name: "Image Picker", code: imagePickerClassCode.toString(), ),
  ListOfItems(preview: const VideoPlayerClass(), name: "Video Player", code: videoPlayerClassCode.toString(),),
];

List<ListOfItems> persistenceList = [
  ListOfItems(preview: const SharedPrefClass(), name: "Shared Preference", code: sharedPreferenceClassCode.toString(),),
  ListOfItems(preview: LocalFileReadWriteClass(storage: CounterStorage(),), name: "Local File Read/Write", code: localClassCode.toString(),),
  ListOfItems(preview: const SqfLiteClass(), name: "SQFLite", code: sqfClassCode.toString(), ),
  ListOfItems(preview: const HiveClass(), name: "HIVE database", code: hiveClassCode.toString(),),
];

List<ListOfItems> pluginsList = [
  ListOfItems(preview: const ShimmerClass(), name: "Shimmer Effect", code: sharedPreferenceClassCode.toString(), ),
  ListOfItems(preview: const SharePlusExample(), name: "Share Text", code: imagePickerClassCode.toString(),),
];

List<ListOfItems> richTextList = [
  ListOfItems(preview: const SelectableClass(), name: "Selectable Text", code: selectableCode.toString(),),
  ListOfItems(preview: const HighlightCodeClass(), name: "Highlight Code", code: highlightCode.toString(),),
];

List<ListOfItems> networkingList = [
  ListOfItems(preview: const FetchingDataClass(), name: "Fetching Data (API)", code: fetchingDataCode.toString(),),
  ListOfItems(preview: const GoogleBooksClass(), name: "Google Books", code: googleBooksCode.toString(),),
];

