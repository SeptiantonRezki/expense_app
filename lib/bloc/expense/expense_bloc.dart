import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// import '../../enum/category_type.dart';
import '../../models/money_model.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(ExpenseLoadingState()) {
    on<ExpenseStartedEvent>(_onExpenseStartedEvent);
    on<ExpenseAddNewEvent>(_onExpenseAddNewEvent);
    on<ExpenseChangeSelectedDateEvent>(_onExpenseChangeSelectedDateEvent);
  }

  _onExpenseStartedEvent(
      ExpenseStartedEvent event, Emitter<ExpenseState> emit) async {
    emit(ExpenseLoadingState());

    try {
      // await Future.delayed(const Duration(seconds: 1)).whenComplete(
      //   () => emit(
      //     const ExpenseLoadedState(expenseList: []),
      //   ),
      // );

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

        // emit(
        //   state.copyWith(
        //     newExpenseList: [
        //       ...state.expenseList,
        //       event.money.toMap(),
        //     ],
        //   ),
        // );
      } catch (error) {
        emit(
          ExpenseErrorState(error: error),
        );
      }
    }
  }

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
