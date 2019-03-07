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
      title: "BNZ The Terrace",
      subtitle: "6 hrs - iOS Swift Development",
      image: nzdfAvatar);
  RowBoxData row2 = new RowBoxData(
      title: "LPS Wellington",
      subtitle: "2 hrs - Brownbag Meeting",
      image: lpsAvatar);

  DataListBuilder() {
    rowItemList.add(row1);
    rowItemList.add(row2);
  }
}
