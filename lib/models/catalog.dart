import 'Item.dart';

class Catalog{

  static List<String> itemNames = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];

  Item getById(int id){
    return Item(id,itemNames[id % itemNames.length]);
  }

  Item getByPosition(int position){
    return getById(position);
  }

 int itemCount(){
    return itemNames.length;
  }
}