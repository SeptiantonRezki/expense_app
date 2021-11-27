import 'package:flutter/material.dart';
import 'package:spending_app/data/data.dart';

import '../widgets/drawer_navigation_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _expenseName = TextEditingController();
  String _selectedCategory = categoryTypeList[0];
  TextEditingController _expenseTotal = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2121),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerNavigationWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Spending App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text("Tambah Pengeluaran"),
              content: StatefulBuilder(builder: (context, setState) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: _expenseName,
                        decoration: const InputDecoration(
                          labelText: "Nama Pengeluaran",
                        ),
                      ),
                      DropdownButton<String>(
                        value: _selectedCategory,
                        isExpanded: true,
                        itemHeight: 70.0,
                        underline: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedCategory = newValue!;
                          });
                        },
                        items: categoryTypeList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      TextField(
                        controller: _expenseTotal,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: "Banyak Pengeluaran",
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: ListTile(
                          title: const Text("Pilih Tanggal"),
                          subtitle: Text(_selectedDate.toString()),
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: _selectedDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2121),
                            );

                            if (picked != null && picked != _selectedDate) {
                              setState(() {
                                _selectedDate = picked;
                              });
                            }
                          },
                        ),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, "Cancel"),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    print(_expenseName.text);
                    print(_expenseTotal.text);
                    print(_selectedCategory);
                    print(_selectedDate);

                    Navigator.pop(context, "OK");
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
