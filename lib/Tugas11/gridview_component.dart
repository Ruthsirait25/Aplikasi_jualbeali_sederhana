import 'package:flutter/material.dart';

import 'detail_component.dart';

class GridviewComponent extends StatelessWidget {
  GridviewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> data_object = [
      {"id": "1", "name": "Ruth", "email": "ruth@gmail.com"},
      {"id": "2", "name": "karolina", "email": "karolina@gmail.com"},
      {"id": "3", "name": "caroline", "email": "caroline@gmail.com"},
      {"id": "4", "name": "yuth", "email": "yuth@gmail.com"},
      {"id": "5", "name": "saya", "email": "kipas@gmail.com"},
      {"id": "6", "name": "ingin", "email": "angin@gmail.com"}
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Gridview component'),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height / 1,
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  print(data_object[index]["id"]);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DetailComponent(
                        name: data_object[index]['name'],
                      );
                    },
                  ));
                },
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person),
                      Text(data_object[index]['id']),
                      Text(data_object[index]['name']),
                      Text(data_object[index]['email']),
                    ],
                  ),
                ),
              );
            },
            itemCount: data_object.length,
          )),
    );
  }
}
