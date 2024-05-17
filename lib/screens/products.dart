import 'package:cart_example/logic/blocs/product/product_bloc.dart';
import 'package:cart_example/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Products extends StatelessWidget {
  Products({super.key});

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                  bloc: productBloc,
                  builder: ((context, state) {
                    if (state is ProductLoaded) {
                      return GridView.builder(
                          itemCount: state.products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Center(
                                child: ClipRRect(
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      ClipRRect(
                                        // borderRadius: BorderRadius.circular(10),
                                        child: InkWell(
                                          onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductDetail(
                                                          product:
                                                              state.products[
                                                                  index]))),
                                          child: Image.network(
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  const SizedBox(
                                                    child: Center(
                                                      child: Text(
                                                          'Error laoding Images'),
                                                    ),
                                                  ),
                                              height: 300,
                                              width: 300,
                                              state.products[index].images[0]),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        height: 60,
                                        width: 300,
                                        decoration: BoxDecoration(
                                            color: Colors.black45
                                                .withOpacity(0.3)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              state.products[index].title,
                                              overflow: TextOverflow.fade,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                    return Container();
                  })),
            )
          ],
        ));
  }
}
