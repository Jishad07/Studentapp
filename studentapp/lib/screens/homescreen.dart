   

   import 'package:flutter/material.dart';
import 'package:studentapp/screens/searchpage.dart';
import 'package:studentapp/screens/studentList.dart';

import '../db/function/db.functions.dart';
import 'studentaddpage.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
     getAllStudents();
      super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900 ],
        title:  const Text("Student App"),
        actions: [IconButton(onPressed: (){
                 showSearch(
                    context: context,
                    delegate: Searchpage(),
                  );
        },
         icon:const Icon(Icons.search))],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration:const BoxDecoration(
                image: DecorationImage(image: AssetImage("lib/assets/school.png"),fit: BoxFit.cover)
              ),           
          )),
          Expanded(
            flex: 7,
            child:Container(
              child: const Studentlist(),
          ) ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green[900]),
            onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const StudentAddPage()));
             image1=null;
          }, child:const Text("+Add Student" ,))
        ],
      ),
    
    );
  }
}