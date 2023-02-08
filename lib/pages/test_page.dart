import 'package:flutter/material.dart';

class tff extends TextFormField{
  ttf1(){

    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.purple.shade200,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.purple.shade700,
            width: 2.5,
          ),
        ),
        hintText: "Enter Username",
        labelText: "Username",
      ),
    );
  }
}
class TestPage extends StatelessWidget {
  var ttf = tff();

  @override
  Widget build(BuildContext context) {
    var name = "Aryan";

    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Test")),),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50)),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
            ttf.ttf1(),
          ],


        ),
      ),
    );
  }
}
