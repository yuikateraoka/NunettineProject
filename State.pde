import java.awt.*; //<>//
import processing.video.*;
Movie movie1,movie2,movie3,movie4;
String msg; //状態MSG

PImage image[] = new PImage[20];
int index = 0;
int wait = 1000;

//Button 틀래스 메소드
Button  btnVehicle,btnAnimal,btnColor,btnFood,btnNum,btnRandom,btnBack,btnRecord,btnGameStart,
        btnHome,btnMusic, btnEnd1, btnTomato, btnBear, btnWord, btnPig,btnEnd2,btnCard,btnSafe,
        btnNote,btnView,btnWrite1,btnPlay,btnStop,btnPause,btnSafety1,btnSafety2,btnSafety3,
        btnSafety4,btnNum1,btnNum2,btnNum3,btnNum4,btnQuiz;  

PImage  img,imgVehicle,imgAnimal,imgColor,imgFood,imgNum,imgRondom,imgBack,imgStart,imgTitle,imgWrite,
        imgHome,imgMusic,imgReady,bgd,random,imgBack2,imgBack5,imgView,imgBack4,
        imgWrite1,imgWrite2,imgPlay,imgStop,imgPause,imgSafety1,imgSafety2,imgSafety3,imgSafety4,imgBack3,imgQuiz,
        imgblue,imgred,imgopen,imgnotOpen,imgtouch,imgdontTouch,imgBack6,imgNum1,imgNum2,imgNum3,imgNum4,imgeat,imghand,
        imgQback,cimgB,cimgR,imgHome2; 
        
import org.gicentre.handy.*; 
HandyRenderer h;
Flower[] flowers = new Flower[5];

import ddf.minim.*;
Minim minim;
AudioPlayer song1,song2,song3,song4, song5,song6,song7,song8,
            song9,song10,song11,song12;
PFont font;


class TitleState extends State {
  void drawState() {
    font = createFont("굴림체",20);
    imgTitle = loadImage("imgTitle.png");
    imageMode( CORNER );
    image(imgTitle, 0.1, 0.1, width, height); 
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    btnGameStart = new Button(353, 370, 120, 70,  color(204, 80, 255, 85),"START!");
    btnGameStart.run();
  }

  State decideState() {
    if (btnGameStart.isPush()) { 
      return new MenuState(); // start game
    }
    return this;
  }
}

class MenuState extends State {
  void drawState() {
    fill(0); // moji color  
    font = createFont("굴림체",20);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    
    //그림 읽기
    imgBack2 = loadImage("Menu3.jpg"); 
        
    imageMode( CORNER );
    image(imgBack2, 0, 0, width, height);
    
  //  버튼 생성
    btnCard =new Button(110, 220, 100, 120,  color(190, 100, 70,0), "");
    btnNote =new Button(470, 180, 100, 120, color(190, 100, 70,0), "");   
    btnSafe = new Button(290, 310, 100, 120, color( 220, 80, 100, 0), "");
    btnBack = new Button(600, 360, 100, 120, color( 220, 80, 100, 0), "");       
            
  // 버튼 실행
    btnCard.run();
    btnNote.run();
    btnSafe.run(); 
    btnBack.run();           
   }  
   
  State decideState() {      
    if (btnCard.isPush()) { // if ellapsed time is larger than
      return new GameState0 (); // go to ending
    }  
     else if
    (btnBack.isPush()) {
      return new TitleState();    
    }
     else if
    (btnSafe.isPush()) {
      return new Safety0();    
    }  
     else if
    (btnNote.isPush()) {
      return new Music ();
    } 
    return this;
  }
}

class Safety0 extends State {
  void drawState() {
    fill(0); // moji color  
    font = createFont("굴림체",20);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    imgHome = loadImage("home.png");
    imgQuiz = loadImage("Qize.png");
    imgBack3 = loadImage("back3.png");
    imageMode( CORNER );
    image(imgBack3, 0, 0, width, height);
    
    //그림 읽기
    imgSafety1 = loadImage("imSafety1.png");
    imgSafety2 = loadImage("imSafety2.png");
    imgSafety3 = loadImage("imSafety3.png");
    imgSafety4 = loadImage("imSafety4.png");
    
  //  버튼 생성
    btnSafety1 =new Button(200, 150, 130, 130, color(190, 100, 70,190), "");
    btnSafety2 =new Button(500, 150, 130, 130, color(190, 100, 70,190), "");
    btnSafety3 =new Button(200, 320, 130, 130, color(190, 100, 70,190), "");
    btnSafety4 =new Button(500, 320, 130, 130, color(190, 100, 70,190), ""); 
    btnBack = new Button(360, 450, 100, 50, color(0, 0, 0,0), "");
    btnQuiz = new Button(355,230,110,110,color(0, 0, 0,0), "");

      
  // 버튼 실행
    btnSafety1.run();
    btnSafety2.run();
    btnSafety3.run(); 
    btnSafety4.run();
    btnQuiz.run();
    btnBack.run();
    
    
        //그림 넣기
    image(imgSafety1,115, 60);
    image(imgSafety2,430,60);   
    image(imgSafety3,115, 250);
    image(imgSafety4,430, 250);  

    //그그림 넣기    
    image(imgHome,330, 420);
    image(imgQuiz,320,200);    
   }
  State decideState() {      
    if (btnSafety1.isPush()) { // if ellapsed time is larger than
      return new Safety1 (); // go to ending
    }  
    else if
    (btnSafety2.isPush()) {
      return new Safety2 ();    
    } 
     else if
    (btnSafety3.isPush()) {
      return new Safety3 ();   
    } 
     else if
    (btnSafety4.isPush()) {
      return new Safety4 ();
    }
    else if
    (btnQuiz.isPush()) {
      return new SafetyQuiz();
    } 
     else if
    (btnBack.isPush()) {
      //return new TitleState();
      return new MenuState();
    } 
    return this;
  }

}


