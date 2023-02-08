import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_second_app/modals/cart.dart';
import 'package:my_second_app/utils/routes.dart';

import '../modals/catalog.dart';

class CartCatalogHeader extends StatelessWidget {
  const CartCatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Cart Items : ", style: Theme.of(context).textTheme.headline6)
        ],
      ),
    );
  }
}

class AllCartProducts extends StatefulWidget {
  AllCartProducts({Key? key}) : super(key: key);

  @override
  State<AllCartProducts> createState() => _AllCartProductsState();
}

class _AllCartProductsState extends State<AllCartProducts> {
  final _cart = CartModal();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: _cart.items.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Your Cart is Empty",
                        style: Theme.of(context).textTheme.headline5),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.deepPurple.shade300,
                          ),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      icon: Icon(Icons.arrow_back),
                      label: Text("Add Some Items"),
                    )
                  ],
                ),
              )
            : RefreshIndicator(
          onRefresh: () {
            return Future(() { setState(() {}); });
          },
                child: SizedBox(
                  height: 700,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final catalog = CatalogModal.items![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CartItem(
                          index: index,
                          catalog: catalog,
                        ),
                      );
                    },
                    itemCount: _cart.items.length,
                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisSpacing: 2, mainAxisSpacing: 5, crossAxisCount: 2),
                  ),
                ),
              ),
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  final Item catalog;
  late final dynamic index;

  CartItem({super.key, required this.catalog, required this.index})
      : assert(catalog != null, index != null);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final _cart = CartModal();
  var Itemindex;

  @override
  void initState() {
    super.initState();
    Itemindex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    bool isAdded = _cart.items.contains(widget.catalog) ?? false;
    return Container(
      // color: Colors.blue,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Container(
        height: 100,
        width: 150,
        // color: Colors.white,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).cardColor),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),

        child: Row(
          children: [
            Container(
              height: 90,
              width: 90,
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).canvasColor),
              child: CartProductImage(
                productImageUrl: widget.catalog.filename,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.catalog.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  ButtonBar(
                    buttonPadding: EdgeInsets.symmetric(horizontal: 5),
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "₹${widget.catalog.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                _cart.remove(_cart.items[Itemindex]);
                // print(Itemindex);
                setState(() {});
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.red.shade300,
                  ),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              icon: Icon(Icons.delete_forever_rounded),
              label: Text("Remove"),
            )
          ],
        ),
      ),
    );
  }
}

class CartProductImage extends StatelessWidget {
  final String productImageUrl;

  const CartProductImage({Key? key, required this.productImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      productImageUrl,
      width: 110,
      height: 100,
      fit: BoxFit.cover,
    );
  }
}
