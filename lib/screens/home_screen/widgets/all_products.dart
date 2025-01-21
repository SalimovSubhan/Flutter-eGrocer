import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_relise_app/bloc/cart/cart_bloc.dart';
import 'package:test_relise_app/bloc/cart/cart_event.dart';
import 'package:test_relise_app/bloc/pricelist/price_bloc.dart';
import 'package:test_relise_app/bloc/pricelist/price_state.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  List suratho = [
    "images/1705582249_floar_01.jpg",
    "images/1705582285_chocolates_01.jpg",
    "images/1705582285_chips_01.jpg",
    "images/1705582249_floar_03.jpg",
    "images/1705582285_chips_04.jpg",
    "images/1705582303_candy_06.jpg",
    "images/1705582059_popcorn_03.jpg",
    "images/1705582059_popcorn_05.jpg",
    "images/1705582303_candy_04.jpg",
    "images/1705582261_coffee_03.jpg",
    "images/1705582303_chips_06.jpg",
    "images/1705582319_candy_11.jpg",
    "images/1705582303_candy_04.jpg",
    "images/1705582261_coffee_03.jpg",
    "images/1705582303_chips_06.jpg",
    "images/1705582319_candy_11.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<PriceBloc, PriceState>(
        builder: (context, state) {
          if (state is PriceLoadingState) {
            return CircularProgressIndicator();
          } else if (state is PriceLoadedState) {
            return ListView.builder(
              shrinkWrap: true,
              clipBehavior: Clip.none,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final priceList = state.priceList[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Container(
                            width: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage("${suratho[index]}"),
                                    fit: BoxFit.cover),
                                color: Colors.white),
                          ),
                          SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 190,
                                    child: Text(
                                      "${priceList.name}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.green,
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    "${priceList.price} \$",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 17),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "${priceList.price! * 1.5} \$",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 21,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 21,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 21,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 21,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 21,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "(5.0)",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "1 Pack",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(width: 5),
                                          Icon(
                                            Icons.arrow_drop_down_rounded,
                                            color: Colors.white,
                                            size: 30,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  InkWell(
                                    onTap: () {
                                      context
                                          .read<CartBloc>()
                                          .add(AddToCartEvent(priceList));
                                    },
                                    child: Container(
                                        width: 110,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 44, 79, 45),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.shopping_basket_outlined,
                                              color: Colors.green,
                                              size: 20,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "Add to Cart",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            )
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: state.priceList.length,
            );
          } else if (state is PriceErrorState) {
            return Text("${state.error}");
          }
          return Container();
        },
      ),
    );
  }
}
