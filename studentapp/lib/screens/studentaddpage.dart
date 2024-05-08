
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentapp/db/function/db.functions.dart';
import 'package:studentapp/db/model/studentmodel.dart';
import 'package:studentapp/screens/homescreen.dart';

   File? image1;
   String? image;



class StudentAddPage extends StatefulWidget {
  const StudentAddPage({super.key});

  @override
  State<StudentAddPage> createState() => _StudentAddPageState();
}
 
class _StudentAddPageState extends State<StudentAddPage> {
    
  List<StudentModel> studentlist=[];
 final studentname=TextEditingController();
 final studentplace=TextEditingController();
 final studentage=TextEditingController();
 final studentphone=TextEditingController();
 final GlobalKey<FormState> formkey=GlobalKey<FormState>();
   
  @override
  Widget build(BuildContext context) {
    return    
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          centerTitle: true,
          title: const Text("Student page" ,),
        ),
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(onTap: (){
                   showalertdialog(context);
                },
                child:  CircleAvatar(radius: 35,
                
                backgroundImage: image1!=null?
                 FileImage(image1!): const AssetImage("lib/assets/school.png")as ImageProvider,
                )),
                
                        const  SizedBox(height: 20,),
                TextFormField(
                 
                  validator: (value) {
                    if(value==null||value.isEmpty){
                      return "Enter Student Name";
                    }
                  },
                   maxLength: 14,
                  controller: studentname,
                 decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  // hintText: "NAME"
                  labelText: "NAME",
                  
                  suffixIcon: Icon(Icons.person),
                 ),
                ),
               const  SizedBox (height: 12,),
                TextFormField(
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return "Enter Student Place";
                    }
                  },
                  maxLength: 14,
                  controller: studentplace,
                 decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "PLACE",
                 suffixIcon: Icon(Icons.place),
                 ),
                ),
                   const      SizedBox(height: 12,),
                 TextFormField(
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return"Enter Student Age";
                    }
                  },
                  controller: studentage,
                  keyboardType:TextInputType.number ,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                 decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                 labelText: "AGE",
                 suffixIcon: Icon(Icons.calendar_month_outlined),
                 ),
                ),
              const  SizedBox(height: 12,),
                 TextFormField(
                  validator: (value){
                    if(value==null||value.isEmpty||value.length<10){
                      return"Enter Student Phone Number";
                    }
                  },
                  controller: studentphone,
                  keyboardType:TextInputType.number ,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
                  maxLength: 10,
                 decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "PHONE",
                    prefixText: "+91",
                    suffixIcon: Icon(Icons.phone),
                 ),
                ),
              const   SizedBox(height: 50,),
              ElevatedButton
              (
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.green[900],
                  fixedSize: const Size(300, 25)
                ),
                onPressed: ()
                {
                onSubmitClicked();
             
                
                },
                child: const  Text("submit"))
              ],
              ),
            ),
          ),
        ),
      );
  }
    
    Future<void>onSubmitClicked()async{
      final stname   = studentname.text.trim();
      final stplace  = studentplace.text.trim();
      final stphone = studentphone.text.trim();
      final stage   = studentage.text.trim();
       
       if (formkey.currentState!.validate()&&image != null)
       {
       final student=StudentModel( name:stname,place: stplace,age: stage,phone: stphone ,image:image!) ; 
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Homescreen()));  
         formkey.currentState!.reset();
          image1=null;
          image=null;
         
       await addStudent(student);
       
       
       }
       else if(image==null){
              
            imagenull();
       }
    }

    void imagenull(){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('please add your photo'),duration: Duration(seconds:3),));
    }

    Future<void> fromgallery() async {
    final img1 = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img1 != null) 
    {
      setState(() {
        image1 = File(img1.path);
        image = image1!.path;
      
      });
    }
    Navigator.of(context).pop();
    
  }
   
    Future<void> fromcamera() async {
    final img1 = await ImagePicker().pickImage(source: ImageSource.camera);
    if (img1 != null) 
    {
      setState(() {
        image1 = File(img1.path);
        image = image1!.path;
      });
    }
    Navigator.of(context).pop();
  }
    void showalertdialog(BuildContext context){
    showModalBottomSheet(context: context,backgroundColor: Colors.transparent, builder: (BuildContext context){
    return  Container(
       decoration: BoxDecoration(color: Colors.green[900],borderRadius: BorderRadius.circular(50) ),
       height: 130,
       padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        TextButton(onPressed: (){
            fromgallery();
        }, child: const Text("gallery")),
        TextButton(onPressed: (){
             fromcamera();
        }, child: const Text("camera")),

          ],
        ),
      );
    });
     

   
     }
      
   }


 
