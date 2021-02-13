import 'package:flutter/material.dart';
import 'package:netdemo/modal/post_model.dart';
import 'package:netdemo/services/http_sevice.dart';

class HomePage extends StatefulWidget {

  static final String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post = Post(id: 1,name: "test",salary: "123",age: '23');
    _apiPostDelete(post);
  }

  void _apiPostList(){
    NetWork.GET(NetWork.API_LIST, NetWork.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _apiPostCreate(Post post){
    NetWork.POST(NetWork.API_CREATE, NetWork.paramsCreate(post)).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _apiPostUpdate(Post post){
    NetWork.PUT(NetWork.API_UPDATE + post.id.toString(), NetWork.paramsUpdate(post)).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _apiPostDelete(Post post){
    NetWork.DEL(NetWork.API_DELETE + post.id.toString(), NetWork.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response),
    });
  }

  void _showResponse(String response){
    setState(() {
      data = response;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data : "No Data"),
      ),
    );
  }
}
