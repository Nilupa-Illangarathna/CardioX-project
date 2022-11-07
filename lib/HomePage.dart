import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Column(
        children: [
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: Hero(
                      tag: "Splash",
                      child: Image.asset(
                        'assets/image.png',
                      ),
                    ),
                  ),
                   SingleChildScrollView(
                       child:  Column(
                           children: <Widget>[
                             TEXTFIELD(),
                             TEXTFIELD(),
                             TEXTFIELD(),
                             TEXTFIELD(),
                             TEXTFIELD(),
                             TEXTFIELD(),
                             TEXTFIELD(),
                             TEXTFIELD(),
                           ]
                       )
                   ),
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.vertical,
                  //   child: Column(
                  //     children: [
                  //       TEXTFIELD(),
                  //       TEXTFIELD(),
                  //       TEXTFIELD(),
                  //       TEXTFIELD(),
                  //       TEXTFIELD(),
                  //       TEXTFIELD(),
                  //       TEXTFIELD(),
                  //       TEXTFIELD(),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class TEXTFIELD extends StatelessWidget {
  // const TEXTFIELD({Key? key}) : super(key: key);

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
