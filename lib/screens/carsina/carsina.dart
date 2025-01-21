import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_relise_app/bloc/carsina_search/carsina_search_bloc.dart';
import 'package:test_relise_app/bloc/cart/cart_bloc.dart';
import 'package:test_relise_app/bloc/cart/cart_event.dart';
import 'package:test_relise_app/bloc/cart/cart_state.dart';
import 'package:test_relise_app/bloc/pricelist/price_bloc.dart';
import 'package:test_relise_app/bloc/pricelist/price_state.dart';
import 'package:test_relise_app/repository/priseListrepository.dart';
import 'package:test_relise_app/screens/carsina/widgets/search_delegate.dart';
import 'package:http/http.dart' as http;
import 'package:test_relise_app/utiles/http_statuscode.dart';

int cnt = 0;

class Carsina extends StatefulWidget {
  const Carsina({super.key});

  @override
  State<Carsina> createState() => _CarsinaState();
}

class _CarsinaState extends State<Carsina> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    registration();
  }

  Future registration() async {
    var response = await http.post(
      Uri.parse("http://192.168.100.59:8000/api/register"),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        'name': 'Subhon',
        'email': 'subhansalimov08@gmail.com',
        'password': 'subhon08',
      }),
    );
    if (HttpStatuscode.succsess.contains(response.statusCode)) {
      print("Маладес: ${response.body}");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 110,
          backgroundColor: Color.fromARGB(255, 46, 44, 44),
          leadingWidth: double.infinity,
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              Row(
                children: [
                  SizedBox(width: 15),
                  Text(
                    "Wishlist",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      CarsinaSearchBloc bloc3 =
                          CarsinaSearchBloc(Priselistrepository());
                      bloc3.add(CarsinaSearchGetPriceLIst());
                      showSearch(
                              context: context, delegate: CastomSearch(bloc3))
                          .whenComplete(
                        () {
                          bloc3.close();
                        },
                      );
                    },
                    child: SizedBox(
                      width: 250,
                      height: 45,
                      child: TextField(
                        ignorePointers: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          label: Text(
                            "Search Products",
                            style: TextStyle(color: Colors.grey),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.mic,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.qr_code_2_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ],
              )
            ],
          ),
          actions: [
            Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.message_outlined,
                      color: Colors.green,
                      size: 30,
                    )),
              ],
            )
          ],
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final list = state.stateModal.cartItem[index];
                  final priselist = list.pricelist;
                  int qty = list.qty!;
                  return Card(
                    child: ListTile(
                      title: Text("${priselist!.name}"),
                      subtitle: Text("${list.price}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(DecrementFromCart(priselist));
                                context.read<CartBloc>().add(ComplektCart());
                              },
                              icon: Icon(Icons.remove)),
                          Text(
                            "$qty",
                            style: TextStyle(fontSize: 20),
                          ),
                          IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(AddToCartEvent(priselist));
                                context.read<CartBloc>().add(ComplektCart());
                              },
                              icon: Icon(Icons.add)),
                          IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(RemoveFromCart(priselist));
                                context.read<CartBloc>().add(ComplektCart());
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: state.stateModal.cartItem.length);
          },
        ));
  }
}
