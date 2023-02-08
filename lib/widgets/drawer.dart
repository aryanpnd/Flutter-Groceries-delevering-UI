import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  final avtarUrl =
      'https://instagram.fixc2-1.fna.fbcdn.net/v/t51.2885-19/306455184_1155835988619488_5429635101423431051_n.jpg?stp=dst-jpg_s320x320&_nc_ht=instagram.fixc2-1.fna.fbcdn.net&_nc_cat=108&_nc_ohc=W9lmlfOVCZwAX8gDGFC&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfAQWY9UGX57iXjlwFRi5qY0X2Pwm-7dzcG-5gpzB8dr0w&oe=63CF5C81&_nc_sid=8fd12b';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: PopupMenuButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 15,
          padding: EdgeInsets.all(20),
          offset: Offset(0.0, AppBar().preferredSize.height),
          itemBuilder: (BuildContext context) => [

             PopupMenuItem(
                child: ListTile(

              leading: Icon(
                CupertinoIcons.home,
                color: Theme.of(context).backgroundColor,
              ),

                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              title: Text(
                "Home",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            ),


             PopupMenuItem( child:ListTile(
              leading: Icon(
                CupertinoIcons.cart,
                color: Theme.of(context).backgroundColor,

              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              title: Text(
                "My cart",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),),

             PopupMenuItem(child: ListTile(
              onTap: () {Navigator.pushNamed(context, MyRoutes.loginRoute);},
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              tileColor: Colors.red,
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text(
                "Sign Out",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),)


          ],


          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/home_drawer_pp.png"),
          ),
        ),
      ),
    );

    //   Drawer(
    //   elevation: 20,
    //   child: Container(
    //     color: Colors.deepPurple.shade400,
    //     child: ListView(
    //       children: [
    //         DrawerHeader(
    //
    //             padding: EdgeInsets.zero,
    //             child: UserAccountsDrawerHeader(
    //               margin: EdgeInsets.zero,
    //               currentAccountPicture: CircleAvatar(
    //
    //                 backgroundImage:NetworkImage(avtarUrl),
    //               ),
    //               accountName: Text("__User's Name__"),
    //               accountEmail: Text("__User's Email__"),
    //             )),
    //         // Divider(
    //         //   color: Colors.white,
    //         //   thickness: 0.5,
    //         // ),
    //         ListTile(
    //           leading: Icon(
    //             CupertinoIcons.home,
    //             color: Colors.white,
    //           ),
    //           title: Text(
    //             textScaleFactor: 1.5,
    //             "Home",
    //             style: TextStyle(
    //               color: Colors.white
    //             ),
    //           ),
    //         ),
    //         ListTile(
    //           leading: Icon(
    //             CupertinoIcons.cart,
    //             color: Colors.white,
    //           ),
    //           title: Text(
    //             textScaleFactor: 1.5,
    //             "My cart",
    //             style: TextStyle(
    //                 color: Colors.white
    //             ),
    //           ),
    //         ),
    //         ListTile(
    //           onTap: () {Navigator.pushNamed(context, MyRoutes.loginRoute);},
    //           tileColor: Colors.red,
    //             leading: Icon(
    //               Icons.logout,
    //               color: Colors.white,
    //             ),
    //             title: Text(
    //               textScaleFactor: 1.5,
    //               "Sign Out",
    //               style: TextStyle(
    //                   color: Colors.white
    //               ),
    //             ),
    //           ),
    //
    //       ],
    //     ),
    //   ),
    // );
  }
}
