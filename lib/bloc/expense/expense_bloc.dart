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
  }

  _onExpenseStartedEvent(
      ExpenseStartedEvent event, Emitter<ExpenseState> emit) async {
    emit(ExpenseLoadingState());

    try {
      await Future.delayed(const Duration(seconds: 1)).whenComplete(
        () => emit(
          const ExpenseLoadedState(expenseList: []),
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
        emit(
          state.copyWith(
            newExpenseList: [
              ...state.expenseList,
              event.money.toMap(),
            ],
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
