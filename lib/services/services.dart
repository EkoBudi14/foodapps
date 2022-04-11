import 'dart:convert';

// import 'package:flutter/cupertino.dart';
import 'package:misefood/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

part 'user_services.dart';
part 'food_services.dart';
part 'transaction_services.dart';

String baseURL = 'http://misefood-laravel.xyz/api/';
// 'http:///misefood-backend-fix.test/api/'
// http://127.0.0.1/misefood-backend-fix/
// http://misefood-laravel.xyz/api/
