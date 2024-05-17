import 'package:cart_example/logic/blocs/cart/cart_bloc.dart';
import 'package:cart_example/screens/cart.dart';
import 'package:cart_example/screens/home.dart';
import 'package:cart_example/screens/products.dart';
import 'package:cart_example/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(children: [
        FloatingActionButton(
          tooltip: "cart",
          shape: const CircleBorder(),
          backgroundColor: Colors.grey.shade100,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Cart()));
          },
          child: const Icon(Icons.shopping_cart),
        ),
        BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state.items.isEmpty) {
            return Container();
          } else {
            return Transform(
                transform: Matrix4.translationValues(30, -15, 0),
                child: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    child: Text(
                      state.items.length.toString(),
                    )));
          }
        }),
      ]),
      bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.grey.shade300,
              items: [
                BottomNavigationBarItem(
                  icon: Transform(
                    transform: Matrix4.translationValues(0, 10, 0),
                    child: const Icon(
                      Icons.home,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Transform(
                    transform: Matrix4.translationValues(0, 10, 0),
                    child: const Icon(
                      Icons.shopping_bag,
                    ),
                  ),
                  label: 'Products',
                ),
                BottomNavigationBarItem(
                  icon: Transform(
                    transform: Matrix4.translationValues(0, 10, 0),
                    child: const Icon(
                      Icons.person_2,
                    ),
                  ),
                  label: 'Home',
                ),
              ])),
      body: [Home(), Products(), const Profile()][selectedIndex],
    );
  }
}
