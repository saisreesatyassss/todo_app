import 'dart:async';

import 'package:flutter/material.dart';
import '../pages/RegisterScreen.dart';
import '../pages/home.dart';
import 'api_service.dart';

class SplashServices {
  final ApiService _apiService = ApiService();

  Future<void> checkAuthentication(BuildContext context) async {
    String? token = await _apiService.getToken();
    Timer(const Duration(milliseconds: 3500), () {
      if (token != null && token.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => RegisterScreen()),
        );
      }
    });
    // if (token != null && token.isNotEmpty) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => Home()),
    //   );
    // } else {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => RegisterScreen()),
    //   );
    // }
  }
}
//  Timer(const Duration(milliseconds: 2000), () {
//       if(uid==null){
//         Get.to(SignUp());
//       }else{
//         final homeController=Get.put(HomeController());
//         final newTaskController=Get.put(NewTaskController());
//         homeController.getTasks();
//         Get.to(HomePage());
//       }
//     });