// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../constant.dart';
import '../Notification/notification_screen.dart';
import 'Model/category_model.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kTitleColor),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'All Categories',
          style: kTextStyle.copyWith(color: kTitleColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {
                const NotificationScreen().launch(context);
              },
              child: const Icon(FontAwesomeIcons.search),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: 2.5,
                crossAxisCount: 2,
                children: List.generate(
                  categoryList.length,
                  (index) => CategoryCard(
                    categoryModel: categoryList[index],
                    textPadding: 10.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  CategoryCard({Key? key, required this.categoryModel, required this.textPadding}) : super(key: key);
  final CategoryModel categoryModel;
  double textPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 5.0),
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        decoration: kButtonDecoration.copyWith(
          color: categoryModel.color,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.asset(
                categoryModel.icon.toString(),
                height: 40.0,
                width: 40.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: textPadding),
              child: Text(
                categoryModel.title.toString(),
                style: kTextStyle.copyWith(
                  color: kTitleColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
