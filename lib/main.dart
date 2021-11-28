import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/app_router.dart';
import '../config/custom_app_route.dart';
import '../bloc/expense/expense_bloc.dart';
import '../bloc/simple_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ExpenseBloc()
              ..add(
                ExpenseStartedEvent(),
              ),
          ),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Spending App",
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: CustomAppRoute.homeScreen,
        ));
  }
}
