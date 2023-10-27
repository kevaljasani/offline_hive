import 'package:hive/hive.dart';
part 'controller.g.dart';


@HiveType(typeId: 0)
class controller extends HiveObject{
  
  @HiveType(typeId: 0)
  String name; 
  
  @HiveType(typeId: 1)
  String contact;
  
  
  controller(this.name,this.contact);

  @override
  String toString() {
    return 'controller(name : ${name}, contact: ${contact})';
  }
}