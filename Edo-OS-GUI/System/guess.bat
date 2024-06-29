@echo off
:start
                                               
echo        GUESS THE EMOJI FOR EDO OS GUI
echo.
echo                ---------------                
echo            ----...............----            
echo          ---.....................---          
echo        ---.........................---        
echo      ---.............................---      
echo     ---................................--     
echo   ---..................................--    
echo   ---..........--...........--..........---   
echo  ----.........+++++.......+++++.........----  
echo  ----........+++++++.....+++++++........----  
echo  -----.......+-...++.....++...-+-......-----  
echo  ------......-.....-.....-.....-.......-----  
echo  ------...............................------  
echo  -------+#++--.................--++#+.------  
echo  -------+-...--+++++#+++#+++++--...-+-------  
echo   +------+-.......................-+------+   
echo    -------++++++------------+++++++------+    
echo     +------++........---.......-++------+     
echo      ++------++-.............-++-------+      
echo        +--------++#+-----+#++--------+        
echo          +-------------------------+          
echo            +++-----------------++-            
echo               +++++++++++++++                
:Loop1

Call Button  5 28 "Happy Emoji" 20 28 "Smile Emoji" 35 28 "Grin Emoji" 48 2 "Quit" # Press
Getinput /m %Press% /h 70

:: Check for the pressed button 
if %errorlevel%==1 goto wrong
if %errorlevel%==2 goto wrong
if %errorlevel%==3 goto right1
if %errorlevel%==4 goto quit
goto Loop1

:wrong
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo You have got it wrong. Starting from begining...
ping localhost -n 3 >nul
cls
goto start

:quit
call so-ode.bat

:right1
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo You got it right! Please wait...
ping localhost -n 2 >nul
cls
echo        GUESS THE EMOJI FOR EDO OS GUI
echo.
echo                ::::::::::::::::::                
echo             ::::::::::::::::::::::::             
echo         ::::::::::::::::::::::::::::::::         
echo       :::::-++**##**++-:::::::::::::::::::       
echo      -:::::=##*+====+*##+::::::::::::::::::::     
echo     ::::::::::::::::::::::::::::::::::::::::::    
echo    :::::::::::::----:::::::::--=+****++=-::::::   
echo   ::::::::::::-+####=::::::::=##*##*+**##*=:::::  
echo  :::::::::::::-#####*-:::::::::=#####-::--::::::: 
echo  :::::::::::::-*####+-:::::::::*#####+::::::::::::
echo :::::::::::::::-+**=-::::::::::=#####-::::::::::::
echo ::::::::::::::::::::::::::::::::-=+=-:::::::::::::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::::::::::::::::::::::::::::::::::::::::::::::::::
echo :::::::::::::===-:::::::::::::::::::::::::::::::::
echo :::::::::::::=====:=*#####**+-::::::::::::::::::::
echo :::::::::::::-====--++====+*###*::::::::::::::::::
echo  ::::::::::::=====-::::::::::-==--::::::::::::::: 
echo  ::::::::::-======:::::::----======-::::::::::::: 
echo   :::::::-=======---===============-::::::::::::  
echo    :::::-===================---::::::::::::::::   
echo     ::-==================-::::::::::::::::::     
echo       -====================:::::::::::::::::      
echo        ===================-:::::::::::::::        
echo         ===================-::::::::::::           
echo          =================-::::::::::              
echo           ================-::                     
echo            =============                         

:Loop2

Call Button  2 28 "Confused Emoji" 20 28 "Thinking Emoji" 38 28 "Sad Emoji" 48 2 "Quit" # Press
Getinput /m %Press% /h 70

:: Check for the pressed button 
if %errorlevel%==1 goto wrong
if %errorlevel%==2 goto right2
if %errorlevel%==3 goto wrong
if %errorlevel%==4 goto quit
goto Loop2

:right2
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo You got it right! Please wait...
ping localhost -n 2 >nul
cls
echo        GUESS THE EMOJI FOR EDO OS GUI
echo.
                                                 
echo                      ........                     
echo                ....................               
echo             ......               .....            
echo           .-..                      ..-.          
echo          .....     .           .   . .....        
echo        .-................................-.       
echo       .-..................................-.      
echo      .-......+##--..............--##+......-.     
echo      ........--+####+-......-+####+--........     
echo     .-..........--#####....#####--..........-.    
echo     .-------.-+###++--......--+++###---------.    
echo   .--------+--+--................--+--+--------.  
echo  .--....-----.........................-+--....--. 
echo  --......-+--########++++-+++########--+-......--.
echo  .-.....---.-+##-................-##+-.-+-.....-- 
echo  .++--++--..--##+-....     ....+##--...-++--++.  
echo       .-.......-+################+-.......-.      
echo        .--......---++########++---......--.       
echo         .---.--.-.-------------.-.-.-.---.        
echo           .----------------------------.          
echo             .------------------------.            
echo                .------------------.               
echo                    ..--------..                   

:Loop3
Call Button  3 28 "Laughing Emoji" 21 28 "Grin Emoji" 35 28 "LMAO Emoji" 48 2 "Quit" # Press
Getinput /m %Press% /h 70

:: Check for the pressed button 
if %errorlevel%==1 goto right3
if %errorlevel%==2 goto wrong
if %errorlevel%==3 goto wrong
if %errorlevel%==4 goto quit
goto Loop3
:right3
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo You got it right! Please wait...
ping localhost -n 2 >nul
cls

echo.
echo        GUESS THE EMOJI FOR EDO OS GUI
echo.
echo                   ............                   
echo          .---+++----------------+++---.          
echo      .------. .................... .------.      
echo     .-----. ......... . . .......... .-----.     
echo      -----------................-----------      
echo        .--------------------------------.        
echo        ........----..........----........        
echo       .-................................-.       
echo      .--........-+++........-++-........--.      
echo      ----......-+++++......+++++-......----      
echo     .----------++..-+-....-+-..++----------.     
echo     .----------+-...-+....+-...-+----------.     
echo     .-------------............-------------.     
echo      -------------............-------------      
echo      --------------.........---------------      
echo      .---------++---.-..-.-..--++---------.      
echo       .----------++++++++++++++----------.       
echo        .-------------++++++-------------.        
echo         .------------------------------.         
echo           .--------------------------.           
echo             .----------------------.             
echo                .----------------.                
echo                      ......                      
                                                  
                                                  
:Loop4
Call Button  5 28 "Angel Emoji" 20 28 "Silly Emoji" 35 28 "Happy Emoji" 48 2 "Quit" # Press
Getinput /m %Press% /h 70

:: Check for the pressed button 
if %errorlevel%==1 goto right4
if %errorlevel%==2 goto wrong
if %errorlevel%==3 goto wrong
if %errorlevel%==4 goto quit
goto Loop4
:right4
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo Well done! You completed the game! Returning to Edo OS GUI...
ping localhost -n 4 >nul
cls
color 07