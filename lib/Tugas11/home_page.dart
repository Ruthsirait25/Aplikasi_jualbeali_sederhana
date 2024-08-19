import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas10/Tugas11/bottom_nav.dart';
import 'package:tugas10/Tugas11/utils/snack_bar.dart';

import 'detail_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var loading = false;

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  List<dynamic> data_object = [];

  getCategories() async {
    setState(() => loading = true);
    try {
      var result = await GetConnect()
          .get('https://fakestoreapi.com/products/categories');
      print('result: ${result.body}');
      if (result.body is List) {
        data_object = result.body;
        setState(() {});
      }
    } catch (e) {
      showSnackBar(context, 'Terjadi kesalahan $e');
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          final ctrl = Get.find<BottomNavController>();
                          ctrl.selectedCategory = data_object[index] ?? '';
                          ctrl.selectedNav = 1;
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.shopping_bag),
                              Text(data_object[index]),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: data_object.length,
                  )),
            ),
    );
  }
}
