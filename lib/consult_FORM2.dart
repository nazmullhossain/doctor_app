import 'package:doctor_app/api_services/payment_service.dart';
import 'package:doctor_app/view/timer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ConsultationForm2 extends StatefulWidget {
  final String? doctorID;
  final String? customerMsisdn;
  final String? paymentID;
  final String? trxID;
  final String? amount;
  final String? merchantInvoiceNumber;

  final String? time;


  const ConsultationForm2(
      {super.key,
        this.customerMsisdn,
        this.paymentID,
        this.trxID,
        this.amount,
        this.merchantInvoiceNumber,
        this.doctorID, this.time,

      });

  @override
  ConsultationForm2State createState() => ConsultationForm2State();
}

class ConsultationForm2State extends State<ConsultationForm2> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _problemDescriptionController =
  TextEditingController();

  String? _selectedGender;
  DateTime? _selectedDate;
  String _selectedReason = "";
  String? _fileName;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Final Amount --- ${widget.amount}');
    return SafeArea(
      child: Scaffold(
        appBar: (AppBar(
          elevation: 0,
          title: const Text(
            "Consultation Details",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
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
        )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 5,
                margin: const EdgeInsets.all(12),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 42,
                        child: TextFormField(
                          controller: _fullNameController,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text('Gender:'),
                              const SizedBox(width: 16.0),
                              Radio(
                                value: 'Male',
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value;
                                  });
                                },
                              ),
                              const Text('Male'),
                              const SizedBox(width: 16.0),
                              Radio(
                                value: 'Female',
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value;
                                  });
                                },
                              ),
                              const Text('Female'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          elevation: 5,
                          child: Row(
                            children: [
                              SizedBox(
                                height: 40,
                                child: IconButton(
                                  icon:
                                  const Icon(Icons.calendar_month_rounded),
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now(),
                                      locale: const Locale('en', 'US'),
                                      initialDatePickerMode: DatePickerMode.day,
                                      builder: (BuildContext context,
                                          Widget? child) {
                                        return Theme(
                                          data: ThemeData.light().copyWith(
                                            cupertinoOverrideTheme:
                                            const CupertinoThemeData(
                                              textTheme: CupertinoTextThemeData(
                                                dateTimePickerTextStyle:
                                                TextStyle(
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                    ).then((pickedDate) {
                                      if (pickedDate != null) {
                                        setState(() {
                                          _selectedDate = pickedDate;
                                        });
                                      }
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              Text(
                                _selectedDate != null
                                    ? 'Date of Birth: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}'
                                    : 'Date of Birth: Not Selected',
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: _weightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Weight (kg)',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      // SizedBox(
                      //   height: 60,
                      //   child: DropdownButtonFormField<String>(
                      //     value: _selectedReason,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         _selectedReason = value;
                      //       });
                      //     },
                      //     decoration: InputDecoration(
                      //       labelText: 'Main Reason for Visit',
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //       ),
                      //     ),
                      //     items: <String>[
                      //       'Headache',
                      //       'Chest Pain',
                      //       'Runny Nose',
                      //       'Belly Pain',
                      //       'Breathing Difficulty'
                      //     ].map<DropdownMenuItem<String>>((String value) {
                      //       return DropdownMenuItem<String>(
                      //         value: value,
                      //         child: Text(value),
                      //       );
                      //     }).toList(),
                      //   ),
                      // ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _problemDescriptionController,
                        maxLines: 3,
                        maxLength: 200,
                        decoration: InputDecoration(
                          labelText: 'Briefly Describe the Problem',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all()),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_fileName ?? "No file selected",
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis)),
                                IconButton(
                                    onPressed: () {
                                      _pickFile();
                                    },
                                    icon: const Icon(Icons.cloud_upload_sharp))
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan),
                          onPressed: () {
                            PaymentService222.sendResponse(
                              doctorID: widget.doctorID!,
                              fullName: _fullNameController.text,
                              age: '${_selectedDate}',
                              weight: _weightController.text,
                              reason: _selectedReason,
                              description: _problemDescriptionController.text,
                              amount: widget.amount!,
                              customerMisdn: widget.customerMsisdn!,
                              invoiceNumber: widget.merchantInvoiceNumber!,
                              paymentID: widget.paymentID!,
                              trxID: widget.trxID!,
                                schdule: 1,
                              time: "${widget.time}"

                            )..then((value) {
                              return Get.to(() => TimerScreen());
                            });
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
