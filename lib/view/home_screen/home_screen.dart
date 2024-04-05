import 'package:flutter/material.dart';
import 'package:sqflite_sample_task/controller/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    fetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            HomeScreenController.addData();
          },
        ),
        body: Center(
            child: Column(
          children: [
            TextButton(
                onPressed: () async {
                  await HomeScreenController.getData();
                  setState(() {});
                },
                child: Text("Get")),
            Column(
              children: List.generate(
                  HomeScreenController.studentsListData.length,
                  (index) => ListTile(
                        title: Text(HomeScreenController
                            .studentsListData[index].name
                            .toString()),
                        subtitle: Text(HomeScreenController
                            .studentsListData[index].phNo
                            .toString()),
                        leading: InkWell(
                            onTap: () async {
                              await HomeScreenController.deleteData(
                                  HomeScreenController
                                      .studentsListData[index].id);
                              setState(() {});
                            },
                            child: Icon(Icons.delete)),
                            trailing: InkWell(
                               onTap: () async {
                                await HomeScreenController.updateDate(HomeScreenController.studentsListData[index].id);
                                 setState(() {
                                   
                                 });
                               },
                              child: Icon(Icons.edit)),
                      )),
            )
          ],
        )),
      ),
    );
  }

  Future<void> fetData() async {
    await HomeScreenController.getData();
    setState(() {});
  }
}
