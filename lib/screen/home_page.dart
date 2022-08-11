import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../Models/MovieModel.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  Future<MovieModel> getMoviesApi () async {
    final storage = new FlutterSecureStorage();
    Map<String, String> token = await storage.readAll();


    //final response = await http.get(Uri.parse("https://api-telly-tell.herokuapp.com/movies/rahul.verma"));
    final response = await http.get(Uri.parse("https://api-telly-tell.herokuapp.com/movies/rahul.verma"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder<MovieModel>(
                  future: getMoviesApi (),
                  builder: (context, snapshot){
                    if(snapshot.hasData){
                      return GridView.builder(
                          itemCount: snapshot.data!.data!.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
                          itemBuilder: (context,index) {
                            return Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(image: NetworkImage(snapshot.data!.data![index].thumbnail.toString()),fit: BoxFit.cover,),
                                    ),
                                    Text(snapshot.data!.data![index].title.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                    Text(snapshot.data!.data![index].year.toString()),
                                    Row(
                                      children: [
                                        Icon(Icons.star,color: Colors.amber,),
                                        SizedBox(width: 5,),
                                        Text(snapshot.data!.data![index].ratings!.imDb.toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                      );
                    }else{
                      return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.redAccent,
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                            strokeWidth: 10,
                          ),
                      );
                    }
                  },
                )
            )
          ],
        ),
      )
    );
  }
}
