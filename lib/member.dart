//出席者クラス

class Member {

  //property
  //氏名
  String _name;
  //出欠
  bool _atendanceFlg = false;
  //LTフラグ
  bool _ltFlg;
  //コンパス名
  String _conpassName;

  Member(String name, String compassName, bool ltFlg){
    this._name = name;
    this._conpassName = compassName;
    this._ltFlg = ltFlg;
  }

  void setName(String name) {
    this._name = name;
  }

  String getName() {
    return this._name;
  }

  void setAtendanceFlg(bool atendanceFlg) {
    this._atendanceFlg = atendanceFlg;
  }

  bool isAtendance() {
    return this._atendanceFlg;
  }

  void setLtFlg(bool ltFlg) {
    this._ltFlg = ltFlg;
  }

  bool isLt() {
    return this._ltFlg;
  }

  void setConpassName(String conpassName) {
    this._conpassName = conpassName;
  }

  String getConpassName() {
    return this._conpassName;
  }

}