import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_relise_app/bloc/cart/cart_bloc.dart';
import 'package:test_relise_app/bloc/cart/cart_event.dart';
import 'package:test_relise_app/bloc/pricelist/price_bloc.dart';
import 'package:test_relise_app/bloc/pricelist/price_state.dart';
import 'package:test_relise_app/models/pricelist.dart';

class AllProductsWidget extends StatefulWidget {
  const AllProductsWidget({super.key});

  @override
  State<AllProductsWidget> createState() => _AllProductsWidgetState();
}

class _AllProductsWidgetState extends State<AllProductsWidget> {
  List suratho = [
    "images/1726575561_92904.jpg",
    "images/1726572570_45125.jpg",
    "images/1726572462_54888.jpg",
    "images/1726572272_68411.jpg",
    "images/1726571865_77875.jpg",
    "images/1726571719_43949.jpg",
    "images/1726570689_21211.jpg",
    "images/1726568740_96739.jpg",
    "images/1726575561_92904.jpg",
    "images/1726572570_45125.jpg",
    "images/1726572462_54888.jpg",
    "images/1726572272_68411.jpg",
    "images/1726571865_77875.jpg",
    "images/1726571719_43949.jpg",
    "images/1726570689_21211.jpg",
    "images/1726568740_96739.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 5,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "All products",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "View All",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    Icon(
                      Icons.arrow_circle_right_sharp,
                      color: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Text(
              "All products",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
          BlocBuilder<PriceBloc, PriceState>(
            builder: (context, state) {
              if (state is PriceLoadingState) {
                return SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 170,
                            color: Colors.amber,
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 170,
                            color: Colors.amber,
                          ),
                        ],
                      )),
                );
              } else if (state is PriceLoadedState) {
                return Container(
                  width: double.infinity,
                  height: 310,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Pricelist priseList = state.priceList[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Container(
                            width: 170,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "${suratho[index]}"))),
                                      ),
                                      Text(
                                        "${priseList.name}",
                                        style: TextStyle(color: Colors.white),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 5,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "${priseList.price} \$",
                                                  style: TextStyle(
                                                      color: Colors.green),
                                                ),
                                                Text(
                                                  "${priseList.price! * 1.5} \$",
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    decorationColor:
                                                        Colors.white,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: 60,
                                              height: 30,
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Text(
                                                  "6 PC",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: ContinuousRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            backgroundColor:
                                                Theme.of(context).primaryColor),
                                        onPressed: () {
                                          context
                                              .read<CartBloc>()
                                              .add(AddToCartEvent(priseList));
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.shopping_basket_rounded,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "Add to Cart",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(),
                      itemCount: state.priceList.length),
                );
              } else if (state is PriceErrorState) {
                return Text("${state.error}");
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
