import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCaruselWidget extends StatefulWidget {
  const HomeCaruselWidget({super.key});

  @override
  State<HomeCaruselWidget> createState() => _HomeCaruselWidgetState();
}

class _HomeCaruselWidgetState extends State<HomeCaruselWidget> {

  
  List cartinki = [
    "images/1706009972_90837.jpg",
    "images/1706009993_46236.jpg",
    "images/1706010005_61844.jpg",
    "images/1706010046_19908.jpg",
    "images/1706010060_95265.jpg",
    "images/1706010065_22047.jpg",
  ];

  int cnt = 0;
  @override
  Widget build(BuildContext context) {
    return SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                          width: double.infinity,
                          height: 280,
                          color: Colors.black,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: CarouselSlider.builder(
                                    itemCount: cartinki.length,
                                    itemBuilder: (context, index, realIndex) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 2),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      cartinki[index]),
                                                  fit: BoxFit.cover),
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      );
                                    },
                                    options: CarouselOptions(
                                      autoPlay: true,
                                      viewportFraction: 1,
                                      aspectRatio: 1.6,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          cnt = index;
                                        });
                                      },
                                    )),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int i = 0; i < cartinki.length; i++)
                                    Container(
                                      margin: EdgeInsets.all(5),
                                      width: cnt == i ? 20 : 8,
                                      height: cnt == i ? 8 : 8,
                                      decoration: BoxDecoration(
                                          color: cnt == i
                                              ? Colors.green
                                              : Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    childCount: 1),
              );
  }
}