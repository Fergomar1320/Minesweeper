Tab myTab;

void setup() {
  myTab= new Tab();
  size (520, 520);
  myTab.coordenadas();
  myTab.num();
  myTab.table();
  myTab.colocar();
  myTab.tapar();
  myTab.eliminar();
  myTab.console();
}

void draw() {
  myTab.tapar();
  myTab.cuadro();
}



class Tab {
  int tab=12;
  int bom=10;
  int c=bom;
  int x1=0, y1=0;
  int ar [][]= new int [tab][tab];
  boolean ban[][]= new boolean [tab][tab];
  boolean check [][]= new boolean [tab][tab];
  boolean visit [][]= new boolean [tab][tab];
  boolean p=false;
  int rx, ry;
  int cx[]= new int [bom];
  int cy[]= new int [bom]; 

  Tab() {
    for (int i=0; i<tab; i++) {
      for (int j=0; j<tab; j++) {
        check[j][i]=true;
        visit[j][i]=false;
        ban[j][i]=false;
      }
    }
  }

  void coordenadas() {
    for (int i=0; i<bom; i++) {
      rx=int(random(1, tab-1));
      ry=int(random(1, tab-1));
      while (ar[rx][ry]==10) {
        rx=int(random(1, tab-1));
        ry=int(random(1, tab-1));
      }
      ar[rx][ry]=10;
      print(rx, " ");
      println(ry);
      println(" ");
    }
  }
  void num() {
    for (int i=1; i<tab-1; ) {
      for (int j=1; j<tab-1; ) {
        if (ar[j][i]!=10) {
          if (ar[j-1][i+1]==10) {
            ar[j][i]++;
          }
          if (ar[j-1][i]==10) {
            ar[j][i]++;
          }
          if (ar[j-1][i-1]==10) {
            ar[j][i]++;
          }
          if (ar[j+1][i+1]==10) {
            ar[j][i]++;
          }
          if (ar[j+1][i]==10) {
            ar[j][i]++;
          }
          if (ar[j+1][i-1]==10) {
            ar[j][i]++;
          }
          if (ar[j][i+1]==10) {
            ar[j][i]++;
          }
          if (ar[j][i-1]==10) {
            ar[j][i]++;
          }
        }
        j++;
      }
      i++;
    }
  }

  void table() {
    background (50); 
    rect(10, 10, 1, 500);
    rect(10, 10, 500, 1);
    for (int i=61; i<520; i=i+50) {
      rect(i, 10, 1, 500);
    }
    for (int i=61; i<520; i=i+50) {
      rect(10, i, 500, 1);
    }
  }

  void tapar() {
    int x=12, y=12;
    for (int i=1; i<tab-1; ) {
      for (int j=1; j<tab-1; j++) {
        if (check[j][i]==true) {
          fill(255, 255, 255);
          noStroke();
          square(x, y, 48);
        }
        x=x+50;
      }
      y=y+50;
      x=12;
      i++;
    }
  }

  void cuadro() {
    int x=12, y=12;
    for (int i=1; i<tab-1; ) {
      for (int j=1; j<tab-1; j++) {
        if (myTab.ban[j][i]==true) {
          fill(255, 0, 0);
          noStroke();
          square(x, y, 48);
        }
        x=x+50;
      }
      y=y+50;
      x=12;
      i++;
    }
    fill(255, 255, 255);
  }

  void colocar() {
    int sx=27;
    int sy=45;
    for (int i=1; i<tab-1; i++) {
      for (int j=1; j<tab-1; j++) {
        textSize(30);
        if (ar[j][i]==10) {
          if (ban[j][i]==false) {
            fill(255, 0, 0);
            text("B", sx, sy);
          }
          fill(255, 255, 255);
        } else if (ar[j][i]==0) {
          if (ban[j][i]==false) {
            text(" ", sx, sy);
          }
        } else {
          if (ban[j][i]==false) {
            text(ar[j][i], sx, sy);
          }
        }
        sx=sx+50;
      }
      sx=27;
      sy=sy+50;
    }
  }

