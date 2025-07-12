import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/export.dart';

Uint8List decryptAes(Uint8List data, {required String keyOrPassphrase}) {
  final isSalted =
      data.length > 16 && utf8.decode(data.sublist(0, 8)) == 'Salted__';

  Uint8List keyBytes;
  Uint8List iv;
  Uint8List cipherText;

  if (isSalted) {
    // 🧂 OpenSSL-style
    final salt = data.sublist(8, 16);
    cipherText = data.sublist(16);

    final derived = _evpBytesToKey(
      passphrase: keyOrPassphrase,
      salt: salt,
      keyLength: 32,
      ivLength: 16,
    );
    keyBytes = derived.key;
    iv = derived.iv;
  } else {
    keyBytes = hexDecode(keyOrPassphrase.trim());
    if (keyBytes.length != 32) {
      throw Exception('Key must be 64 hex chars (32 bytes)');
    }
    iv = Uint8List(16);
    cipherText = data;
  }

  final cipher = CBCBlockCipher(AESEngine())
    ..init(false, ParametersWithIV(KeyParameter(keyBytes), iv));

  final paddedPlaintext = _processBlocks(cipher, cipherText);
  final unpadded = _removePkcs7Padding(paddedPlaintext);

  return unpadded;
}

Uint8List hexDecode(String hexStr) {
  final cleaned = hexStr.replaceAll(RegExp(r'\s+'), '').toLowerCase();
  if (cleaned.length % 2 != 0) {
    throw FormatException('Hex string must have even length');
  }
  final result = Uint8List(cleaned.length ~/ 2);
  for (var i = 0; i < cleaned.length; i += 2) {
    result[i ~/ 2] = int.parse(cleaned.substring(i, i + 2), radix: 16);
  }
  return result;
}

class _KeyIv {
  final Uint8List key;
  final Uint8List iv;
  _KeyIv(this.key, this.iv);
}

_KeyIv _evpBytesToKey({
  required String passphrase,
  required Uint8List salt,
  required int keyLength,
  required int ivLength,
}) {
  final totalLength = keyLength + ivLength;
  final passBytes = utf8.encode(passphrase);
  final buffer = BytesBuilder();

  Uint8List? prev;
  while (buffer.length < totalLength) {
    final md5 = Digest("MD5");

    final input = BytesBuilder();
    if (prev != null) input.add(prev);
    input.add(passBytes);
    input.add(salt);

    prev = md5.process(input.toBytes());
    buffer.add(prev);
  }

  final derived = buffer.toBytes();
  return _KeyIv(
    derived.sublist(0, keyLength),
    derived.sublist(keyLength, keyLength + ivLength),
  );
}

Uint8List _processBlocks(BlockCipher cipher, Uint8List input) {
  final out = Uint8List(input.length);
  for (int offset = 0; offset < input.length;) {
    offset += cipher.processBlock(input, offset, out, offset);
  }
  return out;
}

Uint8List _removePkcs7Padding(Uint8List data) {
  if (data.isEmpty) throw Exception('Empty decrypted data');
  final padLength = data.last;
  if (padLength <= 0 || padLength > 16) {
    throw Exception('Invalid PKCS7 padding length: $padLength');
  }
  for (int i = 1; i <= padLength; i++) {
    if (data[data.length - i] != padLength) {
      throw Exception('Invalid PKCS7 padding content');
    }
  }
  return data.sublist(0, data.length - padLength);
}
