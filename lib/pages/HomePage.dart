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
bool Fetch_Data=false; //Data Fetched From The Database

class HomePage extends StatefulWidget {
  HomePage({this.app});
  final FirebaseApp app;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final referenceDatabase = FirebaseDatabase.instance;

  var Firebase_Snapshot;
  int Timer_value=6000; //in milliseconds
  bool Is_Loading=false;
  int Progress_bar_percentage=0;

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
    print("The responce deosmdsw");
    print(response.body);
    if(response.body=='true'){
      User_Data_Object.response=false; // no heart attacks. normal
      print("Current recorded statge of the patient is : " + User_Data_Object.response.toString());
    }else{
      User_Data_Object.response=true;  // possible heart attacks. anomaly
      print("Current recorded statge of the patient is : " + User_Data_Object.response.toString());
    }
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

            //////////////////////////Delete below ///////////////

            // //Anomal
            // From_Firebase_To_App={'a1': 0.89486742, 'a2': -0.003822158, 'a3': -0.75105205, 'a4': -1.3965429, 'a5': -1.7378376, 'a6': -2.1130203, 'a7': -2.2132096, 'a8': -2.2033471, 'a9': -2.0241906, 'a10': -1.5914581, 'a11': -1.0499022, 'a12': -0.57789108, 'a13': -0.3131374, 'a14': -0.20084404, 'a15': -0.18379899, 'a16': 0.016525057, 'a17': 0.50921179, 'a18': 0.77751147, 'a19': 0.75067496, 'a20': 0.78843003, 'a21': 0.77137524, 'a22': 0.73257374, 'a23': 0.67985885, 'a24': 0.62183591, 'a25': 0.60469296, 'a26': 0.58129958, 'a27': 0.65998204, 'a28': 0.63413413, 'a29': 0.63558912, 'a30': 0.76050608, 'a31': 0.76912011, 'a32': 0.73457027, 'a33': 0.72108854, 'a34': 0.75040232, 'a35': 0.62612794, 'a36': 0.51689273, 'a37': 0.54554218, 'a38': 0.50588773, 'a39': 0.5258932, 'a40': 0.49186076, 'a41': 0.52836623, 'a42': 0.62282844, 'a43': 0.58039006, 'a44': 0.54824181, 'a45': 0.50770483, 'a46': 0.51204975, 'a47': 0.40906504, 'a48': 0.31038144, 'a49': 0.36845009, 'a50': 0.38137005, 'a51': 0.33419976, 'a52': 0.18130539, 'a53': 0.20183031, 'a54': 0.2933171, 'a55': 0.27945872, 'a56': 0.29958438, 'a57': 0.21474396, 'a58': 0.18456487, 'a59': 0.13197654, 'a60': 0.057778811, 'a61': 0.018044803, 'a62': -0.071802363, 'a63': 0.005535548, 'a64': 0.066041, 'a65': 0.042362944, 'a66': 0.05525463, 'a67': -0.005126899, 'a68': -0.051986345, 'a69': -0.015207146, 'a70': -0.0094131254, 'a71': 0.02094263, 'a72': 0.092754939, 'a73': 0.00073659051, 'a74': -0.071986495, 'a75': 0.070326647, 'a76': 0.091355005, 'a77': 0.028342719, 'a78': 0.17460518, 'a79': 0.28679751, 'a80': 0.27782832, 'a81': 0.31537371, 'a82': 0.31602348, 'a83': 0.36637824, 'a84': 0.44613065, 'a85': 0.41105086, 'a86': 0.42461382, 'a87': 0.4831252, 'a88': 0.4544008, 'a89': 0.46774525, 'a90': 0.56968959, 'a91': 0.54844061, 'a92': 0.52878176, 'a93': 0.63875397, 'a94': 0.64354817, 'a95': 0.62231549, 'a96': 0.6227605, 'a97': 0.57584803, 'a98': 0.56640109, 'a99': 0.56635399, 'a100': 0.57809064, 'a101': 0.61300844, 'a102': 0.63278994, 'a103': 0.59456305, 'a104': 0.61561681, 'a105': 0.72445263, 'a106': 0.7123046, 'a107': 0.67086495, 'a108': 0.71278444, 'a109': 0.66167141, 'a110': 0.58293314, 'a111': 0.58568763, 'a112': 0.61013419, 'a113': 0.69306756, 'a114': 0.68844189, 'a115': 0.61338458, 'a116': 0.60209334, 'a117': 0.42122252, 'a118': 0.16604014, 'a119': 0.14347481, 'a120': 0.19632701, 'a121': 0.16141046, 'a122': 0.1275313, 'a123': -0.018672703, 'a124': -0.23865283, 'a125': -0.3706969, 'a126': -0.59290109, 'a127': -0.63411579, 'a128': -0.44082747, 'a129': -0.5180703, 'a130': -0.70243851, 'a131': -0.89974628, 'a132': -1.4415163, 'a133': -1.8616119, 'a134': -2.3213812, 'a135': -2.8848769, 'a136': -3.530246, 'a137': -4.4125149, 'a138': -3.9033308, 'a139': -3.5671064, 'a140': -1.5363381};
            // //Normal
            // From_Firebase_To_App={'a1': -1.1008778, 'a2': -3.9968398, 'a3': -4.2858426, 'a4': -4.5065789, 'a5': -4.0223767, 'a6': -3.2343676, 'a7': -1.5661258, 'a8': -0.99225766, 'a9': -0.75467971, 'a10': 0.042321173, 'a11': 0.14895093, 'a12': 0.18352707, 'a13': 0.29487608, 'a14': 0.19023267, 'a15': 0.235575, 'a16': 0.25348712, 'a17': 0.2217424, 'a18': 0.050233259, 'a19': 0.17804214, 'a20': 0.13956318, 'a21': 0.046794433, 'a22': 0.043007139, 'a23': 0.10654432, 'a24': 0.012654003, 'a25': 0.0039948539, 'a26': 0.045724179, 'a27': -0.045999362, 'a28': -0.072666959, 'a29': -0.071077909, 'a30': -0.15386649, 'a31': -0.22725443, 'a32': -0.2492697, 'a33': -0.25348935, 'a34': -0.33283516, 'a35': -0.26432996, 'a36': -0.34582525, 'a37': -0.31078107, 'a38': -0.33415978, 'a39': -0.30617791, 'a40': -0.17456252, 'a41': -0.20616017, 'a42': -0.22447967, 'a43': -0.048683931, 'a44': -0.019621159, 'a45': 0.094805186, 'a46': 0.11678639, 'a47': 0.18518592, 'a48': 0.23052577, 'a49': 0.13802707, 'a50': 0.24442554, 'a51': 0.27169477, 'a52': 0.25900331, 'a53': 0.26920166, 'a54': 0.12706463, 'a55': 0.20207339, 'a56': 0.25598343, 'a57': 0.15311526, 'a58': 0.21021583, 'a59': 0.19108187, 'a60': 0.19092702, 'a61': 0.21051006, 'a62': 0.20710764, 'a63': 0.20488835, 'a64': 0.20086474, 'a65': 0.34691963, 'a66': 0.3480019, 'a67': 0.25453726, 'a68': 0.33197465, 'a69': 0.3566903, 'a70': 0.34992982, 'a71': 0.43037963, 'a72': 0.46750163, 'a73': 0.48606309, 'a74': 0.4031884, 'a75': 0.47895569, 'a76': 0.39739177, 'a77': 0.46412003, 'a78': 0.45179539, 'a79': 0.36136121, 'a80': 0.3798309, 'a81': 0.34278528, 'a82': 0.39910656, 'a83': 0.3875084, 'a84': 0.25570346, 'a85': 0.28403408, 'a86': 0.28499257, 'a87': 0.25010809, 'a88': 0.17303626, 'a89': 0.14942257, 'a90': 0.141685, 'a91': 0.22226096, 'a92': 0.17284705, 'a93': 0.15077932, 'a94': 0.17656601, 'a95': 0.28094204, 'a96': 0.48993901, 'a97': 0.66088884, 'a98': 0.8931933, 'a99': 1.0269972, 'a100': 1.2023937, 'a101': 1.5574096, 'a102': 1.8084277, 'a103': 2.1643459, 'a104': 2.0707467, 'a105': 1.9036136, 'a106': 1.7644552, 'a107': 1.5077694, 'a108': 1.2934277, 'a109': 0.89456215, 'a110': 0.57801575, 'a111': 0.24434305, 'a112': -0.28644345, 'a113': -0.51588134, 'a114': -0.73270694, 'a115': -0.83246547, 'a116': -0.80331806, 'a117': -0.83625248, 'a118': -0.77786456, 'a119': -0.77475301, 'a120': -0.73340394, 'a121': -0.72138631, 'a122': -0.83209517, 'a123': -0.71198159, 'a124': -0.7518673, 'a125': -0.7577196, 'a126': -0.85311967, 'a127': -0.76698841, 'a128': -0.68816064, 'a129': -0.51992349, 'a130': 0.039406169, 'a131': 0.56032676, 'a132': 0.53835583, 'a133': 0.65688079, 'a134': 0.78748958, 'a135': 0.72404623, 'a136': 0.55578372, 'a137': 0.47633335, 'a138': 0.77381971, 'a139': 1.1196209, 'a140': -1.4362499};

          },
          )
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
