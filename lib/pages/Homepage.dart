import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/Model/Bid.dart';
import 'package:flutter_app2/Model/Person.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Details_page.dart';

final List<Bid> bidList = [
  new Bid(
      name: "Abstract Liquid",
      imgURL:
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      endTime: DateTime.now().millisecondsSinceEpoch + 10000 * 30,
      owener: new Person(name: "Minasie Alemu", total_balance: "0.000089")),
  new Bid(
      name: "Total Tester",
      imgURL:
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      endTime: DateTime.now().millisecondsSinceEpoch + 10000 * 60,
      owener: new Person(name: "William Danie", total_balance: "0.000777")),
  new Bid(
      name: "Android Studio",
      imgURL:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      endTime: DateTime.now().millisecondsSinceEpoch + 10000 * 10,
      owener: new Person(name: "William Danie", total_balance: "0.000777")),
  new Bid(
      name: "Android Studio",
      imgURL:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      endTime: DateTime.now().millisecondsSinceEpoch + 10000 * 30000,
      owener: new Person(name: "William Danie", total_balance: "0.000777"))
];
final List<String> imgList = [
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',

];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onEnd() {
      print('worked');
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          // title: Text(
          //   "Carousel Example",
          //   style: GoogleFonts.mcLaren(
          //       color: Colors.whi, fontWeight: FontWeight.bold),
          // ),
          // toolbarHeight: 80,
          elevation: 0,
          leading: Icon(
            Icons.widgets_outlined,
            color: Colors.black26,
            size: 30,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.search_off_outlined,
                  color: Colors.black26,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.add_alarm_rounded,
                  color: Colors.black26,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white70,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Live Auctions',
                  style: GoogleFonts.pacifico(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: CarouselSlider(
                      items: bidList
                          .map((bid) => GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AuctionDetails(bid: bid,)));
                                },
                                child: Container(
                                  child: Card(
                                    elevation: 4,
                                    margin:
                                        EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    // shadowColor: Colors.white,
                                    // color: Colors.white70,
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            child: Image.network(
                                              bid.imgURL,
                                              fit: BoxFit.fill,
                                              height: 600,
                                            ),
                                          ),
                                        ),
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                padding: EdgeInsets.fromLTRB(
                                                    8.0, 8.0, 8.0, 8.0),
                                                child: Center(
                                                  child: ElevatedButton(
                                                    onPressed: null,
                                                    style: ButtonStyle(
                                                      // backgroundColor:
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(Colors
                                                                  .greenAccent),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: CountdownTimer(
                                                        onEnd: onEnd,
                                                        endTime: bid.endTime,
                                                        textStyle:
                                                            GoogleFonts.aBeeZee(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              //////
                                            ])
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                      options: CarouselOptions(
                        autoPlay: false,
                        // aspectRatio: 2.0,
                        viewportFraction: .7,
                        enlargeCenterPage: true,
                      )),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Abstract Liquid",
                    style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                        imgList[0],
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Owner',
                            style: GoogleFonts.ubuntu(
                                color: Colors.black54, fontSize: 18),
                          ),
                          Text(
                            'Jenny Wilson',
                            style: GoogleFonts.quantico(fontSize: 20),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Top Sellers',
                  style: GoogleFonts.quintessential(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    _maindd(),
                    _maindd(),
                    _maindd(),
                    _maindd(),
                    _maindd(),
                    _maindd(),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

Widget _maindd() {
  return (Column(
    children: [
      Row(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
              imgList[0],
            ),
            backgroundColor: Colors.transparent,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Eleanor Pena',
                  style: GoogleFonts.ubuntu(fontSize: 18),
                ),
                SizedBox(height: 7.0),
                Text(
                  '0.000053 BTC',
                  style:
                      GoogleFonts.quantico(color: Colors.black54, fontSize: 20),
                )
              ],
            ),
          ),
          SizedBox(
            width: 150,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(40)),
            child: Icon(
              Icons.arrow_upward,
              color: Colors.white,
              size: 40,
            ),
          )
        ],
      ),
    ],
  ));
}
