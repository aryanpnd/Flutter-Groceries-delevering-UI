import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:my_second_app/modals/catalog.dart';
import 'package:my_second_app/pages/product_details.dart';
import 'package:my_second_app/utils/routes.dart';
import 'package:my_second_app/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../modals/catalog.dart';
import '../modals/catalog.dart';
import '../widgets/homepage_widgets.dart';
import '../widgets/item_widget.dart';
import '../widgets/themes.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final foodJson = await rootBundle.loadString("assets/files/foods2.json");
    final decodedData = jsonDecode(foodJson);
    var productsData = decodedData["products"];
    CatalogModal.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
    // print(CatalogModal.items);
  }

  bool fabBehaviour = false;

  // Timer(Duration(seconds: 3), () {
  // print("Yeah, this line is printed after 3 seconds");
  // });

  @override
  Widget build(BuildContext context) {
    var name = "Aryan";

    // final dummyList = List.generate(15, (index) => CatalogModal.items[0]);

    final avtarUrl = 'https://instagram.fixc2-1.fna.fbcdn.net/v/t51.2885-19/306455184_1155835988619488_5429635101423431051_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fixc2-1.fna.fbcdn.net&_nc_cat=108&_nc_ohc=W9lmlfOVCZwAX8gDGFC&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfAQWY9UGX57iXjlwFRi5qY0X2Pwm-7dzcG-5gpzB8dr0w&oe=63CF5C81&_nc_sid=8fd12b';

    return Scaffold(
      // backgroundColor: Theme.of(context).cardColor,
        // drawer: MyDrawer(),

        floatingActionButton: Material(
            color: Colors.transparent,
            child: fabBehaviour
                ? Material(
              color: Colors.transparent,
                    child: FloatingActionButton.extended(
                      elevation: 20,
                      onPressed: () {
                        setState(() {
                          fabBehaviour = false;
                          Navigator.pushNamed(context, MyRoutes.cartRoute);
                        });
                      },
                      // splashColor: Colors.green,
                      icon: Icon(Icons.arrow_circle_right_outlined),
                      label: Text("Go to the cart"),
                    ),
                  )
                : Material(
              color: Colors.transparent,
                    child: FloatingActionButton(
                        elevation: 10,
                        onPressed: () {
                          setState(() {
                            fabBehaviour = true;
                          });
                        },
                        child: Icon(Icons.shopping_cart_outlined)),
                  )),

        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
                height: 55,
              ),
              Container(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Healthy GO",
                    style: Theme.of(context).textTheme.headline4,
                  )),

              MyDrawer()
            ],
          ),
          // actions: <Widget>[
        ),

        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                ),
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModal.items != null &&
                    CatalogModal.items!.isNotEmpty)
                  Expanded(child: AllProducts())
                else
                  Expanded(
                    child: Container(
                      child: Center(
                        child: CircularProgressIndicator(
                            color: Colors.deepPurple, strokeWidth: 6),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ));
  }
}
