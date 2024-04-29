x = global.cameraX;
y = global.cameraY;

// Find the nearest monster
var nearestMonster = instance_nearest(obj_player.x, obj_player.y, obj_monster);

// Calculate the distance to the nearest monster
var distanceToMonster = point_distance(obj_player.x, obj_player.y, nearestMonster.x, nearestMonster.y);

// Define the distance threshold at which the static effect starts appearing
var effectThreshold = 300;

// Calculate the static effect transparency based on the distance
var normalizedDistance = clamp(1 - (distanceToMonster / effectThreshold), 0, 0.15);

// Apply an easing function to the normalized distance for a smoother transition
staticEffectAlpha = power(normalizedDistance, 2); // Adjust the exponent for different easing curves