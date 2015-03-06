class BlockElements extends Entity{
	//int x,y,height,width,textureIndex; Vererbung
	//int x,y,width,height,id;
	//Konstuktor breite - höhe - länge - höhe
	static ArrayList FallingBlocks = new ArrayList();
	boolean Falling,
	Damage,
	FallingTrigger,
	Respawn;
	int FallingSpeed;
	String SingleBlockTexture;
	BlockElements(int bx, int by, int bwidth, int bheight, String[] btexture, String bSingleBlockTexture, boolean bFalling, int bSpeed, boolean bTrigger, boolean bRespawn, boolean bMakeDamage){
		super(bx, by, bwidth, bheight, btexture);
		Falling = bFalling;
		Damage = bMakeDamage;
		FallingSpeed = bSpeed;
		FallingTrigger = bTrigger;
		Respawn = bRespawn;
		SingleBlockTexture = bSingleBlockTexture;
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
		//rect(x, y, width, height);
		if(SingleBlockTexture == 'views/boden.png'){
			image(BlocksBoden, x, y , width, height);	
		}else if(SingleBlockTexture == 'views/falling.png'){
			image(FallingB, x, y , width, height);	
		}
	}
	static void BlockTrigger(){
		for (Entity e : Entities){
			if(e instanceof Player){
				Player p = e;
			}
		}
		for (Entity e : Entities){
			if(e instanceof BlockElements){
				if(e.FallingTrigger == true){
					if(FallingBlocks.contains(e)){
							break;
						}else{
							if(e.Falling){
							FallingBlocks.add(e);
							}
						}
				}else{
					if(p.x >= e.x && p.x <= e.x+e.width){
						if(FallingBlocks.contains(e)){
							break;
						}else{
							if(e.Falling){
							FallingBlocks.add(e);
							}
						}
					}
				}
			}	
		}
	}
	static void BlockDmg(){
		for (Entity e : Entities){
			if(e instanceof Player){
				Player p = e;
			}
		}
		for (Entity b : Entities){
			if(b instanceof BlockElements){
				if(b.Damage == true && b.Falling == false){
					if(p.x >= b.x && p.x <= b.x+b.width && p.y >= b.y && p.y <= b.y+b.height){
						//DEAD AND MAYBE Block Animation
						//image(BlockTexture, b.x, b.y , b.width, b.height);
						GameIsLose = true;
						image(gameover, 0, 0, 600, 500);
					}
				}
			}
		}
	}
	static void BlockFalling(){
		for (Entity e : Entities){
			if(e instanceof Player){
				Player p = e;
			}
		}
		for(BlockElements d : FallingBlocks){
			if(d instanceof BlockElements){
				d.y += d.FallingSpeed;
				//Damage or noth , if mario on under the objekt then kill him
				//image(BlockTexture, d.x, d.y , d.width, d.height); wird von placing übernommen!
				if(d.y == 500){
					if(d.Respawn){
						d.y = 0-d.height;	
					}else{
					FallingBlocks.remove(d);
					}
				}
				if(d.Damage){
					if(p.x+p.width >= d.x && p.x <= d.x+d.width && p.y >= d.y && p.y <= d.y+d.height){
						GameIsLose = true;
						image(gameover, 0, 0, 600, 500);
					}
				}			
			}
		}
	}
}