import 'package:flutter/material.dart';
import '../pages/HomePage.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../classes/data.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pages/navigation_home_screen_with_App_Drawer.dart';



void ResultModelBottomSheet(BuildContext ctx,Setting_State_Of_Previous_Screen_Funnction) {
  Future submitdata() async {
//     if ((CategoryAmountInput == ""  ||double.parse(CategoryAmountInput) <0) && _text == '')
//     {
//       return;
//
//     }
//     else
//     {
//       AccountDatatemp = dropdownValue;
//       CurrentSumtemp=double.parse(CategoryAmountInput==""? _text:CategoryAmountInput);
//       TransectionAmounttemp =CurrentSumtemp;
//       var Temp = Categories(
//         IDtemp,
//         CategoryNametemp,
//         CategoryTypetemp,
//         CurrentSumtemp,
//         AddressofTheImagete,
//         ButtonColortemp,
//         EndButtonColortemp,
//         TransectionAmounttemp,
//         IsRecurringtemp,
//         AccountDatatemp,
//         DateTime.now().subtract(Duration(days:DateInt =="Today"? 0:(DateInt =="Yesterday"? 1:(DateInt =="Two Days ago"? 2:3)))),
//         // Datetemp = DateTime.now().subtract(Duration(days:DateInt =="Today"? 0:(DateInt =="Yesterday"? 1:(DateInt =="Two Days ago"? 2:(DateInt =="Three Days ago"? 3:(DateInt =="Four Days ago"? 4:(DateInt =="Five Days ago"? 5:(DateInt =="Six Days ago"? 6:(DateInt =="Seven Days ago"? 7:(DateInt =="Eight Days ago"? 8:(DateInt =="Nine Days ago"? 9:10))))))))))),
//         Timetemp,
//         false,
//         false,
//       );
//       AllTransectionsForTheTime.add(Temp);
//
//       List <Note> StringBasedList=await UserSecureStorage.set_ToStringConverted_Lists([Temp]);
//       AllTransections_addNote(StringBasedList[0],tableAllTransections);
//
// //148  175    392   423   451
//
//       dropdownValue = FiltersForTheApp.Is_Cash;;
//       AddressofTheImagetemp="";
//       CategoryNameInput="";
//       CategoryAmountInput="";
//       DateInt="Today";
//       Navigator.of(context).pop();
//       IsIncome? Navigator.of(context).pushReplacementNamed("incomes_page"):Navigator.of(context).pushReplacementNamed("expenses_page");
//     }
  }

  showModalBottomSheet(isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      context: ctx,
      backgroundColor: Colors.transparent,
      builder: (_) {
        Running_a_Single_Process = false;
        Setting_State_Of_Previous_Screen_Funnction;

        // print(User_Data_Object.response);

        return
          Stack(
            children: [

              Center(
                child: Container(
                  height: MediaQuery.of(ctx).size.height * 0.85,
                  width: MediaQuery.of(ctx).size.width * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(MediaQuery.of(ctx).size.height * 0.05),
                        bottomRight: Radius.circular(MediaQuery.of(ctx).size.height * 0.05),
                        topRight: Radius.circular(MediaQuery.of(ctx).size.height * 0.05),
                        topLeft: Radius.circular(MediaQuery.of(ctx).size.height * 0.05)),
                  ),
                  child:
                  Stack(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(ctx).size.height * 0.16,
                          ),


                          Container(
                            height: MediaQuery.of(ctx).size.height * 0.69,
                            width: MediaQuery.of(ctx).size.width * 0.85,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(MediaQuery.of(ctx).size.height * 0.05),
                                  bottomRight: Radius.circular(MediaQuery.of(ctx).size.height * 0.05),
                                  topRight: Radius.circular(MediaQuery.of(ctx).size.height * 0.05),
                                  topLeft: Radius.circular(MediaQuery.of(ctx).size.height * 0.05)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [


                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    boxShadow: [BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 8,
                                      offset: Offset(0, 0),
                                    )],
                                  ),
                                  margin: EdgeInsets.only(right: 30, left:30 , bottom: 30, top: 30),
                                  padding: EdgeInsets.all(20),
                                  child:Column(
                                    children: [
                                      Icon(
                                        User_Data_Object.response == true ? Icons.heart_broken: Icons.favorite,
                                        color: User_Data_Object.response == true ? Colors.red.shade900: Colors.redAccent,
                                        size: 70,
                                      ),
                                      Text(
                                        User_Data_Object.response == true ?
                                        User_Data_Object.Heart_Attack_Possitive_message :
                                        User_Data_Object.Heart_Attack_Negative_message,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),

                                ),



                                User_Data_Object.response == true
                                    ? ElevatedButton(
                                  onPressed: () async {
                                    User_Data_Object.mobile_number==null? null: await FlutterPhoneDirectCaller.callNumber(User_Data_Object.mobile_number);
                                    // launchWhatsApp();
                                    /////////////////////////////////
                                    //////////////////////////////////
                                    /////////////////////////////////
                                    /////////////////////////////////
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white.withOpacity(0.8),
                                      fixedSize: Size(MediaQuery.of(ctx).size.width * 0.8, MediaQuery.of(ctx).size.width * 0.2),
                                      textStyle: const TextStyle(fontSize: 30)),
                                  child: const Text("Call Emergency"),
                                )
                                    : SizedBox(height: MediaQuery.of(ctx).size.width * 0.2,),
                                ElevatedButton(
                                  // child: AddMoreCategoriesMenu(),
                                  child: Text("Close"),
                                  onPressed: () {
                                    print(User_Data_Object.response);
                                    User_Data_Object.response=false;
                                    Running_a_Single_Process=false;
                                    Fetch_Data=false; //Data Fetched From The Database
                                    ////////////////////////////////////
                                    ///////////////////////////////////
                                    ///////////////////////////////////
                                    ///////////////////////////////////
                                    Navigator.of(ctx).pop();
                                    Navigator.of(ctx)
                                        .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => NavigationHomeScreen()), (route) => false);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(
                                        MediaQuery.of(ctx).size.width * 0.4,
                                        MediaQuery.of(ctx).size.width * 0.1),
                                    elevation: 2,
                                    primary: Colors.red.shade300,
                                    shadowColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(MediaQuery.of(ctx).size.height * 0.05),
                                          bottomRight: Radius.circular(
                                              MediaQuery.of(ctx).size.height * 0.05),
                                          topRight: Radius.circular(MediaQuery.of(ctx).size.height * 0.05),
                                          topLeft: Radius.circular(MediaQuery.of(ctx).size.height * 0.05)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(ctx).size.height * 0.1,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Slide Down To close",
                                          style: TextStyle(
                                              color: Colors.grey
                                          ),),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(ctx).size.width * 0.70,
                            width: MediaQuery.of(ctx).size.width * 0.70,
                            child: Image.asset(
                              User_Data_Object.response == true
                                  ? 'assets/images/Unhealthy heart.png'
                                  : 'assets/images/HealthyHeart.png',

                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: MediaQuery.of(ctx).size.height * 0.01,),
                    ],
                  ),
                ),
              )
            ],
          );
      });
}