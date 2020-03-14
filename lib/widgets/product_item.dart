import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/providers/product.dart';
import 'package:shoppingcart/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // const ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    print(product.id);
    print(product.title);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: (
        GridTile(
        child: GestureDetector(
          onTap:(){
           Navigator.of(context).pushNamed(ProductDetailScreen.routeName,arguments: product.id);
          } ,
            child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(product.isFavorite?Icons.favorite : Icons.favorite_border),
            onPressed: () {
              // print("clicked");
              product.toogleFavoriteStatus();
              print(product.isFavorite);
            },
            color: Theme.of(context).accentColor,
          ),
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
        ),
      )),
    );
  }
}
