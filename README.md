# Crossfire

## A tribute to the C=64 original from Sierra

### Further experiments with the Godot game engine

### TODO
- Reroute game over signal on player death
- Game, world and level loading with persistent player and UI
- Look at bbcode UI rich text component
- Transition with 2 nodes swapping children amounts

### Done
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
