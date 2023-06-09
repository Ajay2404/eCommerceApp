import 'package:ecommerce/addProduct.dart';
import 'package:ecommerce/allProduct.dart';
import 'package:ecommerce/category.dart';
import 'package:ecommerce/loginPage.dart';
import 'package:ecommerce/splashScreen.dart';
import 'package:ecommerce/viewProduct.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int onChange = 0;

  String? img = SplashScreen.prefs!.getString("imgPath");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://ajay2404.000webhostapp.com/ApiCalling/$img")),
                accountName: Text("${SplashScreen.prefs!.getString("fName")}"),
                accountEmail:
                    Text("${SplashScreen.prefs!.getString("eMail")}")),
            ListTile(
              title: const Text("View Product"),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  onChange = 0;
                });
              },
            ),
            ListTile(
              title: const Text("Add Product"),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  onChange = 1;
                });
              },
            ),
            ListTile(
              title: const Text("All Product"),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  onChange = 2;
                });
              },
            ),
            ListTile(
              title: const Text("Category"),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  onChange = 3;
                });
              },
            ),
            const ListTile(title: Text("Order History")),
            const ListTile(title: Text("Contact Us")),
            const ListTile(title: Text("Help Center")),
            const ListTile(title: Text("About Us")),
            ListTile(
              title: const Text("Log Out"),
              onTap: () {
                SplashScreen.prefs!.setBool("loginStatus", false).then((value) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ));
                });
              },
            ),
          ],
        ),
      ),
      body: onChange == 0
          ?  ViewProduct()
          : onChange == 1
              ?  AddProduct()
              : onChange == 2
                  ?  AllProduct()
                  :  Category(),
    );
  }
}
