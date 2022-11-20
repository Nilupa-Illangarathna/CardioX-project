import 'dart:async';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../classes/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:morphable_shape/morphable_shape.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int Timer_value=12000; //in milliseconds
  bool Is_Loading=true;
  int Progress_bar_percentage=0;


  Timer timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void Change_Progress_Bar_Value(){
    print(Progress_bar_percentage);
    setState(() {
      Progress_bar_percentage<100? Progress_bar_percentage+=1: Progress_bar_percentage=100;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(250.0), bottomRight: Radius.circular(0.0), ),
                ),

                child:
                Center(
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
                      // SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
                      ElevatedButton(
                          onPressed: (){
                            Progress_bar_percentage=0;
                            Timer.periodic(Duration(milliseconds: (Timer_value/100).toInt()), (Timer t) => Change_Progress_Bar_Value());
                            setState(() {
                              Is_Loading=true; /////////////////////////////////////////////////////////////////////////////////////////
                            });
                            Future.delayed(Duration(milliseconds: Timer_value), () {
                              setState(() {
                                Is_Loading? Is_Loading=false:Is_Loading=true; //////////////////////////////////////////////////////////
                              });
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                                MediaQuery.of(context).size.height * 0.1,
                                MediaQuery.of(context).size.height * 0.1,
                            ),
                            shape: const CircleBorder(),
                            primary: Colors.green,
                          ),
                          child: Text("Click"),
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
                        Container(height: 100,width: 200,color: Colors.red,),
                      )
                      // Is_Loading? CircularProgressIndicator():Container(height: 100,width: 200,color: Colors.red,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}




class TEXTFIELD extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.transparent,
                offset: const Offset(4, 4),
                blurRadius: 8),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            height: MediaQuery.of(context).size.height*0.1,
            padding: const EdgeInsets.all(4.0),
            constraints: const BoxConstraints(minHeight: 80, maxHeight: 160),
            color: Colors.white24.withOpacity(0.1),
            child: SingleChildScrollView(
              padding:
              const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
              child: TextField(
                // controller: DescriptionContraller,
                // onTap: FiltersForTheApp.voiceRecognitionWant? _listenTransectionsDescription : VoidFunc ,
                // inputFormatters: <TextInputFormatter>[
                //   FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                // ],
                autocorrect: true,
                maxLength: 250,
                autofocus: false,
                onChanged: (val){
                  // CategoryDescriptionInput=val;
                },
                maxLines: 3,
                style: TextStyle(
                    fontFamily: 'WorkSans',
                    fontSize: 16,
                    // color: Color(0xFF313A44),
                    color: Colors.white
                ),
                cursorColor: Colors.white24,
                decoration: InputDecoration(
                  // icon: FiltersForTheApp.voiceRecognitionWant? FloatingActionButton(
                  //   mini:true,
                  //   onPressed: (){
                  //
                  //     setState(() {
                  //
                  //     });
                  //   },
                  //   child: Icon(Icons.mic_none),
                  // ): Icon(
                  //   Icons.align_horizontal_left_sharp,
                  // ),
                    border: InputBorder.none,
                    hintText: 'Description',
                    hintStyle: TextStyle(
                        color: Colors.white60
                    )
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
