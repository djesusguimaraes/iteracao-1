import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  late FirebaseFirestore firestore;

  initiliase() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(
      String email, String nome, String senha, double n1, double n2) async {
    try {
      await firestore.collection("alunos").add(
          {'email': email, 'n1': n1, 'n2': n2, 'nome': nome, 'senha': senha});
    } catch (e) {
      print(e);
    }
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot =
          await firestore.collection('alunos').orderBy('nome').get();
      if (querySnapshot.docs.isNotEmpty) {
        
        for (var doc in querySnapshot.docs.toList()) {
          print(doc.id);
          Map a = {
            "id": doc.id,
            "email": doc['email'],
            "n1": doc['n1'],
            "n2": doc["n2"],
            "nome": doc["nome"],
            "senha": doc["senha"]
          };
          print(a);
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return read();
  }

  Future<List> readp() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot =
          await firestore.collection('professores').get();
      if (querySnapshot.docs.isNotEmpty) {
        
        for (var doc in querySnapshot.docs.toList()) {
          print(doc.id);
          Map a = {
            "id": doc.id,
            "email": doc['email'],
            "senha": doc["senha"]
          };
          print(a);
          docs.add(a);
        }
        return docs;
      }
    } catch (e) {
      print(e);
    }
    return read();
  }

  Future<void> update(String id, String email, String nome, String senha,
      double n1, double n2) async {
    try {
      await firestore.collection("alunos").doc(id).update(
          {'email': email, 'n1': n1, 'n2': n2, 'nome': nome, 'senha': senha});
    } catch (e) {
      print(e);
    }
  }

  Future<void> delete(String id) async {
    try {
      await firestore.collection("alunos").doc(id).delete();
    } catch (e) {
      print(e);
    }
  }
}
