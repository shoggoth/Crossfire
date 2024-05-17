# Crossfire

## A tribute to the C=64 original from Sierra

### Further experiments with the Godot game engine

### TODO
- Sample the bullet sound out of Rolling Thunder
- Game, world and level loading with persistent player and UI
- Reroute game over signal on player death
- Look at bbcode UI rich text component

### Done
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

### Reference
https://www.youtube.com/watch?v=KfdTJ1QuPvU Beginner platformer P10 GeMakesGames
https://www.youtube.com/watch?v=tNqFLmbWW-Y Bacon and Games Godot template
