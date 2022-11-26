import 'dart:async';
import 'dart:async';
import 'dart:convert';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../classes/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../Constants/constants.dart';
import '../Widgets/ResultModelBottomSheet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


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

  int Timer_value=9000; //in milliseconds
  bool Is_Loading=true;
  int Progress_bar_percentage=0;
  bool Fetch_Data=false; //Data Fetched From The Database

  Timer timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void SetTheState(){setState(() {});}

  void Change_Progress_Bar_Value(){
    setState(() {
      Progress_bar_percentage<100?
      Progress_bar_percentage+=1:
      Progress_bar_percentage=100;
    });
  }

  function(snapshot){
    print(snapshot);
  }

  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference();



    return Scaffold(
      backgroundColor: HexColor("#3C9E91"),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.80,
                decoration: BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(250.0), topRight: Radius.circular(250.0), ),
                ),
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width * 0.4,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child:
                    Hero(
                      tag: "Splash",
                      child: Image.asset(
                        'assets/images/CardioXLOGOjpg.jpg',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: Running_a_Single_Process? null: (){

                          ////Write data to Firebase
                          // ref
                          //     .child("CardioX")
                          //     .set("Set")
                          //     .asStream();

                          Fetch_Data=true;

                          Running_a_Single_Process=true;
                          setState(() {});

                          Progress_bar_percentage=0;
                          Timer.periodic(Duration(milliseconds: (Timer_value/100).toInt()), (Timer t) => Change_Progress_Bar_Value());
                          setState(() {
                            Is_Loading=true; /////////////////////////////////////////////////////////////////////////////////////////
                          });
                          Future.delayed(Duration(milliseconds: Timer_value), () {
                            setState(() {
                              Fetch_Data=false;
                              ResultModelBottomSheet(context,SetTheState);
                              Is_Loading? Is_Loading=false:Is_Loading=true; //////////////////////////////////////////////////////////

                            });
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white.withOpacity(0.8),
                            fixedSize: Size(MediaQuery.of(context).size.width*0.4, MediaQuery.of(context).size.width*0.2),
                            textStyle: const TextStyle(fontSize: 30)),
                        child: const Text("START"),
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.3,
                        child: Is_Loading?


                        SfRadialGauge(axes: <RadialAxis>[
                          RadialAxis(
                            minimum: 0,
                            maximum: 100,
                            showLabels: false,
                            showTicks: false,
                            axisLineStyle: AxisLineStyle(
                              thickness: 0.2,
                              cornerStyle: CornerStyle.bothCurve,
                              color: Color.fromARGB(30, 0, 169, 181),
                              thicknessUnit: GaugeSizeUnit.factor,
                            ),
                            pointers: <GaugePointer>[
                              RangePointer(
                                // value: progressValue,
                                value: Progress_bar_percentage.toDouble(),

                                cornerStyle: CornerStyle.bothCurve,
                                width: 0.2,
                                sizeUnit: GaugeSizeUnit.factor,
                              )
                            ],
                          ),

                        ])


                            :
                        Container(height: 0,width: 0),
                      )
                    ],
                  ),
                ),
              ),







            ],
          ),


          Fetch_Data? FirebaseAnimatedList(
          query: ref,
          defaultChild: Text("loading"),
          itemBuilder: (context, snapshot, animation, index){
            Map<String, dynamic> FromFirebaseToFlutterAppData = jsonDecode(jsonEncode(snapshot.value));
            print(FromFirebaseToFlutterAppData);
          })
              : SizedBox(height: 0,width: 0,)


        ],
      ),

    );
  }
}




// class TEXTFIELD extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.transparent,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: <BoxShadow>[
//             BoxShadow(
//                 color: Colors.transparent,
//                 offset: const Offset(4, 4),
//                 blurRadius: 8),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(25),
//           child: Container(
//             height: MediaQuery.of(context).size.height*0.1,
//             padding: const EdgeInsets.all(4.0),
//             constraints: const BoxConstraints(minHeight: 80, maxHeight: 160),
//             color: Colors.white24.withOpacity(0.1),
//             child: SingleChildScrollView(
//               padding:
//               const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
//               child: TextField(
//                 // controller: DescriptionContraller,
//                 // onTap: FiltersForTheApp.voiceRecognitionWant? _listenTransectionsDescription : VoidFunc ,
//                 // inputFormatters: <TextInputFormatter>[
//                 //   FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
//                 // ],
//                 autocorrect: true,
//                 maxLength: 250,
//                 autofocus: false,
//                 onChanged: (val){
//                   // CategoryDescriptionInput=val;
//                 },
//                 maxLines: 3,
//                 style: TextStyle(
//                     fontFamily: 'WorkSans',
//                     fontSize: 16,
//                     // color: Color(0xFF313A44),
//                     color: Colors.white
//                 ),
//                 cursorColor: Colors.white24,
//                 decoration: InputDecoration(
//                   // icon: FiltersForTheApp.voiceRecognitionWant? FloatingActionButton(
//                   //   mini:true,
//                   //   onPressed: (){
//                   //
//                   //     setState(() {
//                   //
//                   //     });
//                   //   },
//                   //   child: Icon(Icons.mic_none),
//                   // ): Icon(
//                   //   Icons.align_horizontal_left_sharp,
//                   // ),
//                     border: InputBorder.none,
//                     hintText: 'Description',
//                     hintStyle: TextStyle(
//                         color: Colors.white60
//                     )
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
