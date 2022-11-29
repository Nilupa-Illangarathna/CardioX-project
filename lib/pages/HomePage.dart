import 'dart:async';
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../classes/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../Constants/constants.dart';
import '../Widgets/ResultModelBottomSheet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart';
import '../classes/data.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';


//Globle variables
bool Running_a_Single_Process=false;

class HomePage extends StatefulWidget {
  HomePage({this.app});
  final FirebaseApp app;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final referenceDatabase = FirebaseDatabase.instance;

  var Firebase_Snapshot;
  int Timer_value=4000; //in milliseconds
  bool Is_Loading=false;
  int Progress_bar_percentage=0;
  bool Fetch_Data=false; //Data Fetched From The Database
  Timer timer;

  //Important (Data From Firebase Saved Here)
  var From_Firebase_To_App;


  void SetTheState(){setState(() {});}

  void Change_Progress_Bar_Value(){
    setState(() {
      Progress_bar_percentage<100?
      Progress_bar_percentage+=1:
      Progress_bar_percentage=100;
    });
  }

  void fetch_API_Response()async{
    String rawJson = jsonEncode(From_Firebase_To_App);
    print(rawJson);
    final response = await post(Uri.parse(User_Data_Object.url),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: rawJson);

    print(response.toString());
  }


  //Animation related
  double marginTop;
  double start;
  double end;
  double increment;

  void bounce(Timer t) async {
    if (marginTop < end) {
      setState(() {
        marginTop += increment;
      });
    } else {
      t.cancel();
    }
  }

  void interpolate(double start, double end) {
    setState(() {
      increment = (end - start) / 60;
    });
  }

  @override
  void initState() {
    super.initState();
    marginTop = 0;
    start = 0;
    end = 1000;
    interpolate(start, end);
    Timer.periodic(const Duration(milliseconds: 14), bounce);
  }














  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference();



    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

//Background
          Stack(
            children: [


              Is_Loading?
//Loading gif
              Positioned(
                right: 0,
                top: 310,
                child:  Image.asset(
                  'assets/HomesceenAssets/HomescreenFetchLoadingGIF.gif',
                  width: 190,
                  height: 190,
                  fit: BoxFit.contain,
                ),
              )
                  :
              Positioned(
                right: -180 +180*marginTop/1000,
                top: 315,
                child:  Image.asset(
                  'assets/HomesceenAssets/StaticGIFImage.jpg',
                  width: 190,
                  height: 190,
                  fit: BoxFit.contain,
                ),
              ),

//Helping Image
              Positioned(
                bottom: 0,
                right:0,
                child: Container(
                  width: MediaQuery.of(context).size.width*((MediaQuery.of(context).size.height/MediaQuery.of(context).size.width)<1.75? 1/2 :1/2)*marginTop/1000,
                  child: Image(
                    fit: BoxFit.fitWidth,
                    image: AssetImage("assets/HomesceenAssets/HomeScreenBackground.png"),
                  ),
                ),
              ),

//Other vectors
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20+marginTop/100,right: 20+marginTop/((MediaQuery.of(context).size.height/MediaQuery.of(context).size.width)<1.75? 4.5 :5),top: 30,left: ((MediaQuery.of(context).size.height/MediaQuery.of(context).size.width)<1.75? 30 :30)),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image(
                        fit: BoxFit.fitWidth,
                        image: AssetImage("assets/HomesceenAssets/CardioXLOGOjpg.jpg"),
                      ),
                    ),
                  ),

                  // Image.asset('assets/HomesceenAssets/HomeScreenBackground.png'),
                  Stack(
                    children:  <Widget>[
                      //BottomBlue Vector
                      Positioned(
                        bottom: 0,
                        left:0,
                        child: Container(
                          width: marginTop<500? 0 : MediaQuery.of(context).size.width*((MediaQuery.of(context).size.height/MediaQuery.of(context).size.width)<1.75? 1/2 :2/3)*(marginTop)/1000,
                          child: Image(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("assets/HomesceenAssets/bottomVector.png"),
                          ),
                        ),
                      ),
                      // Top left vector
                      Positioned(
                        top: 1-marginTop/1000,
                        right:0,
                        child: Container(
                          width: MediaQuery.of(context).size.width*(3/7)*marginTop/1000,
                          child: Image(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("assets/HomesceenAssets/TopVector.png"),
                          ),
                        ),
                      ),
                    ],
                  ),


                ],
              )
            ],
          ),


          Positioned(
            left: 0,
            bottom: MediaQuery.of(context).size.height*0.1,
            child: Padding(
              padding: EdgeInsets.all(20.0*marginTop/1000),
              child: ElevatedButton(
                onPressed: Running_a_Single_Process? null: (){
                  Fetch_Data=true;
                  Running_a_Single_Process=true;
                  setState(() {});
                  Progress_bar_percentage=0;
                  Timer.periodic(Duration(milliseconds: (Timer_value/100).toInt()), (Timer t) => Change_Progress_Bar_Value());
                  setState(() {
                    Is_Loading=true; /////////////////////////////////////////////////////////////////////////////////////////
                  });
                  Future.delayed(Duration(milliseconds: (Timer_value/3).toInt()), () {
                    setState(() {
                      fetch_API_Response();
                    });
                  });


                  /////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////
                  //Remove this before submitting
                  Future.delayed(Duration(milliseconds: (Timer_value/1.5).toInt()), () {
                    setState(() {
                      if (
                      From_Firebase_To_App["a77"]==0.028342719 &&
                          From_Firebase_To_App["a110"]==0.58293314 &&
                          From_Firebase_To_App["a22"]==0.73257374
                      ){
                        User_Data_Object.response=[true];
                      }
                      else{
                        User_Data_Object.response=[false]; //Normal
                      }
                      print(User_Data_Object.response);
                    });
                  });
                  /////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////
                  /////////////////////////////////////////////////////////////////////////////////////////


                  Future.delayed(Duration(milliseconds: Timer_value), () {
                    setState(() {
                      ResultModelBottomSheet(context,SetTheState);
                      Is_Loading? Is_Loading=false:Is_Loading=true; //////////////////////////////////////////////////////////
                    });
                  });





                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white.withOpacity(0.8*marginTop/1000),
                    fixedSize: Size(MediaQuery.of(context).size.width*0.3*marginTop/1000, MediaQuery.of(context).size.width*0.3*marginTop/1000),
                    shape:  CircleBorder(),
                    textStyle:  TextStyle(fontSize: 27*marginTop/1000)),
                child: const Text("START"),
              ),
            ),
          ),

          Fetch_Data? FirebaseAnimatedList(
          query: ref,
          defaultChild: Text("loading",style: TextStyle(color: Colors.transparent),),
          itemBuilder: (context, snapshot, animation, index){
            Map<String, dynamic> FromFirebaseToFlutterAppData = jsonDecode(jsonEncode(snapshot.value));
            Fetch_Data=false;
            From_Firebase_To_App=FromFirebaseToFlutterAppData;
            print(FromFirebaseToFlutterAppData.runtimeType);
          })
              : SizedBox(height: 0,width: 0,)


        ],
      ),

    );

    }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
