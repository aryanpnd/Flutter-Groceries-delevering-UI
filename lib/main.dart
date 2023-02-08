import 'package:flutter/material.dart';
import 'package:my_second_app/modals/catalog.dart';
import 'package:my_second_app/pages/cart_page.dart';
import 'package:my_second_app/pages/home_page.dart';
import 'package:my_second_app/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_second_app/pages/product_details.dart';
import 'package:my_second_app/pages/test_page.dart';
import 'package:my_second_app/utils/routes.dart';
import 'package:my_second_app/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var themeMode = 'light';




  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      themeMode: ThemeMode.system,
      theme:MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,


      initialRoute: '/',
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),

        // MyRoutes.productDetails: (context) => ProductDetailsPage(catalog: CatalogModal.items,),
        // MyRoutes.testRoute:(context)=>TestPage(),
      },
    );
  }
}