class Safety1 extends State {
   void drawState() {
   background(0);
   
   //video
   image( movie1, 0, 0, width, height);
       
   //그림 읽기
   imgHome = loadImage("home.png");
   imgPlay = loadImage("play.png");
   imgStop = loadImage("stop.png");
   imgPause = loadImage("pause.png");
    
    //  버튼 생성
    btnBack = new Button(632, 438, 70, 70, color( 220, 80, 100, 88), "");
    btnStop = new Button(42, 438, 50, 50, color( 220, 80, 100, 88), "");
    btnPlay = new Button(110, 438, 50, 50, color( 220, 80, 100, 88), "");
    btnPause = new Button(180, 438, 50, 50, color( 220, 80, 100, 88), "");
   
    // 버튼 실행
    btnBack.run();
    btnPlay.run();
    btnStop.run();
    btnPause.run();
    
         //그림 넣기
    image(imgHome,600, 400);
    image(imgPause,1, 400);
    image(imgPlay,68, 400);
    image(imgStop,140, 400);
         
  
    if(btnStop.isPush()){
      msg = "STOP";
      movie1.stop();
    }
    else if(btnPlay.isPush()){ //제생
      msg = "PLAY";
      movie1.play();
     } else if( btnPause.isPush()){ 
   msg = "PAUSE";
   movie1.pause();
  } 
 }
     
  State decideState() {
 //    image( movie, 0, 0, width, 225);
    if (btnBack.isPush()) { // if ellapsed time is larger than
      movie1.stop();
      return new Safety0(); // go to ending  
    }  
    return this;   

  }
}


class Safety2 extends State {
   void drawState() {
   background(0);
   
   //video
   image( movie2, 0, 0, width, height);
       
   //그림 읽기
   imgHome = loadImage("home.png");
   imgPlay = loadImage("play.png");
   imgStop = loadImage("stop.png");
   imgPause = loadImage("pause.png");
    
    //  버튼 생성
    btnBack = new Button(632, 438, 70, 70, color( 220, 80, 100, 88), "");
    btnStop = new Button(42, 438, 50, 50, color( 220, 80, 100, 88), "");
    btnPlay = new Button(110, 438, 50, 50, color( 220, 80, 100, 88), "");
    btnPause = new Button(180, 438, 50, 50, color( 220, 80, 100, 88), "");
   
    // 버튼 실행
    btnBack.run();
    btnPlay.run();
    btnStop.run();
    btnPause.run();
    
         //그림 넣기
    image(imgHome,600, 400);
    image(imgPause,1, 400);
    image(imgPlay,68, 400);
    image(imgStop,140, 400);
         
  
    if(btnStop.isPush()){
      msg = "STOP";
      movie2.stop();
    }
    else if(btnPlay.isPush()){ //제생
      msg = "PLAY";
      movie2.play();
     } else if( btnPause.isPush()){ 
   msg = "PAUSE";
   movie2.pause();
  } 
 }
     
  State decideState() {
 //    image( movie, 0, 0, width, 225);
    if (btnBack.isPush()) { // if ellapsed time is larger than
      movie2.stop();
      return new Safety0(); // go to ending  
    }  
    return this;   

  }
}


class Safety3 extends State {
   void drawState() {
   background(0);
   
   //video
   image( movie3, 0, 0, width, height);
       
   //그림 읽기
   imgHome = loadImage("home.png");
   imgPlay = loadImage("play.png");
   imgStop = loadImage("stop.png");
   imgPause = loadImage("pause.png");
    
    //  버튼 생성
    btnBack = new Button(632, 438, 70, 70, color( 220, 80, 100, 88), "");
    btnStop = new Button(42, 438, 50, 50, color( 220, 80, 100, 88), "");
    btnPlay = new Button(110, 438, 50, 50, color( 220, 80, 100, 88), "");
    btnPause = new Button(180, 438, 50, 50, color( 220, 80, 100, 88), "");
   
    // 버튼 실행
    btnBack.run();
    btnPlay.run();
    btnStop.run();
    btnPause.run();
    
         //그림 넣기
    image(imgHome,600, 400);
    image(imgPause,1, 400);
    image(imgPlay,68, 400);
    image(imgStop,140, 400);
         
  
    if(btnStop.isPush()){
      msg = "STOP";
      movie3.stop();
    }
    else if(btnPlay.isPush()){ //제생
      msg = "PLAY";
      movie3.play();
     } else if( btnPause.isPush()){ 
   msg = "PAUSE";
   movie3.pause();
  } 
 }
     
  State decideState() {
 //    image( movie, 0, 0, width, 225);
    if (btnBack.isPush()) { // if ellapsed time is larger than
      movie3.stop();
      return new Safety0(); // go to ending  
    }  
    return this;   

  }
}


