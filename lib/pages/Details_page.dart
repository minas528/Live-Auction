import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/Model/Bid.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';

class AuctionDetails extends StatefulWidget {
  Bid bid;
  AuctionDetails({required this.bid});
  @override
  _AuctionDetailsState createState() => _AuctionDetailsState();
}

class _AuctionDetailsState extends State<AuctionDetails> {



  _displayDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 6,
            backgroundColor: Colors.transparent,
            child: _DialogWithTextField(context),
          );
        });
  }
   String bid ="0.0";
  Widget _DialogWithTextField(BuildContext context) => Container(
    height: 280,
    decoration: BoxDecoration(
      color:  Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    child: Column(
      children: <Widget>[
        SizedBox(height: 24),
        Text(
          "Place Your Bid".toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        SizedBox(height: 10),
        Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15),
            child: TextFormField(

              maxLines: 1,
              autofocus: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            )
        ),

        Container(
          width: 150.0,
          height: 1.0,
          color: Colors.grey[400],
        ),
        Padding(
            padding: EdgeInsets.only(top: 10, right: 15, left: 15),
            child: TextFormField(
              maxLines: 1,
              autofocus: false,
              keyboardType: TextInputType.number,
              onChanged:(String value){setState(() {
                bid=value;
              });},
              decoration: InputDecoration(
                labelText: 'Your bid',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            )
        ),
        SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(width: 8),
            RaisedButton(
              color: Colors.white,
              child: Text(
                "Bid".toUpperCase(),
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
              onPressed: () {

                print(bid);
                print(widget.bid.endTime);
                Navigator.of(context).pop();
                // return Navigator.of(context).pop(true);
              },
            )
          ],
        ),
      ],
    ),
  );


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        )
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 170,
            color: Colors.white60,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Card(
                        elevation: 4,
                        margin: EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 4.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        // shadowColor: Colors.white,
                        // color: Colors.white70,
                        child: Stack(
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.network(
                                  widget.bid.imgURL,
                                  fit: BoxFit.fill,
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                ),
                              ),
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding:
                                        EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                    child: Center(
                                      child: ElevatedButton(
                                        onPressed: null,
                                        style: ButtonStyle(
                                          // backgroundColor:
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.greenAccent),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CountdownTimer(
                                            onEnd: null,
                                            endTime: widget.bid.endTime,
                                            textStyle: GoogleFonts.aBeeZee(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ])
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 20, 0, 20),
                      child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Abstract Liquid",
                            style: GoogleFonts.milonga(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Center(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 20, 0, 20),
                      child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Description",
                            style: GoogleFonts.milonga(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 20, 0, 20),
                      child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod"
                                " tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim"
                                " veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea"
                                " commodo consequat.",
                            style: GoogleFonts.milonga(
                                color: Colors.black38, fontSize: 20),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Current Bid', style: GoogleFonts.habibi(fontSize: 17,color: Colors.black87),),
                      Text(
                        '${bid} ETH',
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      )
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: ElevatedButton(
                      onPressed: widget.bid.endTime > DateTime.now().millisecondsSinceEpoch? _displayDialog:null,
                      style: ButtonStyle(
                        // backgroundColor:
                        
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      child: Padding(

                        padding: const EdgeInsets.fromLTRB(13.0, 8.0, 13.0, 8.0),
                        child: Text(
                          'Place a Bid',
                          style: GoogleFonts.openSans(
                              fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
