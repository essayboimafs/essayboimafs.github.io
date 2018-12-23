class player{
  int let;
  int[] in;
  float max = -1000000;
  int maxin;
  int fitness = 0;
  brain brab;
  player(int let){
    max = -1000000;
    fitness = 0;
    this.let = let;
    in = new int[10];
    brab = new brain();
  }
  float i = 0;
  float j = 0;
  int trys = 0;
  void play(){
    if(!done){
      in[0] = 1;
  for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){
    in[3*i+j+1] = board[i][j];
  }
  }
  for(int i=0;i<9;i++){
    if(brab.ans(in)[i]>max){
      max = brab.ans(in)[i];
      maxin = i;
    }
  }
  if(board[maxin%3][floor(maxin/3)] == 0){
  board[maxin%3][floor(maxin/3)] = let;
    }
    }
}
}
