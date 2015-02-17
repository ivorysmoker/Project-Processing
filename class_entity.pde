class Entity{
	static ArrayList Entities = new ArrayList();
	int x,y,height,width,textureIndex;
	ArrayList Textures = new ArrayList();
	Entity(int ex,int ey,int ewidth,int eheight, String[] etexture){
		x = ex;
		y = ey;
		height = eheight;
		width = ewidth;
		textureIndex = 1;
			for (String s : etexture){
				Textures.add(loadImage(s));
			}
		Entities.add(this);
	}
	public void remove(){
		Entities.remove(this);
	}
	static void draw() {
		for (Entity e : Entities){
			//println('x: ' + e.x + '  y: ' + e.y + '  w: ' + e.width + '  h: ' + e.height + 'type: '+ e.type+'  tindex: ' + e.textureIndex );
			//image(e.Textures.get(e.textureIndex), e.x, e.y, e.width, e.height);
			
			//Kleine Idee um die Entitys zuordnen zu können @ Bilder
			/*if(e.type == 'Player'){
				//image(standingMario, e.x, e.y, 14, 20);
				//Hier müsste zimlich viel hin von class_player
			}*/
			if(e instanceof Enemy){ // das prüäft ob e äs object vom typ Enemy isch... sehr gäbig.. wärd/chöi mir de oft bruchä
			    image(Koopa, e.x, e.y, e.width, e.height);
			}
		}
	}
}