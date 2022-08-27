import 'package:hooks_riverpod/hooks_riverpod.dart';

final providerRegexEmail=Provider((ref) => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'));