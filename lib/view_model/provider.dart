import 'package:flutter/material.dart';
import 'package:post_api_app/model/model_class.dart';
import 'package:post_api_app/view_model/post_api.dart';
//import 'package:post_api_app/view_model/post_api.dart';

class HomePageProvider extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController useridController = TextEditingController();
  Future<PostingData>? savedata;

  void test() {
    savedata = Createdata(
      titleController.text,
      bodyController.text,
      idController.text,
      useridController.text,
    );
    notifyListeners();
  }

  Column ColoumnUi() {
    //notifyListeners();
    return Column(
      children: [
        TextField(
          controller: titleController,
          decoration: InputDecoration(
            hintText: 'Enter the Title',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 3, color: const Color.fromARGB(255, 54, 54, 54)),
            ),
          ),
        ),
        TextField(
            controller: bodyController,
            decoration: InputDecoration(
              hintText: 'enter the body',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 3, color: const Color.fromARGB(255, 54, 54, 54)),
              ),
            )),
        TextField(
            controller: idController,
            decoration: InputDecoration(
              hintText: 'enter the id',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 3, color: const Color.fromARGB(255, 54, 54, 54)),
              ),
            )),
        TextField(
            controller: useridController,
            decoration: InputDecoration(
              hintText: 'enter the userid',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 3, color: const Color.fromARGB(255, 54, 54, 54)),
              ),
            )),
        SizedBox(
          height: 15,
        ),
        ElevatedButton(
            onPressed: () {
              test();
              notifyListeners();
            },
            child: Text('POST'))
      ],
    );
  }

  FutureBuilder<PostingData> buildFutureBuilder() {
    notifyListeners();
    return FutureBuilder<PostingData>(
      future: savedata,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            decoration:
                BoxDecoration(color: const Color.fromARGB(255, 156, 156, 156)),
            height: MediaQuery.of(context).size.height / 7,
            width: MediaQuery.of(context).size.width / 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Title : ${snapshot.data!.title}'),
                Text('body: ${snapshot.data!.body}'),
                Text('id: ${snapshot.data!.id}'),
                Text('userid: ${snapshot.data!.userId}'),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      }),
    );
  }
}
