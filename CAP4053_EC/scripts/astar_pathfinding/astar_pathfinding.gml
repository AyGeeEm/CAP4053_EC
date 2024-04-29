// Define the necessary variables
var startX = argument0;
var startY = argument1;
var goalX = argument2;
var goalY = argument3;

// Create lists to store open and closed nodes
var openList = ds_priority_create();
var closedList = ds_list_create();

// Create a map to store parent nodes
var parentMap = ds_map_create();

// Create a map to store G scores (cost from start to current node)
var gScoreMap = ds_map_create();

// Create a map to store F scores (total cost estimate)
var fScoreMap = ds_map_create();

// Add the start node to the open list
ds_priority_add(openList, [startX, startY], 0);
gScoreMap[? [startX, startY]] = 0;
fScoreMap[? [startX, startY]] = heuristic(startX, startY, goalX, goalY);

while (!ds_priority_empty(openList)) {
    // Get the node with the lowest F score from the open list
    var current = ds_priority_delete_min(openList);
    var currentX = current[0];
    var currentY = current[1];

    // If the current node is the goal, terminate the loop
    if (currentX == goalX && currentY == goalY) {
        break;
    }

    // Add the current node to the closed list
    ds_list_add(closedList, current);

    // Generate the neighbors of the current node
    var neighbors = getNeighbors(currentX, currentY);

    // Iterate through each neighbor
    for (var i = 0; i < array_length_1d(neighbors); i++) {
        var neighbor = neighbors[i];
        var neighborX = neighbor[0];
        var neighborY = neighbor[1];

        // If the neighbor is in the closed list, skip it
        if (ds_list_find_index(closedList, neighbor) != -1) {
            continue;
        }

        // Calculate the tentative G score for the neighbor
        var tentativeGScore = gScoreMap[? current] + distance(currentX, currentY, neighborX, neighborY);

        // If the neighbor is not in the open list or has a lower G score
        if (ds_priority_find_priority(openList, neighbor) == 0 || tentativeGScore < gScoreMap[? neighbor]) {
            // Update the parent, G score, and F score for the neighbor
            parentMap[? neighbor] = current;
            gScoreMap[? neighbor] = tentativeGScore;
            fScoreMap[? neighbor] = tentativeGScore + heuristic(neighborX, neighborY, goalX, goalY);

            // Add the neighbor to the open list
            if (ds_priority_find_priority(openList, neighbor) == 0) {
                ds_priority_add(openList, neighbor, fScoreMap[? neighbor]);
            }
        }
    }
}

// Reconstruct the path from the goal to the start
var path = path_add();
var current = [goalX, goalY];

while (current != [startX, startY]) {
    path_add_point(path, current[0], current[1], 100);
    current = parentMap[? current];
}
path_add_point(path, startX, startY, 100);
path_reverse(path);

// Clean up data structures
ds_priority_destroy(openList);
ds_list_destroy(closedList);
ds_map_destroy(parentMap);
ds_map_destroy(gScoreMap);
ds_map_destroy(fScoreMap);

// Return the generated path
return path;

// Heuristic function (estimate the distance from a node to the goal)
function heuristic(x1, y1, x2, y2) {
    return abs(x1 - x2) + abs(y1 - y2);
}

// Distance function (calculate the actual distance between two nodes)
function distance(x1, y1, x2, y2) {
    return sqrt(sqr(x1 - x2) + sqr(y1 - y2));
}

// Function to get the neighbors of a node
function getNeighbors(x, y) {
    var neighbors = [];
    var directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]; // Up, Down, Left, Right

    for (var i = 0; i < array_length_1d(directions); i++) {
        var dir = directions[i];
        var nx = x + dir[0];
        var ny = y + dir[1];

        if (nx >= 0 && nx < room_width && ny >= 0 && ny < room_height) {
            if (!place_meeting(nx, ny, obj_testWall)) {
                array_push(neighbors, [nx, ny]);
            }
        }
    }

    return neighbors;
}