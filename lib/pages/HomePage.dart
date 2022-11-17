import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../classes/colors.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    Timer mytimer = Timer.periodic(Duration(seconds: 5), (timer) {
      print("5 Seconds");
    });
    return Scaffold(
      backgroundColor: HexColor("#3C9E91"),
      body: Stack(
        children: [
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.20,
          //   decoration: BoxDecoration(
          //     color: HexColor("#F3FEFF"),
          //     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0), ),
          //   ),
          //   // width: MediaQuery.of(context).size.width * 0.8,
          //   child: Center(
          //     child: SizedBox(
          //       height: MediaQuery.of(context).size.width * 0.4,
          //       width: MediaQuery.of(context).size.width * 0.8,
          //       child:
          //       // Lottie.asset(
          //       //   'assets/LottieLogo1.json',
          //       //   width: 200,
          //       //   height: 200,
          //       //   fit: BoxFit.fill,
          //       // ),
          //       Hero(
          //         tag: "Splash",
          //         child: Image.asset(
          //           'assets/images/CardioXPNG.png',
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // SizedBox(height: 100,),
              Container(
                height: MediaQuery.of(context).size.height * 0.80,
                decoration: BoxDecoration(
                  // color: HexColor("#F3FEFF").withOpacity(0.9),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(250.0), bottomRight: Radius.circular(0.0), ),
                ),
                // width: MediaQuery.of(context).size.width * 0.8,
                child:
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width * 0.4,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child:
                    // Lottie.asset(
                    //   'assets/LottieLogo1.json',
                    //   width: 200,
                    //   height: 200,
                    //   fit: BoxFit.fill,
                    // ),
                    Hero(
                      tag: "Splash",
                      child: Image.asset(
                        'assets/images/CardioXLOGOjpg.jpg',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      // Column(
      //   children: [
      //     Center(
      //       // child: Container(
      //       //   width: MediaQuery.of(context).size.width,
      //       //   height: MediaQuery.of(context).size.height,
      //       //   color: Colors.grey,
      //       //   child: AnimatedAlign(
      //       //     // alignment: s,
      //       //   ),
      //       // ),
      //       child: Column(
      //         children: [
      //           Container(
      //             height: MediaQuery.of(context).size.width * 0.45,
      //             decoration: BoxDecoration(
      //               color: HexColor("#F3FEFF"),
      //               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0), bottomRight: Radius.circular(40.0) ),
      //             ),
      //             // width: MediaQuery.of(context).size.width * 0.8,
      //             child: Center(
      //               child: SizedBox(
      //                 height: MediaQuery.of(context).size.width * 0.4,
      //                 width: MediaQuery.of(context).size.width * 0.8,
      //                 child:
      //                 // Lottie.asset(
      //                 //   'assets/LottieLogo1.json',
      //                 //   width: 200,
      //                 //   height: 200,
      //                 //   fit: BoxFit.fill,
      //                 // ),
      //                 Hero(
      //                   tag: "Splash",
      //                   child: Image.asset(
      //                     'assets/images/CardioXPNG.png',
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
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
