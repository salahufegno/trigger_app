import 'package:trigger_app/core/services/security/security_services.dart';

///*This extension contains
extension StringX on String {
  ///*
  String get encrept => SecurityServices.encrept(this);

  ///*
  String get decrypt => SecurityServices.decrypt(this);
}
