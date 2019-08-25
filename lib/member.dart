//出席者クラス
class Member {

  //property
  //氏名
  String name;
  //LTフラグ
  bool ltFlg;
  //コンパス名
  String conpassName;

  Member(String name, bool ltFlg, String compassName){
    this.name = name;
    this.ltFlg = ltFlg;
    this.conpassName = compassName;
  }

}