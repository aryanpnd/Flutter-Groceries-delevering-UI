import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../modals/cart.dart';
import '../modals/catalog.dart';
import '../utils/routes.dart';

class ProductDetailsPage extends StatefulWidget {
  final Item catalog;

  const ProductDetailsPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final _cart = CartModal();

  @override
  Widget build(BuildContext context) {
    bool isAdded = _cart.items.contains(widget.catalog) ?? false;
    return Scaffold(
      appBar: AppBar(),

      bottomNavigationBar: ButtonBar(
        buttonPadding: EdgeInsets.symmetric(horizontal: 15),
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          Hero(
            tag: Key(widget.catalog.price.toString()),
            child: SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton.icon(
                  onPressed: () {
                    if (!isAdded) {
                      isAdded = true;
                      final _catalog = CatalogModal();

                      _cart.catalog = _catalog;
                      _cart.add(widget.catalog);

                      setState(() {});
                      final snackBar = SnackBar(
                        content: Text('Your Item has been Added to the cart!'),
                        action: SnackBarAction(
                          label: 'Go to Cart',
                          onPressed: () {
                            Navigator.pushNamed(context, MyRoutes.cartRoute);
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // <-- Radius
                      )),
                  icon: isAdded ? Icon(Icons.done) : Icon(Icons.add),
                  label: isAdded ? Text("") : Text("Add to Cart")),
            ),
          ),
          SizedBox(
            height: 50,
            width: 150,
            child: ElevatedButton.icon(
                onPressed: () {},
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

      body: SafeArea(
        // bottom: false,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 350,
                child: Hero(
                    tag: Key(widget.catalog.title.toString()),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        widget.catalog.filename.toString(),
                        fit: BoxFit.cover,
                        //     frameBuilder:
                        //         (context, child, frame, wasSynchronouslyLoaded) {
                        //   return child;
                        // }, loadingBuilder: (context, child, loadingProgress) {
                        //   if (loadingProgress == null) {
                        //     return child;
                        //   } else {
                        //     return Center(
                        //       child: CircularProgressIndicator(),
                        //     );
                        //   }
                        // }
                      ),
                    )),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(0),
            child: SingleChildScrollView(
              child: Container(
                alignment: AlignmentDirectional.center,
                // height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    children: [
                      // Title Area ---------------------------------------------------
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                widget.catalog.title.toString(),
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //----------------------------------------------------------------

                      SizedBox(
                        height: 20,
                      ),

                      // Rating and Pricing Field ------------------------------------------------------
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Rating area -----------------------------------------------
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: SizedBox(
                                height: 40,
                                width: 90,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        )),
                                    Text(
                                      widget.catalog.rating.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // -------------------------------------------------------------

                            // Pricing Area ------------------------------------------------
                            Text(
                              " ₹${widget.catalog.price.toString()}",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green),
                            ),
                            //   ------------------------------------------------------------
                          ],
                        ),
                      ),
                      //  --------------------------------------------------------------------------------

                      // SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                            thickness: 1.2,
                            color: Theme.of(context).backgroundColor),
                      ),

                      //  Description Area ------------------------------------------------
                      Text(
                        widget.catalog.description.toString(),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      //  ------------------------------------------------------------------
                    ],
                  ),
                ),
                // color: Colors.green,
              ),
            ),
          ))
        ]),
      ),
      // bottomNavigationBar: Container(),
    );
  }
}
