import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/controllers/cart_controller.dart';
import 'package:getx_template/controllers/news_controller.dart';
import 'package:getx_template/controllers/shopping_controller.dart';
import 'package:getx_template/utils/theme_services.dart';

class NewsPage extends StatelessWidget {
  final newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("News page Toolbar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.network(
                    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: GetX<NewsController>(

                  builder: (controller) {
                    print(controller.latestNews.length);
                    return ListView.builder(
                      itemCount: controller.latestNews.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(12),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ListTile(
                              leading: Icon(Icons.next_week_sharp),
                              title: Text(controller.latestNews[index].title),

                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}