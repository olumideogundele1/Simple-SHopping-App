import 'package:flutter/foundation.dart';
import 'package:shopping_app/models/Item.dart';
import 'package:shopping_app/models/catalog.dart';

class CartModel extends ChangeNotifier{

  Catalog _catalog;

  final List<int> _itemIds = [];

  //current catalog. Used to construct items from numeric ids
  Catalog get catalog => _catalog;

  set catalog(Catalog newCatalog){
    assert(newCatalog != null);
    assert(_itemIds.every((element) => newCatalog.getById(element) != null),
      'The catalog $newCatalog does not have one of the $_itemIds in it.');
    _catalog = newCatalog;
    notifyListeners();
  }

  //Get list of items
  List<Item> get items{
    return _itemIds.map((id) => _catalog.getById(id)).toList();
  }

  //Get the current total price of all items
  int get totalPrice{
    return items.fold(0, (total, current) => total + current.price);
  }

  void add(Item item){
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Item item){
    _itemIds.remove(item.id);
    notifyListeners();
  }
}