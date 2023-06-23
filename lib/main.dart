import 'dart:js';

import 'package:flutter/material.dart';
import 'package:ulma_y22/providers/image_page.dart';

import 'data/images_data.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  const MiApp({key}) : super(key: key);
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      
      title: 'ULMA',
      theme: ThemeData(colorSchemeSeed: Color.fromARGB(179, 25, 37, 201)),
      initialRoute: '/',
      routes: {
        
        '/': (context) => Inicio(),
        '/contactanos': (context) => contactanos(),
        '/servicios': (context) => servicios(),
        '/productos': (context) => productos(),
        '/signup': (context) => signup(),
        '/login': (context) => login(),


      },
      
    );
    
  }
}

class Inicio extends StatelessWidget {
  Inicio({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("ULMA PRODUCTION",style: TextStyle(color:Colors.black,fontSize: 50.0),),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        
      ),
    
      backgroundColor: Color.fromARGB(255, 112, 116, 105),
      body: Center(      

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tu empresa de encofrados",
              
              style: TextStyle(fontSize: 24),
            ),
            Text(" Y andamios para la construccion "),
            
            SizedBox(height: 20),
            ElevatedButton(
              
              onPressed: () => Navigator.pushNamed(context, '/contactanos'),
              child: Text(
                'CONTACTANOS',
                style: TextStyle(fontSize: 20),),
                 
            ),
            
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/servicios'),
              child: Text(
                'SERVICIOS',
                style: TextStyle(fontSize: 20),),
            ),
            SizedBox(height: 20),
          
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/productos'),
              child: Text(
                'PRODUCTOS',
                style: TextStyle(fontSize: 20),
                
                ),
                
            ),
            
            SizedBox(height: 20),
          
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: Text(
                'SIGN UP',
                style: TextStyle(fontSize: 20),
                
                ),
            ),

             SizedBox(height: 20),
          
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: Text(
                'LOGIN',
                style: TextStyle(fontSize: 30),
                
                ),
                
            ),
            
          ],
        ),
      ),
    );
  }
}

class contactanos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 76, 76, 70),
      appBar: AppBar(
        title: const Text(
          "Detalles",
          
          style: TextStyle(fontSize: 38),
              ),
       backgroundColor: Color.fromARGB(255, 22, 23, 23),
       
       
      ),
      body: Center(
        child: Column(
          children: [
          // Container(
           //   padding: EdgeInsets.all(50.0),
          //    child: Text("") ,
          //  ),
            Container(
              padding: EdgeInsets.all(50.0),
              child: Text("QUIENES SOMOS") ,
            ),
            Container(
              padding: EdgeInsets.all(50.0),
              child: Text("HISTORIA DE LA EMPRESA") ,
              
            ),
            Container(
              padding: EdgeInsets.all(50.0),
              child: Text("FECHA DE CREACION") ,
              
            ),
          ],
        ),
      )
    );
  }
  
}
    
        

class servicios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 90, 88, 75),
       appBar: AppBar(
        title: Text("Aqui configuraremos"),
               backgroundColor: Color.fromARGB(255, 22, 144, 192),
      ),
      
      );
    
  }
}

class productos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 206, 10),
       appBar: AppBar(
        title: Text("PRODUCTOS"),
               backgroundColor: Color.fromARGB(255, 18, 15, 1),
     ),
      body: GridView.extent(
        maxCrossAxisExtent: 150.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        children: _listaimagenes,
        ),
    );
    }
     List<Widget> get _listaimagenes {
    
    List<Widget>_listaimagenes = [];

    for (var image in images) {
      _listaimagenes.add(
        GestureDetector(
          onTap: (){
           Navigator.push(context as BuildContext,MaterialPageRoute(builder: (context) => ImagePage(Url: image)));
          },
          child: Image.network(image, fit: BoxFit.cover)));
    }

    return _listaimagenes;
  }

  
    }
    class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 244, 126, 23),
        appBar: AppBar(
        title: Text("Aqui nos registraremos"),
               backgroundColor: Color.fromARGB(255, 237, 65, 13),
      ),
      
      );
    
  }
}

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 244, 126, 23),
        appBar: AppBar(
        title: Text("Aqui nos registraremos"),
               backgroundColor: Color.fromARGB(255, 237, 65, 13),
      ),
      
      );
    
  }
}

Widget cuerpo({required Column child}){
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage("https://cdn.pixabay.com/photo/2019/02/06/16/32/architect-3979490_640.jpg"),
      fit: BoxFit.cover
      )
      
    ),
  );
}