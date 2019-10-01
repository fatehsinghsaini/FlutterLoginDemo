import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowListView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(title: "ListDetails",
      home:Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('ListView'),
          leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () =>Navigator.pop(context,false),

          ),
        ),
       body:_myListView(context) ,
      ),
    );
  }
  //myListView(context)

  Widget _myListView(BuildContext context) {

    // backing data
    final europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria',
      'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
      'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
      'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
      'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
      'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
      'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
      'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden',
      'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];

    return ListView.builder(scrollDirection: Axis.vertical,
      itemCount: europeanCountries.length,itemBuilder: (context,index){
        return
          Card(
            child:ListTile(
              title: Text(
                europeanCountries[index],
                textAlign: TextAlign.start,

              ),
              leading: Icon(Icons.wb_sunny),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: (){
                Fluttertoast.showToast(
                    msg: europeanCountries[index],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              },
            ) ,
          );

      },
    );
  }

  ShowListView();


}