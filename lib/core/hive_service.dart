import 'package:hive_flutter/adapters.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tinda_one_app/features/pages/domain/product_model.dart';

part 'hive_service.g.dart';

class HiveService {
  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(ProductModelHiveAdapter());
    Hive.registerAdapter(ProductSizesHiveAdapter());

    await Hive.openBox<ProductModelHive>('products');
  }

  Box<ProductModelHive> get productBox =>
      Hive.box<ProductModelHive>('products');
}

@riverpod
HiveService hiveService(Ref ref) => HiveService();

@riverpod
Future<void> hiveInit(Ref ref) async {
  final hive = ref.watch(hiveServiceProvider);
  await hive.init();
}
