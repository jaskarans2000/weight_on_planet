import 'package:flutter/material.dart';
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }

}

class HomeState extends State<Home>{
   double finalresult=0.0;
  int radioValue=0;
  String _string="";
final TextEditingController weightController=new TextEditingController();
  void handleRadioValueChanged(int value){
    setState(() {
      radioValue=value;
      switch(radioValue){
        case 0:finalresult=calculate(weightController.text,0.06);
        _string="Your weight on Pluto is ${finalresult} lbs";
        break;
        case 1: finalresult=calculate(weightController.text, 0.38);
        _string="Your weight on Mars is ${finalresult} lbs";
        break;
        case 3:finalresult=calculate(weightController.text, 0.91);
        _string="Your weight on Venus is ${finalresult} lbs";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weigh On Planet"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,

        child: new ListView(
          padding: const EdgeInsets.all(3.3),
          children: <Widget>[
            new Image.asset("images/planet.png",
            width: 100,
            height: 100,),
            new Container(
              margin: const EdgeInsets.all(3.0),
              child: new TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  labelText:"Enter your weight on earth",
                  hintText: "in pounds",
                  icon: Icon(Icons.person)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio<int>(
                    activeColor: Colors.brown,
                      value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),
                  new Text("Pluto",
                  style: new TextStyle(color: Colors.white30),),
                  new Radio<int>(
                    activeColor: Colors.redAccent,
                      value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
                  new Text("Mars",
                    style: new TextStyle(color: Colors.white30),),
                  new Radio<int>(
                    activeColor: Colors.orangeAccent,
                      value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
                  new Text("Venus",
                    style: new TextStyle(color: Colors.white30),),
                ],
                            ),

            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: new Text(
                  weightController.text.isEmpty ? "": "${_string}",
              textAlign: TextAlign.center,
              style: new TextStyle(color: Colors.white70,fontSize: 19.9,fontStyle: FontStyle.italic),),
            )
          ],
        ),
      ),
    );
  }

  double calculate(String text, double d) {
    if( int.parse(text).toString().isNotEmpty && int.parse(text)>0){
      return int.parse(text)*d;
    }
  }
}