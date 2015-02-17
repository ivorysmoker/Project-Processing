class Spritebank{
	private static final String[][] imagesPaths = {
		{'KOOPA','views/koopa.png'},
		{'MARIO','views/mariolexu.png'}
	};
	private static HashMap<String,PImage> images = new HashMap();
	Spritebank(String name){
		
	}
	public static void preloadImages(){
		for(int index = 0; index < imagesPaths.length; index++){
			Spritebank.images.put(imagesPaths[index][0],loadImage(imagesPaths[index][1]));
		}
	}
	public static void testdraw(){
		image(images.get('MARIO'),200,200,12,20);
		println('drawing mario on 200:200   ' + images.get('MARIO').width);
	}
}