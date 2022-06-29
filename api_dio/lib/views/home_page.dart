import 'package:api_dio/dio/dio_client.dart';
import 'package:api_dio/model/data.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DioClient _client = DioClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home page")),
      body: Center(
        child: FutureBuilder<User?>(
            future: _client.getUser(id: '1'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                User? userInfo = snapshot.data;

                if (userInfo != null) {
                  Data userData = userInfo.data;
                  return Column(
                    children: [
                      Image.network(userData.avatar),
                      Text(
                        '${userInfo.data.firstName} ${userInfo.data.lastName}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        userData.email,
                        style: const TextStyle(fontSize: 16.0),
                      )
                    ],
                  );
                }
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
