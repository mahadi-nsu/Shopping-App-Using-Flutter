import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingcart/widgets/product_item.dart';
// import 'package:shoppingcart/models/product.dart';
// import '../models/product.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return Scaffold(
      appBar: AppBar(
        title : Text('MyShop'),
      ),
      body:GridView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder : (ctx,i) => ProductItem(
          products[i].id,
          products[i].title,
          products[i].imageUrl
          ),
          
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          )
        ) ,
    );
  }
}