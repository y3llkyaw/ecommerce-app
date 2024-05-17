import 'package:bloc/bloc.dart';
import 'package:cart_example/logic/models/product.dart';
import 'package:equatable/equatable.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial(const [])) {
    on<CartAdd>((event, emit) {
      if (!state.items.contains(event.item)) {
        print('add');
        List<Product> updatedItems = List.from(state.items)..add(event.item);
        emit(CartUpdated(updatedItems));
      } else {
        List<Product> updatedItems = List.from(state.items);
        emit(CartAlreadyAdded(updatedItems));
      }
    });
    on<CartRemove>((event, emit) {
      List<Product> updatedItems = List.from(state.items)..remove(event.item);
      emit(CartUpdated(updatedItems));
    });
  }
}
