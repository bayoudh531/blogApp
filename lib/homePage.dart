import 'package:CWCFlutter/screens/feed.dart';
import 'package:flutter/cupertino.dart';
 import 'package:flutter/material.dart';

class WelcomeChoix extends StatelessWidget {
  // This widget is the root of your application.
 @override
  Widget build(BuildContext context){

   return Scaffold(
  appBar: AppBar(
     elevation: 0.0,
     automaticallyImplyLeading: false,
     backgroundColor:Colors.white,
     title:Text("Select your choice",style: TextStyle(
       fontSize: 20,
       foreground: Paint()
       ..style=PaintingStyle.stroke
       ..strokeWidth=2
       ..color=Colors.deepOrange[900]
       )
     
     ),
    
     ) ,
  body: SingleChildScrollView(
    child: Column(
   children:[
    Container(
    height: 130,
    width: MediaQuery.of(context).size.width,
    decoration: new BoxDecoration(
      color: Colors.pink[200],
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(50.0),
      )
    ),
    
    child: Column(
    mainAxisAlignment:MainAxisAlignment.end ,
    children: <Widget>[
    Container(
   child: Text("Bienvennue dans notre catégorie Jeux",
    style: TextStyle(color: Colors.blueGrey,fontSize: 18.0,fontWeight: FontWeight.bold),
  ),
                   
 ),
 SizedBox(
height: 10,
 ),
 MaterialButton(
  color: Colors.pink[100],
  onPressed: (){
  },
  child:Text("accéder au page ",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
  ),
   ),    
SizedBox(
height: 7,
),
],
)
 ),
 SizedBox(
height: 1,
 ),
Container(
    height: 140,
    width: MediaQuery.of(context).size.width,
    decoration: new BoxDecoration(
      color: Colors.pink[300],
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(50.0)
      )
    ),
    
    child: Column(
    mainAxisAlignment:MainAxisAlignment.end ,
    children: <Widget>[
    Container(
   child: Text("Bienvennue dans notre catégorie Musique",
    style: TextStyle(color: Colors.blueGrey,fontSize: 18.0,fontWeight: FontWeight.bold),
  ),
                   
 ),
 SizedBox(
height: 10,
 ),
 MaterialButton(
  color: Colors.pink[200],
  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Feed()));},
  child:Text("accéder au page ",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
  ),
   ),    
SizedBox(
height: 7,
),

],
)
 ),
 SizedBox(
height: 1,
 ),
 Container(
    height: 140,
    width: MediaQuery.of(context).size.width,
    decoration: new BoxDecoration(
      color: Colors.pink[400],
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(50.0),
      )
    ),
    
    child: Column(
    mainAxisAlignment:MainAxisAlignment.end ,
    children: <Widget>[
    Container(
   child: Text("Bienvennue dans notre catégorie Lecture",
    style: TextStyle(color: Colors.blueGrey,fontSize: 18.0,fontWeight: FontWeight.bold),
  ),
                   
 ),
 SizedBox(
height: 10,
 ),
 MaterialButton(
  color: Colors.pink[300],
  onPressed: (){
 
  },
  child:Text("accéder au page ",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
  ),
   ),     
   ],
  )
  ),
   SizedBox(
height: 1,
   ),
   Container(
    height: 140,
    width: MediaQuery.of(context).size.width,
    decoration: new BoxDecoration(
      color: Colors.pink[700],
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(50.0),
      )
    ),
    
    child: Column(
    mainAxisAlignment:MainAxisAlignment.end ,
    children: <Widget>[
    Container(
   child: Text("Bienvennue dans notre catégorie Jardin thérapeutique",
    style: TextStyle(color: Colors.blueGrey,fontSize: 18.0,fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,
  ),
                   
 ),
 SizedBox(
height: 10,
 ),
 MaterialButton(
  color: Colors.pink[600],
  onPressed: (){

  },
  child:Text("accéder au page ",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
  ),
   ),     
   ],
  )
  ),   
SizedBox(
height: 1,
 ),
Container(
    height: 140,
    width: MediaQuery.of(context).size.width,
    decoration: new BoxDecoration(
      color: Colors.pink[900],
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(50.0),
      )
    ),
    
    child: Column(
    mainAxisAlignment:MainAxisAlignment.end ,
    children: <Widget>[
    Container(
   child: Text("Bienvennue dans notre catégorie Sport",
    style: TextStyle(color: Colors.blueGrey,fontSize: 18.0,fontWeight: FontWeight.bold),
  ),
                   
 ),
 SizedBox(
height: 10,
 ),
 MaterialButton(
  color: Colors.pink[800],
  onPressed: (){
    
  },
  child:Text("accéder au page ",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),
  ),
   ),     
   ],
  )
  ),  
SizedBox(
height: 1,
 ),

                   
      
   ],
  )
  ),  

   );
  
   

}
}