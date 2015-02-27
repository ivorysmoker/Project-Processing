class Spritebank{
	// --- static variables
	private static HashMap<String,HashMap<String,AnimationSet>> SpriteBanks = new HashMap<String,HashMap<String,AnimationSet>>();
	
	
	// --- obj fields
	private HashMap<String,PImage[]> animations;
	private String name,currentAnimation;
	private int width,height,currentAnimationIndex,skipedFrames;
	
	// --- constructor
	Spritebank(String spname){
		if(Spritebank.SpriteBanks.containsKey(spname)){
			this.name = 'missingSprite';
		}
		else{
			this.name = spname;
		}
		this.animations = Spritebank.SpriteBanks.get(this.name);
		this.currentAnimation = this.animations.keySet().toArray()[0];
		this.width = this.animations.get(this.currentAnimation).width;
		this.height = this.animations.get(this.currentAnimation).height;
		this.currentAnimationIndex = 0;
		this.skipedFrames = 0;
	}
	
	
	// --- static methods
	public static void preloadImages(){
		if (debug){println('Preloading all Sprites');}
		String lines[] = loadStrings("spritebanks.txt");
		for (String l : lines) {
			if (Lexudebug){println('working on line : ' + l);}
			Sting[] spProperties = l.split(';',-1);
			PImage spImage = loadImage('graphics/spritebanks/' + spProperties[0]);
			Sting spName = spProperties[1];
			int yOffset = 0;
			Sting[]	animationDiscriptions = spProperties[2].split(':',-1);
			HashMap<String,AnimationSet> AnimationSets = new HashMap<String,AnimationSet>();
			if (Lexudebug){println('path : graphics/spritebanks/' + spProperties[0] + '   name : ' + spProperties[1] + '   otherstuff : ' + spProperties[2]);}
			for(String aD : animationDiscriptions){
				println('working on a Discription: ' + aD);
				String[] animationProperties = aD.split('-',-1);
				String animationName =  animationProperties[0];
				int frameCount =  animationProperties[1],
					frameSkip = animationProperties[2],
					frameWidth = animationProperties[3],    //chani no chürzä wenns überhoupt geit funktioniert
					frameHeight = animationProperties[4];
				PImage[] animationImageSet;
				for(int index = 0 ; index < frameCount; index++){
					animationImageSet[animationImageSet.length] = spImage.get(index*frameWidth,yOffset,frameWidth,frameHeight);  // darn it... ig bi nid sicher obs so stimmt.. isch mir eifach no grad i sinn cho das es so eh fail isch gsi 
					println(index);
				}
				yOffset += frameWidth;
				AnimationSet as = new AnimationSet(frameWidth,frameHeight,frameSkip,animationImageSet);
				AnimationSets.put(animationName,as);
				println('name :' + animationName);
			}
			Spritebank.SpriteBanks.put(spName,AnimationSets);
		}
	}
	
	public static void testdraw(){
		println(Spritebank.SpriteBanks.get('name2').get('name2animationname2').width);
	}
	
	// obj methods
	public void nextFrame(){
		if(this.skipedFrames >= this.animations.get(this.currentAnimation).frameSkip){
			this.skipedFrames = 0;
			this.currentAnimationIndex++;
			if(this.currentAnimationIndex >= this.animations.get(this.currentAnimation).AnimationSetImages.length){
				this.currentAnimation = 0;
			}
		}
		else{
			this.skipedFrames++;
		}
	}
	
	public void previousFrame(){
		if(this.skipedFrames >= this.animations.get(this.currentAnimation).frameSkip){
			this.skipedFrames = 0;
			this.currentAnimationIndex--;
			if(this.currentAnimationIndex > 0){
				this.currentAnimation = this.animations.get(this.currentAnimation).AnimationSetImages.length-1;
			}
		}
		else{
			this.skipedFrames++;
		}	
	}
	
	public void resetFrame(){
		this.currentAnimationIndex = 0;
		this.skipedFrames = 0;
	}
	
	public void setAnimation(String n){
		this.currentAnimation = n;
		this.width = this.animations.get(this.currentAnimation).width;
		this.height = this.animations.get(this.currentAnimation).height;
		this.resetFrame;
	}
	
	public String getAnimation(){
		return this.currentAnimation;
	}
	public Set<String> getAnimationList(){
		return this.animations.keySet();
	}
	public PImage draw(){
		return this.animations.get(this.currentAnimation).AnimationSetImages[this.currentAnimationIndex];
	}
}

	// this class is used to store diffrent datatypes under one roof.
class AnimationSet{
	int width,height,frameSkip;
	PImage[] AnimationSetImages;
	AnimationSet(int w,int h,int fS,PImage[] ASI){
		width = w;
		height = h;
		frameSkip = fS;
		AnimationSetImages =  ASI;
	}
}