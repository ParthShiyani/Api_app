import 'package:flutter/material.dart';
import 'package:singlton_api_call_app/helper/api_helper.dart';
import 'package:singlton_api_call_app/models/post.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Singleton API call"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: APIHelper.apiHelper.fetchSinglePostData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            Post? data = snapshot.data;

            return Card(
              elevation: 2,
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: Text("${data!.userId}"),
                title: Text(data.title),
                subtitle: Text(data.body),
                trailing: Text("${data.id}"),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
