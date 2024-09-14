# Crossfire

## A tribute to the C=64 original from Sierra

### Further experiments with the Godot game engine

### TODO
- Raycast line of sight (vision) as adjunct to Area2D (sound)
- Track can prioritise shortest vector as well as x and y
- Enemies to track and fire at player
- Different enemy behaviours
- Level intro and Game Over screens
- Reset world to next level
- Configure behaviours and difficulty
- Reskin menus and add Options menu
- Only destroy one enemy per bullet
- Game, world and level loading with persistent player and UI
- Pickup sounds

### Done
- Optimise tracking with sequential vectors
- Shader to score label a la Defender
- Score label fly out from lantern on pickup
- Decide if we need enemy Move state
- Standardise grid position for player and enemy
- Fix crash in enemy AI if enemy outlives player
- Remove extraneous globals
- Rotate bullet in travel direction
- Lantern scoring on pickup
- Lanterns movement
- Bullets can't pass tiles
- Fix disparity in MC and spawn grid sizes
- Enemies initially move towards centre (can use Track?)
- Reroute game over signal on player death
- Spawner handles destruction of enemies
- Track to position in enemy state
- Sort out state movements
- Implement hiding and Lurking in the enemies
- Investigate giving the move handler a completion func (for above) or perhaps a signal 'move completed'
- Look at bbcode UI rich text component
- Sample the bullet sound out of Rolling Thunder
- Remove cyclic explode state
- Fix the multiple explosion problem: does the state need to be unique / local to the scene?
- Do more work on the state machine transitions allowed. Recent Timer state chages cause explode to lock
- Can I make the weapon component a Node2D?
- Quantise joystick to 4 directions
- Stop player movement on explode
- Move player export to Idle state and pass it to Move state as a param
- Implement pausing
- Transition with 2 nodes swapping children amounts
- Componentise health and movement, remove Mob subclass
- Put a signal for enter and exit in the State
- Experimenting with a state machine design:
- StateMachine: Handle current state processing switches (test)
- StateMachine: Handle enter and exit tree signals for child nodes
- Port the explode shader from EF3
- Use vertex programme for scaling explode shader

### Oubliette
- Recycle bullets

### Reference
https://docs.godotengine.org/en/stable/tutorials/ui/bbcode_in_richtextlabel.html
https://www.youtube.com/watch?v=KfdTJ1QuPvU Beginner platformer P10 GeMakesGames
https://www.youtube.com/watch?v=tNqFLmbWW-Y Bacon and Games Godot template

### Notes
Enemy scores: 10, 20, 40, 80
Lanterns: 100, 200, 400, 800
