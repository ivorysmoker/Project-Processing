class Player extends Entity{ 
	//Eigenschaften
	/*int realX = 5; // The Real Player Coord X
	int x = 5; //Actuell Player Coords MAPPING
	int y = 200; 
	int Speed = 0; // Example for Test*/
	public boolean LeftSpeed = false, //Setzt ob der Linke Pfeilt Aktiv ist
	RightSpeed = false, //Keyevent trigger
	UpSpeed = false;
	int Life;
	Player(int px, int py, int pwidth, int pheight, String[] ptexture, int plife){
		super(px, py, pwidth, pheight, ptexture);
		/*x = px;
		y = py;
		width = pwidth;
		height = pheight;*/
		Life = plife;
		//Wenn mann hier die Super Klasse läd, wird die Breite und Höhe des Mario's nicht übernommen.
		//super(px, py, pwidth, pheight, plife);
	}
	static void isOnGround(){
		//omg das isch ja so epic  //Lexu: wie meinsch das isch epic? was bringt de das jtz? its duaesch vo aunae entities alli wo instanceof player si i ae 'int' var?
		for (Entity e : Entities){
			if(e instanceof Player){
				int p = e;
			}
		}
		for (Entity b : Entities){
			if(b instanceof BlockElements){
				if(p.x >= b.x-p.width && p.x <= b.x+b.width && p.y >= b.y-p.height && p.y <= b.y-p.height+GravityKraft){
					//println("Mario hat einen festen untergrund!");
					//Notiz für mich: Hier den Code auseinander nehmen und schritte verfolgen damit keine Bugs entstehen!
					//Sowie besser hinterlegen, update funktion integrieren! + return maybe epic /boolean nicht vergessen statt void
					//lauf bug, der mario wird immer hochgedrückt. Lexu noch fragen wo der code integriert wurde.
					Gravity = false;
					if(PlayerMario.UpSpeed == false){
						FramesBlocker = false;
					}
					p.y = b.y-p.height;
				}else{
					if(PlayerMario.UpSpeed == true){
						Gravity = false;	
					}else{
						Gravity = true;
					}
				}
			}	
		}
		
	}
	private void PlayerDie(){
		//Mario ist kollidiert mit einem Enemy
		for(Enemy e : Enemy.Enemies){
			if(this.x >= e.x && this.x <= e.x+e.width && this.y >= e.y && this.y <= e.y+e.height){
					this.Life -= 1;
					this.x = 5; this.y = 200;
					image(standingMario, this.x, this.y, this.width, this.height);
			}
		}
		//Mario ist runtergefallen!
		if(this.y >= 500){
			this.Life -= 1;
			this.x = 5; this.y = 200;
			//Spawn Mario from the start Point
			image(standingMario, this.x, this.y, this.width, this.height);
		}
		if(this.Life <= 0){
					GameIsLose = true;
					image(gameover, 0, 0, 600, 500);
					
		}
	}
	public void FeuerBall(){
		
		//Welche Seite drückt der Spieler
		//if(this.LeftSpeed || LastPressed ){  // isch genau ds glichä eifach haut eifacher ;)     (needsremoval)
		if(this.LeftSpeed == true || LastPressed == true){
					
			firex -= 3;
			//um den feuerball sringen zu lassen, addre bsp alle 3 frame 4 höhe - die gravity wird in automatisch wieder runter drücken
		//}else if(this.RightSpeed|| !LastPressed){  // da o    (needsremoval)
		}else if(this.RightSpeed == true || LastPressed == false){
			frame3 = (frame3+1)%numFrames3; 
			image(images3[frame3], firex, firey, 7, 7);
			firex += 3;
		}
	}
	public void Movement(){
		//Rechts
		//if(this.RightSpeed && this.LeftSpeed){  // da o    (needsremoval)
		if(this.RightSpeed == true && this.LeftSpeed == true){
				image(standingMario, this.x, this.y, this.width, this.height);
		}else{
		//if(this.RightSpeed){  // da o    (needsremoval)
		if(this.RightSpeed == true){
			//println("Test"+this.RightSpeed);
			this.x += MovementMaxSpeed;
			//Animation
			//if(!this.UpSpeed){  // da o und haut viller orts :)   (needsremoval)
			if(this.UpSpeed == false){
			frame = (frame+1)%numFrames; 
			image(images[frame], this.x, this.y, this.width, this.height);
			}
		}
		//Links
		if(this.LeftSpeed == true){
			this.x -= MovementMaxSpeed;
				if(this.UpSpeed == false){
					//Animation
					frame2 = (frame2+1)%numFrames2; 
					image(images2[frame2], this.x, this.y, this.width, this.height);
				}
		}
		//Nac
		if(this.UpSpeed == true){
				if(FramesBlocker == false){
					AnzahlFrames = frameCount;
					AnzahlFramesSpeicher = frameCount;
					FramesBlocker = true;
				}
				if(AnzahlFrames > (AnzahlFramesSpeicher+15)){
					println("Frames wurde erreicht! Springen verboten!");
					if(this.RightSpeed == true){
					image(jumpMario, this.x, this.y, this.width, this.height);
					}else if(this.LeftSpeed == true){
					image(jumpMarioLeft, this.x, this.y, this.width, this.height);	
					}else{
						if(LastPressed = true){
							image(jumpMario, this.x, this.y, this.width, this.height);	
						}else if(LastPressed == false){
							image(jumpMarioLeft, this.x, this.y, this.width, this.height);	
						}
					}
					//Blocke das Springen
					this.UpSpeed = false;
				}else{
					println(JumpOptik);
						this.y -= 4;

				AnzahlFrames++;
				JumpOptik++;
				if(this.RightSpeed == true){
					image(jumpMario, this.x, this.y, this.width, this.height);
					}else if(this.LeftSpeed == true){
					image(jumpMarioLeft, this.x, this.y, this.width, this.height);	
					}else{
						if(LastPressed = true){
							image(jumpMario, this.x, this.y, this.width, this.height);	
						}else{
							image(jumpMarioLeft, this.x, this.y, this.width, this.height);	
						}
					}
				//println("Test"+this.RightSpeed);
				}
		}
	}
	}
}