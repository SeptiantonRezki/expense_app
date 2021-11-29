import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/money_model.dart';
import '../bloc/expense/expense_bloc.dart';

class AlertSelectMonthWidget extends StatelessWidget {
  const AlertSelectMonthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseBloc, ExpenseState>(builder: (context, state) {
      if (state is ExpenseLoadingState) {
        return const SingleChildScrollView(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (state is ExpenseLoadedState) {
        if (state.expenseMapList.keys.isEmpty) {
          return const SingleChildScrollView(
            child: Center(
              child: Text("Pengeluaran masih kosong."),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: state.expenseMapList.keys.map((item) {
                return ListTile(
                  title: Text(getDateTimeString(item)),
                  trailing: state.selectedExpenseDate == item
                      ? const CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 8.0,
                        )
                      : const SizedBox(),
                  onTap: () {
                    context.read<ExpenseBloc>().add(
                          ExpenseChangeSelectedDateEvent(selectedDate: item),
                        );

                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          );
        }
      }

      return const SingleChildScrollView(
        child: Center(
          child: Text("Something went wrong!"),
        ),
      );
    });
  }
}