class Safety4 extends State {
   void drawState() {
   background(0);
   
   //video
   image( movie4, 0, 0, width, height);
       
   //그림 읽기
   imgHome = loadImage("home.png");
   imgPlay = loadImage("play.png");
   imgStop = loadImage("stop.png");
   imgPause = loadImage("pause.png");
    
    //  버튼 생성
    btnBack = new Button(632, 438, 70, 70, color( 220, 80, 100, 88), "");
    btnStop = new Button(42, 438, 50, 50, color( 220, 80, 100, 88), "");
    btnPlay = new Button(110, 438, 50, 50, color( 220, 80, 100, 88), "");
    btnPause = new Button(180, 438, 50, 50, color( 220, 80, 100, 88), "");
   
    // 버튼 실행
    btnBack.run();
    btnPlay.run();
    btnStop.run();
    btnPause.run();
    
         //그림 넣기
    image(imgHome,600, 400);
    image(imgPause,1, 400);
    image(imgPlay,68, 400);
    image(imgStop,140, 400);
         
  
    if(btnStop.isPush()){
      msg = "STOP";
      movie4.stop();
    }
    else if(btnPlay.isPush()){ //제생
      msg = "PLAY";
      movie4.play();
     } else if( btnPause.isPush()){ 
   msg = "PAUSE";
   movie1.pause();
  } 
 }
     
  State decideState() {
 //    image( movie, 0, 0, width, 225);
    if (btnBack.isPush()) { // if ellapsed time is larger than
      movie4.stop();
      return new Safety0(); // go to ending  
    }  
    return this;   

  }
}



class RecordState extends State {
  void drawState() {
    fill(0); // moji color  
    font = createFont("굴림체",20);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);    
       
    //그림 읽기
    imgBack5 = loadImage("back5.PNG"); 
    imgHome = loadImage("home.png");
    imgView = loadImage("view.png");
        
    imageMode( CORNER );
    image(imgBack5, 0, 0, width, height);
    
  //  버튼 생성
    btnBack = new Button(632, 438, 50, 50, color( 220, 80, 100, 88), "");
    btnView = new Button(70, 438, 50, 50, color( 220, 80, 100, 88), "");
            

  // 버튼 실행
    btnBack.run();
    btnView.run();
    
  //그림 넣기
    image(imgHome,600, 400);
    image(imgView,35, 400);
      
   }  
  State decideState() {      
    if (btnBack.isPush()) { // if ellapsed time is larger than
      return new GameState0(); // go to ending
    }    
    else if
    (btnView.isPush()) {
      return new WriteState();    
    } 
    return this;
  }
}

class WriteState extends State {
  void drawState() {
    
    fill(0); // moji color  
    font = createFont("굴림체",20);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);   
           
    //그림 읽기
    imgBack4 = loadImage("back4.PNG"); 
    imgHome = loadImage("home.png");
    imgWrite2 = loadImage("write1.png");
        
    imageMode( CORNER );
    image(imgBack4, 0, 0, width, height);
    
  //  버튼 생성
    btnBack = new Button(632, 50, 50, 50, color( 220, 80, 100, 88), "");
    btnWrite1 = new Button(70, 50, 50, 50, color( 220, 80, 100, 88), "");
            
  // 버튼 실행
    btnBack.run();
    btnWrite1.run();
    
  //그림 넣기
    image(imgHome,600, 20);
    image(imgWrite2,40, 20);
      
   }  
  State decideState() {      
    if (btnBack.isPush()) { // if ellapsed time is larger than
      return new MenuState(); // go to ending
    }    
    else if
    (btnWrite1.isPush()) {
      return new RecordState();    
    } 
    return this;
  }
}

// 퀴즈 main

class SafetyQuiz extends State {
  void drawState() {
    fill(0); 
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    imgBack6 = loadImage("bacQuiz.PNG");
    imgHome = loadImage("home.png");
    imageMode( CORNER );
    image(imgBack6, 0, 0, width, height);    
         
    
    //그림 읽기
    imgNum1 = loadImage("Num1.png");     
    imgNum2 = loadImage("Num2.png");
    imgNum3 = loadImage("Num3.png");
    imgNum4 = loadImage("Num4.png");
    
     //그림 넣기
    image(imgNum1,130, 140);
    image(imgNum2,445,140);   
    image(imgNum3,130, 290);
    image(imgNum4,445, 290);
    image(imgHome,330, 420);  
     
  //  버튼 생성
    btnNum1 =new Button(200, 150, 130, 130,  color(0, 0, 0,0), "");
    btnNum2 =new Button(500, 150, 130, 130, color(0, 0, 0,0), "");   
    btnNum3 = new Button(200, 320, 130, 130, color(0, 0, 0,0), "");
    btnNum4 = new Button(500, 320, 130, 130, color(0, 0, 0,0), "");
    btnBack = new Button(360, 450, 100, 50, color(0, 0, 0,0), "");
        
  // 버튼 실행
    btnNum1.run();
    btnNum2.run();
    btnNum3.run(); 
    btnNum4.run();
    btnBack.run();
   }
  
