import 'package:flutter/material.dart';
import 'package:project/api/get_wisata.dart';
import 'package:project/model/wisata.dart';
import 'package:project/pages/detail.wisata.dart';
import 'package:project/pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Wisata> wisatas = [];

  getData() async {
    wisatas = await GetWisata.getWisatas();
    setState(() {});
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
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
        ),
        itemCount: wisatas.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Center(
                    child: FlutterLogo(
                      size: 100,
                    ),
                  ),
                  Text(
                    wisatas[index].nama.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    wisatas[index].lokasi.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    wisatas[index].hargaTiket.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DetailWisata(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
