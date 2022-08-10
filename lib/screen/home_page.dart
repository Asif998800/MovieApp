import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/MovieModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  Future<MovieModel> getMoviesApi () async {
    final response = await http.get(Uri.parse("https://api-telly-tell.herokuapp.com/movies/rahul.verma"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200){
      return MovieModel.fromJson(data);
    }else{
      return MovieModel.fromJson(data);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<MovieModel>(
                future: getMoviesApi (),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index){
                        return Container(
                          height: 150,
                          width: double.infinity,
                          child:
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width*0.55,
                                child: Image(image: NetworkImage(snapshot.data!.data![index].thumbnail.toString()),fit: BoxFit.cover,),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data!.data![index].title.toString(),
                                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                    Text(snapshot.data!.data![index].year.toString()),
                                    Text(snapshot.data!.data![index].ratings.toString()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }else{
                    return Center(child: Text('Loading'));
                  }
                },
              )
          )
        ],
      )
    );
  }
}
