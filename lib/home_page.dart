import 'package:flutter/material.dart';
import 'package:tugas2mobile/dummy_menu.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (Colors.blueGrey),
        title: Text("Selamat Datang $username"),
        automaticallyImplyLeading: false,
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.red),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Logout"),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              " Daftar Menu",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: foodMenuList.length,
                  itemBuilder: (context, index) {
                    final FoodMenu menu = foodMenuList[index];
                    return Card(
                      child: Column(
                        children: [
                          Text(menu.name),
                          Text(menu.category),
                          Text(menu.description),
                          Text(menu.ingredients),
                          Text(menu.cookingTime),
                          Text(menu.price),
                          Image.network(menu.imageUrls[0])
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
