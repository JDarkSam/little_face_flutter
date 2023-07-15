import 'package:little_face/db.dart';
import 'package:little_face/infante.dart';
import 'package:flutter/material.dart';

class Editar extends StatelessWidget {

  static final _formKey = GlobalKey<FormState>();
  static final nombresController = TextEditingController();
  static final apellidosController = TextEditingController();
  static final edadController = TextEditingController();
  static final aliasController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Infante infante;
    infante = ModalRoute.of(context).settings.arguments;
    nombresController.text =  infante.nombres;
    apellidosController.text =  infante.apellidos;
    edadController.text = infante.edad.toString();
    aliasController.text  = infante.alias;

    return Scaffold(
        appBar: AppBar(
            title: Text("Guardar Culicagado")
        ),
        body: Container(
            child: Padding(
              child: Form (
                  key: _formKey,
                child: Container(
                  alignment: Alignment.center,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            controller: nombresController,
                            validator: (value) {
                              if (value.isEmpty)
                                return "Los nombres son obligatorios";
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: "Nombres"
                            ),

                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: apellidosController,
                            validator: (value) {
                              if (value.isEmpty)
                                return "El apellido es obligatorio";
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: "Apellidos"
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: edadController,
                            validator: (value) {
                              if (value.isEmpty)
                                return "La Edad es obligatorio";
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: "Edad"
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: aliasController,
                            validator: (value) {
                              if (value.isEmpty)
                                return "El Alias es obligatorio";
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: "Alias"
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  if (infante.id > 0) {
                                    infante.nombres = nombresController.text;
                                    infante.apellidos = apellidosController.text;
                                    infante.edad = int.parse(edadController.text);
                                    infante.alias = aliasController.text;

                                    DB.update(infante);
                                  }
                                  else
                                    DB.insert(Infante(nombres: nombresController.text, apellidos: apellidosController.text, edad:int.parse(edadController.text),alias:aliasController.text ));
                                  Navigator.pushNamed(context,"/");
                                }
                              },
                              child: Text("Guardar Chinche"))
                        ]
                    )
                ),

              ),
              padding: EdgeInsets.all(15),
            )
        )
    );
  }

}