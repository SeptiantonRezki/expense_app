import 'package:flutter/material.dart';

import '../widgets/about_us_widget.dart';
import '../widgets/alert_select_month_widget.dart';

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
                    return const AlertDialog(
                      title: Text(
                        "Pilih Bulan",
                        textAlign: TextAlign.center,
                      ),
                      content: AlertSelectMonthWidget(),
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
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text(
                        "Tentang Kami",
                        textAlign: TextAlign.center,
                      ),
                      content: AboutUsWidget(),
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}
