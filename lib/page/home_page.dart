import 'package:flutter/material.dart';
import 'package:quiz_app_ii_example/data/categories.dart';
import 'package:quiz_app_ii_example/data/user.dart';
import 'package:quiz_app_ii_example/page/category_page.dart';
import 'package:quiz_app_ii_example/widget/category_detail_widget.dart';
import 'package:quiz_app_ii_example/widget/category_header_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('School Quiz'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: buildWelcome(username),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepOrange, Colors.purple],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          actions: [
            Icon(Icons.search),
            SizedBox(width: 12),
          ],
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            SizedBox(height: 8),
            buildCategories(),
            SizedBox(height: 32),
            buildPopular(context),
          ],
        ),
      );

  Widget buildWelcome(String username) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            username,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      );

  Widget buildCategories() => Container(
        height: 300,
        child: GridView(
          primary: false,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: categories
              .map((category) => CategoryHeaderWidget(category: category))
              .toList(),
        ),
      );

  Widget buildPopular(BuildContext context) => Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Popular',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 240,
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: categories
                  .map((category) => CategoryDetailWidget(
                        category: category,
                        onSelectedCategory: (category) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CategoryPage(category: category),
                          ));
                        },
                      ))
                  .toList(),
            ),
          )
        ],
      );
}
