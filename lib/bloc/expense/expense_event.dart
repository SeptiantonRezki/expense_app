part of 'expense_bloc.dart';

abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();

  @override
  List<Object> get props => [];
}

class ExpenseStartedEvent extends ExpenseEvent {}

class ExpenseAddNewEvent extends ExpenseEvent {
  final MoneyModel money;

  const ExpenseAddNewEvent({required this.money});

  @override
  List<Object> get props => [money];
}

class ExpenseErrorEvent extends ExpenseEvent {
  final Object error;

  const ExpenseErrorEvent({required this.error});

  @override
  List<Object> get props => [error];
}
