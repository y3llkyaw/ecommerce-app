import 'package:cart_example/logic/blocs/product/product_bloc.dart';
import 'package:cart_example/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);
    if (productBloc.state.props.isEmpty) {
      productBloc.add(ProductLoadingEvent());
    }
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Product of the Day',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'show all',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<ProductBloc, ProductState>(
                  bloc: productBloc,
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return const SizedBox(
                          height: 300,
                          child: Center(child: CircularProgressIndicator()));
                    }
                    if (state is ProductLoaded) {
                      return SizedBox(
                          height: 300,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.products.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Center(
                                    child: ClipRRect(
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Hero(
                                            tag:
                                                'item-${state.products[index].id}',
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: InkWell(
                                                onTap: () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProductDetail(
                                                                product: state
                                                                        .products[
                                                                    index]))),
                                                child: Image.network(
                                                    errorBuilder: (context,
                                                            error,
                                                            stackTrace) =>
                                                        const SizedBox(
                                                          height: 300,
                                                          width: 300,
                                                          child: Center(
                                                            child: Text(
                                                                'Error laoding Images'),
                                                          ),
                                                        ),
                                                    height: 300,
                                                    width: 300,
                                                    state.products[index]
                                                        .images[0]),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            height: 50,
                                            width: 300,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                ),
                                                color: Colors.black45
                                                    .withOpacity(0.3)),
                                            child: Column(
                                              children: [
                                                Text(
                                                  state.products[index].title,
                                                  overflow: TextOverflow.fade,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }));
                    }
                    if (state is ProductLoadingError) {
                      return const Text('Product Loading Error');
                    }
                    return const Text('Product Loading Error');
                  }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Trending',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'show all',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
