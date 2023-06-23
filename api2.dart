import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
const MyApp({super.key});

@override
State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

List<persona> _personas = [
persona("Juan", "Rivas", "+51 990124567"),
persona("Mario", "Vargas", "+51 908762456"),
persona("Cesar", "Nemez", "+51 920864536"),
persona("Miguel", "Caceres", "+51 908111465"),
persona("Marcelo", "Lopez", "+51 900885621"),
persona("Mao", "Peres", "+51 900022346"),
persona("Marco", "Valdes", "+51 96633440"),
persona("Mari", "Vega", "+51 999321234"),
];

@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Material App',
home: Scaffold(
appBar: AppBar(
title: const Text('CONTACTOS'),

),
body: ListView.builder(
itemCount: _personas.length,
itemBuilder: (context, index){
return ListTile(
onLongPress: (){
this._borrarPersona(context, _personas[index]);
},
title: Text(_personas[index].name + ' ' + _personas[index].lastname),
subtitle: Text(_personas[index].phone),
leading: CircleAvatar(
child: Text(_personas[index].name.substring(0,1))
),
trailing: Icon(Icons.arrow_forward_ios),
);
}
)
),
);
}

_borrarPersona(context, persona persona){
showDialog(context: context, builder: ( _ ) => AlertDialog(
title: Text("Eliminar contacto"),
content: Text("esta seguro de que desea eliminar a " + persona.name + '¿'),
actions: [
FloatingActionButton(onPressed: (){
Navigator.pop(context);
}, child: Text("cerrar")),
FloatingActionButton(onPressed: (){
print(persona.name);
this.setState(() {

});
this._personas.remove(persona);
Navigator.pop(context);
}, child: Text("Borrar",
style: TextStyle(color: Colors.amber),
)),
],
));
}
}

class persona{
String name;
String lastname;
String phone; 

persona(this.name, this.lastname, this.phone);
}