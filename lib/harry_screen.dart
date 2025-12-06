import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harry_potter/model/harry_model.dart';

class HarryScreen extends StatefulWidget {
  const HarryScreen({super.key});

  @override
  State<HarryScreen> createState() => _HarryScreenState();
}

class _HarryScreenState extends State<HarryScreen> {
  final dio = Dio();
  List<HarryModel>? listModels;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final list = await getHttp();
    setState(() {
      listModels = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Harry Potter Characters",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xfff0d77a),
            fontFamily: "Serif",
          ),
        ),
      ),
      body: listModels == null
          ? const Center(child: CircularProgressIndicator(color: Colors.amber))
          : ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: listModels!.length,
        itemBuilder: (context, index) {
          final item = listModels![index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Card(
              color: const Color(0xff1a1a1a),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.network(
                        item.image,
                        width: 120,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        item.fullName,
                        style: const TextStyle(
                          color: Color(0xfff0d77a),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Serif',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<List<HarryModel>> getHttp() async {
    final response = await dio.get(
      'https://potterapi-fedeperin.vercel.app/en/characters',
    );

    final data = response.data;

    return (data as List)
        .map((item) => HarryModel.fromJson(item))
        .toList();
  }
}
