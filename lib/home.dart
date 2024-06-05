import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:secure_next_interview/modal.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? userName;
  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future getUser() async {
    final dio = Dio();
    final res =
        await dio.get('https://dummy.restapiexample.com/api/v1/employees');
    List<dynamic> data = res.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            // Text() .\
          ],
        ),
      ),
    );
  }
}
