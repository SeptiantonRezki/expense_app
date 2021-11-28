import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:spending_app/widgets/expense_widget.dart';

import '../enum/category_type.dart';
import '../models/money_model.dart';
import '../bloc/expense/expense_bloc.dart';
import '../widgets/alert_add_expense_widget.dart';

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
          if (state.expenseList.isEmpty && state.selectedExpenseDate.isEmpty) {
            return const Center(
              child: Text("Pengeluaran masih kosong."),
            );
          } else {
            return ExpenseWidget(
              expenseMapList: state.expenseMapList,
              selectedExpenseDate: state.selectedExpenseDate,
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
