import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'The user can use the platform without any hesitation. The following privacy policy is applicable here in this context.\n',
            ),
            Text(
              'This Privacy Policy represents the health information of "TreatMent-চিকিৎসা" and Doctors may collect or receive in connection with your use of the Platform and describes how the personal data such as personal information, health information, medical records from time to time. Please review this section of our Privacy Policy before using our platform.\n',
            ),
            Text(
              'The platform is a technology-based platform that facilitates healthcare and health-related services by BMDC Registered Doctor to patients, with the assistance of healthcare workers/professional, if any, using information and communication technologies (“the Services”). The Doctors who deliver Services through "TreatMent-চিকিৎসা" are independent medical practitioners. Any health data or information related to a patient, such as patient’s history, physical findings, information about disease risks and information about the actual physiological or biomedical state of an individual independent of its source, investigation, medical data, medical images, medical, pathological or investigation reports, lab reports and/or radiological investigations, medication, diagnosis, health education, counselling, treatment clinical progress and supplementary data; handwritten, printed or electronically generated or audio and visual recordings (“Health Information”) shall be covered by the Privacy Policy.\n',
            ),
            Text(
              'Patient\'s privacy protection Policy:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'As a trusted partner in facilitating online medical and clinical/consultation services by Doctors through the Platform (collectively referred to as "us", "we", "our"), we understand that information about you and your health is personal. Because of this, we strive to maintain the confidentiality of your health information. We continuously seek to safeguard that information through administrative, physical and technical means, and otherwise abide by applicable national and district guidelines. Your Health Information is protected by general laws and medical ethics under the Bangladesh Medical and Dental Council Telemedicine Guidelines July 2020 (“the Guidelines”), the Bangladesh Medical and Dental Council Code of Professional Conduct, Etiquette and Ethics (“the Code of Conduct”), and rules, regulations and direction related to data protection and privacy laws of Bangladesh.\n',
            ),
            Text(
              'Usage and disclose policy of health information:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'We may use and disclose your health information for the normal business activities, the purposes described in the Informed Consent and in case of any emergency situation related to you that the law sees as falling in the categories of patient management, payment, and healthcare operations. Below we provide examples of those activities, although not every use or disclosure falling within each category is listed:\n',
            ),

          ],
        ),
      ),
    );
  }
}

