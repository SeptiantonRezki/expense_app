import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/money_model.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(ExpenseLoadingState()) {
    on<ExpenseStartedEvent>(_onExpenseStartedEvent);
    on<ExpenseAddNewEvent>(_onExpenseAddNewEvent);
    on<ExpenseChangeSelectedDateEvent>(_onExpenseChangeSelectedDateEvent);
  }

  // Load semua data.

  _onExpenseStartedEvent(
      ExpenseStartedEvent event, Emitter<ExpenseState> emit) async {
    emit(ExpenseLoadingState());

    try {
      await Future.delayed(const Duration(seconds: 1)).whenComplete(
        () => emit(
          const ExpenseLoadedState(expenseMapList: {}),
        ),
      );
    } catch (error) {
      emit(
        ExpenseErrorState(error: error),
      );
    }
  }

  // Menambah pengeluaran ke dalam map.
  // Contoh: {}
  // Tambah data: { "11-2021": [ money.toMap() ] }
  // Jika sudah ada: { "11-2021": [ money.toMap(), money2.toMap() ] }
  // Gunakan spread (...) untuk mengambil seluruh data.

  _onExpenseAddNewEvent(
      ExpenseAddNewEvent event, Emitter<ExpenseState> emit) async {
    final state = this.state;

    if (state is ExpenseLoadedState) {
      try {
        final dateTimeArray = event.money.dateTime.split("-");

        final year = dateTimeArray[0];
        final month = dateTimeArray[1];

        final currentMonth = "$month-$year";

        if (state.expenseMapList.containsKey(currentMonth)) {
          final currentExpense = state.expenseMapList[currentMonth];

          emit(
            state.copyWith(newExpenseMapList: {
              ...state.expenseMapList,
              currentMonth: [
                ...currentExpense!,
                event.money.toMap(),
              ]
            }, newSelectedExpenseDate: currentMonth),
          );
        } else {
          emit(
            state.copyWith(newExpenseMapList: {
              ...state.expenseMapList,
              currentMonth: [event.money.toMap()]
            }, newSelectedExpenseDate: currentMonth),
          );
        }
      } catch (error) {
        emit(
          ExpenseErrorState(error: error),
        );
      }
    }
  }

  // Mengganti bulan yang yang dipilih untuk ditampilakn.

  _onExpenseChangeSelectedDateEvent(
      ExpenseChangeSelectedDateEvent event, Emitter<ExpenseState> emit) async {
    final state = this.state;

    if (state is ExpenseLoadedState) {
      try {
        emit(
          state.copyWith(
            newSelectedExpenseDate: event.selectedDate,
          ),
        );
      } catch (error) {
        emit(
          ExpenseErrorState(error: error),
        );
      }
    }
  }
}
