import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {

 final String testName, title,price;

  const ReusableContainer({super.key, required this.testName, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return  Card(
      
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 130,
        padding: const EdgeInsets.only(left: 8,right: 8,top: 8,bottom: 0),
        color: Colors.white,

        child: Column(
          children: [
            Text(title),
            const SizedBox(height: 2,),
            Text(testName,style: const TextStyle(fontSize: 10),),
            const SizedBox(height: 35,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price),
                Container(height:25,width:25,color:Colors.lightBlue.shade50,child: const Icon(Icons.add,color: Colors.blue,),)
              ],)

          ],
        ),
      ),
    );
  }
}
