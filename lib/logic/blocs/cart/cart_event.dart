part of 'cart_bloc.dart';

sealed class CartEvent {}

final class CartAdd extends CartEvent {
  final Product item;
  CartAdd(this.item);
}

final class CartRemove extends CartEvent {
  final Product item;
  CartRemove(this.item);
}
