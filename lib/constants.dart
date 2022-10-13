import 'package:flutter/material.dart';
import 'package:tiktok_clone/view/screens/add_video.dart';

//Colors
const backgroundColor = Color.fromRGBO(24, 26, 32, 1);
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

var pageIndex = [
  const Text(
    "Home",
  ),
  const Text(
    "Search",
  ),
  const AddVideo(),
  const Text(
    "Messages",
  ),
  const Text(
    "Profile",
  )
];
