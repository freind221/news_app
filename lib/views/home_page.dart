import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_full/controller/category_controller.dart';
import 'package:news_app_full/controller/news_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  final NewsController newsController = Get.put((NewsController()));
  final CategoryController categoryController = Get.put((CategoryController()));

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "News",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "Bazaar",
              style: TextStyle(color: Colors.deepOrangeAccent),
            )
          ],
        ),
      ),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(left: 3),
          height: 140,
          child: GetX<CategoryController>(builder: (controller) {
            return PageView.builder(
                padEnds: false,
                itemCount: controller.catagories.length,
                controller: PageController(viewportFraction: 0.55),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: (() {
                      Get.toNamed(controller.catagories[index].pageUrl);
                    }),
                    child: Container(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        height: 220,
                        width: MediaQuery.of(context).size.width - 20,
                        margin: const EdgeInsets.only(
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.srcOver),
                                image: NetworkImage(controller
                                    .catagories[index].imageAssetUrl))),
                        child: Center(
                          child: Text(
                            controller.catagories[index].categorieName,
                            style: TextStyle(
                                color: Colors.grey.shade200,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),
                          ),
                        )),
                  );
                }));
          }),
        ),
        SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Latest",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Text(
                  "News",
                  style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                )
              ],
            )),

        Expanded(
          child: GetX<NewsController>(builder: (controller) {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: controller.articlesList.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: (() {
                        Get.toNamed('/detail', arguments: {
                          "urlToImage": controller
                              .articlesList[index].urlToImage
                              .toString(),
                          "title":
                              controller.articlesList[index].title.toString(),
                          "content":
                              controller.articlesList[index].content.toString(),
                          "author":
                              controller.articlesList[index].author.toString(),
                          "publishedAt": controller
                              .articlesList[index].publishedAt
                              .toString(),
                          "url": controller.articlesList[index].url.toString(),
                        });
                      }),
                      // child: NewsTile(
                      //     imgUrl:
                      //         '${controller.articlesList[index].urlToImage}',
                      //     desc:
                      //         '${controller.articlesList[index].description}',
                      //     title: '${controller.articlesList[index].title}',
                      //     posturl: '${controller.articlesList[index].url}')
                      child: Container(
                          margin: const EdgeInsets.only(bottom: 24),
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            alignment: Alignment.bottomCenter,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(6),
                                    bottomLeft: Radius.circular(6))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.network(
                                      "${controller.articlesList[index].urlToImage}",
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    )),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "${controller.articlesList[index].title}",
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "${controller.articlesList[index].description}",
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: Colors.black54, fontSize: 14),
                                )
                              ],
                            ),
                          )),
                    );
                  }));
            }
          }),
        ),

        // Expanded(child: GetX<NewsController>(builder: (controller) {
        //   return ListWheelScrollView.useDelegate(
        //       itemExtent: 240,
        //       physics: const FixedExtentScrollPhysics(),
        //       diameterRatio: 5,
        //       childDelegate: ListWheelChildBuilderDelegate(
        //           childCount: controller.articlesList.length,
        //           builder: ((context, index) {
        //             return NewsTile(
        //                 imgUrl:
        //                     "${controller.articlesList[index].urlToImage}",
        //                 desc: "${controller.articlesList[index].description}",
        //                 title: "${controller.articlesList[index].title}",
        //                 posturl: "${controller.articlesList[index].url}");
        //           })));
        // }))
      ]),
    );
  }
}
