import 'package:cart_example/logic/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends HydratedBloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial(const [])) {
    on<CartAdd>((event, emit) {
      if (!state.items.contains(event.item)) {
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

  @override
  CartState? fromJson(Map<String, dynamic> json) {
    try {
      List<Product> items = (json['items'] as List)
          .map((item) => Product.fromJson(item))
          .toList();
      return CartUpdated(items);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    try {
      return {
        'items': state.items.map((item) => item.toJson()).toList(),
      };
    } catch (e) {
      return null;
    }
  }
}