  void eliminar() {
    for (int i=0; i<tab; i=i+11) {
      for (int j=0; j<tab; j++) {
        ar[j][i]=-1; 
        ar[i][j]=-1;
      }
    }
  }

  void console() {
    for (int i=0; i<tab; ) {
      for (int j=0; j<tab; j++) {
        print(ar[j][i], " ");
      }
      println(" ");
      i++;
    }
  }
  void destape(int a, int b) {
    check[a][b]=false;
    visit[a][b]=true;
    if (ar[a][b]==0) {     
      check[a][b+1]=false;      
      check[a][b-1]=false;      
      check[a+1][b]=false; 
      check[a+1][b+1]=false;  
      check[a+1][b-1]=false;    
      check[a-1][b]=false; 
      check[a-1][b-1]=false;    
      check[a-1][b+1]=false;

      if (visit [a][b+1]==false) {
        myTab.destape(a, b+1);
      }

      if (visit [a][b-1]==false) {
        myTab.destape(a, b-1);
      }

      if (visit [a+1][b]==false) {
        myTab.destape(a+1, b);
      }

      if (visit [a+1][b+1]==false) {
        myTab.destape(a+1, b+1);
      }

      if (visit [a+1][b-1]==false) {
        myTab.destape(a+1, b-1);
      }

      if (visit [a-1][b]==false) {
        myTab.destape(a-1, b);
      }

      if (visit [a-1][b-1]==false) {
        myTab.destape(a-1, b-1);
      }

      if (visit [a-1][b+1]==false) {
        myTab.destape(a-1, b+1);
      }
    }
  }
  void perder() {
    int bm=0;
    if (p==true) {
      for (int i=1; i<tab-1; i++) {
        for (int j=1; j<tab-1; j++) {
          if (ar[j][i]==10 && ban[j][i]==true){
            bm++;
          }
        }
      }
      if (bm==bom){
        myTab.table();
        myTab.colocar();
        for (int i=1; i<tab-1; i++){
          for (int j=1; j<tab-1; j++){
           ban[j][i]=false; 
           check[j][i]=false;
          }
        }
        textSize(70);
        fill(0, 255, 0);    
        text("HAS GANADO", 35, 250);
        fill(255,255,255);
      }
    }
  }

  
}

void mousePressed() {
  int x=0, y=0;
  x=((mouseX-10)/50)+1;
  y=((mouseY-10)/50)+1;
  if (mouseButton==LEFT) {
    myTab.destape(x, y);
    if (myTab.c>0) {
      background(51);
      myTab.table();
      myTab.colocar();
      myTab.tapar();
      if (myTab.ar[x][y]==10) {
        myTab.c=0;

        for (int i=1; i<myTab.tab-1; i++) {
          for (int j=1; j<myTab.tab-1; j++) {
            myTab.check[j][i]=false;
            myTab.ban[j][i]=false; 
          }
        }
        myTab.table();
        myTab.colocar();
        textSize(70);
        fill(255, 0, 0);    
        text("HAS PERDIDO", 35, 250);
        
      }
      println("check: ", myTab.check[x][y]);
      println("Arreglo: ", myTab.ar[x][y]);
      println("Visit: ", myTab.visit[x][y]);
      println("Coor: ", x, " ", y);
      println(" ");
    }
  } else if (mouseButton==RIGHT) {   
    if (myTab.ban[x][y]==true) {
        myTab.ban[x][y]=false;
        myTab.check[x][y]=true;
        myTab.c++;
      } else if (myTab.c>0) {          
      if (myTab.ban[x][y]!=true && myTab.check[x][y]==true) {
        myTab.c--;
        myTab.check[x][y]=false;
        myTab.ban[x][y]=true;
       
      }
      println("Coor: ", x, y);
      println("Mina: ", myTab.ban[x][y]);
      println("Minas Restantes: ", myTab.c);
      println("");
      if (myTab.c==0){
       myTab.p=true; 
       myTab.perder();
      }
    }
  }
}
