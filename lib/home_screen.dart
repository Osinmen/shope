import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope/core/constants/app_colors.dart';
import 'package:shope/providers/product_api_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      return Provider.of<ProductApiProvider>(
        context,
        listen: false,
      ).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductApiProvider>(context);
    return Scaffold(body: buildPage(provider));
  }

  Widget buildPage(ProductApiProvider provider) {
    if (provider.isLoading && provider.products.isEmpty) {
      return Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      );
    } else if (provider.error.isNotEmpty) {
      return Center(child: Text("${provider.error}"));
    } else if (provider.products.isNotEmpty) {
      return ListView.builder(
        itemCount: provider.products.length,
        itemBuilder: (context, index) {
          
          final product = provider.products[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              color: Colors.grey,
              padding: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(product.title.toString()),
                subtitle: Text(product.description.toString()),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(product.networkImageurl.toString()),
                ),
              ),
            ),
          );
        },
      );
    } else {
      return Container(child: Text("empty"));
    }
  }
}
