class TranspositionTechniques {
  String _filterText(String text) {
    text = text.toUpperCase();
    text = text.replaceAll(new RegExp(r'[^\w]+'), '');
    return text;
  }

  String railFenceCipher(String plain, int depth) {

    String cipher = "";
    plain = _filterText(plain);

    var railFence = List<String>.filled(depth, "", growable: false);

    // int i = 0;
    // int flag = 0;
    // while(flag == 0){
    //
    //   int j = -1;
    //   for(j=0; j < depth; j++) {
    //     railFence[j] += plain[i];
    //     if(i < plain.length - 1)
    //       i++;
    //     else
    //       flag = 1;
    //   }
    //   for(j=depth-2; j > 0; j--){
    //     railFence[j] += plain[i];
    //     if(i < plain.length - 1)
    //       i++;
    //     else
    //       flag = 1;
    //   }
    // }

    bool moveDown = true;
    int depthCount = 0;
    for (int i = 0; i < plain.length; i++) {
      railFence[depthCount] += plain[i];
      if (moveDown)
        depthCount++;
      else
        depthCount--;
      if (depthCount == 0 || depthCount == depth - 1) moveDown = !moveDown;
    }

    for (int i = 0; i < depth; i++)
      cipher += railFence[i];
    print(cipher);
    return cipher;
  }

  String railFenceDecryption(String cipher, int depth){
    String plain = "";
    var railFence = List<String>.filled(depth, "", growable: false);


    return plain;
  }

  
}
