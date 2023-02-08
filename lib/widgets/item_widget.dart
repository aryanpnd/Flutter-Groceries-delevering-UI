import 'package:flutter/material.dart';
import 'package:my_second_app/modals/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Card(
        elevation: 3,
        child: ListTile(
          onTap: () {},
          leading: Padding(
            padding: const EdgeInsets.all(0),
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 100,
                  minHeight: 100,
                  maxWidth: 100,
                  maxHeight: 100,
                ),
                child: Image.network(
                  item.filename.toString(),
                )),
          ),
          title: Text(item.title),
          subtitle: Text(item.description, maxLines: 3),
          isThreeLine: true,
          horizontalTitleGap: 15,

          trailing: Text(
            "₹${item.price.toString()} ",
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              // fontSize: 20
            ),
          ),

          // tileColor: Colors.amber,
        ),
      ),
    );
  }
}
