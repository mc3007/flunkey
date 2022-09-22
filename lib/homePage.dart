import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flunkey/logIn.dart';

Future getList() async {
  String theUrl = "https://api.flunkey.app/api/explore/restaurants?&pageNo=0&size=10&di rection=asc ";
  var res = await http
      .get(Uri.parse(theUrl), headers: {"Accept": "application/json"});
  var responseBody = json.decode(res.body);
  return responseBody;
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DREAM"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Material(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                color: Colors.blue,
                child: DrawerHeader(
                    padding: EdgeInsets.zero,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: 40,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ]
                    )),
              ),
              ListTile(
                title: const Text('FLUNKEY'),
                leading: const Icon(Icons.local_dining,
                  color: Colors.blue,),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: Scrollbar(
        child: FutureBuilder(
          future: getList(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            List snap = snapshot.data;

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error fetching data"),
              );
            }

            if(snap.isNotEmpty){
              return Padding(
                padding: const EdgeInsets.all(5),
                child: ListView.builder(
                    itemCount: snap.length,
                    itemBuilder: (context, index){
                      _index=index;
                      return ListTile(
                        title: Text('${snap[index]['restaurantName']}'),
                        subtitle: Text('${snap[index]['shortMessage']}'),
                      );
                    }),
              );
            }else{
              return const Text("No data");
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:(){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) {
              return LogIn();
            }),
                (route) => false,
          );
        },
        icon: const Icon(Icons.logout),
        label: const Text("Logout"),
        tooltip: "Logout",
      ),
    );
  }
}
