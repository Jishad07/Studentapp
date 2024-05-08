 class StudentModel{  


    int? id ; 
    String name ;
    String place;
    String age;
    String phone;
    String image;
  

    StudentModel({ this.id, required this.name,required this.place,required this.age,required this.phone, required this.image });


    static StudentModel fromMap(Map<String,Object?>map){
         final id    =   map['id'] as int;
         final name  =   map['name'] as String;
         final place =   map['place'] as String;
         final age   =   map['age'] as String ;
         final phone =   map['phone'] as String ; 
         final image =   map['image']as String;

         return StudentModel (id: id, name: name, place: place, age: age, phone: phone,image:image);
    }
 }
  