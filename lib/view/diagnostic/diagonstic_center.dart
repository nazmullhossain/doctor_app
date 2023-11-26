
import 'package:doctor_app/view/diagnostic/widgets/reusable_container.dart';
import 'package:flutter/material.dart';

class Diagnostic extends StatefulWidget {
  const Diagnostic({Key? key}) : super(key: key);

  @override
  State<Diagnostic> createState() => _DiagnosticState();
}

class _DiagnosticState extends State<Diagnostic> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Center(
              child: Text("Coming Soon",style: TextStyle(
                fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold
              ),),
            )
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [Icon(Icons.location_on_rounded,color: Colors.red),
            //   Text("কোনো ঠিকানা পাওয়া যায়নি"),
            //   Icon(Icons.arrow_drop_down_sharp),
            //   Icon(Icons.shopping_cart_outlined)
            // ],),
            // const SizedBox(
            //   height: 10,
            // ),
            // const SizedBox(
            //     height: 40,
            //     child: TextField(
            //       decoration: InputDecoration(
            //           hintText: "নাম/কোড অথবা ডিপার্টমেন্ট দ্বারা ডাক্তার খুঁজুন",
            //           hintStyle: TextStyle(fontSize: 14),
            //           suffixIcon: Icon(Icons.search),
            //           border: OutlineInputBorder()),
            //     )),
            // const SizedBox(
            //   height: 20,
            // ),
            // const Text(
            //   "এটা কীভাবে কাজ করে",
            //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            // ),
            // const Row(
            //
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //   Column(children: [
            //     Icon(Icons.smartphone),
            //     SizedBox(height: 4,),
            //     Text("টেস্ট বুক করুন",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),),
            //     SizedBox(height: 20,),
            //     Text("দ্রুত ও সুবিধাজনক বুকিং",style: TextStyle(fontSize: 8),)
            //
            //   ],),
            //   Icon(Icons.arrow_circle_right,color: Colors.orange,),
            //   Column(
            //     children: [
            //       Icon(Icons.home_filled),
            //       SizedBox(height: 4,),
            //       Text("স্যাম্পল সংগ্রহ",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),),
            //       SizedBox(height: 10,),
            //       Text("একজন অভিজ্ঞ ও পেশাদার\nল্যাব টেকনিশিয়ান বাড়ী থেকে\nস্যম্পল সংগ্রহ করবেন",style: TextStyle(fontSize: 8),)
            //
            //     ],
            //   ),
            //     Icon(Icons.arrow_circle_right,color: Colors.orange,),
            //   Column(
            //     children: [
            //       Icon(Icons.smartphone),
            //       SizedBox(height: 4,),
            //       Text("রিপোর্ট সংগ্রহ",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),),
            //       SizedBox(height: 20,),
            //       Text("২৪ ঘন্টার মধ্যে ট্রীট্মমেন্ট\nএপে রিপোর্ট বুঝে নিন",style: TextStyle(fontSize: 8),)
            //
            //     ],
            //   )
            // ],),
            // const SizedBox(height: 20,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Text("যেই টেস্টগুলো করা যাবে",style: TextStyle(fontWeight: FontWeight.bold),),
            //     SizedBox(
            //       height: 30,
            //       width: 90,
            //       child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //               backgroundColor: Colors.white,
            //               foregroundColor: Colors.blue),
            //           onPressed: () {},
            //           child: const Text("সব দেখুন")),
            //     )
            //   ],
            // ),
            // const Row(
            //   children:  [
            //     Expanded(
            //       child: ReusableContainer(
            //           testName:
            //               "রক্তে হিমোগ্লোবিনের পরিমান/সক্রমণ/এলার্জি বা অন্যান্য অবস্থা নির্ণয়",
            //           title: "CBC",
            //           price: "From: ৳৩৯৯.৮  "),
            //     ),
            //
            //     Expanded(
            //       child: ReusableContainer(
            //           testName: "মূত্রনালীর সংক্রমণ(ইউটিআই)\nএবং মূত্রনালীর\nঅন্যান্য ব্যাধি নির্ণয়", title: "Urine RME", price: "From: ৳১৬০"),
            //     ),
            //   ],
            // ),
            // const Row(
            //   children: [
            //     Expanded(
            //       child: ReusableContainer(
            //           testName: "কিডনির সামগ্রিক কার্যকারিতা নির্ণয়",
            //           title: "Serum Creatinine",
            //           price: "From: ৳৩০০"),
            //     ),
            //
            //     Expanded(
            //       child: ReusableContainer(
            //           testName:
            //               "রক্তে হিমোগ্লোবিনের পরিমান/সক্রমণ/এলার্জি বা অন্যান্য অবস্থা নির্ণয়",
            //           title: "CBC with ESR",
            //           price: "From: ৳৪০০"),
            //     ),
            //   ],
            // )
          ],
      ),
    ),
        ));
  }
}
