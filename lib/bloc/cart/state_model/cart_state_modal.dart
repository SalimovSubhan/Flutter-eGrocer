import 'package:test_relise_app/models/bundles.dart';
import 'package:test_relise_app/models/cart_item.dart';

class CartStateModal {
  final List<Cartitem> cartItem=[];
  final List<Bundles> bundels;
  final List<int> id;
  bool complekt;
  bool loadingBundl=false;
  Bundles? bunl;
  CartStateModal(this.bundels,this.complekt,this.id);
}