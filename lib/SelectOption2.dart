import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'dashboard2.dart';
import 'Dashboard.dart';
import 'dashboard3.dart';
import 'dashboard5.dart';
import 'dashboard6.dart';
import 'dashboard7.dart';
import 'list.dart';
import 'registration.dart';
import 'Cluster Functions.dart';
import 'Group Functions.dart';

class SelectionOption2 extends StatefulWidget {
  final int MemberID,GroupID;
  SelectionOption2({this.MemberID,this.GroupID});


  @override
  _SelectionOption2State createState() => _SelectionOption2State(MemberID: MemberID,GroupID:GroupID);
}

enum TtsState { playing, stopped }

class _SelectionOption2State extends State<SelectionOption2> {
  final int MemberID,GroupID;
  _SelectionOption2State({this.MemberID,this.GroupID});
  FlutterTts flutterTts;
  dynamic languages;
  String language;
  double volume = 10;
  double pitch = 1;
  double rate = .7;


  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    flutterTts.setStartHandler(() {
      setState(() {
        print("playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _speak(word) async {
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);
    // print(await flutterTts.getLanguages);
    flutterTts.setLanguage("ml-IN");
    // print("check");
    if (word != null) {
      if (word.isNotEmpty) {
        var result = await flutterTts.speak(word);
        if (result == 1) setState(() => ttsState = TtsState.playing);
      }
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  Material myItems(String icon, String heading, int color, int position) {
    return Material(
      color: Colors.black54,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: InkWell(
        onTap: () {
          if (position == 2)
            //PendingLoanAmount
              {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => CF()));
            print(MemberID);
          }
          else if (position == 3)
            //Savings
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => GF()));
          else if (position == 4)
            //PaymentHistory
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Registration(GroupID :GroupID)));
          else if (position == 5)
            //Group info
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard(MemberID: MemberID)));
          else if (position == 7)
            //PaymentAlert
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard5(MemberID: MemberID)));
        }, // handle your onTap here
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // height: 20,
                        width: 75,
                        child: Text(
                          heading,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.0),
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            // child: Icon(icon,
                            // color: Colors.black,
                            // size: 30.0),
                            child: Image(
                                image: AssetImage(icon),
                                height: 80,
                                width: 100)),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      child: Text(
                        'play',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      height: 40,
                      minWidth: 30,
                      shape: CircleBorder(),
                      color: Colors.red,
                      onPressed: () {
                        _speak(heading); //Do something
                      },
                    )
                    // IconButton(icon: new Icon(Icons.audiotrack),
                    // onPressed: _speak(),
                    // iconSize: 40),
                    //  Material(
                    //   color: Colors.white,
                    //   borderRadius: BorderRadius.circular(24.0),
                    //   child: Padding(padding: const EdgeInsets.all(16.0),
                    //   child: Icon(Icons.audiotrack,
                    //   color: Colors.black,
                    //   size: 15.0,),
                    //   ),
                    // ),
                    // Container(
                    //   color: Colors.white,
                    // )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // speak( String word){
  //  flutterTts.speak(word);
  // }

  //  Future speak() async{
  //     var result = await flutterTts.speak("Hello World");
  //     if (result == 1) setState(() => ttsState = TtsState.playing);
  //  }

  //  Future stop() async{
  //    var result = await flutterTts.stop();
  //    if (result == 1) setState(() => ttsState = TtsState.stopped);
  //  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'അമൃതശ്രീ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          //myItems('assets/images/nextdue.jpg', "അടുത്ത അടവ് ", 0xffed622b, 1),
          myItems('assets/images/pendingpayment.png', "ക്ലസ്റ്റർ പ്രവർത്തനങ്ങൾ",
              0xffed622b, 2),
          myItems('assets/images/savings.jpg', "ഗ്രൂപ്പ് പ്രവർത്തനങ്ങൾ", 0xffed622b, 3),
//          myItems('assets/images/paymenthistory.png', "അടവ് വിവരങ്ങൾ ",
//              0xffed622b, 4),
          myItems(
              'assets/images/loandetails.png', "അംഗങ്ങളെ ചേർക്കുക", 0xffed622b, 5),
          myItems('assets/images/group.jpg', "ഹോം പേജ്", 0xffed622b, 6),
        ],
        staggeredTiles: [
          //StaggeredTile.extent(2, 150.0),
          //StaggeredTile.extent(2, 150.0),
          StaggeredTile.extent(2, 150.0),
          StaggeredTile.extent(2, 150.0),
          StaggeredTile.extent(2, 150.0),
          StaggeredTile.extent(2, 150.0),
          StaggeredTile.extent(2, 150.0),
          // StaggeredTile.extent(2, 150.0),
        ],
      ),
    );
  }
}