  State decideState() {      
    if (btnNum1.isPush()) { // if ellapsed time is larger than
      return new SafetyQuiz1 (); // go to ending
    }  
    else if
    (btnNum2.isPush()) {
      return new SafetyQuiz2 ();    
    } 
     else if
    (btnNum3.isPush()) {
      return new SafetyQuiz3 ();   
    } 
     else if
    (btnNum4.isPush()) {
      return new SafetyQuiz4 ();
    } 
     else if
    (btnBack.isPush()) {
      return new Safety0();
    } 
    return this;
  }

}
           
// 퀴즈 sub
class SafetyQuiz1 extends State {
   
  void drawState() {
   background(0);
  
   imgQback = loadImage("imgQback.png");
   imgeat = loadImage("image4.png");
   imghand = loadImage("image5.png");
   imgHome2 = loadImage("imgHome2.png");  
   cimgB = loadImage("cimgB.png");  
   cimgR = loadImage("cimgR.png");  
   image(imgQback, 0, 0, width, height);
   image(imgHome2,620, 455);     

    //1번퀴즈
    
   
   fill(0);
   textFont(font);
   textSize(25);
   text("밖에서 놀다가 들어오면 제일 먼저 해야 할 일은?",330,70);

   if(mouseX<width/2){
      image(cimgR,10,200,340,250);
      image(imgeat,30,220,300,200);
    }
   
   else{ 
      image(cimgB,350,200,340,250);
      image(imghand,370,220,300,200);
    } 
   if(mousePressed){
     if(mouseX>=350 && mouseY>=200){
        song11.play();
      } else if(mouseX<=350 && mouseY>=200){
        song12.play();
      }
    }
      
     //  버튼 생성
    btnBack = new Button(645, 470, 50, 50, color(0,0,0,0), "");
     // 버튼 실행
    btnBack.run();
  }
  

  State decideState() {
    if (btnBack.isPush()) { // if ellapsed time is larger than
      return new SafetyQuiz(); // go to ending  
    }  
    return this;   

  }
}


class SafetyQuiz2 extends State {
   void drawState() {
   background(0);
   
   imgQback = loadImage("imgQback.png");
   imgHome2 = loadImage("imgHome2.png");
   cimgB = loadImage("cimgB.png");  
   cimgR = loadImage("cimgR.png");  
   image(imgQback, 0, 0, width, height);
   image(imgHome2,620, 455);     
   
   //그림 읽기
   imgopen = loadImage("open.PNG");
   imgnotOpen = loadImage("notOpen.PNG");
    
   fill(250,10);
   rect(10,200,340,250);
  
   fill(250,10);
   rect(350,200,340,250);
  
  //2번퀴즈
  
    fill(0);
    textFont(font);
    textSize(25);
    text("모르는 사람이 문을 열어 달라고 하면?",330,70);
    
    if(mouseX<width/2){
      image(cimgR,10,200,340,250);
      image(imgopen,30,220,300,200);
    }
   
   else{ 
      image(cimgB,350,200,340,250);
      image(imgnotOpen,370,220,300,200);
    }
    if(mousePressed){
     if(mouseX>=350 && mouseY>=200){
        song11.play();
      } else if(mouseX<=350 && mouseY>=200){
        song12.play();
      }
    }

     //  버튼 생성
     btnBack = new Button(645, 470, 50, 50, color(0,0,0,0), "");
     // 버튼 실행
     btnBack.run();
}
     
  State decideState() {
    if (btnBack.isPush()) { // if ellapsed time is larger than
      return new SafetyQuiz(); // go to ending  
    }  
    return this;   

  }
}

class SafetyQuiz3 extends State {
   void drawState() {
   background(0);
   
   imgQback = loadImage("imgQback.png");
   imgHome2 = loadImage("imgHome2.png");
   cimgB = loadImage("cimgB.png");  
   cimgR = loadImage("cimgR.png");  
   image(imgQback, 0, 0, width, height);
   image(imgHome2,620, 455);     
   
   //그림 읽기
   imgtouch = loadImage("touch.PNG");
   imgdontTouch = loadImage("dontTouch.PNG");
   
   fill(250,10);
   rect(10,200,340,250);
  
   fill(250,10);
   rect(350,200,340,250);
  
  //3번퀴즈
  
    fill(0);
    textFont(font);
    textSize(25);
    text("근처에 불이나 뜨거운 냄비가 있을 땐",330,70);
    text("어떻게 해야 할까요?",330,100);
    
    
    if(mouseX<width/2){
      image(cimgR,10,200,340,250);
      image(imgtouch,30,220,300,200);
    }
   
   else{ 
      image(cimgB,350,200,340,250);
      image(imgdontTouch,370,220,300,200);
    }
    if(mousePressed){
     if(mouseX>=350 && mouseY>=200){
        song11.play();
      } else if(mouseX<=350 && mouseY>=200){
        song12.play();
      }
    }
       //  버튼 생성
     btnBack = new Button(645, 470, 50, 50, color(0,0,0,0), "");
     // 버튼 실행
     btnBack.run();
}
     
  State decideState() {
    if (btnBack.isPush()) { // if ellapsed time is larger than
      return new SafetyQuiz(); // go to ending  
    }  
    return this;   

  }
}

