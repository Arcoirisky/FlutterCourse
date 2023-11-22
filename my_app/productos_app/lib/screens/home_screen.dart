import 'package:flutter/material.dart';
import 'package:productos_app/models/product.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/products_service.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);
    final products = productsService.products;

    if (productsService.isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          child: ProductCard(product: products[index]),
          onTap: () {
            productsService.selectedProduct = products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          productsService.selectedProduct =
              Product(available: true, name: "", price: 0);

          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}
