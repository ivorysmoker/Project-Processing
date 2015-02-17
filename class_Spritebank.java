class Spritebank{
	private static final String[][] imagesPaths = {
		{'KOOPA','views/koopa.png'},
		{'MARIO','views/mariolexu.png'}
	};
	private static HashMap<String,PImage> images;
	Spritebank(String name){
		
	}

	public static void preloadImages(){
		for(int index = 0; index < imagesPaths.length; index++){
			//Spritebank.images.put(imagesPaths[index][0],loadImage(imagesPaths[index][1]));
		}
	}
}