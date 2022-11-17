import 'dart:convert';

import 'package:counter_7/models/watchlist.dart';
import 'package:counter_7/watchlist_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'my_drawer.dart';

class MyWatchlist extends StatefulWidget {
  const MyWatchlist({super.key, required this.data, required this.addData});
  final List<Budget> data;
  final Function(Budget) addData;
  @override
  State<MyWatchlist> createState() => _MyWatchlistState();
}

class _MyWatchlistState extends State<MyWatchlist> {
  Future<List<Watchlist>> fetchWatchlist() async {
    var url = Uri.parse('https://tugas-pbp.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<Watchlist> listToDo = [];
    for (var d in data) {
      if (d != null) {
        listToDo.add(Watchlist.fromJson(d));
      }
    }

    return listToDo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      // Menambahkan drawer menu
      drawer: MyDrawer(
        data: widget.data,
        addData: widget.addData,
      ),
      body: FutureBuilder(
        future: fetchWatchlist(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada watchlist :(",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          print("click");
                          // Route menu ke halaman utama
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => WatchlistDetail(
                                data: widget.data,
                                addData: widget.addData,
                                watched: snapshot.data![index].fields.watched,
                                title: snapshot.data![index].fields.title,
                                rating: snapshot.data![index].fields.rating,
                                releaseDate:
                                    snapshot.data![index].fields.releaseDate,
                                review: snapshot.data![index].fields.review,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: const [
                              BoxShadow(color: Colors.black, blurRadius: 2.0)
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data![index].fields.title}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
            }
          }
        },
      ),
    );
  }
}
