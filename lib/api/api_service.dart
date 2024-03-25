import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import '/../home pages/dashboard.dart';

class ApiService {
  static Future<void> registerUser(
      BuildContext context,
      TextEditingController firstNameController,
      TextEditingController lastNameController,
      TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController phoneController,
      TextEditingController fullAddressController,
      TextEditingController villageController,
      TextEditingController subDistrictController,
      TextEditingController cityDistrictController,
      TextEditingController provinceController,
      TextEditingController postalCodeController,
      TextEditingController textEditingController) async {
    final String apiUrl = 'http://192.168.100.170:8080/api/individuals';

    final response = await http.post(Uri.parse(apiUrl), body: {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'phone': phoneController.text,
      'full_address': fullAddressController.text,
      'village': villageController.text,
      'sub_district': subDistrictController.text,
      'city_district': cityDistrictController.text,
      'province': provinceController.text,
      'postal_code': postalCodeController.text,
    });

    final jsonData = json.decode(response.body);

    // Handle response here, for example, you can check the status code
    if (response.statusCode == 200) {
      // If registration is successful, navigate to dashboard
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } else {
      // If registration fails, show error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registration Failed'),
            content: Text(jsonData['message'] ?? 'Unknown Error'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