class SafetyQuiz4 extends State {
   void drawState() {
   background(0);
   
   imgQback = loadImage("imgQback.png");
   imgHome2 = loadImage("imgHome2.png");
   cimgB = loadImage("cimgB.png");  
   cimgR = loadImage("cimgR.png");  
   image(imgQback, 0, 0, width, height);
   image(imgHome2,620, 455);     
   
   //그림 읽기
   imgblue = loadImage("blue.PNG");
   imgred = loadImage("red.PNG");
   
  //4번퀴즈
  
    fill(0);
    textFont(font);
    textSize(25);
    text("물을 틀 때 조심해야 하는 방향의 색깔은?",330,70);
    
    
    if(mouseX<width/2){
      image(cimgR,10,200,340,250);
      image(imgblue,30,220,300,200);
      }
   
   else{ 
      image(cimgB,350,200,340,250);
      image(imgred,370,220,300,200);
    }
    if(mousePressed){
       if(mouseX>=350 && mouseY>=200){
          song12.play();
      }else if(mouseX<=350 && mouseY>=200){
          song11.play();
      }
    }   
     //  버튼 생성
     btnBack = new Button(645, 470, 50, 50, color(0,0,0,0), "");
     // 버튼 실행
     btnBack.run();
   }     
  State decideState() {
    if (btnBack.isPush()) { // if ellapsed time is larger than
      return new SafetyQuiz(); // go to ending  
    }  
    return this;   

  }
}


// Game
class GameState0 extends State {
  void drawState() {
    fill(0); // moji color  
    font = createFont("굴림체",20);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    
    //그림 읽기
    imgBack = loadImage("back1.jpg"); 
    imgVehicle = loadImage( "vehicle.png" );
    imgAnimal = loadImage( "animal.png"); 
    imgColor = loadImage("color.png"); 
    imgFood = loadImage("food.png"); 
    imgNum = loadImage("num.png"); 
    imgRondom = loadImage("random.png");
    
    imgHome = loadImage("home.png");
    imgWrite = loadImage("write.png");
    imgMusic = loadImage("music3.png");
    
    
    imageMode( CORNER );
    image(imgBack, 0, 0, width, height);
    
  //  버튼 생성
    btnVehicle =new Button(130, 170, 150, 100,  color(190, 100, 70,190), "Vehicle");
    btnAnimal =new Button(350, 170, 150, 100, color(190, 100, 70,190), "Animal");
    btnColor =new Button( 570, 170, 150, 100, color(190, 100, 70,190), "Color");
    btnFood =new Button(130, 320, 150, 100, color(190, 100, 70,190), "Food");
    btnNum =new Button(350, 320, 150, 100, color(190, 100, 70,190), "Things" );
    btnRandom =new Button(570, 320, 150, 100, color(190, 100, 70,190), "Random");
    
    btnBack = new Button(130, 450, 100, 50, color( 220, 80, 100, 88), "");
    btnRecord = new Button(350, 450, 100, 50, color( 220, 80, 100, 88), "");
    btnMusic = new Button(570, 450, 100, 50, color( 220, 80, 100, 88), "");
         
  // 버튼 실행
    btnVehicle.run();
    btnAnimal.run();
    btnColor.run(); 
    btnFood.run(); 
    btnNum.run();
    btnRandom.run(); 
    btnBack.run();
    btnRecord.run();
    btnMusic.run();
    
    //그림 넣기
    image(imgVehicle,30, 80);
    image(imgAnimal,317,100);
    image(imgColor,593, 105);
    image(imgFood,20, 310);
    image(imgNum,408, 313);
    image(imgRondom,600, 250);
    
    image(imgHome,100, 417);
    image(imgWrite,320, 420);
    image(imgMusic,545, 430);
       
   }  
  State decideState() {      
    if (btnVehicle.isPush()) { // if ellapsed time is larger than
      return new GameState1 (); // go to ending
    }  
    else if
    (btnAnimal.isPush()) {
      return new GameState2 ();    
    } 
     else if
    (btnColor.isPush()) {
      return new GameState3 ();    
    } 
     else if
    (btnFood.isPush()) {
      return new GameState4 ();   
    } 
     else if
    (btnNum.isPush()) {
      return new GameState5 ();   
    } 
     else if
    (btnRandom.isPush()) {
      return new GameState6 ();   
    } 
     else if
    (btnRecord.isPush()) {
      return new RecordState ();    
    }
     else if
    (btnBack.isPush()) {
      return new TitleState();    
    }  
     else if
    (btnMusic.isPush()) {
      return new Music ();
    } 
    return this;
  }

}

class GameState extends State {
  void drawState() {
    fill(0); // moji color
    text("Game Start♪ ", width * 0.5, height * 0.5); // title
  }

  State decideState() {    
    if (t > 1) { // if ellapsed time is larger than
      return new GameState1 (); // go to ending
    } 
    return this;
  }
}

class GameState1 extends State {
  void drawState() {

     font = createFont("굴림체",20);
     bgd = loadImage("bgd.jpg");
     background(bgd);
     
     fill(47,21,178);
     textFont(font);
     textSize(50);
     
     text("Flash Game",350, 30); // title
     
     fill(47,21,178);
     textSize(35);
     text("탈것", 350,80);
     imgReady = loadImage("imgReady.jpg");
     imageMode(CENTER);
     image(imgReady,350,230);
    // delay(wait);
      if (t>1) {
      for(int i = 0; i < image.length ; i++){
        image[i] = loadImage("timage" + i + ".jpg");
        if (btnEnd1.isPush()) 
     break;
     song5.play();
     }  
     imageMode(CENTER);
     image(image[index],350,230);
     index = (index+1) % image.length;
     delay(wait);
    
}
     btnEnd1 =new Button(600, 420, 100, 80, color(190, 100, 70,190), "END");
     btnEnd1.run();
  }
  
