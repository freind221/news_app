import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_full/controller/apple_controller.dart';

class AppleNews extends StatefulWidget {
  AppleNews({Key? key}) : super(key: key);
  final AppleController appleController = Get.put((AppleController()));

  @override
  State<AppleNews> createState() => _AppleNewsState();
}

class _AppleNewsState extends State<AppleNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (() {
              Get.back();
            }),
            child: const Icon(Icons.arrow_back)),
        iconTheme: const IconThemeData(color: Colors.black),
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
      body: SafeArea(
        child: GetX<AppleController>(builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: controller.appleNews.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: (() {
                      Get.toNamed('/detail', arguments: {
                        "urlToImage":
                            controller.appleNews[index].urlToImage.toString(),
                        "title": controller.appleNews[index].title.toString(),
                        "content":
                            controller.appleNews[index].content.toString(),
                        "author": controller.appleNews[index].author.toString(),
                        "publishedAt":
                            controller.appleNews[index].publishedAt.toString(),
                        "url": controller.appleNews[index].url.toString(),
                      });
                    }),
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
                                    "${controller.appleNews[index].urlToImage}",
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  )),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                "${controller.appleNews[index].title}",
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
                                "${controller.appleNews[index].description}",
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
    );
  }
}
