// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:convert';
// import 'package:my_second_app/modals/catalog.dart';
// import 'package:my_second_app/widgets/drawer.dart';
//
// import '../modals/catalog.dart';
// import '../modals/catalog.dart';
// import '../widgets/item_widget.dart';
//
// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }
//
//   loadData() async {
//     // await Future.delayed(Duration(seconds: 2));
//     final foodJson = await rootBundle.loadString("assets/files/foods2.json");
//     final decodedData = jsonDecode(foodJson);
//     var productsData = decodedData["products"];
//     CatalogModal.items = List.from(productsData)
//         .map<Item>((item) => Item.fromMap(item))
//         .toList();
//     setState(() {});
//     // print(CatalogModal.items);
//   }
//
//   bool sortView = true;
//
//   changeView(BuildContext context) async {
//     if (sortView == false) {
//       setState(() {
//         sortView = true;
//       });
//     } else {
//       setState(() {
//         sortView = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var name = "Aryan";
//     // final dummyList = List.generate(15, (index) => CatalogModal.items[0]);
//
//     return Scaffold(
//         drawer: MyDrawer(),
//         appBar: AppBar(
//           title: Center(child: Text("Catalog App")),
//           actions: <Widget>[
//             InkWell(
//                 onTap: () => changeView(context),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Center(child: Icon(Icons.change_circle)),
//                 ))
//           ],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: (CatalogModal.items != null && CatalogModal.items!.isNotEmpty)
//               ? (sortView
//               ? AnimatedSwitcher(
//             transitionBuilder: (child, animation) =>
//                 ScaleTransition(scale: animation, child: child),
//             duration: const Duration(milliseconds: 300),
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisSpacing: 2,
//                   mainAxisSpacing: 5,
//                   crossAxisCount: 2),
//               itemBuilder: (context, index) {
//                 final item = CatalogModal.items![index];
//
//                 return Card(
// // elevation: 0,
//                     clipBehavior: Clip.antiAlias,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20)),
//                     child: GridTile(
//                         header: Container(
//                           color: Colors.green.shade300,
//                           child: Text(item.title),
//                           padding: EdgeInsets.all(12),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10),
//                           child: Image.network(item.filename),
//                         ),
//                         footer: Text(
//                           "₹${item.price.toString()} ",
//                           textScaleFactor: 1.5,
//                           style: TextStyle(
//                             color: Colors.green,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         )));
//               },
//               itemCount: CatalogModal.items?.length,
//             ),
//           )
//               : AnimatedSwitcher(
//             transitionBuilder: (child, animation) =>
//                 ScaleTransition(scale: animation, child: child),
//             duration: const Duration(milliseconds: 200),
//             child: ListView.builder(
//               itemCount: CatalogModal.items?.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ItemWidget(
//                   item: CatalogModal.items![index],
//                 );
//               },
//             ),
//           ))
//               : Center(
//             child: CircularProgressIndicator(
//               strokeWidth: 7,
//             ),
//           ),
//         ));
//   }
// }
