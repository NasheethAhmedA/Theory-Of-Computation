# THEORY OF COMPUTATION

## Table of Contents 
1. [Introduction](#introduction)
2. [Tech-Stack](#tech-stack)
3. [Project Structure](#project-structure)
	- [File Structure](#file-structure)
	- [Separate Scenes](#separate-scenes)
 4. [Resources Used](#resources-used)
 5. [Features Implemented](#features-implemented)
 6. [How to Contribute/Play It](#how-to-contributeplay-it)
	 - [Contribution](#contribution)
	 - [Try It Here](#try-it-here)

## INTRODUCTION

Theory Of Computation or TOC is a Computer Science subject dealing with the computational theories and concepts.

For a long time many students view it as only a old/useless topic of education. But it has many practical applications on knowing its concepts.

So this is a Game that makes the learning experience of TOC in an exciting and fun gamified way.


## TECH-STACK
- This uses **GODOT** game engine with gdscript for programming.
- **Aseprite** is used for making the sprites.

## PROJECT STRUCTURE

### FILE STRUCTURE
```yaml
root:
-------->addons:
-------->assests:
---------------->components
---------------->ui:
------------------------>fonts
------------------------>sfx
------------------------>spritesheets
-------->scenes:
---------------->components
---------------->playgrounds
---------------->ui
---------------->scripts:
---------------->components
---------------->playgrounds
---------------->ui
```

### SEPARATE SCENES
- main
- about
- music_player
- state_form
- alphabet
- State
- automata_area
- DFA

## RESOURCES USED
- UI essentials pack from [crusenho](https://crusenho.itch.io/complete-ui-essential-pack)
- Wood Block sound effects from [ellr](https://ellr.itch.io/universal-ui-soundpack)
- My own sprites made with *Aseprite*

## FEATURES IMPLEMENTED
- Create, Update, Delete States.
- State Form for State details.
- Automata Area for housing states.
- DFA for deterministic Finite Automata.
- Side menu for DFA.
- Pan, Drag and Zoom in/out in Automata area.
- About Section for the controls.
- Main menu with parallax background.
- All data is synchronized appropriately.

## HOW TO CONTRIBUTE/PLAY IT
### CONTRIBUTION
- Clone this project in your local directory
``gh repo clone NasheethAhmedA/Theory-Of-Computation``
- Open it with GODOT game engine.
- Edit the project.
- Create a Pull Request.

### TRY IT HERE
You can directly compile this project for any platform of your wish.
Or you can Try out a Debug release in windows [toc_debug_v0.0.1.zip](https://github.com/NasheethAhmedA/Theory-Of-Computation/releases/tag/windows).
