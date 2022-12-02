import 'package:flutter/material.dart';
import 'dart:math';
import '../Shared_Preferences_DB/LoadingClass.dart';
import '../classes/data.dart';
import '../pages/HomePage.dart';

class SettingsPage extends StatefulWidget {

  @override
  State<SettingsPage> createState() => _DetailState();
}

class _DetailState extends State<SettingsPage> {

  String MobileNumber=User_Data_Object.mobile_number;
  int bandwidth=User_Data_Object.Bandwidth;

  Future LocalSet() async {
    if(MobileNumber!=User_Data_Object.mobile_number){
      User_Data_Object.mobile_number=MobileNumber;
    }
    if(bandwidth!=User_Data_Object.Bandwidth){
      User_Data_Object.Bandwidth=bandwidth;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Fetch_Data=false;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.settings,
              color: Colors.blue[800],
              size: MediaQuery.of(context).size.width*0.1,
            ),
          ),
        ],
      ),
      body:

      Stack(
        children: [


          // BottomNavBarV2(false),
          Container(
            child: SingleChildScrollView(
              // physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 70,),

                  Container(
                    // height: 310,
                    padding: EdgeInsets.only(left: 16),
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [

                          Container(
                            // height: 470,
                            color: Colors.transparent,
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      SizedBox(height: 6,),

                                      Text(
                                        "Set app settings",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21,
                                          letterSpacing: 0.5,
                                          color: Color(0xFF4A6572),
                                        ),
                                      ),

                                      SizedBox(height: 6,),

                                      Text(
                                        "Set Mobile Number",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 21,
                                          letterSpacing: 0.5,
                                          color: Color(0xFF4A6572),
                                        ),
                                      ),


                                      buildCurrency("Set Number"),//////////////////////

                                      SizedBox(height: 6,),


                                      SizedBox(height: 6,),

                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ],
                      ),
                    ),


                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            // physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),
                    ),
                    // boxShadow: [kBoxShadow],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 16,left: 16,bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Text(
                                "Settings",
                                style: TextStyle(
                                  fontFamily: "amasis-mt-std-black",
                                  fontSize: 36,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                           ElevatedButton(
                              onPressed: (){
                                  LocalSet();
                                  UserSecureStorage.setAll();
                                  setState(() {});
                              },
                              child: Text("Confirm"),

                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[700],
                                shadowColor: Colors.black,
                                padding:EdgeInsets.symmetric(horizontal: 40,vertical: 18),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)),),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }






  Widget buildCurrency( String title){
    return Container(
      // height: MediaQuery.of(context).size.height*0.09,
      width: MediaQuery.of(context).size.width*0.9,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        // boxShadow: [kBoxShadow],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "${User_Data_Object.mobile_number==""? "Set mobile number":User_Data_Object.mobile_number}",
            textAlign: TextAlign.left,
            style: TextStyle(
             //xxx fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              letterSpacing: 0.5,
              color: Color(0xFF4A6572).withOpacity(0.8),
            ),
          ),


          SizedBox(
            width: MediaQuery.of(context).size.width*0.3,
            height: MediaQuery.of(context).size.width*0.1,
            child: TextField(
              // autocorrect: true,
              // autofocus: true,

              onChanged: (val){
                 MobileNumber=val;
              },
              decoration: InputDecoration(
                labelText: "Current: ${User_Data_Object.mobile_number==null? "":User_Data_Object.mobile_number}",
                labelStyle: TextStyle(
                  color: Colors.indigo.withOpacity(0.3),
                ),
              ),
            ),
          ),

          // SizedBox(
          //   width: 20,
          // ),

        ],
      ),
    );
  }


}





















