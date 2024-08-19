import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas10/Tugas11/bottom_nav.dart';
import 'package:tugas10/Tugas11/utils/snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  List data_object = [];
  var loading = false;

  getAllProducts() async {
    setState(() => loading = true);
    try {
      var result = await GetConnect().get('https://fakestoreapi.com/products');
      print('result: ${result.body}');
      if (result.body is List) {
        data_object = result.body;
        final selectedCat = Get.find<BottomNavController>().selectedCategory;
        final hasSelectedCat = selectedCat.isNotEmpty;
        data_object = data_object
            .where((e) => !hasSelectedCat ? true : e['category'] == selectedCat)
            .toList();
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
        title: const Text('Products'),
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
                          launchUrl(
                            Uri.parse(
                                'https://wa.me/6281264086157?text=halo admin, saya mau beli ${data_object[index]['title']}'),
                            mode: LaunchMode.externalNonBrowserApplication,
                          );
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(data_object[index]['image'],
                                  height: 50),
                              Text(
                                data_object[index]['title'],
                                textAlign: TextAlign.center,
                              ),
                              Text('${data_object[index]['price']}'),
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
