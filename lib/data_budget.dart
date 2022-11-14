import 'package:flutter/material.dart';
import 'main.dart';
import 'form.dart';
import 'my_drawer.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({super.key, required this.data, required this.addData});
  final List<Budget> data;
  final Function(Budget) addData;
  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ),
      // Menambahkan drawer menu
      drawer: MyDrawer(
        data: widget.data,
        addData: widget.addData,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            itemCount: widget.data.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: ListTile(
                    tileColor: Colors.white,
                    title: Text(
                      widget.data[index].judul,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(widget.data[index].nominal.toString()),
                    trailing: Text(widget.data[index].tipeBudget),
                  ),
                ),
              );
            })),
      ),
    );
  }
}
