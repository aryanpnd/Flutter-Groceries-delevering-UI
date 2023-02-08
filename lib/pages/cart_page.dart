import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_second_app/pages/product_details.dart';

import '../modals/cart.dart';
import '../modals/catalog.dart';
import '../widgets/cartpage_widgets.dart';

class CartPage extends StatefulWidget {
  // final Item catalog;

  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _cart = CartModal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart_outlined,
                    color: Theme
                        .of(context)
                        .primaryColor, size: 25),
                Text(
                  "My Cart",
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline6,
                )
              ]),
        ),

        bottomNavigationBar: Container(
          color: Colors.blue.shade900,
          child: ButtonBar(
            buttonPadding: EdgeInsets.symmetric(horizontal: 8),
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: 50,
                  width: 150,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: RichText(
                        text: TextSpan(
                            text: 'Total : ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                            children: [
                              TextSpan(
                                  text: '₹${_cart.totalPrice.toStringAsFixed(
                                      2)} ',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headline4)
                            ]),
                      ),
                    ),
                  )),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton.icon(
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: const Text('Your Order has been placed!'),
                        action: SnackBarAction(
                          label: 'Okay',
                          onPressed: () {},
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // <-- Radius
                      ),
                    ),
                    icon: Icon(Icons.shopping_cart),
                    label: Text("Buy Now")),
              )
            ],
          ),
        ),

        body: SafeArea(
        child: Container(
        decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
    ),
    padding: EdgeInsets.all(15),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [CartCatalogHeader(), Expanded(child: AllCartProducts())],
    ),
    )
    ,

    )
    ,


    // bottomNavigationBar: SafeArea(child: Container(
    //   height: 80,
    //   color: Theme.of(context).cardColor,
    //   child: Row(
    //     children: [SizedBox(
    //       child: Text("RS999"),
    //     )
    //     ],
    //   ),
    // ),
    );
  }
}
