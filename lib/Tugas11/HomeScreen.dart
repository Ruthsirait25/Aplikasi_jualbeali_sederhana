import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
                IconButton(icon: Icon(Icons.extension), onPressed: () {}),
              ],
            ),
            SizedBox(height: 37),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Welcome, \n",
                    style: TextStyle(color: Colors.blue[300]),
                  ),
                  TextSpan(
                    text: "Hilmy, \n",
                    style: TextStyle(color: Colors.blue[900]),
                  ),
                ],
              ),
              style: TextStyle(fontSize: 50),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    size: 18,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Search"),
            ),
            SizedBox(height: 10),
            Text(
              "Recomended Place",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            SizedBox(
              height: 250,
              child: GridView.count(
                padding: EdgeInsets.all(5),
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  for (var country in countries)
                    Image.asset("assets/img/$country.png")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

final countries = ["Tokyo", "Berlin", "Roma", "Monas"];
