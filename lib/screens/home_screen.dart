import 'package:flutter/material.dart';
import 'package:spending_app/widgets/alert_add_expense_widget.dart';

import '../widgets/drawer_navigation_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            builder: (BuildContext context) => const AlertAddExpenseWidget(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
