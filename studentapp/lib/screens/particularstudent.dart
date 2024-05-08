import 'package:flutter/material.dart';
import 'package:studentapp/db/model/studentmodel.dart';
  


class Particularstudent extends StatelessWidget {
  const Particularstudent({required this.give ,super.key});
  

  final StudentModel give;
  @override

  
  Widget build(BuildContext context) {
    return   Scaffold(appBar: AppBar(
      title: Text("StudentApp"),
      backgroundColor: Colors.green[900],

    ),
    body:  Container(
      decoration: BoxDecoration(
      color: Colors.grey
      ),
      height: double.infinity,
      width: double.infinity,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
    
        children: [
          SizedBox(height: 100 ,),
        const  CircleAvatar(radius: 70,),
        const  SizedBox(height: 40 ,),
          Text('NAME:${give.name}',style: TextStyle(
            fontSize: 25  ,
          ),),
        const  SizedBox(height: 20 ,),
          Text("PLACE:${give.place}",style: TextStyle(
            fontSize: 25 
          ),),
         const SizedBox(height: 20 ,),
          Text("AGE:${give.age}",style: TextStyle(
            fontSize: 25 
          ),),
        const  SizedBox(height: 20 ,),
          Text("PHONE:${give.phone}",style: TextStyle(
            fontSize: 25 
          ),),
          
        ],
      ),
    ),
    
    );
  }
}