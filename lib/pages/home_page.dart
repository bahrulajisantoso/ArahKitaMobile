import 'package:flutter/material.dart';
import 'package:project/API/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String output = 'tidak ada data';
  List<Wisata> wisatas = [];

  getData() async {
    wisatas = await Wisata.getWisatas();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: ListView.builder(
        itemCount: wisatas.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const FlutterLogo(),
              title: Text(wisatas[index].nama.toString()),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(wisatas[index].kategori.toString()),
                  Text(wisatas[index].lokasi.toString()),
                  Text(wisatas[index].hargaTiket.toString()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
