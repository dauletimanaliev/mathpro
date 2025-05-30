// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Video _$VideoFromJson(Map<String, dynamic> json) => _Video(
      title: json['title'] as String,
      videoUrl: json['videoUrl'] as String,
      thumbnail: json['thumbnail'] as String,
    );

Map<String, dynamic> _$VideoToJson(_Video instance) => <String, dynamic>{
      'title': instance.title,
      'videoUrl': instance.videoUrl,
      'thumbnail': instance.thumbnail,
    };
