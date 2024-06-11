import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StateMachineController? _stateMachineController;
  Artboard? mainArtBoard;
  SMIBool? check;
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    rootBundle.load("assets/rive/fire_button.riv").then((riveByteData){
      var riveFile=RiveFile.import(riveByteData);
      var mArtboard=riveFile.mainArtboard;

      _stateMachineController=StateMachineController.fromArtboard(mArtboard, "State Machine 1");

      if(_stateMachineController!=null){
        mArtboard.addController(_stateMachineController!);
        mainArtBoard=mArtboard;

        check=_stateMachineController!.findSMI("ON");

        setState(() {

        });

      }
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(

      body: mainArtBoard!=null ? 
      InkWell(
        onTap: (){
          check!.value=!check!.value;
        },
        child: SizedBox(
          width: double.infinity,
            height: double.infinity ,
            child: Rive(artboard: mainArtBoard!,fit: BoxFit.fill,)),
      ):Container(),
    );

  }
}
