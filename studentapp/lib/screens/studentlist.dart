



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studentapp/db/function/db.functions.dart';
import 'package:studentapp/db/model/studentmodel.dart';
import 'package:studentapp/screens/editstudent.dart';





 
class Studentlist extends StatelessWidget {
  const Studentlist({super.key});

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(valueListenable: studentlistnotifier,
     builder: (BuildContext ctx, List<StudentModel> studentlist, Widget?child){
      return ListView.separated(
        itemBuilder: (context, index) {
          final data=studentlist[index];
          return Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)),
              padding:const EdgeInsets.all(10),
          
              child: Row(
                children: [
              const   SizedBox(width: 8,),
                 CircleAvatar(radius: 30,backgroundImage: image1!=null?
               FileImage(File(data.image)): FileImage(File(data.image)) as ImageProvider,),
              const    SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                 
                      Text('Name :${data.name}'),
                      Text('Place:${data.place}'),
                      Text('Age  :${data.age}'),
                      Text('Phone :${data.phone}'),
                    ],
                  ),
              const   SizedBox(
                    width: 50,
                  ),
                  IconButton(onPressed: (){
                    
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Editstudent(previousdetails:data )));
                    
                  }, icon:const Icon(Icons.edit,color: Colors.blue,)),
                   IconButton(onPressed: (){
                     showDialog(
                    context: context,
                     builder:(BuildContext context){
                       return AlertDialog(
                        title: const Text('Alert Dialog'),
                        content: const Text('Do you want delete?'),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, child: const Text('No')),
                          TextButton(onPressed: (){
                              deleteStudent(data.id!);
                                Navigator.of(context).pop();
                            
                          }, child:const Text('Yes'))
                        ],
                       );
                     },);
                   
                   
                  }, icon: const Icon(Icons.delete,color: Colors.red,)),
                ],
              ),
            ),
          );
        }, 
        separatorBuilder: (context, index) {
          return const SizedBox();
        }, 
        itemCount:studentlist.length);
     }
     );
  }
 

  }
     
    




