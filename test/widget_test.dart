// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'const_test.dart';

void main() {
//  var test = new ConstTest();
//  print(test.name);
//  print(test.nameD);
//  print(test.nameO);
//  print(test.nameS);
//  _test("2", "4");
//  final list = [2, "4", "2", null];
//  list.forEach(_printElement);
//  final listA = {[], []};
//  var listAType = listA?.runtimeType;
//  print("listAType=$listAType");

  var employee = Employee.C("2",4,z: "zzzzzzzz");
  employee.p();
}

_test(String a, String b, [String c = "c"]) {
  print("a= $a");
  print("b= $b");
  print("c= $c");
}

_printElement(var element) {
  var elementType = element.runtimeType;
  var elementHashCode = element.hashCode;
  if (elementType == String) {
    print("element = $elementType");
    print("element = $elementHashCode");
  }
}

class ExtendA {
  var x, y, z;

  ExtendA.C(this.x, this.y, [this.z = "2222"]) {
    print(" ExtendA->.C()");
    print("ExtendA->x = $x,y = $y,z = $z");
  }

  void p() {
    print("ExtendA->P()");
  }
}

class ImplA {
  void p() {
    print("ImplA->P()");
  }
}

class ImplB {
  void p() {
    print("ImplB->P()");
  }
}

class MiXinA {
  void p() {
    print("MiXinA->P()");
  }
}

class MiXinB {
  void p() {
    print("MiXinB->P()");
  }
}

///
/// 优先级 with(后进先出)>extends>implements
///
///
class Employee extends ExtendA with MiXinA, MiXinB implements ImplA, ImplB {
  var x, y, z;

  Employee.C(this.x, this.y, {this.z = "Employee",a}) : super.C(x, y, z){
    print(" Employee->.C()");
    print("Employee->x = $x,y = $y,z = $z");
  }

}
