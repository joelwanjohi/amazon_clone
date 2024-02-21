import 'package:amazon/widgets/banner_ad_widget.dart';
import 'package:amazon/widgets/categories_horizontal_list_view_bar.dart';
import 'package:amazon/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackButton: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoriesHorizontalListViewBar(),
            BannerAdWidget()
          ],
        ),
      ),
    );
  }
}
