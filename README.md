# Final

Our game is a boss fighting game where your objective is to defeat the boss and the minions that spawn to defend the boss. 

Controls:
W - Move upward
A - Move left
S - Move downward
D - Move right
F - Place defensive shield
E - Switch weapon
Left Mouse - Shoot

May 16
- Repo created

May 17
- Derek: Worked on triangle creation helper function

- Jackson:
    Implemented a move method using WASD
    Circle can move up, down left, right, but movement is a little clunky and looks unstable

May 20
- Derek:
    Started work on bullet classes
    Created green friendly bullets
    Created red enemy bullets

- Jackson:
    Added classes Character, Player and Monster
    Gave the player object a gun and trying to get that to aim at the cursor

May 21
- Derek:
    Finished work with player created bullets
    Added math to shoot in direction of the cursor
    Added math so that bullets can move in a straight line in any direction
- Jackson:
    Able to get cannon to follow cursor (add to use atan2 instead of regular atan)
    Used same method to get a monster to follow the player

May 22
- Derek:
    Smoothed out player movements so that it's not so choppy
    Started work on enemy shooting ai.

May 23
- Derek:
    Added hitboxes for enemies and player
    Finished aimed shooting for AI
    Added fire modes like shotgun and rapid fire
    Added boundaries at the edges of screen
- Jackson:
    Created two different menus: main and stage
    Main has only one button that changes mode to stage
    Stage has previous features inside

May 24
- Derek:
    Added wall objects
    Added code to allow walls to stop bullets
- Jackson:
    Added in a status bar that shows health and ammo
    Outside health bar is fixed, and inside health bar changes based on percent of max health
    Ammo decreases when gun is fired, and different weapons show different names

May 27
- Derek:
    Fixed the problem with the array that Jackson had
    Started working on making walls block player movement
- Jackson:
    Added in an array of monsters, no longer just long
    Game crashes whenever bullets hit monster: array is messed up

May 28
- Derek:
    Added in system for despawning enemies once killed
    Made walls look nicer
- Jackson:
    Added in a spawner for monsters: create one every x amount of seconds
    Added in a health pack that regenerates on the map: changed health bar so health doesn't surpass the max

May 29
- Derek
    Reorganized code to lower number of tabs
    Made start screen look better
    Tightened shotgun cone

May 30
- Derek
    Made wall block player movement
    Made text in starting screen blink so that it looks more gamelike
    Randomized enemy shooting patterns
- Jackson
    Started designing boss, not yet in use
    Started designing stage 1, have spawners in place
    Gave monsters a less than 100% accuracy, because their shots will always miss if the player is moving 
