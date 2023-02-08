import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_second_app/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var name = '';
  bool changeButton = false;
  bool textfeildIsEmpty = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(milliseconds: 900));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Center(child: Text("Test")),),
      body: SafeArea(
        child: Material(
            child: SingleChildScrollView(
          reverse: true,
          // physics: const AlwaysScrollableScrollPhysics(),

          child: Form(
            key: _formKey,
            child: Column(
              children: [

                Image.asset("assets/images/login_ilus2.png", fit: BoxFit.cover),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 50.0),
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    text:  TextSpan(text: 'Welcome \n',style: Theme.of(context).textTheme.headline3, children: [
                      TextSpan(
                          text: '$name'.toUpperCase(),
                          style: TextStyle(color: Colors.deepPurple.shade400)
                      )
                    ]),
                  ),
                  // child: Text(
                  //   "Welcome $name",
                  //   style: Theme.of(context).textTheme.headline3,
                  // ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 35),
                  child: Column(children: [

                    TextFormField(
                      style: Theme.of(context).textTheme.headline5,
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
                        hintStyle: Theme.of(context).textTheme.subtitle2,
                        labelText: "Username",
                        labelStyle: Theme.of(context).textTheme.headline5,
                      ),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Usernmae cannot be Empty!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      style: Theme.of(context).textTheme.headline5,
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
                        hintText: "Enter Password",
                        hintStyle: Theme.of(context).textTheme.subtitle2,
                        labelText: "Password",
                        labelStyle: Theme.of(context).textTheme.headline5,
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Password cannot be Empty!';
                        } else if (value.length < 6) {
                          return 'Password should be greater than 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Material(
                      elevation: 40,
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(changeButton ? 50 : 30),
                      child: InkWell(
                          onTap: () => moveToHome(context),
                          borderRadius: BorderRadius.circular(30),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 900),
                            child: changeButton
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                            alignment: Alignment.center,
                            height: 70,
                            width: changeButton ? 80 : 300,
                          )),
                    )
                  ]),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
