import 'dart:io';

import 'package:flutter/material.dart';

import '../db/function/db.functions.dart';
import '../db/model/studentmodel.dart';
import 'particularstudent.dart';

class Searchpage extends SearchDelegate {
  List data = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentlistnotifier,
        builder: (BuildContext context, List<StudentModel> studentlist,
            Widget? child) {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final data = studentlist[index];
              String nameval = data.name;
              if ((nameval).contains(query)) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Particularstudent(
                           give: data,
                          );
                        }));
                      },
                      title: Text(data.name),
                      leading: CircleAvatar(
                        backgroundImage: FileImage(File(data.image)),
                      ),
                    ),
                    const Divider(),
                  ],
                );
              } else {
                return Container();
              }
            },
            itemCount: studentlist.length,
          );
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentlistnotifier,
        builder: (BuildContext context, List<StudentModel> studentlist,
            Widget? child) {
          return ListView.builder(
            itemBuilder: (ctx, index) {
              final data = studentlist[index];
                String nameval = data.name;
             
            

            
              if ((nameval).contains((query.trim()))) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Particularstudent(give: data);
                         
                        }));
                      },
                      title: Text(data.name),
                      leading: CircleAvatar(
                        backgroundImage: FileImage(File(data.image)),
                      ),
                    ),
                    const Divider(),
                  ],
                );
              } 
              else if(nameval.isEmpty){
                 return Column(
                  children: [
                    Container(height: 370   ,width: double.infinity),
                    Container(height: 50,width: double.infinity,
                    child: Center(
                      child: Text('Result not found!!!' ,
                      style: TextStyle(fontSize: 18 
                      ,color: Colors.grey),)),),
                    
                  
                

                  ],
                );
              }
              
               
                
                  //  Container(
                    
                  //    child:
                  // //     const Center( 
                      
                                     
                  //                 child: Text('Result not found !!',style: TextStyle(color: Colors.grey,
                  //                 fontSize: 24,
                  //               ),),
                  //               ),
                  //  );   
                
              
              
            },
           
            itemCount: studentlist.length,
          );
        });
  }
}