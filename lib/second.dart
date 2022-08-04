import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
 var someImages = [];
  Future _initImages() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('myphoto/'))
        .where((String key) => key.contains('.png'))
        .toList();

    setState(() {
      someImages = imagePaths;
    });
  }


 @override
  void initState() {
  super.initState();
  _initImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: someImages.length,
          itemBuilder: (context,index){
            return ListTile(
              leading: Image.asset(someImages[index],
                height: 90,
                width: 90,
              ),

            );
          }),



    );
  }
}
