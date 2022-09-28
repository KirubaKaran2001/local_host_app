import 'package:dio/dio.dart';
 import 'package:flutter/material.dart';
import 'package:local_host_app/class/user.dart';

class LocalHost extends StatefulWidget {
  const LocalHost({super.key});

  @override
  State<LocalHost> createState() => LocalHostState();
}

class LocalHostState extends State<LocalHost> {
  List <User> users =[];

  final String baseUrl ="http://192.168.0.243:5000/api/users";
  void _fetchDataFromTheServer()async{

    final Dio dio = new Dio();
    try {
      var response = await dio.get('$baseUrl/api/users');
      print(response.data);
      var responseData = response.data as List ;
      setState(() {
        users = responseData.map((e) => User.fromJson(e)).toList();
      });
    }on DioError catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Local host'),
        ),
        body: ListView(
          children: [
       ...users.map(
        (user) => ListTile(
        leading: Container(
          height: 50,
        width: 50,
        child: CircleAvatar(
          backgroundImage:NetworkImage("$baseUrl/${user.profilePicture}") 
          ,),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${user.firstName} ${user.lastName}"),
            Text ("${user.email}",
            style:const  TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 10,),

          ],
        ),
        subtitle: Text(user.bio,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        ),
       ),
       ),
          ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed:_fetchDataFromTheServer,
            tooltip: 'Fetch Data',
            child:const  Icon(Icons.cloud_download),
             ),
      ),
    );
  }
}
