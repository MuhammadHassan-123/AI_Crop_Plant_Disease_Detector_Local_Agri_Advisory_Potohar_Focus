import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';

import '../services/history_service.dart';


class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() =>
      _HistoryScreenState();
}


class _HistoryScreenState extends State<HistoryScreen> {

  final HistoryService historyService =
      HistoryService();


  List<Map<String, dynamic>> history = [];

  List<Map<String, dynamic>> filteredHistory = [];

  final TextEditingController searchController =
      TextEditingController();

  String selectedFilter = "All";

  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    loadHistory();
  }



  Future<void> loadHistory() async {

    final data =
        await historyService.getHistory();


    setState(() {

      history = data;

      filteredHistory = data;

      isLoading = false;

    });

  }



  Future<void> clearHistory() async {

    await historyService.clearHistory();

    loadHistory();

  }



  Future<void> deleteItem(int index) async {

    await historyService.deleteHistoryItem(index);

    loadHistory();

  }



  void searchHistory(String value) {

    setState(() {

      filteredHistory = history.where((item) {

        return item["name"]
            .toString()
            .toLowerCase()
            .contains(value.toLowerCase());

      }).toList();

    });

  }



  void applyFilter(String filter) {
    selectedFilter = filter;

    setState(() {
      if (filter == "All") {
        filteredHistory = history;
      } else if (filter == "Healthy") {
        filteredHistory = history.where((item) {
          return item["name"]
              .toString()
              .toLowerCase()
              .contains("healthy");
        }).toList();
      } else {
        filteredHistory = history.where((item) {
          return !item["name"]
              .toString()
              .toLowerCase()
              .contains("healthy");
        }).toList();
      }
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title:
            const Text("Scan History"),

        backgroundColor:
            Colors.green,

        foregroundColor:
            Colors.white,


        actions: [

          IconButton(

            icon:
                const Icon(Icons.delete),

            onPressed: () async {
              await clearHistory();
            },

          ),

        ],

      ),



      body: isLoading

          ? const Center(
              child:
                  CircularProgressIndicator(),
            )


          : history.isEmpty

              ? const Center(

                  child: Text(

                    "No Scan History Yet",

                    style:
                        TextStyle(fontSize: 20),

                  ),

                )


              : Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        controller: searchController,
                        onChanged: searchHistory,
                        decoration: InputDecoration(
                          hintText: "Search disease...",
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Wrap(
                        spacing: 10,
                        children: [

                          FilterChip(
                            label: const Text("All"),
                            selected: selectedFilter == "All",
                            onSelected: (_) => applyFilter("All"),
                          ),

                          FilterChip(
                            label: const Text("Healthy"),
                            selected: selectedFilter == "Healthy",
                            onSelected: (_) => applyFilter("Healthy"),
                          ),

                          FilterChip(
                            label: const Text("Diseased"),
                            selected: selectedFilter == "Diseased",
                            onSelected: (_) => applyFilter("Diseased"),
                          ),

                        ],
                      ),
                    ),

                    Expanded(
                      child: ListView.builder(

                        padding:
                            const EdgeInsets.all(12),


                        itemCount:
                            filteredHistory.length,


                        itemBuilder:
                            (context, index) {


                          final item =
                              filteredHistory[index];


                    final bool isHealthy =
                        item["name"]
                            .toString()
                            .toLowerCase()
                            .contains("healthy");


                    return Card(

                      elevation:
                          5,


                      margin:
                          const EdgeInsets.only(
                              bottom: 15),


                      shape:
                          RoundedRectangleBorder(

                        borderRadius:
                            BorderRadius.circular(18),

                      ),



                      child:
                          Padding(

                        padding:
                            const EdgeInsets.all(12),


                        child:
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [


                                // Image
                                ClipRRect(

                                  borderRadius:
                                      BorderRadius.circular(12),


                                  child:
                                      item["image"] != null

                                          ? Image.file(

                                              File(
                                                item["image"],
                                              ),

                                              height:
                                                  80,

                                              width:
                                                  80,

                                              fit:
                                                  BoxFit.cover,

                                            )

                                          : Container(

                                              height:
                                                  80,

                                              width:
                                                  80,

                                              color:
                                                  Colors.green.shade100,

                                              child:
                                                  const Icon(
                                                Icons.eco,
                                                size: 40,
                                                color: Colors.green,
                                              ),

                                            ),

                                ),



                                const SizedBox(width: 15),



                                Expanded(

                                  child:
                                      Column(

                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,


                                    children: [


                                      Text(

                                        item["name"] ??
                                            "Unknown",


                                        style:
                                            const TextStyle(

                                          fontSize:
                                              17,

                                          fontWeight:
                                              FontWeight.bold,

                                        ),

                                      ),



                                      const SizedBox(height: 5),



                                      Text(

                                        "Confidence: ${((item["confidence"] ?? 0.0) * 100).toStringAsFixed(1)}%",


                                      ),



                                      const SizedBox(height: 5),



                                      Text(

                                        isHealthy

                                            ? "Healthy Plant"

                                            : "Disease Detected",

                                        style:
                                            TextStyle(

                                          color:
                                              isHealthy
                                                  ? Colors.green
                                                  : Colors.red,

                                          fontWeight:
                                              FontWeight.bold,

                                        ),

                                      ),



                                      const SizedBox(height: 5),



                                      Text(

                                        item["time"] ?? "",

                                        style:
                                            const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),

                                      ),


                                    ],

                                  ),

                                ),

                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () async {
                                    final originalIndex = history.indexOf(item);
                                    await deleteItem(originalIndex);
                                  },
                                ),

                              ],

                            ),

                      ),

                    );

                        },

                      ),
                    ),

                  ],
                ),

    );

  }

}