  State decideState() {
    if (btnEnd1.isPush()) { // if ellapsed time is larger than  
      song5.close( ) ;
      return new GameState0(); // go to ending
    } 
     else if
    (t> image.length) {
      return new EndingState();
    
    }
    return this;
  }
}

class GameState2 extends State {
  void drawState() {

     font = createFont("굴림체",20);
     bgd = loadImage("bgd.jpg");
     background(bgd);
     
     fill(47,21,178);
     textFont(font);
     textSize(50);
     
     text("Flash Game",350, 30); // title
     
     fill(47,21,178);
     textSize(35);
     text("동물", 350,80);
     imgReady = loadImage("imgReady.jpg");
     imageMode(CENTER);
     image(imgReady,350,230);
     if (t>1) {
        
     for(int i = 0; i < image.length ; i++){
       image[i] = loadImage("aimage" + i + ".png");
       if (btnEnd1.isPush()) 
     break;
     song6.play();
     }  
     imageMode(CENTER);
     image(image[index],350,230);
     index = (index+1) % image.length;
     delay(wait);
     
}
     btnEnd1 =new Button(600, 420, 100, 80, color(190, 100, 70,190), "END");
     btnEnd1.run();
  }
  
  State decideState() {
    if (btnEnd1.isPush()) { // if ellapsed time is larger than  
      song6.close( ) ;
      return new GameState0(); // go to ending
    } 
     else if
    (t> image.length) {
      return new EndingState();
    
    }
    return this;
  }
}

class GameState3 extends State {
  void drawState() {

     font = createFont("굴림체",20);
     bgd = loadImage("bgd.jpg");
     background(bgd);
     
     fill(47,21,178);
     textFont(font);
     textSize(50);
     
     text("Flash Game",350, 30); // title
     
     fill(47,21,178);
     textSize(35);
     text("색깔", 350,80);
     imgReady = loadImage("imgReady.jpg");
     imageMode(CENTER);
     image(imgReady,350,230);
      if (t>1) {
     for(int i = 0; i < image.length ; i++){
       image[i] = loadImage("cimage" + i + ".png");
       if (btnEnd1.isPush()) 
     break;
     song7.play();
     }  
     imageMode(CENTER);
     image(image[index],350,230);
     index = (index+1) % image.length;
     delay(wait);
     
}
     btnEnd1 =new Button(600, 420, 100, 80, color(190, 100, 70,190), "END");
     btnEnd1.run();
  }
  
  State decideState() {
    if (btnEnd1.isPush()) { // if ellapsed time is larger than 
      song7.close();
      return new GameState0(); // go to ending
    } 
     else if
    (t> image.length) {
      return new EndingState();
    
    }
    return this;
  }
}

class GameState4 extends State {
  void drawState() {

     font = createFont("굴림체",20);
     bgd = loadImage("bgd.jpg");
     background(bgd);
     
     fill(47,21,178);
     textFont(font);
     textSize(50);
     
     text("Flash Game",350, 30); // title
     
     fill(47,21,178);
     textSize(35);
     text("음식", 350,80);
     imgReady = loadImage("imgReady.jpg");
     imageMode(CENTER);
     image(imgReady,350,230);
      if (t>1) {
//         text("",350, 30); // title
  
     for(int i = 0; i < image.length ; i++){
       image[i] = loadImage("food" + i + ".jpg");
       if (btnEnd1.isPush()) 
     break;
     song8.play();
     }  
     imageMode(CENTER);
     image(image[index],350,230);
     index = (index+1) % image.length;
     delay(wait);
     
}
     btnEnd1 =new Button(600, 420, 100, 80, color(190, 100, 70,190), "END");
     btnEnd1.run();
  }
  
  State decideState() {
    if (btnEnd1.isPush()) { // if ellapsed time is larger than 
      song8.close();
      return new GameState0(); // go to ending
    } 
     else if
    (t> image.length) {
      return new EndingState();
    
    }
    return this;
  }
}
class GameState5 extends State {
  void drawState() {
     bgd = loadImage("bgd.jpg");
     background(bgd);
     
     fill(47,21,178);
     textFont(font);
     textSize(50);
     
     text("Flash Game",350, 30); // title
     
     fill(47,21,178);
     textSize(35);
     text("사물", 350,80);  
     for(int i = 0; i < image.length ; i++){
       image[i] = loadImage("object" + i + ".jpg");

     }  
     imageMode(CENTER);
     image(image[index],350,230);
     index = (index+1) % image.length;
     delay(wait);
     btnEnd1 =new Button(600, 420, 100, 80, color(190, 100, 70,190), "END");
     btnEnd1.run();
     song9.play();
  }
  
  State decideState() {    
    if (t> image.length) { // if ellapsed time is larger than
      song9.close();
      return new EndingState(); // go to ending
    } 
    else if
    (btnEnd1.isPush()) {
      return new GameState0();  
    }
    return this;
  }
}

