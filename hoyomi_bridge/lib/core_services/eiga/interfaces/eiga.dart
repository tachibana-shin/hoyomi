import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hoyomi_bridge/export.dart';
import 'package:eval_annotation/eval_annotation.dart';

part 'eiga.freezed.dart';
part 'eiga.g.dart';

@freezed
@Bind()
sealed class Eiga with _$Eiga {
  const factory Eiga({
    required String name,
    required String eigaId,
    String? originalName,
    required OImage image,
    EigaEpisode? lastEpisode,
    DateTime? lastUpdate,
    String? notice,
    int? countSub,
    int? countDub,
    double? rate,
    @Default(false) bool pending,
    DateTime? preRelease,
    String? description,
  }) = _Eiga;

  factory Eiga.fromJson(Map<String, dynamic> json) => _$EigaFromJson(json);

  factory Eiga.createFakeData() {
    return Eiga(
      name: 'Dragon Ball Daima',
      eigaId: 'eiga-fake-id',
      originalName: null,
      image: OImage.createFakeData(),
      lastEpisode: null,
      lastUpdate: null,
      notice: 'Notice Fake',
      rate: 8.5,
    );
  }
}
