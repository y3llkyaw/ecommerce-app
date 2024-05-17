// ignore_for_file: must_be_immutable

part of 'product_bloc.dart';

@immutable
sealed class ProductState extends Equatable {}

final class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

final class ProductLoading extends ProductState {
  @override
  List<Object?> get props => [];
}

final class ProductLoaded extends ProductState {
  List<Product> products;
  ProductLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

final class ProductLoadingError extends ProductState {
  @override
  List<Object?> get props => [];
}
