import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_relise_app/bloc/cart/cart_bloc.dart';
import 'package:test_relise_app/bloc/cart/cart_event.dart';
import 'package:test_relise_app/bloc/pricelist/price_bloc.dart';
import 'package:test_relise_app/bloc/pricelist/price_state.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TopSelingProduct extends StatefulWidget {
  const TopSelingProduct({super.key});

  @override
  State<TopSelingProduct> createState() => _TopSelingProductState();
}

class _TopSelingProductState extends State<TopSelingProduct> {
  List suratho = [
    "images/1706013545_perfumes10.jpg",
    "images/1706013545_perfumes9.jpg",
    "images/1706013545_perfumes8.jpg",
    "images/1706013545_perfumes7.jpg",
    "images/1706013545_perfumes6.jpg",
    "images/1706013545_perfumes4.jpg",
    "images/1706013545_perfumes3.jpg",
    "images/1706013545_perfumes2.jpg",
    "images/1706013545_perfumes10.jpg",
    "images/1706013545_perfumes9.jpg",
    "images/1706013545_perfumes8.jpg",
    "images/1706013545_perfumes7.jpg",
    "images/1706013545_perfumes6.jpg",
    "images/1706013545_perfumes4.jpg",
    "images/1706013545_perfumes3.jpg",
    "images/1706013545_perfumes2.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<PriceBloc, PriceState>(
        builder: (context, state) {
          if (state is PriceLoadingState) {
            return Container();
          } else if (state is PriceLoadedState) {
            return Container(
              width: double.infinity,
              child: MasonryGridView.builder(
                clipBehavior: Clip.none,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.priceList.length,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final priseList = state.priceList[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            Container(
                              width: double.infinity,
                              height: 180,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.grey,
                                  image: DecorationImage(
                                      image: AssetImage("${suratho[index]}"),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                              top: 3,
                              right: 3,
                              child: CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 55, 49, 49),
                                radius: 18,
                                child: Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ]),
                          Text(
                            "${priseList.name}",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 10,
                          ),
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
                              SizedBox(width: 7),
                              Text(
                                "(5.0)",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "${priseList.price} \$",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 17),
                                  ),
                                  Text(
                                    "${priseList.price! * 1.5} \$",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.white),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        "50 ML",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.arrow_drop_down_rounded,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 68, 106, 70),
                                  shape: ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {
                                  context.read<CartBloc>().add(AddToCartEvent(priseList));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.shopping_basket_outlined,
                                    color: Colors.green,
                                    size: 25,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  );
                },
              ),
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
