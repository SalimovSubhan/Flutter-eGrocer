import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_relise_app/bloc/cart/cart_bloc.dart';
import 'package:test_relise_app/bloc/cart/cart_event.dart';
import 'package:test_relise_app/bloc/pricelist/price_bloc.dart';
import 'package:test_relise_app/bloc/pricelist/price_state.dart';

class FreshFruits extends StatefulWidget {
  const FreshFruits({super.key});

  @override
  State<FreshFruits> createState() => _FreshFruitsState();
}

class _FreshFruitsState extends State<FreshFruits> {
  List suratho = [
    "images/1726577315_80422.jpg",
    "images/1726565448_98799.jpg",
    "images/1726577584_50447.jpg",
    "images/1726577809_35468.jpg",
    "images/1726577979_47341.jpg",
    "images/1726578127_28422.jpg",
    "images/1726578363_60086.jpg",
    "images/1726578457_35954.jpg",
    "images/1726577315_80422.jpg",
    "images/1726565448_98799.jpg",
    "images/1726577584_50447.jpg",
    "images/1726577809_35468.jpg",
    "images/1726577979_47341.jpg",
    "images/1726578127_28422.jpg",
    "images/1726578363_60086.jpg",
    "images/1726578457_35954.jpg",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 70,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 5,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Fresh Fruits",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "View All",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.arrow_circle_right_sharp,
                                color: Colors.green,
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Favor the taste of freshness with our hand",
                            style: TextStyle(color: Colors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(
                          "images/j5ypph---c1905x1016x50px50p-up--7790c9dd93f9b886898b1c3d7b0bbb7e.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
          BlocBuilder<PriceBloc, PriceState>(
            builder: (context, state) {
              if (state is PriceLoadingState) {
                return CircularProgressIndicator();
              } else if (state is PriceLoadedState) {
                return Container(
                  width: double.infinity,
                  height: 310,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final priseList = state.priceList[index];
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
                                      Stack(children: [
                                        Container(
                                          width: double.infinity,
                                          height: 150,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "${suratho[index]}"),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Positioned(
                                          right: 3,
                                          top: 3,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 82, 78, 78),
                                            child: Icon(
                                              Icons.favorite_border_outlined,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ),
                                      ]),
                                      Text(
                                        "${priseList.name}",
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
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
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "6 Kg",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .arrow_drop_down_rounded,
                                                      color: Colors.white,
                                                    )
                                                  ],
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
                                          backgroundColor: const Color.fromARGB(
                                              255, 43, 69, 44),
                                        ),
                                        onPressed: () {
                                          context
                                              .read<CartBloc>()
                                              .add(AddToCartEvent(priseList));
                                        },
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.shopping_basket_rounded,
                                              color: Colors.green,
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
          Column(
            children: [
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 70,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 5,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "All Products",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "View All",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Icon(
                            Icons.arrow_circle_right_rounded,
                            color: Colors.green,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
