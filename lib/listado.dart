import 'dart:core';
import 'package:little_face/infante.dart';
import 'package:little_face/db.dart';
import 'package:flutter/material.dart';

class Listado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Infantes"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context,"/editar",arguments: Infante(id:0,nombres:"",apellidos:"",edad:0,alias:""));

          },
        ),
        body: Container(
            child: Lista()
        )
    );
  }
}

class Lista extends StatefulWidget {

  @override
  _MiLista createState() => _MiLista();

}

class _MiLista extends State<Lista> {

  List<Infante> infantes = [];

  @override
  void initState() {
    cargaInfantes();
    super.initState();
  }

  cargaInfantes() async {
    List<Infante> auxInfante = await DB.infantes();

    setState(() {
      infantes = auxInfante;
    });

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: infantes.length,
        itemBuilder:
            (context, i) =>
            Dismissible(key: Key(i.toString()),
                direction: DismissDirection.startToEnd,
                background: Container (
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 5),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.delete, color: Colors.white)
                    )
                ),
                onDismissed: (direction) {
                  DB.delete(infantes[i]);
                },
                child: ListTile(

                    title: Text(infantes[i].alias),
                    trailing: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context,"/editar",arguments: infantes[i]);
                        },
                        child: Icon(Icons.edit)
                    ),
                    leading: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamed(context,"/objetivo",arguments: infantes[i]);
                        },
                        child: Icon(Icons.add_box_outlined)
                    ),
                )
            )
    );
  }

}