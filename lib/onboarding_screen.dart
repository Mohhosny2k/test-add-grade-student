

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_student_app/home_page.dart';
import 'package:test_student_app/landing_page.dart';

import 'constants.dart';

class BoardingModel {
  final String? image;
  final String? title;
  BoardingModel({
    required this.image,
    required this.title,
  });
}

class onBoardingScreen extends StatefulWidget {
  onBoardingScreen({super.key});
  var boradControl = PageController();
  bool isLast = false;

  List<BoardingModel> boardingList = [
    BoardingModel(
        image: 'assets/images/1.png', title: 'Student 2020'),
    BoardingModel(
        image: 'assets/images/2.png', title: 'Student 2021'),
    BoardingModel(
        image: 'assets/images/3.png', title: 'Student 2022'),
  ];

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kPrimaryColorTwo,
      body: PageView.builder(
        onPageChanged: (int index) {
          if (index == widget.boardingList.length - 1) {
            setState(() {
              widget.isLast = true;
            });
            print('last');
          } else {
            print('no last');
            setState(() {
              widget.isLast = false;
            });
          }
        },
        controller: widget.boradControl,
        itemCount: widget.boardingList.length,
        itemBuilder: (context, index) {
          return BuildBoradingScreen(widget.boardingList[index]);
        },
      ),
    );
  }
TextButton textSkip(
  dynamic tap,
) {
  return TextButton(
      onPressed: tap,
      child: Text(
        'skip',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ));
}
  Widget BuildBoradingScreen(BoardingModel model) {
    return Column(
      children: [
        SizedBox(height: 20,),
          Center(
            child: Container(
              height: 490,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('${model.image}'))),
            ),
          ),

          Text('${model.title}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
SizedBox(
  height: 25,
),
                  Padding(
                    
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                    
                       textSkip(() {
                                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => LandingPage()));
                                }),
                        SmoothPageIndicator(
                          controller: widget.boradControl,
                          count: widget.boardingList.length,
                          effect: ExpandingDotsEffect(
                              activeDotColor: Colors.white,
                              dotColor: Colors.white70,
                              dotHeight: 10,
                              expansionFactor: 4,
                              dotWidth: 10,
                              spacing: 5),
                        ),
                        // Spacer(),
                        TextButton(
                          // style: TextButton.styleFrom(
                          //   backgroundColor: SharedColors.whiteColor,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(10.0),
                          //   ),
                           // fixedSize: Size(90, 45),
                         // ),
                          onPressed: () {
                            if (widget.isLast) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => LandingPage()));
                          
                            } else {
                              widget.boradControl.nextPage(
                                  duration: Duration(milliseconds: 750),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            }
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.yellow),
                          ),
                        ),
                      ],
                    ),
                  ),
      ],
    );
  }
}
