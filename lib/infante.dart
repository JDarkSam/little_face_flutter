import 'dart:core';

class Infante {
  int id;
  String nombres;
  String apellidos;
  int edad;
  String alias;

  Infante({ this.id,  this.nombres, this.apellidos, this.edad, this.alias});

  Map<String, dynamic> toMap(){
    return{'id':id,'nombres':nombres,'apellidos':apellidos, 'edad':edad, 'alias':alias};
  }
}