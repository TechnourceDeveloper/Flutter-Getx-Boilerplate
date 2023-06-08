// To parse this JSON data, do
//
//     final testimonialData = testimonialDataFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

TestimonialData testimonialDataFromJson(String str) =>
    TestimonialData.fromJson(json.decode(str));

String testimonialDataToJson(TestimonialData data) =>
    json.encode(data.toJson());

class TestimonialData {
  TestimonialData({
    required this.message,
    required this.data,
  });

  String message;
  List<Datum> data;

  factory TestimonialData.fromJson(Map<String, dynamic> json) =>
      TestimonialData(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.testimonialId,
    required this.title,
    required this.description,
    required this.image,
  });

  String testimonialId;
  String title;
  String description;
  String image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        testimonialId: json["testimonial_id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "testimonial_id": testimonialId,
        "title": title,
        "description": description,
        "image": image,
      };
}
