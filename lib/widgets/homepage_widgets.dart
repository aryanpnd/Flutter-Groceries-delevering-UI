import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_second_app/modals/cart.dart';
import 'package:my_second_app/pages/product_details.dart';

import '../modals/catalog.dart';
import '../utils/routes.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("All Products : ",
               style: Theme.of(context).textTheme.headline6

          )],
      ),

    );

  }
}

class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final catalog = CatalogModal.items![index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(catalog: catalog)));
                },
                child: CatalogItem(
                  catalog: catalog,
                ),
              ),
            );
          },
          itemCount: CatalogModal.items?.length,
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisSpacing: 2, mainAxisSpacing: 5, crossAxisCount: 2),
        ),
      ),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: Container(
        height: 150,
        width: 150,
        // color: Colors.white,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),color: Theme.of(context).cardColor),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),

        child: Row(
          children: [
            Hero(
              tag: Key(catalog.title.toString()),
              child: Container(
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).canvasColor),
                child: ProductImage(
                  productImageUrl: catalog.filename,
                ),
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
                      catalog.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(catalog.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle2),
                  ),
                  ButtonBar(
                    buttonPadding: EdgeInsets.symmetric(horizontal: 5),
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "₹${catalog.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 17),
                        ),
                      ),
                      Hero(
                        tag: Key(catalog.price.toString()),
                        child: _AddToCart( catalog: catalog),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;
  const _AddToCart({
    Key? key, required this.catalog,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  final _cart = CartModal();
  @override
  Widget build(BuildContext context) {
    bool isAdded = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton.icon(
        onPressed: () {
          if(!isAdded){
          isAdded = true;
          final _catalog = CatalogModal();

          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {});

          // final snackBar = SnackBar(
          //   content: const Text('Your Item has been Added to the cart'),
          //   duration: Duration(seconds: 4),
          //   action: SnackBarAction(
          //     label: 'Go to Cart',
          //     onPressed: () {Navigator.pushNamed(context, MyRoutes.cartRoute);},
          //   ),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.green.shade300,
            ),
            shape:
                MaterialStateProperty.all(StadiumBorder())),
        icon: isAdded? Icon(Icons.done,):Icon(Icons.add_shopping_cart_sharp),
        label: isAdded?Text(""):Text("Cart"));
  }
}

class ProductImage extends StatelessWidget {
  final String productImageUrl;

  const ProductImage({Key? key, required this.productImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      productImageUrl,
      width: 110, height: 100, fit: BoxFit.cover,
      //     frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
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
    );
  }
}
