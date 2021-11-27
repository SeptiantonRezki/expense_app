part of 'expense_bloc.dart';

abstract class ExpenseState extends Equatable {
  const ExpenseState();

  @override
  List<Object> get props => [];
}

class ExpenseLoadingState extends ExpenseState {}

class ExpenseLoadedState extends ExpenseState {
  final List<Map> expenseList;

  const ExpenseLoadedState({
    this.expenseList = const [],
  });

  ExpenseLoadedState copyWith({
    List<Map>? newExpenseList,
  }) {
    return ExpenseLoadedState(
      expenseList: newExpenseList ?? expenseList,
    );
  }

  @override
  List<Object> get props => [expenseList];
}

class ExpenseErrorState extends ExpenseState {
  final Object error;

  const ExpenseErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
