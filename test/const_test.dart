/// author   Mr.Hu(Jc) flutter_learn
/// create   2019-07-08 15:13
/// describe
/// update

class ConstTest{
  var name = "name";
  Object nameO = "nameO";
  dynamic nameD = "nameD";
  String nameS = "nameS";

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ConstTest &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              nameO == other.nameO &&
              nameD == other.nameD &&
              nameS == other.nameS;

  @override
  int get hashCode =>
      name.hashCode ^
      nameO.hashCode ^
      nameD.hashCode ^
      nameS.hashCode;



}
