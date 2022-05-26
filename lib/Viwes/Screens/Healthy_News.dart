import 'package:bloodbankasmaa/Controller/Api_News.dart';
import 'package:bloodbankasmaa/Controller/Function_News.dart';
import 'package:bloodbankasmaa/Viwes/Widgets/Body_Card_News.dart';
import 'package:flutter/material.dart';

class HealthyNews extends StatefulWidget {
  static const String route = "HealthyNews";

  const HealthyNews({Key? key}) : super(key: key);

  @override
  _HealthyNewsState createState() => _HealthyNewsState();
}

class _HealthyNewsState extends State<HealthyNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Healthy News"), backgroundColor: Colors.green[800]),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: Api_News.fetchArticales(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BodyCardNews(
                        Url: "${snapshot.data[index].url}",
                        TextN: "${snapshot.data[index].title}",
                        imageN: (snapshot.data[index].urlToImage == null)
                            ? "https://unsplash.com/photos/NKhckz9B78c"
                            : "${snapshot.data[index].urlToImage}",
                        asmaacopy: () {
                          setState(() {
                            //Fun.copyLink("${snapshot.data[index].url}");
                            Fun.copyLink("${snapshot.data[index].url}")
                                .then((value) {
                              final snackBar =
                                  SnackBar(content: Text("Copy...."));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                          });
                        },
                        asmaashar: () {
                          setState(() {
                            Fun.ShareLink("${snapshot.data[index].url}");
                          });
                        });
                  },
                );
              } else {
                return Center(
                    child: Container(
                  height: 80,
                  width: 80,
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                ));
              }
            },
          )),
        ],
      ),
    );
  }
}
