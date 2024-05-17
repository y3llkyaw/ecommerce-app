import 'package:bloc/bloc.dart';
import 'package:cart_example/logic/api/respository.dart';
import 'package:cart_example/logic/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductLoadingEvent>((event, emit) async {
      emit(ProductLoading());
      final apiRepo = ApiRepository();
      try {
        print("gettting products");
        final products = await apiRepo.getProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductLoadingError());
      }
    });
  }
}
