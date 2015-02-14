class BlockElements{
	int x,y,width,heigth,id;
	//Konstuktor breite - höhe - länge - höhe
	BlockElements(int bx, int by, int bwidth, int bheigth){
		id = AnzahlObjekte;
		x = bx;
		y = by;
		width = bwidth;
		heigth = bheigth;
		MaxBlockElements[AnzahlObjekte] = this;
		AnzahlObjekte++;
	}
	//Methoden
	private void BlockPlacing(){
		rect(x, y, width, heigth);
		image(BlockTexture, x, y , width, heigth);
	}
	static void Collision(){
		//Best way soooo goooooood!
		//villeicht mit einem array? for dyn array MaxBlockElements
		for(int a=0; a < AnzahlObjekte; a++){
			//Objekt name kommt als String, dieser kann nicht verwendet werden um code blöcke zu bauen. Daher den String unwandeln
			int Hoehe = MaxBlockElements[a].y - PlayerMario.height;
			int PXAbfangen = Hoehe + GravityKraft; // 4 = gravity
			int Thick = MaxBlockElements[a].x + MaxBlockElements[a].width; 
			//NewBlock.BlockThick;0, 300, 400, 100
			//0, 300, 400, 100      X 300- mario grösse 100, 240, 300, 50
			//println("Block Dicke ist: "+MaxBlockElements[x].BlockThick);
			//Player Collison and gravity settings
			if(PlayerMario.x >= MaxBlockElements[a].x-PlayerMario.width && PlayerMario.x <= Thick && PlayerMario.y >= Hoehe && PlayerMario.y <= PXAbfangen){
				//Spieler steht auf dem Boden Gravity aus
				//println("Block Dicke ist: "+MaxBlockElements[x].BlockThick);
					Gravity = false;
					if(PlayerMario.UpSpeed == false){
						FramesBlocker = false;
					}
					PlayerMario.y = MaxBlockElements[a].y-PlayerMario.height;
					a = AnzahlObjekte;
					//Falls dies eintrifft schalte value auf true
					//Schalte das value auf false wenn kein objekt zutrifft
					//Frage ab ob das value auf true ist wen ja gravity false
			}else{
				if(PlayerMario.UpSpeed == true){
					Gravity = false;	
				}else{
					Gravity = true;
				}
			}	
		}
		//Alle existierten objekte in dieser klasse laden, werte ausrechnenen, Cod 
	}
}