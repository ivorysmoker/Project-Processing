class BlockElements extends Entity{
	//int x,y,height,width,textureIndex; Vererbung
	//int x,y,width,height,id;
	//Konstuktor breite - höhe - länge - höhe
	BlockElements(int bx, int by, int bwidth, int bheight, String btexture){
		super(bx, by, bwidth, bheight, btexture);
		/*id = AnzahlObjekte;
		x = bx;
		y = by;
		width = bwidth;
		height = bheight;*/
		MaxBlockElements[AnzahlObjekte] = this;
		AnzahlObjekte++;
	}
	//Methoden
	private void BlockPlacing(){
		rect(x, y, width, height);
		image(BlockTexture, x, y , width, height);
	}
	static void Collision(){
		//Lade alle Objekte
		/*for (Entity b : Entities){
			if(b instanceof BlockElements){
				
			}
		}*/
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