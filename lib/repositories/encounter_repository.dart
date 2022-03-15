import 'package:cat_alogue/models/encounter/encounter.dart';
import 'package:cat_alogue/repositories/repository.dart';
import 'package:cat_alogue/services/data/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EncounterRepository extends IRepository<Encounter> {
  final user = DatabaseService.userDoc;
  static QueryDocumentSnapshot? lastSnapshot;
}
