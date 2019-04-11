import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'post.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  Dio dio = Dio(Options(responseType: ResponseType.JSON));
  final response =
      await dio.get('https://jsonplaceholder.typicode.com/posts/2');
  if (response.statusCode == 200) {
    print("response.data:${response.data}");
    return Post.fromJson(response.data);
  } else {
    Exception('Failed to load post');
  }
}

//Future<Post> fetchHttpPost() async {
//  final response = await http.get('https://jsonplaceholder.typicode.com/posts/2');
//
//  if (response.statusCode == 200) {
//    return Post.fromJson(json.decode(response.body));
//  } else {
//    throw Exception('Failed to load post');
//  }
//}

class MyJsonFetch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "fetch json",
      theme: ThemeData(primaryColor: Colors.redAccent),
      home: Scaffold(
          appBar: AppBar(
            title: Text("json"),
          ),
          body: Center(
            child: FutureBuilder<Post>(
              builder: (context, snap) {
                if (snap.hasData) {
                  String title = snap.data.title;
                  String body = snap.data.body;
                  int id = snap.data.id;
                  int userId = snap.data.userId;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('UserId : $userId'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('Id : $id'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('body : $body'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text('title : $title'),
                      ),
                    ],
                  );
                } else if (snap.hasError) {
                  return Text("error:${snap.error}");
                }
                return CircularProgressIndicator();
              },
              future: fetchPost(),
            ),
          )),
    );
  }
}
