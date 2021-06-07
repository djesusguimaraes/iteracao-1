import '../entities/teacher.dart';

abstract class TeacherService {
  Stream<List<Teacher>> all();
  Future<Teacher> add(Teacher teacher);
  Future<void> remove(Teacher teacher);
}
