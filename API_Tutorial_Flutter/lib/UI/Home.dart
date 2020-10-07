import 'package:API_Tutorial_Flutter/Data/SERVER.dart';
import 'package:API_Tutorial_Flutter/Model/GetUsers.dart';
import 'package:API_Tutorial_Flutter/UI/ShowData.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget{

  Home({Key key , this.title}) : super(key : key);
  final String title;

  @override
  HomeState  createState() => HomeState();
}

class HomeState extends State<Home> {

  SERVER server = new SERVER();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Dashboard',
      home: Scaffold(
          appBar: AppBar(
            title:  Text('Home'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.cancel),
                onPressed: (){
                  print('Hello');
                },
              )
            ],
          ),
          floatingActionButton: new FloatingActionButton(
            child: new Icon(Icons.add),
            onPressed: (){
              print('Hello');
            }
          ),
        body: FutureBuilder<List<GetUsers>>(
          future: server.fetchJSONData(),
          builder: (context, snapshot) {

            if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

            return ListView(
              children: snapshot.data
                  .map((user) => ListTile(
                title: Text(user.name),
                onTap: ()=>Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>ShowData(index: user.id,),
                    )),
                subtitle: Text(user.phoneNumber),
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(user.name[0],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                ),
              ),
              )
                  .toList(),
            );
          },
        ),

      ),
    );
  }


}