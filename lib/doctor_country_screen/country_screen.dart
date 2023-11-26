// import 'package:doctor_app/controllers/app_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'find_by_country_doctor_screen.dart';
//
//   class CountryScreen extends StatefulWidget {
//     const CountryScreen({super.key});
//
//     @override
//     State<CountryScreen> createState() => _CountryScreenState();
//   }
//
//   class _CountryScreenState extends State<CountryScreen> {
//
//     final AppController appController = AppController();
//
//
//     @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     appController.getdata();
//   }
//
//   String ?  searchCountry;
//
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         backgroundColor: Colors.grey[300],
//         appBar: AppBar(
//           title: Text("Country Screen"),
//         ),
//         body: Column(
//           children: [
//
//             Padding(
//               padding: const EdgeInsets.only(left: 8.0,right: 8,top: 11,bottom: 16),
//               child: TextField(
//                 onChanged: (val){
//                   setState(() {
//
//                   });
//                 },
//                 decoration: InputDecoration(
//                   hintText: "Search your country",
//                   border: OutlineInputBorder(),
//                   fillColor: Colors.white,
//                   filled: true
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Obx(() {
//                 if(appController.countryLoader.value){
//                   return Center(child: CircularProgressIndicator(),);
//                 }else{
//                   return ListView.builder(
//                     shrinkWrap: true,
//                     primary: false,
//                     itemCount: appController.countryList.length,
//                     itemBuilder: (_,index){
//                       var data = appController.countryList[index];
//
//                       return InkWell(
//                         onTap: (){
//                           Get.to(DoctorCountryScreen(
//                             countryId:data.id,
//                             countryName: data.name,
//                           ));
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(5.0),
//                           child: Container(
//
//                             padding: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Text("${data.name}"),
//                               )),
//                         ),
//                       );
//                     },
//                   );
//                 }
//               }),
//             ),
//
//           ],
//         ),
//       );
//     }
//   }

import 'package:doctor_app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'find_by_country_doctor_screen.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  final AppController appController = AppController();
  TextEditingController searchController = TextEditingController(); // Declare TextEditingController

  @override
  void initState() {
    super.initState();
    appController.getdata();
  }

  String? searchCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Country Screen"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 11, bottom: 16),
            child: TextField(
              controller: searchController, // Assign the TextEditingController
              onChanged: (val) {
                setState(() {
                  searchCountry = val; // Update the search query
                });
              },
              decoration: InputDecoration(
                hintText: "Search your country",
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (appController.countryLoader.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                // Filter the countryList based on search query
                var filteredCountries = appController.countryList.where((country) {
                  if (searchCountry == null || searchCountry!.isEmpty) {
                    return true; // Show all countries if search query is empty
                  } else {
                    return country.name!.toLowerCase().contains(searchCountry!.toLowerCase());
                  }
                }).toList();

                return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: filteredCountries.length,
                  itemBuilder: (_, index) {
                    var data = filteredCountries[index];

                    return InkWell(
                      onTap: () {
                        Get.to(DoctorCountryScreen(
                          countryId: data.id,
                          countryName: data.name,
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${data.name}"),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}

  