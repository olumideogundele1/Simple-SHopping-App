
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/cart_model.dart';


class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CART',
        style: Theme.of(context).textTheme.headline1,),
//        backgroundColor: Colors.white,
        elevation: 8,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 32),
                  child: CartList()
              ),
            ),
            Divider(height: 5,color: Colors.black,thickness: 2,),
            CartTotal()
          ],
        ),
      )
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    var cart = context.watch<CartModel>();
    return ListView.builder(

        itemBuilder: (context,index) => ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: () => cart.remove(cart.items[index]),
          ),
          title: Text(
            cart.items[index].name,
            style: itemNameStyle,
          ),
        ),
      itemCount: cart.items.length,
    );
  }
}

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<CartModel>(
            builder: (context,cart,child){
              return Text('\$${cart.totalPrice}',
              style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 24));
            },
          ),
          SizedBox(width: 24),
          FlatButton(
              onPressed: (){
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Buying not supported yet!'))
                );
              },
              color: Colors.yellow[400],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Text('BUY'))
        ],
      ),
    );
  }
}


