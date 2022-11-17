import 'package:counter_7/my_watchlist.dart';
import 'package:flutter/material.dart';
import 'form.dart';
import 'data_budget.dart';
import 'main.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
    required this.data,
    required this.addData,
  }) : super(key: key);

  final List<Budget> data;
  final Function(Budget) addData;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyFormPage(
                    data: data,
                    addData: addData,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DisplayData(
                    data: data,
                    addData: addData,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('My Watchlist'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyWatchlist(
                    data: data,
                    addData: addData,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
