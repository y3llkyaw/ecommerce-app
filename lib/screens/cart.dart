import 'package:cart_example/logic/blocs/cart/cart_bloc.dart';
import 'package:cart_example/logic/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart', style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 22
        ),),
      ),
      body: SafeArea(
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Items in the Cart',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      int totalPrice = 0;

                      for (Product product in state.items) {
                        totalPrice += product.price;
                      }
                      return Text(
                        "Totoal Price $totalPrice \$",
                      );
                    },
                  )
                ],
              ),
              BlocBuilder<CartBloc, CartState>(
                bloc: cartBloc,
                builder: (context, state) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: ((context, index) {
                        return TweenAnimationBuilder(
                          tween: Tween<double>(begin: 100, end: 0),
                          duration: const Duration(milliseconds: 500),
                          builder: (context, value, child) {
                            return Transform(
                              transform: Matrix4.translationValues(value, 0, 0),
                              child: child,
                            );
                          },
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 5, right: 5),
                              child: Card(
                                color: const Color.fromARGB(197, 171, 171, 171),
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              state.items[index].images[0],
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                return const Center(
                                                  child: Text(
                                                      'Failed to load image'),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 190,
                                            child: Text(
                                              state.items[index].title,
                                              maxLines: 2,
                                              overflow: TextOverflow.fade,
                                              style: const TextStyle(
                                                  fontSize: 15.0),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Price: ${state.items[index].price}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    cartBloc.add(CartRemove(
                                                        state.items[index]));
                                                  },
                                                  icon: const Icon(Icons
                                                      .remove_shopping_cart)),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(Icons.add)),
                                              const Text("1"),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon:
                                                      const Icon(Icons.remove)),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
