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
}