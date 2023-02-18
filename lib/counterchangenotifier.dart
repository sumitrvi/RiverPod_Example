import 'package:flutter/widgets.dart';

class CounterChangeNotifier extends ChangeNotifier
{
  int _counter=0;

  int get clicks=>_counter;

  void increment(){
    _counter++;
    notifyListeners();
  }
  void decrement(){
    if(_counter>=1){
      _counter--;
      notifyListeners();
    }
  }
}