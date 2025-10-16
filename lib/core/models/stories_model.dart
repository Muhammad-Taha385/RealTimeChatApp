import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:real_time_chat_application/core/models/usermodel.dart';

class StoriesModel {
  // final String id;
  final String fromUid;
  final List<String> toUids;
  final String mediaUrl;
  final DateTime timeStamp;
  final String status;

  StoriesModel({
    // required this.id,
    required this.fromUid,
    required this.mediaUrl,
    required this.timeStamp,
    required this.status,
    required this.toUids,
  });

  factory StoriesModel.fromMap(Map<String, dynamic> map, String docId) {
    return StoriesModel(
     
      fromUid: map['fromUid'] ?? '',
      toUids: List<String>.from(map['toUids'] ?? []),
      mediaUrl: map['mediaUrl'] ?? '',
      status: map['status'] ?? '',
      timeStamp: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "toUids":toUids,
      'fromUid': fromUid,
      'mediaUrl': mediaUrl,
      'status': status,
      'createdAt': timeStamp,
    };
  }

  String toJson() => json.encode(toMap());
}
