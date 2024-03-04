import 'dart:async';
import 'dart:convert';

import 'package:apna_advocate/constant/color.dart';
import 'package:apna_advocate/constant/keys.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';


class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Future<List<dynamic>?> _carouselData; // Declare as late Future

  @override
  void initState() {
    super.initState();
    _carouselData = loadCarousel(); // Load carousel data once
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 0, right: 18, left: 18),
      child: Column(
        children: [
          FutureBuilder(
            future: _carouselData, // Use the loaded future
            builder: (context, AsyncSnapshot<List<dynamic>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                // Build carousel using loaded data
                return CarouselWithIndicator(
                  pageController: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  graphicList: snapshot.data!,
                  currentPage: _currentPage,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}


class CarouselWithIndicator extends StatefulWidget {
  final PageController pageController;
  final ValueChanged<int> onPageChanged;
  final List<dynamic> graphicList;
  final int currentPage;

  CarouselWithIndicator({
    required this.pageController,
    required this.onPageChanged,
    required this.graphicList,
    required this.currentPage,
  });

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 6), (Timer timer) {
      final int nextPage = (widget.currentPage + 1) % widget.graphicList.length;
      widget.pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 138,
          width: 400,
          child: PageView.builder(
            controller: widget.pageController,
            onPageChanged: widget.onPageChanged,
            itemCount: widget.graphicList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 18),
                child: InkWell(
                  onTap: ()async{

                  },
                  child: Container(
                    height: 230,
                    width: 356,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: Skeletonizer(
                            child: Container(
                              width: 400,
                              height: 200,
                              decoration: BoxDecoration(
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: CachedNetworkImage(
                              placeholder: (context, url) => Image.memory(kTransparentImage),
                              imageUrl: '${widget.graphicList[index]["image_url"]}',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        // Spacer between carousel and indicators
        // Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.graphicList.length,
                (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                width: widget.currentPage == index ? 13 : 10, // Adjust the width
                height: widget.currentPage == index ? 10 : 7, // Adjust the height
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.currentPage == index ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


Future<List<dynamic>?> loadCarousel() async {
  final Uri uri = Uri.parse("${keys.base_url}/carouselads");

  try {
    final response = await http.get(uri);
    List<dynamic> jsonResponse = json.decode(response.body);
    print(jsonResponse.length);
    return jsonResponse;
  } catch (error) {
    print(error);
    return null; // or handle the error appropriately
  }
}




