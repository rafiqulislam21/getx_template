import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/controllers/test_controller.dart';
import 'package:getx_template/views/widgets/widgets.dart';

class TestPage extends StatelessWidget {
  final controller = Get.put(TestController());
  // final controller = Get.find<TestController>();

  @override
  Widget build(BuildContext context) {
    // controller.getData();
    return Scaffold(
      appBar: AppBar(title: Text('TestPage')),
      body: Obx(() => AnimatedCrossFade(
        duration: Duration(milliseconds: 500),
        crossFadeState: controller.demoData.value == null ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        firstChild: EmptyWidget(),
        secondChild: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.message),
              title: Text(controller?.demoData?.value?.title??""),
            )
            /*ElevatedButton(
                  onPressed: () async {
                    controller.getData();
                  },
                  child: Text('GET Data', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () async {
                    controller.postData();
                  },
                  child: Text('POST Data', style: TextStyle(fontSize: 24)),
                ),*/
          ],
        ),
      ))

    );
  }
}



/*NestedScrollView(
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
*//*     Expanded(
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
              ),*//*
],
),
),
)*/
