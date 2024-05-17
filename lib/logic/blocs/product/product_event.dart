part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class ProductLoadingEvent extends ProductEvent {}

class ProductLoadedEvent extends ProductEvent {}
