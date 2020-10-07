import 'package:API_Tutorial_Flutter/Data/SERVER.dart';
import 'package:API_Tutorial_Flutter/Model/GetUsers.dart';
import 'package:API_Tutorial_Flutter/UI/Home.dart';
import 'package:flutter/material.dart';


class ShowData extends StatefulWidget{

  final int index;
  ShowData({Key key, @required this.index}) : super(key: key);

  @override
  ShowDataState  createState() => ShowDataState();
}

class ShowDataState extends State<ShowData> {

  SERVER server = new SERVER();
  var name ,email , phoneNumber,city;

    getInfo() async{

    await  server.getStatusData(widget.index).then((response){
      setState(() {
        name = response['name'] ;
        email = response['email'] ;
        phoneNumber = response['phone'] ;
        city = response['address']['city'] ;
      });

    }) ;
  }

  @override
  initState()  {
     getInfo() ;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          title:  Text('Login'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: ()=>Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new Home(),
                  )
              ),
            )
          ],
        ),
        body: Container(
          child: (name != null) ? ListView(
            padding: const EdgeInsets.only(top: 62,left: 12.0,right: 12.0,bottom: 12.0),
            children: <Widget>[

              Container(
                height: 50,
                child:   new Text(
                  "Name : $name",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new Text(
                  " Email : $email",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 44.0),),

              Container(
                height: 50,
                child: new Text(
                  " Phone Number : $phoneNumber",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                height: 50,
                child: new Text(
                  " City : $city",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),



            ],
          )
          :
          Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }





}















