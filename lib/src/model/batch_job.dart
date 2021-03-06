import 'dart:async';
import 'package:json_annotation/json_annotation.dart';

part 'batch_job.g.dart';

@JsonSerializable()
class BatchJob {
  final String id;
  final String method;
  final String uri;
  final Map<String, String> params;

  @JsonKey(ignore: true)
  final Completer completer = new Completer();

  Future get future => completer.future;

  BatchJob(this.id, this.method, this.uri, this.params);
  factory BatchJob.fromJson(Map<String, dynamic> json) =>
      _$BatchJobFromJson(json);
  Map<String, dynamic> toJson() => _$BatchJobToJson(this);
}
