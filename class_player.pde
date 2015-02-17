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
		//Wenn mann hier die Super Klasse l�d, wird die Breite und H�he des Mario's nicht �bernommen.
		//super(px, py, pwidth, pheight, plife);
	}
	static void TestingSuperClass(){
		for (Entity p : Entities){
			//println(p.x);
			if(p instanceof Player){
				println("Das Mario Objekt wurde gefunden!");
				//Anscheinend kapiere ich das noch nicht ganz...
				//Der obere Konstruktor �bergibt an Enitity die Werte an den Konstuktor. Dieser erstellt das sogenante neue Entity
				//Jetzt befindet sich das Mario objekt in entity
				//Um die zuholen werden alle entity in p geladen und sobald p eine instanz von player ist gib println aus
				//Was ist falsch?^^
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
		
		//Welche Seite dr�ckt der Spieler
		if(this.LeftSpeed == true || LastPressed == true){
					
			firex -= 3;
			//um den feuerball sringen zu lassen, addre bsp alle 3 frame 4 h�he - die gravity wird in automatisch wieder runter dr�cken
		}else if(this.RightSpeed == true || LastPressed == false){
			frame3 = (frame3+1)%numFrames3; 
			image(images3[frame3], firex, firey, 7, 7);
			firex += 3;
		}
	}
	public void Render(){
		if(this.RightSpeed == false && this.LeftSpeed == false && this.UpSpeed == false || this.RightSpeed == true && this.LeftSpeed == true){
			
			if(this.LeftSpeed == true || LastPressed == true){
			image(images2[3], this.x, this.y, this.width, this.height);		
			}else if(this.RightSpeed == true || LastPressed == false){
			image(images[3], this.x, this.y, this.width, this.height);
			}
			
		}
	}
	public void Movement(){
		//Rechts
		if(this.RightSpeed == true && this.LeftSpeed == true){
				image(standingMario, this.x, this.y, this.width, this.height);
		}else{
		if(this.RightSpeed == true){
			//println("Test"+this.RightSpeed);
			this.x += MovementMaxSpeed;
			//Animation
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