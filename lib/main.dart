import 'package:cart_example/logic/blocs/cart/cart_bloc.dart';
import 'package:cart_example/logic/blocs/product/product_bloc.dart';
import 'package:cart_example/screens/appview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => ProductBloc()),
      ],
      child: MaterialApp(home: AppView()),
    );
  }
}
