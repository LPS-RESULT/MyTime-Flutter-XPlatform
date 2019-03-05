import 'package:flutter/material.dart';
import 'styles.dart';

class RowBoxData {
  String title;
  String subtitle;
  DecorationImage image;
  RowBoxData({this.subtitle, this.title, this.image});
}

class DataListBuilder {
  List<RowBoxData> rowItemList = new List<RowBoxData>();
  RowBoxData row1 = new RowBoxData(
      title: "NZ Defence Force",
      subtitle: "6 hrs - Automated testing...",
      image: nzdfAvatar);
  RowBoxData row2 = new RowBoxData(
      title: "LPS Wellington",
      subtitle: "2hrs - Brownbag Meeting",
      image: lpsAvatar);

  DataListBuilder() {
    rowItemList.add(row1);
    rowItemList.add(row2);
  }
}
