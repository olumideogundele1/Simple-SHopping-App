import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screens/catalog_screen.dart';
import 'package:shopping_app/screens/home_screen.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/models/catalog.dart';
import 'package:shopping_app/screens/login_screen.dart';

import 'screens/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => Catalog()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<Catalog,CartModel>(
            create: (context) => CartModel(),
            update: (context,catalog,cart){
              cart.catalog = catalog;
              return cart;
            }
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.yellow,
            textTheme: TextTheme(
                headline1: TextStyle(
                fontFamily: 'Corben',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/catalog': (context) => MyCatalog(),
         '/cart': (context) => MyCart(),
        },
//      home: HomeScreen(),
      ),
    );
  }
}

