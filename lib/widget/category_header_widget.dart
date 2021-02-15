import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app_ii_example/model/category.dart';
import 'package:quiz_app_ii_example/page/category_page.dart';

class CategoryHeaderWidget extends StatelessWidget {
  final Category category;

  const CategoryHeaderWidget({
    Key key,
    @required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CategoryPage(category: category),
        )),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: category.backgroundColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(category.icon, color: Colors.white, size: 36),
              const SizedBox(height: 12),
              Text(
                category.categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
      );
}
