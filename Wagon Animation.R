wagon.ride<-function (Wagon.SR=0.5, Sun.SD=8, sleep=0.1) {
## Wagon.SR is the Wagon Speed Ratio, increasing Wagon.SR speeds up the wagon
## Sun.SD is the Sun Speed Denominator, increasing Sun.SD slows down Sun speed

# Colors of objects
Water    <- rgb(0, 0.3, .9,.8)
Hills    <- rgb(0.5686, 0.2627, 0.1804, 1)
Sky      <- rgb(0.14, 0.43, .85, 0.4)
Ground   <- rgb(0.04, 0.53, .05, 1)
SunColor <- "#FCD440"
WagonHul <- "brown4"
Splashes <- "skyblue"

# Setting circular pattern
theta <- seq(from=0,to=360,by=0.1)

# Setting sleep time between frames
#sleep <- 0.001

# Setting Duration of Animation to coincide with Wagon Speed Ratio thus ending when wagon reaches edge of plot
Duration <- ceiling(50/Wagon.SR)

# Setting j counter for river splashes such that they occur in sequence every other frame
j <- 1

# Loop for animation
for (i in 0:Duration)
{

# Creating new window - required for animation 
plot.new()
  
# Setting Grid of plot window, x goes from 0-45 and y from -10 to 10
plot.window(xlim = c(0,45), ylim = c(-10,10), asp=1)

# Code for sky
lines(x=c(-10,50),y=c(15,15),lwd=170, col=Sky)

# Code for ground
lines(x=c(-10,50),y=c(-7.5,-7.5),lwd=350, col=Ground)

# Code for the sun
points(x= 10+(i/Sun.SD), y = 15,lwd=45,col=SunColor)

# Code for the mountains
polygon(x=c(25,30,50,60),y=c(3.5,14,20,4.5), col=Hills)       
polygon(x=c(25,30,50,60),y=c(3.5,14,20,4.5), col=Hills)       
polygon(x=c(-3,20,45,30,10),y=c(3.5,2,3,8,10), col=Hills)      
polygon(x=c(-3,20,45,30,10),y=c(3.5,2,3,8,10), col=Hills)      

# Dirt road
lines(x=c(-3,50),y=c(-1,-1),col='tan',lwd=4)

# River code
polygon(x=c(-3,8,10,-3),y=c(-3,-6,-5,-2), col=Water)       
polygon(x=c(8,28,30,10),y=c(-6,-6,-5,-5), col=Water)      
polygon(x=c(28,30,40,30),y=c(-6,-10,-10,-5), col=Water)   
polygon(x=c(30,25,45,40),y=c(-10,-14,-18,-10), col=Water)  
polygon(x=c(25,-3,70,45),y=c(-14,-21,-50,-18), col=Water)  

# River Splashes
if(i%%2==0){
  if(j <= 1)
    polygon(x=c(8.419922,  9.386719, 10.617187,  9.914062,  8.683594,  7.804687),
            y=c(-5.194336, -5.282227, -5.106445, -5.809570, -5.721680, -5.282227), col=Splashes)
  else if(j <= 2)
    polygon(x=c(26.78906, 29.60156, 31.71094, 28.89844, 28.45898, 26.26172), 
            y=c(-5.282227, -5.194336, -6.161133, -6.424805, -5.809570, -5.809570), col=Splashes)
  else if(j <= 3)
    polygon(x=c(34.08398, 35.40234, 38.47852, 31.44727, 33.55664, 33.46875),
            y=c(-9.149414, -10.028320, -10.995117, -10.907227, -10.116211, -8.709961), col=Splashes)
  else if(j <= 4)
    polygon(x=c( 31.18359, 28.10742, 25.20703, 36.36914, 32.76562, 32.23828),
            y=c(-14.15918, -14.59863, -14.42285, -16.88379, -15.56543, -14.42285), col=Splashes)
  else
    polygon(x=c(14.48437, 2.53125, 34.87500), y=c(-20.22363, -23.56348, -23.56348), col=Splashes)

j <- ifelse(j==5, 1, j+1)  
}
## Horse Code
  # Torso 
  polygon(x=c(4.5+(i*Wagon.SR), 3.5+(i*Wagon.SR), 3.5+(i*Wagon.SR), 4.5+(i*Wagon.SR),
              4.5+(i*Wagon.SR), 8.5+(i*Wagon.SR),  
              8.5+(i*Wagon.SR), 4.5+(i*Wagon.SR)),
          y=c(1.8, 2.3, 3.5, 4,
              4, 4,  
              1.8, 1.8),
          col="brown1")

  if(i%%2 == 1){
    # Neck to head
    polygon(x=c(8.5+(i*Wagon.SR), 7.5+(i*Wagon.SR), 8.2+(i*Wagon.SR), 
                9+(i*Wagon.SR), 9.1+(i*Wagon.SR), 9.65+(i*Wagon.SR), 
                12.5+(i*Wagon.SR), 12+(i*Wagon.SR), 10.4+(i*Wagon.SR), 9.8+(i*Wagon.SR),
                8.5+(i*Wagon.SR)),
            y=c(1.8, 3.5, 4,
                6.2, 7, 6.4,
                4.8, 3.8, 4.25, 4.25,
                1.8),
            col="brown1")
    # Eye
    points(x=10+(i*Wagon.SR), y=5.75, pch=20, col=rgb(0.25, 0.5, 0.75))
    
    # Tail
    polygon(x=c(4.068359+(i*Wagon.SR), 3.892578+(i*Wagon.SR), 
                2.750000+(i*Wagon.SR), 2.046875+(i*Wagon.SR), 
                2.750000+(i*Wagon.SR), 3.365234+(i*Wagon.SR),
                4.068359+(i*Wagon.SR)),
            y=c(3.770508, 4.473633, 4.561523, 2.540039, 2.188477, 4.034180, 3.75),
            col="brown3")
    
    # Horse Harness
    lines(x=c(11.8+(i*Wagon.SR), -1+(i*Wagon.SR)), y=c(4.25, 2.45), col=rgb(0.2,0.2,0.2,1), lwd=2)
      
    # Harness Chew
    points(x=11.8+(i*Wagon.SR), y=4.25, pch=20)
  
    # Front far leg
    polygon(x=c(7.25+(i*Wagon.SR), 9.45+(i*Wagon.SR), 9.80+(i*Wagon.SR), 8.30+(i*Wagon.SR)),
            y=c(1.80, -0.75, -0.75, 1.85),
            col="brown") 
    # Back far leg
    polygon(x=c(7.25+(i*Wagon.SR)-4, 9.45+(i*Wagon.SR)-4, 9.80+(i*Wagon.SR)-4, 8.30+(i*Wagon.SR)-4),
            y=c(1.80, -0.75, -0.75, 1.85),
            col="brown")   
  
    # Front near leg
    polygon(x=c(7.50+(i*Wagon.SR), 6.97+(i*Wagon.SR),
                6.88+(i*Wagon.SR), 5.92+(i*Wagon.SR), 5.82+(i*Wagon.SR), 6.88+(i*Wagon.SR), 7.32+(i*Wagon.SR), 
                8.38+(i*Wagon.SR), 7.85+(i*Wagon.SR)),
            y=c(2.54,  1.84,
                0.69, 0.87, 0.34, 0.08, 0.34,
                1.84,  2.63),
            col="brown4")

  # Back near leg
    polygon(x=c(7.50+(i*Wagon.SR)-4, 6.97+(i*Wagon.SR)-4,
                6.88+(i*Wagon.SR)-4, 5.92+(i*Wagon.SR)-4, 5.82+(i*Wagon.SR)-4,
                6.88+(i*Wagon.SR)-4, 7.32+(i*Wagon.SR)-4, 
                8.38+(i*Wagon.SR)-4, 7.85+(i*Wagon.SR)-4),
            y=c(2.54,  1.84,
                0.69, 0.87, 0.34, 0.08, 0.34,
                1.84,  2.63),
            col="brown4")
    

    
  }else{
    # Neck to head
    polygon(x=c(8.5+(i*Wagon.SR), 8.2+(i*Wagon.SR), 
                10+(i*Wagon.SR), 10.1+(i*Wagon.SR), 10.65+(i*Wagon.SR), 
                13.5+(i*Wagon.SR), 13+(i*Wagon.SR), 11.4+(i*Wagon.SR), 10.8+(i*Wagon.SR),
                8.5+(i*Wagon.SR)),
            y=c(1.8, 3.5, 
                6, 6.8, 6.2,
                4.6, 3.6, 4.05, 4.05,
                1.8),
            col="brown1")
    # Eye
    points(x=11+(i*Wagon.SR), y=5.5, pch=20, col=rgb(0.25, 0.5, 0.75))
    
    # Tail
    polygon(x=c(4.068359+(i*Wagon.SR), 3.892578+(i*Wagon.SR), 
                2.750000+(i*Wagon.SR), 1.646875+(i*Wagon.SR), 
                2.350000+(i*Wagon.SR), 3.365234+(i*Wagon.SR),
                4.068359+(i*Wagon.SR)),
            y=c(3.770508, 4.473633, 4.561523, 2.64, 2.29, 4.034180, 3.75),
            col="brown3")
    
    # Horse Harness
    lines(x=c(12.8+(i*Wagon.SR), -1.2+(i*Wagon.SR)), y=c(4.05, 3.15), col=rgb(0.1,0.1,0.1,1), lwd=2)
      
    # Harness Chew
    points(x=12.8+(i*Wagon.SR), y=4.05, pch=20)
    
    # Front near Leg
    polygon(x=c(7.25+(i*Wagon.SR), 7.65+(i*Wagon.SR),
                7.39+(i*Wagon.SR), 7.92+(i*Wagon.SR), 8.20+(i*Wagon.SR),
                8.45+(i*Wagon.SR), 8.30+(i*Wagon.SR)),
            y=c(1.80,  0.57, -0.75, -0.75,  0.66,  1.10,  1.89),
            col="brown")
    
    # Back far Leg
    polygon(x=c(7.25+(i*Wagon.SR)-3.5, 7.65+(i*Wagon.SR)-3.5,
                7.39+(i*Wagon.SR)-3.5, 7.92+(i*Wagon.SR)-3.5, 8.20+(i*Wagon.SR)-3.5,
                8.45+(i*Wagon.SR)-3.5, 8.30+(i*Wagon.SR)-3.5),
            y=c(1.80,  0.57, -0.75, -0.75,  0.66,  1.10,  1.89),
            col="brown")
    
    # Front near Leg
    polygon(x=c(7.05+(i*Wagon.SR), 9.45+(i*Wagon.SR), 9.80+(i*Wagon.SR), 8.30+(i*Wagon.SR)),
            y=c(2.20, -0.75, -0.75, 2.55),
            col="brown4") 
    
    # Back near Leg
    polygon(x=c(7.05+(i*Wagon.SR)-3.5, 9.45+(i*Wagon.SR)-3.5, 9.80+(i*Wagon.SR)-3.5, 8.30+(i*Wagon.SR)-3.5),
            y=c(2.20, -0.75, -0.75, 2.55),
            col="brown4") 
    
  }
  
c(34.87500,36.01758,36.63281,36.80859,36.72070,37.42383,37.42383,36.36914,35.84180)


  
#Cowboy Code
  # Torso
  polygon(x=c(-2+(i*Wagon.SR),-4+(i*Wagon.SR),-3.8+(i*Wagon.SR),-2.2+(i*Wagon.SR)),y=c(2,2,4,4), col="darkgray") 
  # Neck
  polygon(x=c(-2.5+(i*Wagon.SR),-3.5+(i*Wagon.SR),-3.1+(i*Wagon.SR),-2.7+(i*Wagon.SR)),y=c(3.9,3.9,5,5), col="#E0AC69") 
  # Head
  points(x=-3.05+(i*Wagon.SR), y = 5.3, lwd=22, col="#F1C27D")
  # Eyes
  points(x=-2.35+(i*Wagon.SR), y = 5.3, lwd=5, col="white")
  points(x=-2.35+(i*Wagon.SR), y = 5.3, lwd=2, col="blue")
  points(x=-2.35+(i*Wagon.SR), y = 5.3, lwd=1, col="black")
  # Nose
  polygon(x=c(-1.6+(i*Wagon.SR),-2.05+(i*Wagon.SR),-1.85+(i*Wagon.SR)),y=c(5,4.8,5.3), col="#E0AC69") 
  # Lips
  lines(x=c(-2.05+(i*Wagon.SR),-2.35+(i*Wagon.SR), -2.55 +(i*Wagon.SR)), y=c(4.4,4.5,4.7), lwd=1)
  # Hat
    # Brim
    lines(x=c(-5.2+(i*Wagon.SR),-1+(i*Wagon.SR)), y=c(5.2,6.1), lwd=3)
    # Bucket
    polygon(x=c(-4.4+(i*Wagon.SR), -4.4+(i*Wagon.SR), -2.3+(i*Wagon.SR), -1.8+(i*Wagon.SR)),y=c(5.5, 7,7.5,5.9), col="#8D5524") 
  # Arms
  if(i%%2 == 1){
    polygon(x=c(-3.8+(i*Wagon.SR), -2.7+(i*Wagon.SR), -0.8+(i*Wagon.SR),
                -1+(i*Wagon.SR), -2.5+(i*Wagon.SR), -2.4+(i*Wagon.SR)),
            y=c(3.7,2,2.2,2.7,2.5,3.8), col="gray") 
  }else{
    polygon(x=c(-3.8+(i*Wagon.SR), -2.7+(i*Wagon.SR), -1.2+(i*Wagon.SR),
              -1.2+(i*Wagon.SR), -2.5+(i*Wagon.SR), -2.4+(i*Wagon.SR)),
            y=c(3.7,2,2.8,3.5,2.5,3.8), col="gray") 
  }  
  

  

#Wagon Structure
  #Back side
  lines(x=c(-7+(i*Wagon.SR),-5+(i*Wagon.SR)),y=c(2,0),col=WagonHul,lwd=3)
  #Front side
  lines(x=c(2+(i*Wagon.SR),0+(i*Wagon.SR)),y=c(2,0),col=WagonHul,lwd=3)
  #Top side
  lines(x=c(-7+(i*Wagon.SR),2+(i*Wagon.SR)),y=c(2,2),col=WagonHul,lwd=3)
  #Bottom Side
  lines(x=c(x=c(-5+(i*Wagon.SR),0+(i*Wagon.SR))),y=c(median(1*sin(theta)),median(1*sin(theta))),col=WagonHul,lwd=3)
  #shading of wagon
  polygon(x=c(-7+(i*Wagon.SR),2+(i*Wagon.SR),0+(i*Wagon.SR),-5+(i*Wagon.SR)),y=c(2,2,0,0), col=WagonHul) #density=50, angle=90)

  
  
  
#Setting the wheel
y<-1*sin(theta)
x<-1*cos(theta)

#Front Wheel with rotation
lines(x+(i*Wagon.SR),y,lwd=2)
lines(x=c(-x[i]+(i*Wagon.SR),x[i]+(i*Wagon.SR)),y=c(y[i],-y[i]),lwd=2)
lines(x=c(-x[i+360]+(i*Wagon.SR),x[i+360]+(i*Wagon.SR)),y=c(y[i+360],-y[i+360]),lwd=2)

#Back Wheel with rotation
lines(x-5+(i*Wagon.SR),y,lwd=2)
lines(x=c(-x[i]-5+(i*Wagon.SR),x[i]-5+(i*Wagon.SR)),y=c(y[i],-y[i]),lwd=2)
lines(x=c(-x[i+360]-5+(i*Wagon.SR),x[i+360]-5+(i*Wagon.SR)),y=c(y[i+360],-y[i+360]),lwd=2)

# Pause between frames
Sys.sleep(sleep)

}
## ANIMATION LOOP ENDS

# Text concluding Animation
text(x = 22.5, y=5, labels = "THE END", font=2, col="white", cex=5)

}

 
wagon.ride(Wagon.SR=.5, Sun.SD=8)
