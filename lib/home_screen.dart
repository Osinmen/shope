import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope/core/constants/app_colors.dart';
import 'package:shope/core/constants/app_text_style.dart';
import 'package:shope/core/utils/sized_box_extensions.dart';
import 'package:shope/gen/assets.gen.dart';
import 'package:shope/providers/product_api_provider.dart';
import 'package:shope/services/api_services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> testing() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: "victoryairen@gmail.com",
      password: "1234566",
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  Provider.of<ProductApiProvider>(context, listen: false).fetchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: context.read<ProductApiProvider>().fetchProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
          } else if (snapshot.hasData) {
            return Consumer<ProductApiProvider>(
              builder: (context, value, child) {
                final products = value.products;
               return  ListView.builder(
              itemCount: value.products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      title: Text(product.title.toString()),
                      subtitle: Text(product.description.toString()),
                      leading: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(product.networkImageurl.toString()),
                      ),
                    ),
                  ),
                );
              },
            );
              },
            );
          } else if (snapshot.hasError) {
            return Text(
              "erro trying to get product refesh this page",
              style: AppTextStyles.bodyMediumLight(),
            );
          } else {
            return Text("some thing else is wron try to refresh this page");
          }
        },
      ),
    );
  }
}
