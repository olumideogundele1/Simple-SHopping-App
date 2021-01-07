import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/my_app_bar.dart';
import 'package:shopping_app/models/Item.dart';
import 'package:shopping_app/models/cart_model.dart';
import 'package:shopping_app/models/catalog.dart';

class MyCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MyAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: 12,),),
          SliverList(
              delegate: SliverChildBuilderDelegate(

                  (context,index) => _MyListItem(index),
                childCount: Provider.of<Catalog>(context).itemCount()
              ))
        ],
      ),
    );
  }
}

class _MyListItem extends StatelessWidget {

  final int index;

  _MyListItem(this.index);

  @override
  Widget build(BuildContext context) {
    var item = context.select<Catalog,Item>(
            (value) => value.getByPosition(index),
    );
    var theme = Theme.of(context).textTheme.headline6;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
                aspectRatio: 3/2,
                child: Container(
                  color: item.color,
                ),
            ),
            SizedBox(width: 28,),
            Text(item.name,
            style: theme,),
            Spacer(),
            _AddButton(item: item,)
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;
  const _AddButton({
    this.item
  });

  @override
  Widget build(BuildContext context) {
    bool isInCart = context.select<CartModel,bool>(
            (value) => value.items.contains(item)
    );
    var removeFromCart = context.watch<CartModel>();
    return FlatButton(
        onPressed: isInCart ? (){
          removeFromCart.remove(item);
        }:(){
          var cart = context.read<CartModel>();
          cart.add(item);
        },
        splashColor: Theme.of(context).primaryColor,
        child: isInCart ?
        Icon(Icons.check,semanticLabel: 'ADDED') : Text('ADD'));
  }
}



