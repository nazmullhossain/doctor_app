import 'package:doctor_app/doctor_country_screen/country_screen.dart';
import 'package:doctor_app/view/doctor_screen/widgets/doctors_by_category/doctors_by_dept.dart';
import 'package:doctor_app/view/doctor_screen/widgets/type_wise_list.dart';
import 'package:doctor_app/view/user_home/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../controllers/app_controller.dart';
import '../../controllers/user_controller.dart';
import '../../global_widgets/custom_box_card.dart';
import '../../notificatrion/notification_controller.dart';
import '../../notificatrion/notification_screen.dart';
import '../profile_screen/profile_screen_agent.dart';
import '../profile_screen/profile_screen_user.dart';
import 'package:badges/badges.dart' as badges;
class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> with WidgetsBindingObserver {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  final appController = Get.find<AppController>();

  late TextEditingController search;
  @override
  void initState() {
    super.initState();
    search = TextEditingController();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {

    search.dispose();
    _controller.dispose();
    super.dispose();
  }
  List<String> desiredNames = [
    'Allopathic',
    'Ayurvedic',
    'Herbal',
    'Homoeopathic',
    'Healthy Lifestyle',
    'Skin care',
  ];

  NotificationController notificationController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    Future<void> reloadDeptData() async {
      userController.fetchDepartments();
    }

    Future<void> reloadSliders() async {
      appController.getAllSliders();
    }



    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset('assets/images/slogan.jpg'),
        ),
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: (){
              Get.to(NotificationScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0,right: 10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,

                ),
                child: badges.Badge(
                  badgeContent: Text('${notificationController.count.value.data ?? 0}'),
                  child: Icon(Icons.notifications_outlined,size: 30,),
                ),
              ),
            ),
          ),
          // // GestureDetector(
          // //   onTap: (){
          // //     Get.to(NotificationScreen());
          // //   },
          // //   child: Card(
          // //     margin: const EdgeInsets.fromLTRB(8, 18, 8, 18),
          // //     elevation: 5,
          // //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          // //     child: const SizedBox(
          // //       width: 35,
          // //       child: Center(
          // // GestureDetector(
          // //             onTap: (){
          // //               Get.to(NotificationScreen());
          // //             },
          // //             child: Padding(
          // //               padding: const EdgeInsets.only(top: 8.0,right: 10),
          // //               child: Container(
          // //                 padding: EdgeInsets.all(10),
          // //                 decoration: BoxDecoration(
          // //                   color: Colors.white,
          // //
          // //                 ),
          // //                 child: badges.Badge(
          // //                   badgeContent: Text('3'),
          // //                   child: Icon(Icons.notifications_outlined,size: 30,),
          // //                 ),
          // //               ),
          // //             ),
          // //           ),         child: Icon(Icons.notifications_outlined, color: Colors.red),
          // //       ),
          // //     ),
          // //   ),
          // // ),
          // const SizedBox(
          //   width: 4,
          // ),
          // const SizedBox(
          //   width: 8,
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 12,
            ),
            Obx(() {
              if (appController.isSlidersLoading.value) {
                return Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              } else if (appController.sliders.isNotEmpty) {
                return Container(
                    height: 130,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: ImageSlider(imgSlides: appController.sliders));
              } else {
                return Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                  children: [
                    Text('Error: Failed to load sliders'),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      onPressed: () => reloadSliders(),
                      child: Text('Retry'),
                    ),
                  ],
                ));
              }
            }),
            Obx(() {
              if(userController.isDeptLoading.value){
                return Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ));
              }

          else if (userController.departments.isNotEmpty) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                   itemCount: userController.departments.where((department) {
                     return desiredNames.contains(department.name);
                   }).toList().length,
                   itemBuilder: (BuildContext context, int index) {
                    final dept =  userController.departments.where((department) {
                      return desiredNames.contains(department.name);
                    }).toList()[index];
                    return InkWell(
                      onTap: (){
                        Get.to(CountryScreen());
                        // Get.to(()=>DoctorsByDepartmentScreen(deptId: dept.id));
                      },
                        child: CustomBoxCard(text: dept.name, icon:dept.icon));
                },


                );

              } else {
                return Center(
                  child: Column(
                    children: [
                      Text('Error: Failed to load departments'),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onPressed: () => reloadDeptData(),
                        child: Text('Retry'),
                      ),
                    ],
                  ),
                );
              }
            }),
            const SizedBox(
              height: 8,
            ),
            Stack(
              children: [
                FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          height: 100,
                          child: VideoPlayer(_controller),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                Positioned(
                  top: 30,
                  left: MediaQuery.of(context).size.width / 2.2,
                  child: InkWell(
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                    ),
                    onTap: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
