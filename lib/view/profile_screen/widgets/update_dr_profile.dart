import 'dart:developer';
import 'dart:io';
import 'package:doctor_app/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../controllers/dr_controller.dart';
import '../../../model/all_country_model.dart';
import 'package:http/http.dart'as http;
class UpdateDrProfile extends StatefulWidget {
  @override
  _UpdateDrProfileState createState() => _UpdateDrProfileState();
}

class _UpdateDrProfileState extends State<UpdateDrProfile> {
  final AppController appController = Get.find();
  final DrController drController = Get.find();
  File? _profilePic;

  Future<void> _uploadProfilePicture() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _profilePic = File(pickedImage.path);
      });
    }
  }

  int ?selectedCountry;


  AllCountryModel ? allCountryModel;
  bool countryLoader = false;

  Future<AllCountryModel?> getApicall() async {

    setState(() {
      countryLoader = true;
    });
    final token = appController.token;

    var response = await http.get(
      Uri.parse("https://treatmenticwl.com/api/countries"),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    print("abir${token}");
    if (response.statusCode == 200) {
      log("RESS Country_${response.body}");
      setState(() {
        allCountryModel =  allCountryModelFromJson(response.body);
        // selectedCountry = allCountryModel!.data![0].id;
        countryLoader = false;
      });

    }else{
      setState(() {
        countryLoader = false;
      });
    }
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _aboutController = TextEditingController();
  TextEditingController _bmdcNoController = TextEditingController();

  int  ? countryIdAPI;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _nameController.text =  drController.doctorProfile.value!.data!.name?? "";
      _emailController.text =  drController.doctorProfile.value?.data?.email?? "";
      _phoneController.text =  drController.doctorProfile.value!.data?.phone?? "";
      _genderController.text =  drController.doctorProfile.value!.data?.gender?? "";
      _aboutController.text =  drController.doctorProfile.value!.data?.about?? "";
      _bmdcNoController.text =  drController.doctorProfile.value!.data?.bmdcNo?? "";
      countryIdAPI =  drController.doctorProfile.value!.data?.countryId;
     selectedCountry = countryIdAPI;


    });

    setState(() {
      getApicall();
    });
  }






  @override
  Widget build(BuildContext context) {
    // TextEditingController _nameController = TextEditingController(
    //     text: drController.doctorProfile.value!.data!.name);
    // TextEditingController _emailController = TextEditingController(
    //     text: drController.doctorProfile.value?.data?.email);
    // TextEditingController _phoneController = TextEditingController(
    //     text: drController.doctorProfile.value?.data?.phone);
    // TextEditingController _genderController = TextEditingController(
    //     text: drController.doctorProfile.value?.data?.gender ?? '');
    // TextEditingController _aboutController = TextEditingController(
    //     text: drController.doctorProfile.value?.data?.about ?? '');
    // TextEditingController _bmdcNoController = TextEditingController(
    //     text: drController.doctorProfile.value?.data?.bmdcNo ?? '');

      print("Image__${drController
          .doctorProfile.value!.data!.profilePhotoUrl}");
      print("COuntryID__${countryIdAPI}");


    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.cyanAccent,
          elevation: 0,
          title: Text('Update Profile'),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey),
                  height: 25,
                  width: 25,
                  child: const Icon(
                    Icons.navigate_before,
                    color: Colors.black,
                  ))),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: _uploadProfilePicture,
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                CircleAvatar(
                      radius: 64.0,
                      backgroundImage:  NetworkImage("${drController.doctorProfile.value!.data!
                          .profilePhotoUrl}"),
                    ) ,


                    CircleAvatar(
                      radius: 64.0,
                      backgroundImage: drController.doctorProfile.value!.data!
                              .profilePhotoUrl!.isNotEmpty
                          ? NetworkImage(drController
                              .doctorProfile.value!.data!.profilePhotoUrl!)
                          : null,
                      child: _profilePic == null &&
                              drController.doctorProfile.value!.data!
                                  .profilePhotoUrl!.isEmpty
                          ? Icon(Icons.person, size: 64.0)
                          : null,
                    ),
                    if (_profilePic != null)
                      CircleAvatar(
                        radius: 64.0,
                        backgroundImage: FileImage(_profilePic!),
                      ),
                    if (_profilePic == null &&
                        drController.doctorProfile.value!.data!.profilePhotoUrl!
                            .isEmpty)
                      Icon(Icons.person, size: 64.0),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                height: 40.0,
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              SizedBox(
                height: 40.0,
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              SizedBox(
                height: 40.0,
                child: TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8.0),

          countryLoader? Center(child: CircularProgressIndicator(),) :
          Container(
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                hint: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text("Please select a country"),
                ),
                isExpanded: true,
                items: allCountryModel!.data!.map((element) {
                  return DropdownMenuItem(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text("${element.name}"),
                    ),
                    value: element.id,
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    selectedCountry = val!;
                  });
                },
                value: selectedCountry,
              ),
            ),
          ),


              SizedBox(height: 11.0),
              SizedBox(
                height: 40.0,
                child: TextFormField(
                  controller: _genderController,
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              SizedBox(
                child: TextFormField(
                  maxLines: 5,
                  controller: _aboutController,
                  decoration: InputDecoration(
                    labelText: 'About',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              SizedBox(
                height: 40.0,
                child: TextFormField(
                  controller: _bmdcNoController,
                  decoration: InputDecoration(
                    labelText: 'BMDC No',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),


              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.cyanAccent,
                    foregroundColor: Colors.black
                ),
                onPressed: () async {
                  String name = _nameController.text;
                  String email = _emailController.text;
                  String phone = _phoneController.text;
                  String gender = _genderController.text;
                  String about = _aboutController.text;
                  String bmdcNo= _bmdcNoController.text;
                  String? profilePicPath;
                  if (_profilePic != null && _profilePic!.existsSync()) {
                    profilePicPath = _profilePic!.path;
                  }

                  await drController.updateProfile(
                    context: context,
                    name: name,
                    email: email,
                    phone: phone,
                    gender: gender,
                    about: about,
                    profilePicPath: profilePicPath,
                    bmdcNo:bmdcNo,
                    countryId: selectedCountry.toString()
                  );

                  drController.fetchDoctorProfile();
                },
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
