// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:secure_next_interview/modal.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Data>? empDetails;
  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future getUser() async {
    final dio = Dio();
    try {
      final res =
          await dio.get('https://dummy.restapiexample.com/api/v1/employees');
      List<dynamic> data = res.data['data'];
      setState(() {
        empDetails = data.map((empData) => Data.fromJson(empData)).toList();
      });
    } on DioException catch (e) {
      print(e.hashCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'User Names',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: empDetails != null
                      ? ListView.builder(
                          itemCount: empDetails!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Text(empDetails![index].employeeName ?? ''),
                            );
                          })
                      : const Center(child: CircularProgressIndicator()))
            ],
          ),
        ),
      ),
    );
  }
}
