import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spending_app/bloc/expense/expense_bloc.dart';

import '../data/data.dart';
import '../models/money_model.dart';

class AlertSelectMonthWidget extends StatelessWidget {
  const AlertSelectMonthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseBloc, ExpenseState>(builder: (context, state) {
      if (state is ExpenseLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state is ExpenseLoadedState) {
        if (state.expenseMapList.keys.isEmpty) {
          return const Center(
            child: Text("Pengeluaran masih kosong."),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: state.expenseMapList.keys.map((item) {
                return ListTile(
                  title: Text(getDateTimeString(item)),
                  onTap: () {},
                );
              }).toList(),
            ),
          );
        }
      }

      return const Center(
        child: Text("Something went wrong!"),
      );
    });
  }
}
