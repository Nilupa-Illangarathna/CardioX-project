import 'package:flutter/material.dart';
import '../pages/HomePage.dart';
import 'dart:math';

void AddIncomeExpenses(BuildContext ctx,VoidCallback){
  // int IDtemp = AllTransectionsForTheTime.length==0? 0:AllTransectionsForTheTime[AllTransectionsForTheTime.length-1].ID+1; //
  // String CategoryNametemp=OneCategory.CategoryName;  //8 CHARACTERS CAN BE ADDED
  // String CategoryTypetemp=OneCategory.CategoryType;  //
  // double CurrentSumtemp;
  // String AddressofTheImagete=OneCategory.IconAddress;  //
  // Color ButtonColortemp=OneCategory.ButtonColor;  //
  // Color EndButtonColortemp=OneCategory.EndColor;
  // double TransectionAmounttemp; //
  // bool IsRecurringtemp=IsRefurringFunction();
  // String AccountDatatemp;
  // DateTime Datetemp = DateTime.now().subtract(Duration(days:DateInt =="Today"? 0:(DateInt =="Yesterday"? 1:(DateInt =="Two Days ago"? 2:3))));
  // // DateTime Datetemp = DateTime.now().subtract(Duration(days:DateInt =="Today"? 0:(DateInt =="Yesterday"? 1:(DateInt =="Two Days ago"? 2:(DateInt =="Three Days ago"? 3:(DateInt =="Four Days ago"? 4:(DateInt =="Five Days ago"? 5:(DateInt =="Six Days ago"? 6:(DateInt =="Seven Days ago"? 7:(DateInt =="Eight Days ago"? 8:(DateInt =="Nine Days ago"? 9:10)))))))))));
  // TimeOfDay Timetemp = TimeOfDay.now();



  Future submitdata() async{
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

  showModalBottomSheet(isScrollControlled: true,isDismissible: true, enableDrag: true, context: ctx,backgroundColor: Colors.transparent, builder: (_){

    var random=Random();
    int RandomNumber = 0 + random.nextInt(100 - 0);

    Running_a_Single_Process=false;
    VoidCallback;

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
                    bottomLeft: Radius.circular(MediaQuery.of(ctx).size.height*0.05),
                    bottomRight: Radius.circular(MediaQuery.of(ctx).size.height*0.05),
                    topRight: Radius.circular(MediaQuery.of(ctx).size.height*0.05),
                    topLeft: Radius.circular(MediaQuery.of(ctx).size.height*0.05)),
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
                              bottomLeft: Radius.circular(MediaQuery.of(ctx).size.height*0.05),
                              bottomRight: Radius.circular(MediaQuery.of(ctx).size.height*0.05),
                              topRight: Radius.circular(MediaQuery.of(ctx).size.height*0.05),
                              topLeft: Radius.circular(MediaQuery.of(ctx).size.height*0.05)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: (){
                                /////////////////////////////////
                                //////////////////////////////////
                                /////////////////////////////////
                                /////////////////////////////////
                              },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white.withOpacity(0.8),
                                    fixedSize: Size(MediaQuery.of(ctx).size.width*0.8, MediaQuery.of(ctx).size.width*0.2),
                                    textStyle: const TextStyle(fontSize: 30)),
                                child: const Text("Call Emergency"),
                            ),
                            ElevatedButton(
                              // child: AddMoreCategoriesMenu(),
                              child: Text("Close"),
                              onPressed: (){
                                ////////////////////////////////////
                                ///////////////////////////////////
                                ///////////////////////////////////
                                ///////////////////////////////////
                                Navigator.of(ctx).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(MediaQuery.of(ctx).size.width*0.4, MediaQuery.of(ctx).size.width*0.1),
                                elevation: 2,
                                primary: Colors.red.shade300,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(MediaQuery.of(ctx).size.height*0.05),bottomRight: Radius.circular(MediaQuery.of(ctx).size.height*0.05),topRight: Radius.circular(MediaQuery.of(ctx).size.height*0.05),topLeft: Radius.circular(MediaQuery.of(ctx).size.height*0.05)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(ctx).size.height*0.1,
                              child: Center(
                                child: Row(
                                  children: [
                                    Text("Slide Down To close"),

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
                          RandomNumber%2==0? 'assets/images/HealthyHeart.png':'assets/images/Unhealthy heart.png',
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(ctx).size.height*0.01,),
                ],
              ),
            ),
          )
        ],
      );
  });

}