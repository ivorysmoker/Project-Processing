class BlockElements extends Entity{
	//int x,y,height,width,textureIndex; Vererbung
	//int x,y,width,height,id;
	//Konstuktor breite - h�he - l�nge - h�he
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
				if(p.x == e.x){
					if(FallingBlocks.contains(e)){
						break;
					}else{
						if(e.Falling){
						FallingBlocks.add(e);
												println("Block added");
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
			d.y += 5;
			image(BlockTexture, d.x, d.y , d.width, d.height);
		}
	}
}