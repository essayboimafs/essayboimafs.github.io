class brain{
  float[] mid;
  float[] out;
  float[][] theta1;
  float[][] theta2;
  brain(){
    mid = new float[21];
    out = new float[9];
    theta1 = new float[20][10];
    theta2 = new float[9][21];
    randomize();
  }
  void randomize(){
    for(int i=0; i<20;i++){
      for(int j=0; j<10;j++){
      theta1[i][j] = random(-2, 2);
    }
    }
    for(int i=0; i<9;i++){
      for(int j=0; j<21;j++){
      theta2[i][j] = random(-2, 2);
    }
    }
  }
  float[] ans(int[] in){
    for(int i=0;i<20;i++){
      for(int j=0;j<10;j++){
      mid[i]+=in[j]*theta1[i][j];
    }
    mid[i] = (float)Math.tanh(mid[i]);
    }
    for(int i=0;i<9;i++){
      for(int j=0;j<21;j++){
      out[i]+=mid[j]*theta2[i][j];
    }
    out[i] = (float)Math.tanh(out[i]);
    }
    return out;
  }
  void mtuto(){
    for(int i=0;i<20;i++){
      for(int j=0;j<10;j++){
        if(random(1)<.01){
          theta1[i][j] *= random(2);
        }
      }
    }
      for(int i=0;i<9;i++){
      for(int j=0;j<21;j++){
        if(random(1)<.01){
          theta2[i][j] *= random(2);
        }
      }
    }
  }
  }
