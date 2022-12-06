import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'base_network.dart';
import 'model.dart';
import 'data_source.dart';
import 'detail_page.dart';

class PageBendera extends StatefulWidget {
  const PageBendera({Key? key}) : super(key: key);
  @override
  _PageBenderaState createState() => _PageBenderaState();
}

class _PageBenderaState extends State<PageBendera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pink[100],
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.black,
      //   title: Text("Daftar Games Free"),
      // ),
      body: _buildDetailCountriesBody()
      ,
    );
  }

  Widget _buildDetailCountriesBody() {
    return Container(
      child: FutureBuilder(
        future: BaseNetwork.getList(''),
        builder: (
            BuildContext context,
            AsyncSnapshot<dynamic> snapshot,
            ) {
          if (snapshot.hasError) {
            print(snapshot);
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            return _buildSuccessSection(snapshot.data);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Empty");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(List<dynamic> data) {
    return Stack(
      children: [
        // Image.asset("assets/bg4.jpg", width: MediaQuery.of(context).size.width,
        //   fit: BoxFit.cover,
        // ),
        // GridView.builder(
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //   ),
        //   itemCount: data.product?.length,
        //   itemBuilder: (BuildContext context, int index) {//2 parameter
        //     final MatchesModel? games = data.product?[index];
        //     return InkWell(
        //       onTap: (){
        //         // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailGames(name: games,)));
        //       },
        //       child: Container(
        //           // shape: RoundedRectangleBorder(
        //           //   side: BorderSide(
        //           //     color: Colors.black,
        //           //   ),
        //           //   borderRadius: BorderRadius.circular(20.0),
        //           // ),
                  
        //             child: SingleChildScrollView(
        //               child: Column(
        //                 children: [
        //                   // SizedBox(
        //                   //     width: 200, height: 130,
        //                   //     child: Image.network("${data.product?[index].date}",)),
        //                   Column(
        //                       children:[
        //                         Text(
        //                         "${data.product?[index].time}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,  color: Colors.white),
        //                       ),
        //                       Text(
        //                         "Platform : ${data.product?[index].location}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,  color: Colors.white),
        //                       )
        //                       ],),
        //                   // SizedBox(
        //                   //   height: 30,
        //                   // ),
        //                 ],
        //               ),
        //             ),
                
        //       ),
        //     );
        //     // _buildItemCountries("${data.countries?[index].name}");
        //   },
        // ),
        ListView.builder(
          
      itemCount: 48,
      itemBuilder: (BuildContext context, int index) {
        MatchesModel matchesModel = MatchesModel.fromJson(data[index]);
        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: ((context) {
                    
                    return DetailPage(id: matchesModel.id.toString(),);
                    })
                  )),
          child: Container(
            child: Center(
              child: Column(
                children: [
                  Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Image.network(
                            'https://countryflagsapi.com/png/${matchesModel!.homeTeam!.name!}', width: 150,height: 150,
                          ),
                          Text(("${matchesModel!.homeTeam!.name!}")),
                        ],
                      ),
                      
                      SizedBox(width: 20,),
                      Text(("${matchesModel!.homeTeam!.goals!}")),
                      SizedBox(width: 20,),
                      Text("-"),
                      SizedBox(width: 20,),
                      Text(("${matchesModel!.awayTeam!.goals!}")),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Image.network('https://countryflagsapi.com/png/${matchesModel!.awayTeam!.name!}',width: 150,height: 150,),
                          Text(("${matchesModel!.awayTeam!.name!}")),
                        ],
                      ),
                    ],
                  ),
                ),
                ],
              ),
            ),
          ),
        );
      },
    ),
      ],
    );
  }

  Widget _buildItemCountries(String value) {
    return Text(value);
  }
}
