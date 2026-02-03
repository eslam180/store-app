import 'package:flower_app/components/cart.dart';
import 'package:flower_app/components/custom_shoping_cart.dart';
import 'package:flower_app/models/product_model.dart';
import 'package:flower_app/services/all_products_services.dart';
import 'package:flower_app/views/profile_page.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  final List<Widget> pages = [HomeView(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [CustomShopCart()],
      ),

      body: FutureBuilder<List<ProductModel>>(
        future: AllProductsServices().getAllProuducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          } else if (snapshot.hasData) {
            final items = snapshot.data!;

            return GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisExtent: 170,
              ),
              itemBuilder: (context, index) {
                return Center(child: Cart(productModel: items[index]));
              },
            );
          } else {
            return const Center(child: Text('No products found'));
          }
        },
      ),
    );
  }
}
