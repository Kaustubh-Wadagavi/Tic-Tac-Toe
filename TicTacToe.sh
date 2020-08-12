#! /bin/bash

initializeTheGame()
{
    echo "====================================================="
    echo "| |                   Game Name                   | |"
    echo "| |                Tic - Tac - Toe                | |"
    echo "| |               (Two  Player Game)              | |"
    echo "====================================================="
    echo ""
    echo "Initialising the Game...."
    echo ""
    gamePlayer=1
    gameBoard=(- - - - - - - - -)
    declairWinner=1
    echo "*****************************************************"
    echo "| |                                               | |"
    echo "| |                  Game Started                 | |"
    echo "| |                                               | |"
    echo "*****************************************************"
}

printTheBoard()
{
    echo "Rows\Columns   0   1   2 "
    echo ""
    echo "             -------------"
    echo "    0        | ${gameBoard[0]} | ${gameBoard[1]} | ${gameBoard[2]} |"
    echo "             -------------"
    echo "    1        | ${gameBoard[3]} | ${gameBoard[4]} | ${gameBoard[5]} |"
    echo "             -------------"
    echo "    2        | ${gameBoard[6]} | ${gameBoard[7]} | ${gameBoard[8]} |"
    echo "             -------------"   
}

setInput()
{
   placeValue=$(( $1 * 3 + $2 ))
   if [ ${gameBoard[$placeValue]} == "-" ]
   then 
      gameBoard[$placeValue]=$3
      gamePlayer=$((gamePlayer%2+1))
   else
      echo -e "\nYour Choosed Place Is Already Filled!!!"
      echo -e "Please Try Again!!!!"
   fi
}

checkTheWinner()
{
   findMatchedSymbols 0 1 2
   findMatchedSymbols 3 4 5
   findMatchedSymbols 6 7 8
   findMatchedSymbols 0 4 8
   findMatchedSymbols 2 4 6
   findMatchedSymbols 0 3 6
   findMatchedSymbols 1 4 7
   findMatchedSymbols 2 5 8
}

findMatchedSymbols()
{
   if [ ${gameBoard[$1]} != "-" ]&&[ ${gameBoard[$1]} == ${gameBoard[$2]} ]&&[ ${gameBoard[$2]} == ${gameBoard[$3]} ]
   then 
	declairWinner=0
   fi
}

initializeTheGame
while true
do
	echo ""
	if [ $gamePlayer == 1 ]
  	  then 
  	     symbol=X
  	  else
  	     symbol=O
  	  fi
  	  
	  echo "Player $gamePlayer's Turn: ($symbol)"
          echo ""
	       printTheBoard
          echo ""
	  echo "#####################################################"
          echo "||                                                 ||"
          echo "||   Input Commands :                              ||"
          echo "||            A. draw [Row] [Column] (To Play)     ||"
          echo "||            B. reset (To reset The Game)         ||"
          echo "||                                                 ||"
          echo "#####################################################"
          echo ""
   
          while true
          do
            read -r inputCommand a b
            if [ $inputCommand == "draw" ]
            then 
 		setInput $a $b $symbol
                break
            elif [ $inputCommand == "reset" ]
            then 
                initializeTheGame
                break
            else
	        echo ""
                echo "Wrong Input, Please Try Again!!!"
	    fi
          done
   
	  checkTheWinner
	  
          if [ $declairWinner != 1 ]
	  then
	      gamePlayer=$((gamePlayer%2+1))
	      printTheBoard
	      echo "=====================================================" 
	      echo "| |                                               | |"
              echo "| |                   Gameover                    | |"
              echo "| |               Player $gamePlayer ($symbol) Won                | |"
	      echo "| |                                               | |"
	      echo "====================================================="
	      echo ""
              echo "Please Enter \"reset\" to Restart the Game" 
     	      read -r inputCommand n
	      while true 
	      do
           	 if [ $inputCommand == "reset" ]
		 then 
                    initializeTheGame
		    break
		 fi   
	      done
	 fi	
done
