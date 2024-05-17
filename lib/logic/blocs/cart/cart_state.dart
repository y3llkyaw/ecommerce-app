// ignore_for_file: must_be_immutable

part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  List<Product> items = [];
}

final class CartInitial extends CartState {
  List<Product> items;
  CartInitial(this.items);

  @override
  List<Object?> get props => [items];
}

final class CartUpdated extends CartState {
  final List<Product> items;
  CartUpdated(this.items);

  @override
  List<Object?> get props => [items];
}

final class CartAdded extends CartState {
  @override
  List<Object?> get props => [items];
}

final class CartAlreadyAdded extends CartState {
  final List<Product> items;
  CartAlreadyAdded(this.items);
  @override
  List<Object?> get props => [items];
}
