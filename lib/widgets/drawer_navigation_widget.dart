import 'package:flutter/material.dart';

class DrawerNavigationWidget extends StatelessWidget {
  const DrawerNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                "Spending App",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.home,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Pengeluaran",
                )
              ],
            ),
            onTap: () {
              print("Pengeluaran");
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.calendar_view_month,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Pilih Bulan",
                )
              ],
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Pilih Bulan"),
                      content: StatefulBuilder(builder: (context, setState) {
                        return SingleChildScrollView(
                            child: Column(
                          children: [],
                        ));
                      }),
                    );
                  });
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.info,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Tentang Kami",
                )
              ],
            ),
            onTap: () {
              print("Tentang Kami");
            },
          )
        ],
      ),
    );
  }
}
