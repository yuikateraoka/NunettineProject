State state;
import processing.video.*;

void setup() {
  size(700, 500);
  font = createFont("굴림체",20);
  textSize(32);
  textAlign(CENTER);
  fill(255);
  state = new TitleState();
  h = new HandyRenderer(this);  //<>//
  smooth();
  for (int i = 0;i < flowers.length;i++) {
   flowers[i] = new Flower();}
     
  // movie 파일 생성    
  movie1 = new Movie(this,"Safety1.mp4");
  movie2 = new Movie(this,"Safety2.mp4");
  movie3 = new Movie(this,"Safety3.mp4");
  movie4 = new Movie(this,"Safety4.mp4");

  // song 파일 읽음  
  minim = new Minim(this);
  song1 =  minim.loadFile("pig song.mp3");
  song2 =  minim.loadFile("true song.mp3");
  song3 =  minim.loadFile("bear song.mp3"); 
  song4 =  minim.loadFile("tomato song.mp3");
  song5 = minim.loadFile("운송.mp3");
  song6 =  minim.loadFile("동물.mp3");
  song7 =  minim.loadFile("색깔.mp3");
  song8 =  minim.loadFile("음식.mp3");
  song9 =  minim.loadFile("사물.mp3");
  song10 =  minim.loadFile("랜덤.mp3");
  song11 = minim.loadFile("yes.mp3");
  song12 =  minim.loadFile("no.mp3");

}

void draw() {
  background(255);
  state = state.doState();
}

abstract class State {
  long t_start;
  float t;

  State() {
    t_start = millis();
  }

  State doState() {
    t = (millis() - t_start) / 1000.0;
    fill(0);
    drawState();
    return decideState();
  }

  abstract void drawState();    // 상태에 대응한 그리기를 실행함
  abstract State decideState(); // 다음 상태를 반환함
}

void movieEvent(Movie m) {
  m.read();
}