class GameState6 extends State {
  void drawState() {

     font = createFont("굴림체",20);
     bgd = loadImage("bgd.jpg");
     background(bgd);
     
     fill(47,21,178);
     textFont(font);
     textSize(50);
     
     text("Flash Game",350, 30); // title
     
     fill(47,21,178);
     textSize(35);
     text("랜덤", 350,80);
     imgReady = loadImage("imgReady.jpg");
     imageMode(CENTER);
     image(imgReady,350,230);
      if (t>1) {
      for(int i = 0; i < image.length ; i++){
        image[i] = loadImage("random" + i + ".jpg");
        if (btnEnd1.isPush()) 
      break;
      song10.play();
     }  
     imageMode(CENTER);
     image(image[index],350,230);
     index = (index+1) % image.length;
     delay(wait);
     
}
     btnEnd1 =new Button(600, 420, 100, 80, color(190, 100, 70,190), "END");
     btnEnd1.run();
  }
  
  State decideState() {
    if (btnEnd1.isPush()) { // if ellapsed time is larger than
      song10.close();
      return new GameState0(); // go to ending
    } 
     else if
    (t> image.length) {
      return new EndingState();
    
    }
    return this;
  }
}

class EndingState extends State {
  void drawState() {
//    colorMode(HSB, 360, 100, 100);
    fill(0);
    text("Ending", width * 0.5, height * 0.5);
    if (t > 1) {
      text("Press 'Home' to back.", width * 0.5, height * 0.7);   
    btnBack =new Button(350, 420, 130, 50, color(190, 100, 70), "Home");
    btnBack.run();
    }
  }
  State decideState() {
    for (int i = 0;i < flowers.length;i++) {
    flowers[i].expansion();
    flowers[i].display();
  }
    if (btnBack.isPush()) {
      return new  GameState0();
    } 
    else if
    (btnRecord.isPush()) {
      return new  GameState0();    
    } 
    return this;
  }
}

class Music extends State {
  void drawState() {
    fill(0); // moji color  
    font = createFont("굴림체",20);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    imgHome = loadImage("home.png"); 
    imgBack = loadImage("back1.jpg");
    imageMode( CORNER );
    image(imgBack, 0, 0, width, height);
    
  //  버튼 생성
    btnTomato =new Button(200, 170, 150, 100,  color(190, 100, 70,190), "PIG");
    btnBear =new Button(500, 170, 150, 100, color(190, 100, 70,190), "GOOD WORD");
    btnPig =new Button(200, 320, 150, 100, color(190, 100, 70,190), "TOMATO");
    btnWord =new Button(500, 320, 150, 100, color(190, 100, 70,190), "BEAR"); 
    btnBack = new Button(360, 450, 100, 50, color( 220, 80, 100, 88), "");

      
  // 버튼 실행
    btnTomato.run();
    btnBear.run();
    btnPig.run(); 
    btnWord.run(); 
    btnBack.run();

    //그그림 넣기    
    image(imgHome,330, 420);        
   }
  State decideState() {      
    if (btnTomato.isPush()) { // if ellapsed time is larger than
      return new GameState7 (); // go to ending
    }  
    else if
    (btnBear.isPush()) {
      return new GameState8 ();    
    } 
     else if
    (btnWord.isPush()) {
      return new GameState9 ();   
    } 
     else if
    (btnPig.isPush()) {
      return new GameState10 ();
    } 
     else if
    (btnBack.isPush()) {
      return new TitleState();
    } 
    // else if
    //(btnMusic.isPush()) {
    //  return new Music ();    
   // } 
    return this;
  }

}


class GameState7 extends State {
  void drawState() { 
    
     song1.play();

     // 글꼴
     printArray(PFont.list());
     font = createFont("굴림체",40);
  
     // 배경이미지
     bgd = loadImage("backg2.jpg");
     background(bgd);
     fill(47,21,178);
     textFont(font);
     textSize(20);
     fill(0);

    // 노래가사
    textAlign(CENTER);
    text("아기돼지 삼형제",width/2, 45);
  
    textAlign(CENTER,RIGHT);
    text("첫 번째 돼지가 집을 짓는데",width/4, 80 );
    text("짚으로 차곡차곡 집을 짓는데",width/4, 105 );
    text("늑대가 나타나 후!",width/4, 130 );
    text("늑대가 나타나 후!",width/4, 155 );
    text("무너져 내렸대요",width/4, 180 );
  
    textAlign(CENTER,LEFT);
    text("두 번째 돼지가 집을 짓는데",width/2 + 120, 80 );
    text("나무로 차곡차곡 집을 짓는데",width/2 + 120, 105 );
    text("늑대가 나타나 후!",width/2 + 120, 130 );
    text("늑대가 나타나 후!",width/2 + 120, 155 );
    text("무너져 내렸대요",width/2 + 120, 180 );
  
    textAlign(CENTER,RIGHT);
    text("세 번째 돼지가 집을 짓는데",width/4, 250 );
    text("벽돌로 차곡차곡 집을 짓는데",width/4, 275 );
    text("늑대가 나타나 후!",width/4, 300 );
    text("늑대가 나타나 후!",width/4, 325 );
    text("끄떡도 없었대요.",width/4, 350 );
  
    textAlign(CENTER,LEFT);
    text("높은 집을 지읍시다.",width/2 + 120, 250 );
    text("넓은 집을 지읍시다.",width/2 + 120, 275 );
    text("아담한 집을 지읍시다.",width/2 + 120, 300 );
    text("아름답게 지읍시다. 아자!",width/2 + 120, 325 );
    btnEnd2 =new Button(600, 420, 100, 80, color(190, 100, 70,190), "END");
    btnEnd2.run();

  }
  
