import 'package:braber/data/datasource/auth/DatatSource.dart';
import 'package:braber/data/datasource/FireStore.dart';
import 'package:braber/data/model/User.dart';
import 'package:braber/domin/Usecase/Fauilers.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: DataSource)
class authDataSourceimpl implements DataSource {

  @override
  Future<Either<Fauilers, UserModel>> login(
      String email, String password) async {
    try {
      final credatinal = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      final user = UserModel(
          id: credatinal.user?.email,
          name: credatinal.user?.displayName,
          email: credatinal.user?.email);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(ServerError(errormassage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        return Left(ServerError(errormassage: 'Wrong password provided.'));
      } else {
        return Left(ServerError(errormassage: 'Wrong .'));
      }
    } catch (e) {
      return Left(NetworkError(errormassage: 'Network Error'));
    }
  }

  @override
  Future<Either<Fauilers, UserModel>> signup(String email, String password, String name) async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
var user=UserModel(name: name, email: credential.user?.email,
    id: credential.user?.uid);
await FireStore.saveuser(user);
return Right(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
       return Left(ServerError(errormassage: 'weak-password' ));
      } else if (e.code == 'email-already-in-use') {
        return Left(ServerError(errormassage: 'weak-password' ));
      }
      else{
        return Left(ServerError(errormassage: 'An unknown error occurred.'));
      }
    } catch (e) {
      return Left(NetworkError(errormassage: 'Please check Internet' ));
    }
  }

}
