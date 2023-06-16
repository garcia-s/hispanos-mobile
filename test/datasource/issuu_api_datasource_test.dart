import 'package:flutter_test/flutter_test.dart';
import 'package:hispanosmobile/datasources/issuu_api_datasource.dart';

void main() {
  test('What does give us', () async {
    await IssuuApiDataSource().getMagazine('edicion_24_he_1_');
  });
}
