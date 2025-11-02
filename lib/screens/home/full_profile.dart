import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shope/core/constants/app_colors.dart';
import 'package:shope/core/constants/app_text_style.dart';
import 'package:shope/core/utils/sized_box_extensions.dart';
import 'package:shope/gen/assets.gen.dart';
import 'package:shope/providers/product_api_provider.dart';
import 'package:shope/services/api_services/api_services.dart';
import 'package:shope/widgets/profile_full_widgets/description_container.dart';
import 'package:shope/widgets/profile_full_widgets/row_widget.dart';
import 'package:shope/widgets/random_widgets/some_container.dart';

class FullProfile extends StatefulWidget {
  const FullProfile({super.key});

  @override
  State<FullProfile> createState() => _FullProfileState();
}

class _FullProfileState extends State<FullProfile> {
  String? username;
  Future<void> fetchUserName() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final snapshotDoc = await FirebaseFirestore.instance
        .collection("user_details")
        .doc(userId)
        .get();
    if (snapshotDoc.exists) {
      setState(() {
        username = snapshotDoc.data()?["username"];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserName();
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
    final recentlyViewed = provider.randomRecentlyViewed;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //first row at the top of the page
              RowWidget(),
              15.height,
              Text("Hello, $username!", style: AppTextStyles.headingLarge()),
              10.height,
              DescriptionContainer(),
              10.height,
              SizedBox(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ListView.builder(
                    itemCount: recentlyViewed.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 70,
                        width: 70,
                        child: Card(
                          shape: CircleBorder(),
                          elevation: 7,
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  recentlyViewed[index].networkImageurl
                                      .toString(),
                                    
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Text("My Orders"), 

            ],
          ),
        ),
      ),
    );
  }
}
