import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_full/widgets/news_tile.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Center(
                child: Text(
                  Get.arguments["title"],
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 12),
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(Get.arguments['urlToImage']))),
              ),

              Text(
                Get.arguments['publishedAt'],
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              // Text(
              //   Get.arguments['url'],
              //   style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              // ),

              const SizedBox(
                height: 12,
              ),
              Text(Get.arguments["content"],
                  style: const TextStyle(
                    fontSize: 17,
                    //fontWeight: FontWeight.normal,
                  )),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Written by ${Get.arguments['author']}",
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
