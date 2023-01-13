import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var name = "Aryan";

    return Scaffold(
      drawer: Drawer(

      ),
      appBar: AppBar(
        title: Center(child: Text("Catalog App")),
      ),
      body: Center(
        child: Container(
          child: Text('Hello $name'),
        ),
      ),
    );
  }
}
