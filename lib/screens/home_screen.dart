import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:spending_app/bloc/expense/expense_bloc.dart';
import 'package:spending_app/enum/category_type.dart';
import 'package:spending_app/models/money_model.dart';
import 'package:spending_app/widgets/alert_add_expense_widget.dart';

import '../widgets/drawer_navigation_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _elements = [
      {'name': 'John', 'group': 'Team A'},
      {'name': 'Will', 'group': 'Team B'},
      {'name': 'Beth', 'group': 'Team A'},
      {'name': 'Miranda', 'group': 'Team B'},
      {'name': 'Mike', 'group': 'Team C'},
      {'name': 'Danny', 'group': 'Team C'},
    ];

    List _expenseList = [
      MoneyModel(
        id: "id-03",
        label: "Wifi",
        money: 250000,
        categoryType: CategoryType.primer,
        dateTime: "11-11-2021",
      ).toMap(),
      MoneyModel(
        id: "id-04",
        label: "Pajak",
        money: 300000,
        categoryType: CategoryType.primer,
        dateTime: "12-11-2021",
      ).toMap(),
      MoneyModel(
        id: "id-05",
        label: "Makan",
        money: 70000,
        categoryType: CategoryType.primer,
        dateTime: "12-11-2021",
      ).toMap(),
      MoneyModel(
        id: "id-06",
        label: "Liburan",
        money: 500000,
        categoryType: CategoryType.primer,
        dateTime: "12-11-2021",
      ).toMap(),
      MoneyModel(
        id: "id-01",
        label: "Internet",
        money: 100000,
        categoryType: CategoryType.primer,
        dateTime: "10-11-2021",
      ).toMap(),
      MoneyModel(
        id: "id-02",
        label: "Pajak",
        money: 200000,
        categoryType: CategoryType.primer,
        dateTime: "11-11-2021",
      ).toMap(),
    ];

    return Scaffold(
      drawer: const DrawerNavigationWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Spending App"),
      ),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(builder: (context, state) {
        if (state is ExpenseLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ExpenseLoadedState) {
          if (state.expenseList.isEmpty) {
            return const Center(
              child: Text("Pengeluaran masih kosong."),
            );
          } else {
            return GroupedListView<dynamic, String>(
              elements: state.expenseList,
              groupBy: (item) => item["dateTime"],
              groupComparator: (value1, value2) => value2.compareTo(value1),
              itemComparator: (item1, item2) =>
                  item1["label"].compareTo(item2["label"]),
              order: GroupedListOrder.ASC,
              // useStickyGroupSeparators: true,
              groupSeparatorBuilder: (String value) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              itemBuilder: (c, item) {
                return Card(
                  elevation: 8.0,
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      leading: Icon(Icons.account_circle),
                      title: Text(item["label"]),
                      trailing: Icon(Icons.arrow_forward),
                    ),
                  ),
                );
              },
            );
          }
        }

        return const Center(
          child: Text("Something went wrong!"),
        );
      }),
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
