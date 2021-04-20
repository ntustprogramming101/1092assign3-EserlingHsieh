final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg;
PImage soil0,soil1,soil2,soil3,soil4,soil5,stone1,stone2;

PImage life,cabbage,soldier;

PImage groundhogDown,groundhogIdle,groundhogLeft,groundhogRight;

float groundhogSpeed = 1;
float groundhogX; 
float groundhogY;

int cabbageX;
int cabbageY;
int a=0;
int b=0;
int c=0;

int soldierLevel;
float soldierX;
float soldierSpeed = 640.0 / 120;

float base=0;
float baseSpeed=0;

// For debug function; DO NOT edit or remove this!
int playerHealth = 2;
float cameraOffsetY = 0;
boolean debugMode = false;


void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");

  life = loadImage("img/life.png");
  cabbage = loadImage("img/cabbage.png");
  soldier = loadImage("img/soldier.png");
  soil0 = loadImage("img/soil0.png");
  soil1 = loadImage("img/soil1.png");
  soil2 = loadImage("img/soil2.png");
  soil3 = loadImage("img/soil3.png");
  soil4 = loadImage("img/soil4.png");
  soil5 = loadImage("img/soil5.png");
  stone1 = loadImage("img/stone1.png");
  stone2 = loadImage("img/stone2.png");
  
  groundhogDown = loadImage("img/groundhogDown.png");
  groundhogIdle = loadImage("img/groundhogIdle.png");
  groundhogLeft = loadImage("img/groundhogLeft.png");
  groundhogRight = loadImage("img/groundhogRight.png");
  
    groundhogX = 320;
    groundhogY = 80;
    
    cabbageX = floor(random(0,8)) * 80;
    cabbageY = floor(random(2,6)) * 80;
    
    
    //soldier appear
    soldierLevel = floor(random(2,6)) * 80;
    soldierX = - 80;
}


void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game

		// Background
		image(bg, 0, 0);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT+base+80.0/15*baseSpeed, width, GRASS_HEIGHT);


		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
for(int k = 0 ; k < 4 ; k++){    
    for(int i = 0 ; i < 8 ; i++){
		image(soil0, 0+80*i, 160+80*k+base+80.0/15*baseSpeed);
    image(soil1, 0+80*i, 480+80*k+base+80.0/15*baseSpeed);
    image(soil2, 0+80*i, 800+80*k+base+80.0/15*baseSpeed);
    image(soil3, 0+80*i, 1120+80*k+base+80.0/15*baseSpeed);
    image(soil4, 0+80*i, 1440+80*k+base+80.0/15*baseSpeed);
    image(soil5, 0+80*i, 1760+80*k+base+80.0/15*baseSpeed);
}}

    // Stone 1
    for(int i = 0 ; i < 8 ; i++){
    image(stone1, 0+80*i, 160+80*i+base+80.0/15*baseSpeed);  
}

    // Stone 2
for(int l=0;l<4;l++){    
  for(int k=0;k<2;k++){
    for(int i = 0 ; i < 2 ; i++){
    image(stone1, 0+80*i+320*k+l%2*160, 160+640+80-80*i+base+80.0/15*baseSpeed+160*l);
    image(stone1, 0+80*i+160+320*k-l%2*160, 160+640+80*i+base+80.0/15*baseSpeed+160*l);
}}}

    // Stone 3
  for(int k=0;k<8;k++){  
    for(int i = 0 ; i < 16 ; i++){
      if(i%3!=0){
    image(stone1, i*80-80*k, 160+640+640+base+80.0/15*baseSpeed+80*k);}
      if(i%3==2){
    image(stone2, i*80-80*k, 160+640+640+base+80.0/15*baseSpeed+80*k);  
}
}}
 


		// Player
        //start to move
        if (a > 0) {
            //last step
            if (a == 1) {
                groundhogX = groundhogX + 80;
                image(groundhogIdle,groundhogX,groundhogY);
                groundhogSpeed = 1;
            }
            else{
                image(groundhogRight,groundhogX + 80.0 / 15 * groundhogSpeed,groundhogY);
                groundhogSpeed +=1;
            }
            a -=1;
        }
        
        
        else if (b > 0) {
            //last step
            if (b == 1) {
                groundhogX = groundhogX - 80;
                image(groundhogIdle,groundhogX,groundhogY);
                groundhogSpeed = 1;
            }
            else{
                image(groundhogLeft,groundhogX - 80.0 / 15 * groundhogSpeed,groundhogY);
                groundhogSpeed +=1;
            }
            b -=1;
        }

        
        else if (c > 0 && base>-1600) {

            //last step
            if (c == 1) {
                image(groundhogIdle,groundhogX,groundhogY);
                baseSpeed = 0;
                base-=80;
            }
            else{
                image(groundhogDown,groundhogX,groundhogY);
                baseSpeed -= 1;
            }
            c -=1;
        }
        
        else if (c > 0 && base==-1600) {

            //last step
            if (c == 1) {
                groundhogY = groundhogY + 80;
                image(groundhogIdle,groundhogX,groundhogY);
                groundhogSpeed = 1;
            }
            else{
                image(groundhogDown,groundhogX,groundhogY + 80.0 / 15 * groundhogSpeed);
                groundhogSpeed +=1;
            }
            c -=1;
        }
        
        //no move
        else if (a == 0 && b == 0 && c == 0 ) 
        {image(groundhogIdle,groundhogX,groundhogY);}
        
        
		// Health UI
    for(int i = 0 ; i < playerHealth ; i++){  
      image(life,10+70*i,10);}
      
      
      
      
    //cabbage
    image(cabbage,cabbageX,cabbageY+base+80.0/15*baseSpeed);
    if (groundhogX == cabbageX && groundhogY == cabbageY+base+80.0/15*baseSpeed) {
        cabbageX = 0;
        cabbageY =- 80;
        playerHealth+=1;}
        
        
        //soldier walk
        soldierX = (soldierX + soldierSpeed);
        image(soldier,soldierX % 720,soldierLevel+base+80.0/15*baseSpeed); 
        
        
        //soldier bump detect
        if (groundhogX > soldierX % 720 - 80 && groundhogX < soldierX % 720 + 80
            && groundhogY > soldierLevel + base+80.0/15*baseSpeed - 80 
            && groundhogY < soldierLevel + base+80.0/15*baseSpeed + 80) {
            groundhogX = 320;
            groundhogY = 80;
            playerHealth-=1;
            a = 0;
            b = 0;
            c = 0;
            base = 0;
            if(playerHealth==0){
              gameState=GAME_OVER;
            }
          }
       

        


		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
				// Remember to initialize the game here!
          playerHealth=2;
          soldierLevel = floor(random(2,6)) * 80;
          soldierX = - 80;
          cabbageX = floor(random(0,8)) * 80;
          cabbageY = floor(random(2,6)) * 80;
          a = 0;
          b = 0;
          c = 0;
          base=0;
          baseSpeed=0;
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;
		
	}

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here

 if (a > 0 || b > 0 || c > 0) {
        return;
    }
    switch(keyCode) {
        case RIGHT:
        if (groundhogX < 560) {a = 15;}
        break;
        
        case LEFT:
        if (groundhogX > 0) {b = 15;}
        break;
        
        case DOWN:
        if (groundhogY < 400) {c = 15;}
        break;
    } 


	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
    }
}

void keyReleased(){
}
