import 'package:flutter/material.dart';

class InputController with ChangeNotifier{
  List<double> vocDataList = [2,1.95,1.71,1.65,1.54,1,0.7,0.65,0.5,
                              0.35,0.2,0.17,0.15,0.1,0.05,0.03,0.01,0.005,0.000001];
  List<int> vocChoiceList = [];
  List<bool> selectionList1 = List.filled(19, false);
}