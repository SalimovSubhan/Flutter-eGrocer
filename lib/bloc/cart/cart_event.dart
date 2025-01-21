import 'package:test_relise_app/models/pricelist.dart';

class CartEvent {}

class AddToCartEvent extends CartEvent {
  final Pricelist priceList;
  AddToCartEvent(this.priceList);
}

class RemoveFromCart extends CartEvent {
  final Pricelist pricelist;
  RemoveFromCart(this.pricelist);
}

class GetBundelCart extends CartEvent {}

class ComplektCart extends CartEvent{}

class DecrementFromCart extends CartEvent {
  final Pricelist pricelist;
  DecrementFromCart(this.pricelist);
}
