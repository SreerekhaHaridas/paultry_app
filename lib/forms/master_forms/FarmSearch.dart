// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> allNames = ["Farm1", "Farm2", "Farm3", "Farm4"];

  var suggestion = ["Farm1", "Farm2", "Farm3"];
  List<String> searchResult = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchResult.clear();
    searchResult =
        allNames.where((element) => element.startsWith(query)).toList();
    return Center(
      child: Container(
        width: 130,
        height: 130,
        child: Card(
          color:Colors.lightGreen.shade900,
          child: Center(
            child: Text(query,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                )),
          ),
        ),
      ),
    );

    // return Container(
    //   margin: EdgeInsets.all(20),
    //   child: ListView(
    //       padding: EdgeInsets.only(top: 8, bottom: 8),
    //       scrollDirection: Axis.vertical,
    //       children: List.generate(suggestion.length, (index) {
    //         var item = suggestion[index];
    //         return Card(
    //           color: Colors.white,
    //           child: Container(padding: EdgeInsets.all(16), child: Text(item)),
    //         );
    //       })),
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    final suggestionList = query.isEmpty
        ? suggestion
        : allNames.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          if (query.isEmpty) {
            query = suggestion[index];
          }
        },
        leading: Icon(query.isEmpty ? Icons.history : Icons.search),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.black87),
                  )
                ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}