  State decideState() {    
    if (btnEnd2.isPush()) { // if ellapsed time is larger than
      song1.close( ) ;
      return new Music();// go to ending
    } 
    return this;
  }
}

class GameState8 extends State {
  void drawState() {

     song2.play();
     
     // 글꼴
     printArray(PFont.list());
     font = createFont("굴림체",40);
  
     // 배경이미지
     bgd = loadImage("backg.jpg");
     background(bgd);
     fill(47,21,178);
     textFont(font);
     textSize(20);
     fill(0);
            // 노래가사
     textAlign(CENTER);
     text("참 좋은 말",width/2, 40);
  
     text("사랑해요 이한마디 참 좋은말",width/2, 100 );
     text("우리식구 자고나면 주고 받는 말",width/2, 140 );
     text("사랑해요 이 한마디 참 좋은말",width/2, 180 );
     text("엄마아빠 일터갈 때 주고 받는 말",width/2, 220 );
     text("이말이 좋아서 온종일 신이 나지요",width/2, 260 );
     text("이말이 좋아서 온종일 일맛 나지요",width/2, 300 );
     text("이말이 좋아서 온종일 가슴이 콩닥콩닥 인데요",width/2, 340 );
     text("사랑해요 이 한마디 참 좋은말",width/2, 380 );
     text("나는 나는 이 한마디가 정말 좋아요" ,width/2, 420 ); 
     btnEnd2 =new Button(600, 420, 100, 80, color(190, 100, 70,190), "END");
     btnEnd2.run();

  }
  
  State decideState() {    
    if (btnEnd2.isPush()) { // if ellapsed time is larger than
      song2.close( ) ;
      return new Music();// go to ending
    } 
    return this;
  }
}

class GameState9 extends State {
  void drawState() {
    
     song3.play();
      
     // 배경이미지
     bgd = loadImage("backg.jpg");
     background(bgd);
     fill(47,21,178);
     textFont(font);
     textSize(20);
     fill(0);

     // 글꼴
     printArray(PFont.list());
     font = createFont("굴림체",40);

     // 노래가사
     textAlign(CENTER);
     text("예쁜 아기곰",width/2, 40);
  
     text("동그란눈에 까만 작은 코",width/2, 80 );
     text("하얀 털옷을 입은 예쁜 아기 곰",width/2, 105 );
     text("언제나 너를 바라보면서 작은소망 애기하지",width/2, 130 );
     text("너의 곁에 있으면 나는 행복해",width/2, 155 );
     text("어떤 비밀이라도 말할 수 있어",width/2, 180 );////
     text("까만 작은 코에 입을 맞추면 ",width/2, 205 );
     text("수줍어 얼굴을 붉히는 예쁜 아기곰",width/2, 230 );
  
     text("동그란눈에 까만 작은 코",width/2, 280 );
     text("하얀 털옷을 입은 예쁜 아기 곰",width/2, 305 );
     text("언제나 너를 바라보면서 작은소망 애기하지",width/2, 330 );
     text("너의 곁에 있으면 나는 행복해",width/2, 355 );
     text("어떤 비밀이라도 말할 수 있어",width/2, 380 );
     text("까만 작은 코에 입을 맞추면",width/2, 405 );
     text("수줍어 얼굴을 붉히는 예쁜 아기곰",width/2, 430);
     btnEnd2 =new Button(600, 420, 100, 80, color(190, 100, 70,190), "END");
     btnEnd2.run();

  }
  
  State decideState() {    
    if (btnEnd2.isPush()) { // if ellapsed time is larger than
       song3.close( ) ;
      return new Music();// go to ending
    } 
    return this;
  }
}
class GameState10 extends State {
  void drawState() {

      
     // 배경이미지
     bgd = loadImage("backg.jpg");
     background(bgd);
     fill(47,21,178);
     textFont(font);
     textSize(20);
     fill(0);
     song4.play();
     
     // 글꼴
     printArray(PFont.list());
     font = createFont("굴림체",40);

    // 노래가사
    textAlign(CENTER);
    text("멋쟁이 토마토",width/2, 50);
  
    text("울끈불끈 멋진 몸매에(으쓱으쓱)",width/2, 100 );
    text("빨간 옷을 입고(샤방샤방)",width/2, 150 );
    text("새콤달콤 향기 풍기는(유후)",width/2, 200 );
    text("멋쟁이 토마토(토마토)",width/2, 250 );
    text("나는야 주스 될꺼야(꿀꺽)",width/2, 300 );
    text("나는야 케첩 될꺼야(찌익)",width/2, 350 );
    text("나는야 춤을 출거야(헤이)",width/2, 400 );
    text("뽑내는 토마토(토마토)",width/2, 450 );
    btnEnd2 =new Button(600, 420, 100, 80, color(190, 100, 70,190), "END");
    btnEnd2.run();

  }
  
  State decideState() {    
    if (btnEnd2.isPush()) { // if ellapsed time is larger than
      song4.close( ) ;
      return new Music();// go to ending
    } 
    return this;
  }
}
