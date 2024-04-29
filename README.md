# CAP4053 Extra Credit Game

A simple maze game with FSM A* pathfinding monsters chasing you in the dark.

## AI Behavior Description

This game utilizes a Finite-State Machine (FSM) to power any monster instance behavior (obj_monster) within the maze to do the following:
* If the player is farther than 400 coordinate points, remain in the "Roaming" state, using the A* pathfinding script (astar_pathfinding) to traverse the maze to a random point while avoiding wall collision (obj_testWall).
* If the player reaches within a radius of 200 coordinate points of the monster instance, switch to the "Waiting" state for 1 second and run the "alert" animation, before switching to the "Chasing" state.
* Remain in the "Chasing" state while the player is within 300 coordinate points, using A* pathfinding to traverse the maze to the current coordinate point of the player. Switch to the "Roaming" state otherwise.

The A* pathfinding script is powered by the mp_grid_create() function, located within obj_grid, to create a grid structure of the current room that is used by the script to create a set of linked points that form a path that avoids any obj_testWall instances.

## Getting Started

### Installing and running program

* Download "CAP4053_EC-main" root folder
* Run "CAP4053_EC.exe" located in root directory
* Source files located in CAP4053_EC child folder

## Authors

Alex Garcia-Marin
* [Linkedin](https://www.linkedin.com/in/alexgarcia-marin/)

## Version History

* 0.2
    * Optimized FSM behaviors, added monster animations
    * Added particle effects (obj_particleSys and obj_particle)
    * Updated maze layout
* 0.1
    * Initial commit
 
(Finished in a cumulative 24 hours)
