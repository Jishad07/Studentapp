import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentapp/screens/homescreen.dart';

import '../db/function/db.functions.dart';

File? image1;
String? image;


class Editstudent extends StatefulWidget {
   Editstudent({super.key,required this.previousdetails});
   
   final previousdetails;
   
  
  @override
  
  State<Editstudent> createState() => _EditstudentState();
}
  
final studentname=TextEditingController();
final studentplace=TextEditingController();
final studentage=TextEditingController();
final studentphone=TextEditingController();
final GlobalKey<FormState> formkey=GlobalKey<FormState>();

class _EditstudentState extends State<Editstudent> {
  @override
   
   void initState() {
    image=widget.previousdetails.image;
   studentname.text=widget.previousdetails.name;
   studentplace.text=widget.previousdetails.place;
   studentage.text=widget.previousdetails.age;
   studentphone.text=widget.previousdetails.phone;
    super.initState();
  }
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          centerTitle: true,
          title: const Text("STUDENT EDIT PAGE" ,),
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
                
                backgroundImage:
                image1!=null?
                 FileImage(image1!): FileImage(File(widget.previousdetails.image!))as ImageProvider),
                  
                ),
                
                        const  SizedBox(height: 20,),
                TextFormField(
                  validator: (value) {
                    if(value==null||value.isEmpty){
                      return "Enter Student Name";
                    }
                  },
                  maxLength: 11,
                  controller: studentname,
                 decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  // hintText: "NAME"
                  labelText: "EDIT NAME",
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
                  maxLength: 13,
                  controller: studentplace,
                 decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: " EDIT PLACE",
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
                 labelText: "EDIT AGE",
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
                  labelText: "EDIT PHONE",
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
              onEditClicked(widget.previousdetails.id);
           
           
                
                },
                child: const  Text("EDIT"))
              ],
              ),
            ),
          ),
        ),
      ); 
  }
  Future<void>onEditClicked(id)async{
      final stname   = studentname.text.trim();
      final stplace  = studentplace.text.trim();
      final stphone = studentphone.text.trim();
      final stage   = studentage.text.trim();
       
       if (formkey.currentState!.validate()&&image != null)
       {
      //  final student=StudentModel(id: id, name:stname,place: stplace,age: stage,phone: stphone ,image:image!) ; 
          editStudent(id, stname, stplace, stage, stphone,image!);  
         formkey.currentState!.reset();
        image!=null;  
         Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Homescreen()));
      //  await addStudent(student);
       
       
       }
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