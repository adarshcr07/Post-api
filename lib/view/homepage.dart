import 'package:flutter/material.dart';
//import 'package:post_api_app/model/model_class.dart';

import 'package:post_api_app/view_model/provider.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
        backgroundColor: Colors.teal,
      ),
      body: Consumer<HomePageProvider>(builder: (context, value, child) {
        return Center(
            child: Container(
          child: (value.savedata == null)
              ? value.ColoumnUi()
              : value.buildFutureBuilder(),
        ));
      }),
    );
  }
}
