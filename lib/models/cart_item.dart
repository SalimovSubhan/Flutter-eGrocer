import 'package:test_relise_app/models/pricelist.dart';

class Cartitem {
   final Pricelist? pricelist;
  final int? price;
   int? qty;
  Cartitem(this.pricelist,this.qty,this.price);
}