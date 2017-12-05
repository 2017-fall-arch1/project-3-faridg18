LAB 3 - PONG
Due Date: 4/30/2017 @11:59

- How to use the program:

    1. First type

       $ make

       in the directory main directory before project 3, in order to make all the libraries that	  are needed to run the lab

    2. Inside the Project3 folder, there is the actual game: PONG, in order to run it type

       $ make load

       to load the program in the msp430 and start playing pong, the screen will turn white and
       then it will draw all the shapes needed to play the game

    3. To clean the binaries:

       $ make clean

- Description: the program draws 4 main shapes: 2 paddles, one for each player, a ball, and the actual playing field (aka fence) and the ball starts moving. For each time the ball touches the contrary side of the fence, it wil score a point. the game itself has no ending protocol, so the players can play until the become bored.

- Controls for the paddles:

	 P1
		* Going up: S2
		* Going down: S1
         P2
		* Going up: S4
		* Going down: S3

My program implements its main funtions, like the logic of the ball and the shapes based from the shape-demo directory we were provided as a demo. With the aid of Daniel and after many failed attemps, I finally came up with a program that works. I wanted to do the easiest lab possible. Because according to Dr. Freudenthal, as long as we have all the  skills demosntrated in the lab, we are good to go, and that is what I did. I think I deserve an A for my effort! I did have a hard time trying to figure out a way to make the ball collide with the paddles, and after many attemps, I think it will be better to compare shapes using abShape check instead of the boundaries. My method called collision detector will return a 1 if the ball collides with a paddle, so in mladvance, that flag i used to made the ball be rejected. That was the best way I find out to do it, maybe is not the best way to handle it, but is the one that works the best of my may failed attempts.

- Collaborations and References
During the process of the development of the lab, shared ideas and help Eulalio Garcia to apply them in his code. Those ideas are represented in the paddle movement, and how to understand how the ball collides. I would also like to give credit to the arch team for the use of their code in the implementation of this little game, because at the end, it was almost the same code except that I changed it to create pong. That way, coding was simpler that if I had started from 0, also the make files suited for the same structure, so I did reuse it since it made things easier.