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
import 'package:shope/widgets/payment_status_tabs.dart';
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
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await fetchUserName();

    // Fetch products safely after build
    Future.microtask(() {
      final provider = context.read<ProductApiProvider>();
      provider.fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductApiProvider>(context);
    final recentlyViewed = provider.randomRecentlyViewed;
    final newlyAddedItems = provider.newlyAddedItems;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //hggffddsddff  hhl
                RowWidget(),
                15.height, //what fuck
                Text("Hello, $username!", style: AppTextStyles.headingLarge()),
                10.height,
                DescriptionContainer(),
                10.height,
                Text(
                  "Recently Viewed",
                  style: AppTextStyles.bodyMediumBold(Colors.black),
                ),
                SizedBox(
                  height: 100,
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
                            child: Padding(
                              padding: const EdgeInsets.all(6),
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
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Text(
                  "My Orders",
                  style: AppTextStyles.bodyMediumBold(Colors.black),
                ),
                10.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: PaymentStatusTabs(text: "Pay", onPressed: () {}),
                    ),
                    8.width,
                    Expanded(
                      child: PaymentStatusTabs(
                        text: ("Receive"),
                        onPressed: () {},
                      ),
                    ),
                    8.width,
                    Expanded(
                      child: PaymentStatusTabs(
                        text: "Review",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                20.height,
                Text(
                  "Stories",
                  style: AppTextStyles.bodyMediumBold(Colors.black),
                ),
                10.height,
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return AspectRatio(
                        aspectRatio: 14 / 20,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New Items",
                      style: AppTextStyles.bodyMediumBold(Colors.black),
                    ),
                    Row(
                      children: [
                        Text(
                          "See All",
                          style: AppTextStyles.bodySmallBold(Colors.black),
                        ),
                        10.width,
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 150,
                  width: 200,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 7,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
