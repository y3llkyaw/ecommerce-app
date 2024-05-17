// ignore_for_file: must_be_immutable
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cart_example/logic/blocs/cart/cart_bloc.dart';
import 'package:cart_example/logic/blocs/product/product_bloc.dart';
import 'package:cart_example/logic/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({super.key, required this.product});
  Product product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    final productBloc = BlocProvider.of<ProductBloc>(context);
    return BlocProvider(
      create: (context) => productBloc,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(
            widget.product.title,
          ),
        ),
        body: BlocListener<CartBloc, CartState>(
          bloc: cartBloc,
          listener: (context, state) {
            if (state is CartUpdated) {
              toastification.show(
                context: context, // optional if you use ToastificationWrapper
                title: const Text('successfully added to cart !'),
                autoCloseDuration: const Duration(seconds: 2),
              );
            } else if (state is CartAlreadyAdded) {
              toastification.show(
                context: context, // optional if you use ToastificationWrapper
                title: const Text('this item is already in the cart'),
                autoCloseDuration: const Duration(seconds: 2),
              );
            }
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: widget.product.images.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      SizedBox(
                    child: Center(
                        child: Image.network(
                      widget.product.images[itemIndex],
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Center(
                          child: Text('Failed to load image'),
                        );
                      },
                    )),
                  ),
                  options: CarouselOptions(
                      height: 300,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3)),
                ),
                Transform(
                  transform: Matrix4.translationValues(0, -30, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Price: ${widget.product.price.toString()}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        "Sizes",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("M"),
                                        Radio(
                                            value: 'm',
                                            groupValue: "size",
                                            onChanged: null),
                                        Text("L"),
                                        Radio(
                                            value: 'm',
                                            groupValue: "size",
                                            onChanged: null),
                                        Text("XL"),
                                        Radio(
                                            value: 'm',
                                            groupValue: "size",
                                            onChanged: null),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            Text(
                              widget.product.description,
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.grey.shade100,
          onPressed: () {
            cartBloc.add(CartAdd(widget.product));
          },
          child: const Icon(Icons.add_shopping_cart),
        ),
      ),
    );
  }
}
