class BlockElements extends Entity{
	//int x,y,height,width,textureIndex; Vererbung
	//int x,y,width,height,id;
	//Konstuktor breite - höhe - länge - höhe
	static ArrayList FallingBlocks = new ArrayList();
	boolean Falling,
	Damage;
	BlockElements(int bx, int by, int bwidth, int bheight, String btexture, boolean bFalling, boolean bMakeDamage){
		super(bx, by, bwidth, bheight, btexture);
		Falling = bFalling;
		Damage = bMakeDamage;
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
	static void BlockTrigger(){
		for (Entity e : Entities){
			if(e instanceof Player){
				Player p = e;
			}
		}
		for (Entity e : Entities){
			if(e instanceof BlockElements){
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
	static void BlockFalling(){
		for (Entity e : Entities){
			if(e instanceof Player){
				Player p = e;
			}
		}
		for(BlockElements d : FallingBlocks){
			d.y += 6;
			//Damage or noth , if mario on under the objekt then kill him
			image(BlockTexture, d.x, d.y , d.width, d.height);
			if(d.Damage){
				if(p.x+p.width >= d.x && p.x <= d.x+d.width && p.y >= d.y && p.y <= d.y+d.height){
					GameIsLose = true;
					image(gameover, 0, 0, 600, 500);
				}
			}			
			if(d.y > 500){
				FallingBlocks.remove(d);
			}
		}
	}
}