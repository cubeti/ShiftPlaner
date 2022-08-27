import 'package:encrypt/encrypt.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class EncryptService{
  late final String _key;
  late final Encrypter _encrypter;
  late final _iv;
  EncryptService(){
    _key=dotenv.env['key']!;
    _encrypter=Encrypter(AES(Key.fromUtf8(_key)));
    _iv=IV.fromLength(16);
  }
  String encrypt(String txt){
    return _encrypter.encrypt(txt, iv: _iv).base64;
  }
  String decrypt(String txt){
    return _encrypter.decrypt(Encrypted.from64(txt),iv: _iv);
  }




}