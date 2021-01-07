import 'package:flutter/material.dart';
import 'package:shopping_app/components/item_list.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: CataLogList(),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    elevation: 10,
    title: Center(child: Text('Cart Story',
    style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold
    ),)),
  );
}
