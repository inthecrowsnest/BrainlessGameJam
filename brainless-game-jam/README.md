# BRAINLESS MINI-GAME JAM 

Using this to keep track of thought process / code decisions / tutorials I (crow) utilized for personal use.
May add this to my portfolio later and want to document what I personally contributed / what I did not (so I can give proper credit).
Feel free to add to this!

# OVERALL GAME DESIGN

basic overview of game:
	
	starting as a text based adventure, the player expresses they are bored of this "old game" and go to exit. 
	in a panic, the game begs them to stay and warps itself into a "more modern" game - a bullet hell. The player
	will proceed to play the game as a normal bullet hell. At the end, to escape, the player will battle the 
	sentient game itself. After completing the boss battle, an impossible phase will trigger. Once triggered to end
	(time based? death based? both?), the game will apologize, concede, and release the player. 

# PROJECT OVERVIEW

Folders:
	assets - hold all art assets
	json - holds the json for dialogue
	scenes
	scripts 
		singletons - holds global scripts
		
(i know nothing of layers but just a baseline bc the dialogue system needs a layer)

Layers:
	Layer 1 : world (?)
	Layer 2 : dialogue (?)
	Layer 3 : bullets (?)

# MECHANICS

# Crow's code 

## Dialogue System
I utilized (StevePixelFace's)[https://www.youtube.com/@StevePixelFace] godot (dialogue system tutorial)[https://www.youtube.com/watch?v=Ur9j3c5_of0]
to create the framework for the signal bus and dialgoue system.

 
