class population{
  player[] dems1;
  player[] dems2;
  int mfit = -1000000;
  int mfiti = 0;
  population(int size){
    mfit = -1000000;
    mfiti = 0;
    dems1 = new player[size/2];
    dems2 = new player[size/2];
    for(int i=0;i<size/2;i++){
      dems1[i] = new player(1);
    }
    for(int i=0;i<size/2;i++){
      dems2[i] = new player(-1);
    }
  }
  player[] generate(){
    player[] selection = new player[2];
    selection[0] = dems1[floor(random(dems1.length))];
    selection[1] = dems2[floor(random(dems1.length))];
    return selection;
  }
  player[] select(int turn){
    player[] demBois = new player[2];
    int sum = 0;
    int rsum = 0;
    float r = 0;
    if(turn==0){
      for(int i=0; i<dems1.length;i++){
        sum += dems1[i].fitness;
      }
      r = random(dems1[0].fitness, sum);
      for(int i=0; i<dems1.length;i++){
        rsum += dems1[i].fitness;
        if(r>=rsum){
          demBois[0] = dems1[i];
        }
      }
      rsum = 0;
      r = random(dems1[0].fitness, sum);
      for(int i=0; i<dems1.length;i++){
        rsum += dems1[i].fitness;
        if(r>=rsum){
          demBois[1] = dems1[i];
        }
      }
    }
    else{
      for(int i=0; i<dems2.length;i++){
        sum += dems2[i].fitness;
      }
      r = random(dems2[0].fitness, sum);
      for(int i=0; i<dems2.length;i++){
        rsum += dems2[i].fitness;
        if(r>=rsum){
          demBois[0] = dems2[i];
        }
      }
      r = random(dems2[0].fitness, sum);
      rsum = 0;
      for(int i=0; i<dems2.length;i++){
        rsum += dems2[i].fitness;
        if(r>=rsum){
          demBois[1] = dems2[i];
        }
      }
    }
    return demBois;
  }
  population bababa(){
    population ngen = new population(dems1.length*2);
    player[] parents;
    int best = -10000;
    int besti = 0;
    for(int i=0;i<dems1.length-1;i++){
      parents = select(0);
      for(int j=0;j<20;j++){
        for(int k=0;k<10;k++){
          ngen.dems1[i].brab.theta1[j][k] = parents[floor(random(2))].brab.theta1[j][k];
        }
      }
      for(int j=0;j<9;j++){
        for(int k=0;k<21;k++){
          ngen.dems1[i].brab.theta2[j][k] = parents[floor(random(2))].brab.theta2[j][k];
        }
      }
      ngen.dems1[i].brab.mtuto();
      if(dems1[i].fitness>best){
        best = dems1[i].fitness;
        besti = i;
      }
    }
    if(dems1[dems1.length-1].fitness>best){
        best = dems1[dems1.length-1].fitness;
        besti = dems1.length-1;
      }
      if(best>100){
        doner = true;
      }
    ngen.dems1[dems1.length-1] = dems1[besti];
    best = -100000;
    besti = 0;
    for(int i=0;i<dems2.length-1;i++){
      parents = select(1);
      for(int j=0;j<20;j++){
        for(int k=0;k<10;k++){
          ngen.dems2[i].brab.theta1[j][k] = parents[floor(random(2))].brab.theta1[j][k];
        }
      }
      for(int j=0;j<9;j++){
        for(int k=0;k<21;k++){
          ngen.dems2[i].brab.theta2[j][k] = parents[floor(random(2))].brab.theta2[j][k];
        }
      }
      ngen.dems2[i].brab.mtuto();
      if(dems2[i].fitness>best){
        best = dems2[i].fitness;
        besti = i;
      }
    }
    if(dems2[dems2.length-1].fitness>best){
        best = dems2[dems2.length-1].fitness;
        besti = dems2.length-1;
      }
      if(best>100){
        doner = true;
      }
    ngen.dems2[dems2.length-1] = dems2[besti];
    return ngen;
  }
}
