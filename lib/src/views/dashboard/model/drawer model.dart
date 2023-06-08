// ignore_for_file: file_names

class DrawerModel {
  final String icon;
  final String title;
  String? path;
  DrawerModel({required this.icon, required this.title, this.path});
}

class DrawerItemModel {
  final String? pagename;
  final int selectedtile;

  DrawerItemModel({this.pagename, required this.selectedtile});
}
