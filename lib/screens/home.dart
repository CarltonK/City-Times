import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print('data received $data');

    //Set background
    String bgImage = data['isDaytime']
        ? 'https://images.unsplash.com/photo-1464014067366-e69d8b432b8a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80'
        : 'https://images.unsplash.com/photo-1468956398224-6d6f66e22c35?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1055&q=80';

    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo;


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('$bgImage'),
                fit: BoxFit.cover

              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    color: Colors.black,
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time':result['time'],
                            'location':result['location'],
                            'isDaytime':result['isDaytime'],
                            'flag':result['flag']
                          };
                        });
                      },
                      icon: Icon(
                          Icons.edit_location,
                          color: Colors.white,),
                      label: Text('Change Location', style: TextStyle(
                          color: Colors.white
                      ),),),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    data['time'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      fontSize: 50.0
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
