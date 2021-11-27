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
              groupSeparatorBuilder: (String value) => Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                    child: Text(
                      value,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    decoration: const BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.grey)))),
              ),
              itemBuilder: (c, item) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 8.0,
                          backgroundColor:
                              getCategoryColor(item["categoryType"]),
                        )
                      ],
                    ),
                    title: Text(
                      item["label"],
                    ),
                    subtitle: Text(item["dateTime"]),
                    trailing: Text("Rp ${getMoneyFormatted(item['money'])}"),
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
