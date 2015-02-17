class Spritebank{
	private static final String[][] imagesPaths = {
		{'KOOPA','views/koopa.png'},
		{'MARIO','views/mariolexu.png'}
	};
	private static HashMap<String,int> images;

	public static void preloadImages(){
		//images.put('troll',2);
		for(int index = 0; index < imagesPaths.length; index++){
			//Spritebank.images.put(imagesPaths[index][0],loadImage(imagesPaths[index][1]));
			//Spritebank.images.put(imagesPaths[index][0],loadImage(imagesPaths[index][1]));
		}
	}
}