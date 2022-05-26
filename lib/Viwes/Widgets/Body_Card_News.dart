
import 'package:bloodbankasmaa/Controller/Function_News.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BodyCardNews extends StatefulWidget {
  String TextN;
  var imageN;
  dynamic asmaacopy;
  dynamic asmaashar;
  var  Url;
  BodyCardNews(
      {required this.TextN,
      required this.imageN,
        required this.Url
      ,required this.asmaacopy,
      required this.asmaashar});

  @override
  State<BodyCardNews> createState() => _BodyCardNewsState();
}

class _BodyCardNewsState extends State<BodyCardNews> {
  //void _launchUrl(var Url) async {
    //if (!await launchUrl(Uri.parse(Url))) throw 'Could not launch $Url'; }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: GestureDetector(onTap: (){
  Fun.openLink(widget.Url);
      },
        child: Card(
          shadowColor: Colors.black,
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    20,
                  ),
                  bottomRight: Radius.circular(
                    20,
                  ))),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(widget.imageN))),
              ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(alignment: Alignment.topLeft,
                  child: Text(
                    widget.TextN,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black54),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: widget.asmaashar,
                          icon: Icon(
                            Icons.share,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: widget.asmaacopy,
                          icon: Icon(
                            Icons.copy_rounded,
                            size: 30,
                          )),
                      SizedBox(
                        width: 7,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
