import 'package:flutter/material.dart';

@immutable
class Item{

  final int id;
  final String name;
  final Color color;
  final int price = 42;

  Item(this.id, this.name)
    : color = Colors.primaries[id % Colors.primaries.length];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Item &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;



}