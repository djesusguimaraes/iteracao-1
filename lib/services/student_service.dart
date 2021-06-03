import '../entities/student.dart';

abstract class StudentService {
  Stream<List<Student>> all();
  Future<Student> add(Student teacher);
  Future<void> remove(Student teacher);
}
