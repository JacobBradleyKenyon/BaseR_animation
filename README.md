# BaseR_animation
Animation using base R programming

The "Wagon Animation.R" file represents a function which effectively runs in base R (not RStudio).  

The result of the function is an animated wild west scene.  
The animation includes spinning wheels, moving streams, rider, horse and sun. 
Animation is achieved by utilising the sleep R base function which does not work within RStudio.
The function takes three inputs; "Wagon.SR", "Sun.SD" and "sleep".

"Wagon.SR" requires a numeric value as input and controls the speed of the wagon and ultimately the length of the animation.
Larger values result in a shorter animation time and faster wagon.

"Sun.SD" requires a numerica value as input and controls the speed of the sun.
Larger values result in a slower sun speed.

"sleep" requires a numeric value and represents the refresh rate (the seconds between each frame).

