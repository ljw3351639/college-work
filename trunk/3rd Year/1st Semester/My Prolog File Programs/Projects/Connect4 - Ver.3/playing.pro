/*****************************************************************************

		Copyright (c) My Company

 Project:  CONNECT1
 FileName: PLAYING.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "connect1.inc"
include "connect1.con"
include "hlptopic.con"

%BEGIN_WIN Playing
/**************************************************************************
        Creation and event handling for window: Playing
**************************************************************************/

constants
%BEGIN Playing, CreateParms, 15:32:16-30.5.2011, Code automatically updated!
  win_playing_WinType = w_TopLevel
  win_playing_Flags = [wsf_SizeBorder,wsf_TitleBar,wsf_ClipSiblings,wsf_ClipChildren,wsf_Minimize]
  win_playing_RCT = rct(100,80,493,489)
  win_playing_Menu = no_menu
  win_playing_Title = "Playing"
  win_playing_Help = idh_contents
%END Playing, CreateParms

%	Domains and Database are in playing.dom 

predicates


	aB(cBoard,player,cBoard).
%	aB(cbrd(CurrentBoard,LastPlay),Player,return:cbrd(NewBoard,NewPlay(AI Chooses))).

	alphaBeta(cBoard,integer,integer,player,integer,integer,cBoard).
%	alphaBeta(cbrd(CurrentBoard,LastPlay),Alpha,Beta,Player,Depth,return:Heuristic,return:cbrd(NewBoard,NewPlay)).

	alphaBetaAux(cBList,integer,integer,cBoard,player,integer,integer,cBoard).
%	alphaBetaAux(CBoardList,Alpha,Beta,TmpCBoard,Player,Depth,return:Heuristic,return:NewCBoard).



	winningLines(cBoard,player,integer).
%	winningLines(CBoard,Player,return:NumberOfWinningLines).

	winningLinesAux(cBoard,player,winDir,integer).
%	winningLines(CBoard,Player,WinDir,return:NumberOfWinningLinesInWinDir).	
	
	countPossibilities(cBoard,player,location,integer,integer).
%	countPossibilities(CBoard,Player,Location,Depth,return:Number).

	winChances(integer,integer).
%	winChances(NumberOfPossiblePlays,return:howManyWayYouCanWin).



	countPieces(integer,integer,integer).
%	countPieces(countPiecesInLine(Dir),countPiecesInLine(OppositeDir),return:SumOfPiecesInLine).	

	piecesInLine(cBoard,player,integer).
%	piecesInLine(CBoard,Player,return:NumberOfPiecesInLine).

	piecesInLineAux(cBoard,player,winDir,integer).
%	piecesInLine(CBoard,Player,WinDir,return:NumberOfPiecesInLine).

	countPiecesInLine(cBoard,player,location,integer,integer,integer).
%	countPiecesInLine(CBoard,Player,Location,Depth,SpacesCount,return:Number).

	evaluationFunction(cBoard,player,integer).
%	evaluationFunction(CurrentCBoard,Player,return:Value).%Player matters here !



	getNextPlays(board,sqrList).
%	getNextPlays(Board,SqList).
	getNextPlaysAux(board,square,sqrList).
%	getNextPlays(Board,UpperLeftSquare,TheNextInputValidRow).

	doesHorizontalFork(board,sqrList,player).
%	doesHorizaontalFork(Board,NextPlays,Player).
	doesHorizontalForkAux(board,sqrList,player,integer).
%	doesHorizontalForkAux(Board,NextPlays,Player,NumOfWins).

	doesVerticalFork(board,sqrList,player).
%	doesVerticalFork(Board,NextPlays,Player).
	
	doesFork(board,sqrList,player).
%	doesFork(Board,NextPlayList,Player).

	evaluateBoard(cboard,player,integer).
%	evaluateBoard(cbrd(Board,LastPlay),Player,return:HeuristicOfBoard).
	evaluate_Board(board,player,sqrList,integer).
%	evaluate_Board(Board,Player,NextPlayList,return:HeuristicOfBoard).
	evaluateBoardAux(board,sqrList,integer).
%	evaluateBoardAux(Board,LastPlayList,return:HeuristicOfBoard).

	
	emptyBoard(Board).
%	emptyBoard(AnEmptyBoard).

	play.
%	play(cbrd(CurrentBoard,LastPlay(to check winning)),Player(ex,oh)).

	setChoice(cBoard,player,cBoard).
%	setChoice(cbrd(CurrentBoard,Square(out from getChoice(one of the 7 upper most)),Player(to write X or O),return:cbrd(NewBoard,Square(the position square stayed in))).



	countSymbols(cBoard,player,location,integer,integer).
%	countSymbols(cbrd(CurrentBoard,CurrentSquare),Player,countingDirection,Depth,return:NumberOfSymbols).
	
	didWin(cBoard,player).
%	didWin(cbrd(CurrentBoard,LastPlay(only checking around last play)),Player).

	checkNodeWin(cBoard,player,winDir).
%	checkNodeWin(cbrd(CurrentBoard,LastPlay),Player,winDir(horizontal ; .... )).%yes Or no Question.




	getChildren(board,player,cBList).
%	getChildren(CurrentBoard,Player,return:cBoardList).

	getChildrenAux(board,player,integer,cBList).
%	getChildrenAux(CurrentBoard,Player,integerToLoopInputs(7),return:cBoardList).


	
	countSpaces(board,integer).
%	countSpaces(CurrentBoard,return:#spaces).

	isTerminal(board).
%	isTerminal(CurrentBoard).%yes Or no Question.



	getSquareValue(cBoard,player).
%	getSquareValue(CurrentBoard,Square,return:Symbol in this Square( X or O )).

	setSquareValue(cBoard,player,board).
%	setSquareValue(cbrd(CurrentBoard,Square),Player,NewBoard).



	firstSquare(square).
%	firstSquare(return:upperLeftSquare).

	nextSquare(square,square).
%	nextSquare(Square,return:NextSquareInList).

	lastSquare(square).
%	lastSquare(return:LowerRightSquare).


	
	toNumber(square,integer).
%	toNumber(Square,return:#SquareInList).

	getElement(board,integer,player).
%	getElement(CurrentBoard,#SquareInList,return:Symbol(X or O)).

	setElement(board,integer,player,board).
%	setElement(CurrentBoard,#SquareInList,Symbol(X or O),NewBoard).



	nextChar(symbol,symbol).
%	nextChar(EnglishChar,return:NextEnglishChar).

	charValue(symbol,integer).
%	charValue(EnlishChar,return:#CharInEnglish).
	
	location(square,location).
%	location(Square,return:abstractLocation(up,down,left,right,middle).
	
	adj(square,location,square).
%	adj(Square,AdjecentFrom,return:AdjecentSquare).


	chooseMaxOrMinCBoard(player,integer,cBoard,integer,cBoard,integer,cBoard).
%	chooseMaxOrMinCBoard(Player,Integer1,CBoard1,Integer2,CBoard2,MinOrMaxInteger,MinOrMaxCBoard).
	
	maxWithCBoard(integer,cBoard,integer,cBoard,integer,cBoard).
%	maxWithBoard(Integer1,cbrd(Board1,Play1),Integer2,cbrd(Board2,Play2),return:MaxInteger,return:cbrd(MaxBoard(alongWithMaxInteger),MaxPlay(alongWithMaxInteger))).

	minWithCBoard(integer,cBoard,integer,cBoard,integer,cBoard).
%	maxWithBoard(Integer1,cbrd(Board1,Play1),Integer2,cbrd(Board2,Play2),return:MinInteger,return:cbrd(MinBoard(alongWithMinInteger),MinPlay(alongWithMinInteger))).

	max(integer,integer,integer).
%	max(Integer1,Integer2,return:Maximum).

	min(integer,integer,integer).
%	min(Integer1,Integer2,return:Minimum).

	
	minusInfinity(integer).
%	minusInfinity(return:VerySmallInteger).

	plusInfinity(integer).
%	plusInfinity(return:VeryBigNumber).



	printElement(symbol).
%	printElement(Symbol(matters when space)).

	printBoardAux(board,square).
%	printBoardAux(CurrentBoard,CurrentSquareToPrint).

	printBoard(board).
%	printBoard(CurrentBoard).

	printBoardList(bList).
%	printBoardList(BoardList).


	playerValue(player,integer).	
%	playerValue(Player,returns:PlayerValue).

	handleSelectedUser(integer).
%	handleSelectedUser(if 0 assert currentPlayer(Oh) Else assert currentPlayer(Ex)).

	opponentPlayer(player,player).
%	opponentPlayer(Player,return:Opponent).

	playerChar(player,symbol).
%	playerChar(Player,return:Player's-Symbol).

	extractCBoard(cboard,board,square).
%	extractCBoard(CBoard,return:Board,return:Square).
	
	chooseValue(player,integer,integer,integer).
%	chooseValue(Player,Integer1,Integer2,return:ChoosedValueAccordingToPlayer).

	assertWhoWonTheGame(player).
%	assertWhoWonTheGame(Player).assert either Oh or Ex.

	startNewGame.
%	startNewGame.  retracts old game data, asserts a new clear game data

	handleGameEnd.
%	handleGameEnd.	Outputs a note with the game status.
	

	win_playing_eh : EHANDLER  
	drawImage(Window)
	drawScene(Window,sList)
	drawSceneAux(Window,sList,integer)
	drawCircle(Window,symbol,integer)
	getColomn(integer,integer)
	getColomnAux(integer,integer,integer)
	
  
clauses

	%calling play multiple times will not make the game faster as if waiting input from user .. it will do nothing, and so on
	
	play:-%Game Ended ... do nothing
		not(currentSituation(playing)),	!.
	play:-% A player Won
		currentCBoard(CBoard),
		currentPlayer(Player),
		opponentPlayer(Player,Opponent),
		didWin(CBoard,Opponent),
		assertWhoWonTheGame(Opponent),	!.
	play:-%Draw
		currentCBoard(cbrd(Board,_)),
		isTerminal(Board),
		retract(currentSituation(_)),
		assert(currentSituation(draw)),	!.
	play:-%Ex's turn ... play using alphaBeta and set oh as next player
		currentCBoard(CBoard),
		currentPlayer(ex),
		
		aB(CBoard,ex,NewCBoard),
		
		extractCBoard(NewCBoard,_,NewPlay),
		write("Ex Plays : ", NewPlay),	nl,
		
		retract(currentCBoard(_)),
		assert(currentCBoard(NewCBoard)),
		
		retract(currentPlayer(_)),
		assert(currentPlayer(oh)),	!.
		
	play:-%Oh's turn, and input is valid .. set choice and set ex as next player
		currentCBoard(cbrd(Board,_)),
		currentPlayer(oh),
		
		inputValidation(valid),
		
		userInput(Square),
		setChoice(cbrd(Board,Square),oh,NewCBoard),
		
		extractCBoard(NewCBoard,_,NewPlay),
		write("Oh Plays : ", NewPlay),	nl,
		
		retract(inputValidation(_)),
		assert(inputValidation(notValid)),
		
		retract(currentCBoard(_)),
		assert(currentCBoard(NewCBoard)),
		
		retract(currentPlayer(_)),
		assert(currentPlayer(ex)),	!.
	
	play.%else ... it is Oh player, but input still not valid !


	aB(CBoard,Player,NewCBoard):-%just call alphaBeta
		minusInfinity(MinusInfinity),%alpha
		plusInfinity(PlusInfinity),%beta
		alphaBeta(CBoard,MinusInfinity,PlusInfinity,Player,4,_,NewCBoard),	!.%depth is 3, and the (_) neglect for the heuristic of the alphaBeta .. as I don't care for it in the top level ... all I care for is the return board
	
%			AlphaBeta
	
	alphaBeta(CBoard,_,_,Player,0,Return,CBoard):-%win for me, return 1000 * playerValue ( just checking the lastPlay )
		didWin(CBoard,Player),
		playerValue(Player,Value),
		Return = Value * 1000,	!.

	alphaBeta(CBoard,_,_,Player,_,Return,CBoard):-%here the opponent is acutally me ( the last play was the opponent )
		opponentPlayer(Player,Opponent),
		didWin(CBoard,Opponent),
		playerValue(Opponent,OpponentValue),
		Return = OpponentValue * 1000,	!.
		
	alphaBeta(CBoard,_,_,_,_,0,CBoard):-%draw game .... return Zero
		extractCBoard(CBoard,Board,_),
		isTerminal(Board),	!.
		
	alphaBeta(CBoard,_,_,Player,0,Heuristic,CBoard):-%go evaluate board ... ( ************** Problem Starts here ) 
		evaluateBoard(CBoard,Player,Heuristic),	!.
		
	alphaBeta(cbrd(Board,_),Alpha,Beta,Player,Depth,Heuristic,NewCBoard):-%not terminal Node ?! ... get ur children and work dude !
		getChildren(Board,Player,[Head|Tail]),
		NewDepth = Depth - 1,
		alphaBetaAux([Head|Tail],Alpha,Beta,Head,Player,NewDepth,Heuristic,NewCBoard).
		
%			End of AlphaBeta
		
		
%			AlphaBetaAux

	alphaBetaAux([],Alpha,Beta,NewBoard,Player,_,ChoosedValue,NewBoard):-%List is Empty .. return either alpha or beta according to the player
		chooseValue(Player,Alpha,Beta,ChoosedValue),	!.
	alphaBetaAux(_,Alpha,Beta,NewCBoard,Player,_,ChoosedValue,NewCBoard):-%beta <= alpha ... Brunning here, and return alpha or beta according the player
		Beta <= Alpha,
		chooseValue(Player,Alpha,Beta,ChoosedValue),	!.
		
	alphaBetaAux([Head|Tail],Alpha,Beta,TmpCBoard,ex,0,NewAlpha,NewCBoard):-%Terminal ( end of the tree ) ... ( Problem Continues Here ) if ex and depth is zero .. go maximize this play with the tmp play .. and continue the rest of the children
		alphaBeta(Head,Alpha,Beta,ex,0,Heuristic,_),
		maxWithCBoard(Heuristic,Head,Alpha,TmpCBoard,NewAlphaAux,NewTmpCBoard),
		alphaBetaAux(Tail,NewAlphaAux,Beta,NewTmpCBoard,ex,0,NewAlpha,NewCBoard),	!.
	alphaBetaAux([Head|Tail],Alpha,Beta,TmpCBoard,ex,Depth,NewAlpha,NewCBoard):-%if ex and depth isn't zero .. go maximize this play with the tmp and continue the tree in alphaBeta with the opponent player
		alphaBeta(Head,Alpha,Beta,oh,Depth,Heuristic,_),
		maxWithCBoard(Heuristic,Head,Alpha,TmpCBoard,NewAlphaAux,NewTmpCBoard),
		alphaBetaAux(Tail,NewAlphaAux,Beta,NewTmpCBoard,ex,Depth,NewAlpha,NewCBoard),	!.
	alphaBetaAux([Head|Tail],Alpha,Beta,TmpCBoard,oh,0,NewBeta,NewCBoard):-%Same as terminal with ex
		alphaBeta(Head,Alpha,Beta,oh,0,Heuristic,_),
		minWithCBoard(Heuristic,Head,Beta,TmpCBoard,NewBetaAux,NewTmpCBoard),
		alphaBetaAux(Tail,Alpha,NewBetaAux,NewTmpCBoard,oh,0,NewBeta,NewCBoard),	!.
	alphaBetaAux([Head|Tail],Alpha,Beta,TmpCBoard,oh,Depth,NewBeta,NewCBoard):-%Same as depth isn't zero with ex
		alphaBeta(Head,Alpha,Beta,ex,Depth,Heuristic,_),
		minWithCBoard(Heuristic,Head,Beta,TmpCBoard,NewBetaAux,NewTmpCBoard),
		alphaBetaAux(Tail,Alpha,NewBetaAux,NewTmpCBoard,oh,Depth,NewBeta,NewCBoard).
		
%			End of AlphaBetaAux


%			Evaluate Board ( The Source of the Problem ) :) ( in the first 4 conditions i think there is a problem checking just the last play ( try lastPlayedTopLine ) ... take care )

	evaluateBoard(CBoard,Player,Return):-%me did Win ((Last Play)) ... return 1000 * player's Value
		didWin(CBoard,Player),
		playerValue(Player,Value),
		Return = Value * 1000,	!.
		
	evaluateBoard(CBoard,Player,Return):-%this play will block Opponent win ((Last Play))
		extractCBoard(CBoard,_,Square),
		opponentPlayer(Player,Opponent),
		
		setSquareValue(CBoard,Opponent,NewBoard),
		didWin(cbrd(NewBoard,Square),Opponent),
		
		playerValue(Player,Value),
		Return = Value * 900,	!.
		
	evaluateBoard(CBoard,Player,Return):-%this play will be good next time for Opponent ((Last Play))
		extractCBoard(CBoard,Board,Square),
		opponentPlayer(Player,Opponent),
		
		adj(Square,up,SquareAbove),
		setSquareValue(cbrd(Board,SquareAbove),Opponent,NewBoard),
		didWin(cbrd(NewBoard,SquareAbove),Opponent),
		
		playerValue(Opponent,OpponentValue),
		Return = OpponentValue * 900,	!.
		
	evaluateBoard(CBoard,Player,Return):-%this play will make the opnent block my win which is bad ((Last Play))
		extractCBoard(CBoard,Board,Square),
		opponentPlayer(Player,Opponent),
		
		adj(Square,up,NextSquare),
		setSquareValue(cbrd(Board,NextSquare),Player,NewBoard),
		didWin(cbrd(NewBoard,NextSquare),Player),%not opponent ... but me !!
		
		playerValue(Opponent,OpponentValue),
		Return = OpponentValue * 500,	!.
	
	evaluateBoard(CBoard,Player,Number):-%get Next Plays, which i think it is NOT GOOD ... try get the LastPlayedTopLine or the whole board maybe!!  (Problem May be Here)
		extractCBoard(CBoard,Board,_),
		getNextPlays(Board,SqrList),
		evaluate_Board(Board,Player,SqrList,Number).
		
		
		
	evaluate_Board(Board,Player,SqrList,Number):-%does fork next time ... horizontal or vertical ... return 800 * PlayerValue
		doesFork(Board,SqrList,Player),
		playerValue(Player,Value),
		Number = Value * 800,	!.
		
	evaluate_Board(Board,Player,SqrList,Return):-%opponent does fork next time ... horizontal of vertical ... return 800 * opponentValue
		opponentPlayer(Player,Opponent),
		playerValue(Opponent,OpponentValue),
		
		doesFork(Board,SqrList,Opponent),
		
		Return = OpponentValue * 800,	!.
		
	evaluate_Board(Board,_,SqrList,Number):-%go sum the evaluationFunction of every element in NextPlay List ... (Problem may be here also), Random Operation ( may be bad ! ), and again try the lastPlayedTopLine not NextPlays TopLine.
		evaluateBoardAux(Board,SqrList,Number),	!.
		
	%Sums the EvaluationFunction of every element in the Square Below NextPlays List ( a try to handle the error of just evalutaion next plays ), Evaluation sums the ex's and the oh's !!!
	evaluateBoardAux(_,[],0):-	!.%empty ... stop and return 0
	evaluateBoardAux(Board,[Head|Tail],Return):-%add the evaluationFunction of this square to the evalutaions of the tail, if the below square exists
		adj(Head,down,Bottom),
		getSquareValue(cbrd(Board,Bottom),Player),
		not(Player = none),			
		evaluationFunction(cbrd(Board,Bottom),Player,EvalFun),% !!!!!!! won't work 
		evaluateBoardAux(Board,Tail,Continue),
		Return = EvalFun + Continue,	!.
	evaluateBoardAux(Board,[_|Tail],Return):-%iam at the bottom of the board ... continue with tail
		evaluateBoardAux(Board,Tail,Return).
		
	%if does a horizontal fork or vertical fork ... return true.
	doesFork(Board,SqrList,Player):-
		doesHorizontalFork(Board,SqrList,Player),	!.
	doesFork(Board,SqrList,Player):-
		doesVerticalFork(Board,SqrList,Player).	
		
	%if Number of wins returned from the Aux fun is more than one ... reutrn true ... else false.
	doesHorizontalFork(Board,SqrList,Player):-
		doesHorizontalForkAux(Board,SqrList,Player,NumberOfWins),
		NumberOfWins > 1.
	%sums the wins the next plays list
	doesHorizontalForkAux(_,[],_,0):-	!.%list is empty ... reutrn 0
	doesHorizontalForkAux(Board,[Head|Tail],Player,Number):-%if did win return Tail + 1
		
		setSquareValue(cbrd(Board,Head),Player,NewBoard),
		didWin(cbrd(NewBoard,Head),Player),
		doesHorizontalForkAux(Board,Tail,Player,Return),
		Number = Return + 1,	!.
	doesHorizontalForkAux(Board,[_|Tail],Player,Number):-%else ... return tail
		doesHorizontalForkAux(Board,Tail,Player,Number).

	%if there are at least one element in the nextPlays list which will win in this square and the square above it
	doesVerticalFork(Board,[Head|Tail],Player):-%An UpperRow Element .. continue
		Head = sqr(_,6),
		doesVerticalFork(Board,Tail,Player),	!.
	doesVerticalFork(Board,[Head|_],Player):-%A Vertical Fork ( me wins ..  and square above also wins )
	
		setSquareValue(cbrd(Board,Head),Player,Lower),
		didWin(cbrd(Lower,Head),Player),
		
		adj(Head,up,SquareAbove),
		
		setSquareValue(cbrd(Board,SquareAbove),Player,Upper),
		didWin(cbrd(Upper,SquareAbove),Player),	!.
	doesVerticalFork(Board,[_|Tail],Player):-%nothing ?! ... continue
		doesVerticalFork(Board,Tail,Player).
	
		
	getNextPlays(Board,SqList):-
		firstSquare(FirstSquare),
		getNextPlaysAux(Board,FirstSquare,SqList).
		
	getNextPlaysAux(Board,Square,[NewSquare]):-
		adj(Square,right,NextSquare),
		Square = NextSquare,
		getSquareValue(cbrd(Board,Square),none),
		setChoice(cbrd(Board,Square),none,cbrd(_,NewSquare)),	!.
	getNextPlaysAux(_,Square,[]):-
		adj(Square,right,NextSquare),
		Square = NextSquare,	!.
	getNextPlaysAux(Board,Square,[NewSquare|Tail]):-
		getSquareValue(cbrd(Board,Square),none),
		adj(Square,right,NextSquare),
		setChoice(cbrd(Board,Square),none,cbrd(_,NewSquare)),
		getNextPlaysAux(Board,NextSquare,Tail),	!.
	getNextPlaysAux(Board,Square,SqList):-
		adj(Square,right,NextSquare),
		getNextPlaysAux(Board,NextSquare,SqList).


%			End of Evaluate Board


	
%			Evaluate Node ( LastPlay )

	evaluationFunction(CBoard,Player,Return):-%evaluate LastPlay in Board ( get winningLines and PiecesInLine for me ) .. then get them of my ( opponent ) .. ( get the max of their absolute ) and multiply it by the player's value ... will return the greatest value in +ve or -ve for every player
		extractCBoard(CBoard,_,Square),
		opponentPlayer(Player,Opponent),
		
		winningLines(CBoard,Player,WinningLines),
		piecesInLine(CBoard,Player,PiecesInLine),
		
		setSquareValue(CBoard,oh,NewBoard),
		winningLines(cbrd(NewBoard,Square),Opponent,WinningLines2),
		piecesInLine(cbrd(NewBoard,Square),Opponent,PiecesInLine2),
		
										%If you asked why I did that ... I will answer that I didn't know that there was a debugger in the IDE ... so I was just writing what just feels good.
										%and why it feels good : because here it is neither offensive nor deffensive ... it will take the play that is most benefitiable for the currentPlayer and more benefitable for opponent ( total good ), or I thought so.
		
		PlayerVal = WinningLines + PiecesInLine,
		OpponentVal = WinningLines2 + PiecesInLine2,
		
		PMinusO = PlayerVal - OpponentVal,
		OMinusP = OpponentVal - PlayerVal,
		
		AbsPMinusO = abs(PMinusO),
		AbsOMinusP = abs(OMinusP),
		
%		max(AbsPMinusO,AbsOMinusP,Max),
		min(AbsPMinusO,AbsOMinusP,Min),
		
		playerValue(Player,Value),
		
		Return = Value * Min,	!.
		
%			End of Evaluate Node ( LastPlay )


%			WinningLines ( counts all myType and spaces until depth )


	%counts how many ways i can win from this node, in all winning directions.
	winningLines(CBoard,Player,Number):-%return the count of your wins in all directions ( sure of it )
		winningLinesAux(CBoard,Player,vertical,Vertical),
		winningLinesAux(CBoard,Player,horizontal,Horizontal),
		winningLinesAux(CBoard,Player,diagonalRight,DiagonalRight),
		winningLinesAux(CBoard,Player,diagonalLeft,DiagonalLeft),
		playerValue(Player,Value),
		Number = Value * (Vertical + Horizontal + DiagonalRight + DiagonalLeft),	!.

	winningLinesAux(CBoard,Player,vertical,Number):-%if vertical  ... count from me to up and down ... reutrn the count - 1 ( because I was repeated in up and down ), other are just ( else ifs )
		countPossibilities(CBoard,Player,up,4,MeAndUp),
		countPossibilities(CBoard,Player,down,4,MeAndDown),
		Count = MeAndUp + MeAndDown - 1,
		winChances(Count,Number),	!.
	winningLinesAux(CBoard,Player,horizontal,Number):-
		countPossibilities(CBoard,Player,right,4,MeAndRight),
		countPossibilities(CBoard,Player,left,4,MeAndLeft),
		Count = MeAndRight + MeAndLeft - 1,
		winChances(Count,Number),	!.
	winningLinesAux(CBoard,Player,diagonalRight,Number):-
		countPossibilities(CBoard,Player,upperRight,4,MeAndUpperRight),
		countPossibilities(CBoard,Player,lowerLeft,4,MeAndLowerLeft),
		Count = MeAndUpperRight + MeAndLowerLeft - 1,
		winChances(Count,Number),	!.
	winningLinesAux(CBoard,Player,diagonalLeft,Number):-
		countPossibilities(CBoard,Player,upperLeft,4,MeAndUpperLeft),
		countPossibilities(CBoard,Player,lowerRight,4,MeAndLowerRight),
		Count = MeAndUpperLeft + MeAndLowerRight - 1,
		winChances(Count,Number).
		

	%This Predicate will work in all 8 directions around me !
	countPossibilities(_,_,_,0,0):-	!.%Depth is 0 ( Depth is 4 ) ... the least square that makes me a winner ... return 0
%			ex
	countPossibilities(cbrd(Board,LastPlay),Player,_,_,0):-%if : Square is opponent ... stop and return 0
		opponentPlayer(Player,Opponent),
		getSquareValue(cbrd(Board,LastPlay),Opponent),	!.
	countPossibilities(cbrd(Board,Square),Player,Location,Depth,Number):-%else if : Same Player or None ... go check tail( In every Direction ) and add 1 to it.
		adj(Square,Location,NextSquare),	not(Square = NextSquare),%will stop if next is same as I ... means no next.
		NewDepth = Depth - 1,
		countPossibilities(cbrd(Board,NextSquare),Player,Location,NewDepth,ReturnNumber),
		Number = ReturnNumber + 1,	!.
	countPossibilities(_,_,_,_,1).%else : Same Player but next Square isn't
	
	
	%I will give i the number of Possibilities in a row ( horizontal or vertical or .... or ... ) and it return how many win in this number of square.
	winChances(Number,0):-%less than 4 ... can't make a single win
		Number < 4,	!.
	winChances(Number,Return):-%ex : for a 5 consecutive nodes you can win in 2 ways, for a 7 you will make a 4 wins ( can reach all of them from my node ( depth is 4, remember ? ) ).
		Return = Number - 4  + 1.
		
		
%			End of WinningLines
		
	
%			PiecesInLine ( counts the number between me and the farest node like me in the depth ) ... it counts spaces as a temp ... and add it when it founds any pieces like me under the depth

	%I think this is a bad heuristic function to use ... or I understood it in a wrong way ... check it again !

	%same as winningLines .. will count in all winning directions and returns the sum
	piecesInLine(CBoard,Player,Number):-
		piecesInLineAux(CBoard,Player,vertical,Vertical),
		piecesInLineAux(CBoard,Player,horizontal,Horizontal),
		piecesInLineAux(CBoard,Player,diagonalRight,DiagonalRight),
		piecesInLineAux(CBoard,Player,diagonalLeft,DiagonalLeft),
		playerValue(Player,Value),
		Number = Value * (Vertical + Horizontal + DiagonalRight + DiagonalLeft).
		
		
	piecesInLineAux(CBoard,Player,vertical,Number):-%if vertical .. call me and up, me and down ... reutrn the countPieces ... rest are just ( else ifs )
		countPiecesInLine(CBoard,Player,up,4,0,Up),
		countPiecesInLine(CBoard,Player,down,4,0,Down),
		countPieces(Up,Down,Number),	!.
	piecesInLineAux(CBoard,Player,horizontal,Number):-
		countPiecesInLine(CBoard,Player,right,4,0,Right),
		countPiecesInLine(CBoard,Player,left,4,0,Left),
		countPieces(Right,Left,Number),	!.
	piecesInLineAux(CBoard,Player,diagonalRight,Number):-
		countPiecesInLine(CBoard,Player,upperRight,4,0,UpperRight),
		countPiecesInLine(CBoard,Player,lowerLeft,4,0,LowerLeft),
		countPieces(UpperRight,LowerLeft,Number),	!.
	piecesInLineAux(CBoard,Player,diagonalLeft,Number):-
		countPiecesInLine(CBoard,Player,upperLeft,4,0,UpperLeft),
		countPiecesInLine(CBoard,Player,lowerRight,4,0,LowerRight),
		countPieces(UpperLeft,LowerRight,Number).

	countPiecesInLine(_,_,_,0,_,0):-	!.%Depth is 0
	countPiecesInLine(cbrd(Board,Square),Player,Location,Depth,Spaces,Number):-%Space .. add it to the tmpCounter(Spaces)
		getSquareValue(cbrd(Board,Square),none),
		adj(Square,Location,NextSquare),
		NewSpaces = Spaces + 1,
		NewDepth = Depth - 1,
		countPiecesInLine(cbrd(Board,NextSquare),Player,Location,NewDepth,NewSpaces,Number),	!.
	countPiecesInLine(CBoard,Player,_,_,_,0):-%Not Space & Not Me !
		getSquareValue(CBoard,ReturnPlayer),
		not(Player = ReturnPlayer),	!.
	countPiecesInLine(cbrd(Board,Square),Player,Location,Depth,Spaces,Number):-%Same Player and go check next Square ( Add Spaces to Tail + 1 me )
		adj(Square,Location,NextSquare),	not(Square = NextSquare),
		NewDepth = Depth - 1,
		countPiecesInLine(cbrd(Board,NextSquare),Player,Location,NewDepth,0,ReturnNumber),
		Number = ReturnNumber + Spaces + 1,	!.
	countPiecesInLine(_,_,_,_,Spaces,Number):-
		Number = Spaces + 1,	!.%Same Player but next Square isn't
			
			
	%must be more than one to return a value
	countPieces(0,OppositeDir,OppositeDir):-% if one is zero .. and the other is  > 1 .. reutrn the other 
		OppositeDir > 1,	!.
	countPieces(Dir,0,Dir):-
		Dir > 1,	!.
	countPieces(Dir,OppositeDir,Sum):-% return there sum - 1 repeated me ( if 2 equal zero !! )
		Sum = Dir + OppositeDir - 1,
		Sum > 1,	!.
	countPieces(_,_,0).%else return Zero.
	

%			End of Pieces In Line


%			didWin
		
	%Checks the Winning in LastPlay( included in CBoard ) in all ways possible
	didWin(CBoard,Player):-
		checkNodeWin(CBoard,Player,vertical),	!.
	didWin(CBoard,Player):-
		checkNodeWin(CBoard,Player,horizontal),	!.
	didWin(CBoard,Player):-
		checkNodeWin(CBoard,Player,diagonalRight),	!.
	didWin(CBoard,Player):-
		checkNodeWin(CBoard,Player,diagonalLeft),	!.
	
	%if Sum of Symbols in any winningDirection is moreThanEqual 4 ... here is a won
	checkNodeWin(CBoard,Player,vertical):-
		countSymbols(CBoard,Player,up,4,MeAndUp),
		countSymbols(CBoard,Player,down,4,MeAndDown),
		MeAndUp + MeAndDown - 1 >= 4.
	checkNodeWin(CBoard,Player,horizontal):-
		countSymbols(CBoard,Player,right,4,MeAndRight),
		countSymbols(CBoard,Player,left,4,MeAndLeft),
		MeAndRight + MeAndLeft - 1 >= 4.
	checkNodeWin(CBoard,Player,diagonalRight):-
		countSymbols(CBoard,Player,upperRight,4,MeAndUpperRight),
		countSymbols(CBoard,Player,lowerLeft,4,MeAndLowerLeft),
		MeAndUpperRight + MeAndLowerLeft - 1 >= 4.
	checkNodeWin(CBoard,Player,diagonalLeft):-
		countSymbols(CBoard,Player,upperLeft,4,MeAndUpperLeft),
		countSymbols(CBoard,Player,lowerRight,4,MeAndLowerRight),
		MeAndUpperLeft + MeAndLowerRight - 1 >= 4.
		
	countSymbols(_,_,_,0,0):-	!.%Depth is 0
	countSymbols(cbrd(Board,Square),Player,_,_,0):-%Square is Diff Player ( Must be me and only me )
		getSquareValue(cbrd(Board,Square),ReturnPlayer),
		not(ReturnPlayer = Player),	!.
	countSymbols(cbrd(Board,Square),Player,Location,Depth,Number):-%Same Player and go check next Square
		adj(Square,Location,NextSquare),	not(Square = NextSquare),
		NewDepth = Depth - 1,
		countSymbols(cbrd(Board,NextSquare),Player,Location,NewDepth,ReturnNumber),
		Number = ReturnNumber + 1,	!.
	countSymbols(_,_,_,_,1).%Same Player but Next Square isn't
	
	
%			End of didWin

	%takes a play in the top row ... and moves down down down ... until reaches the bottom or stands above another square ( should take a valid play ) ( must check that the top element in the column is empty before calling this predicate )
	%it returns the NewCBoard( which is the NewBoard with the New Element and the Square that it fall into
	setChoice(cbrd(Board,Square),Player,cbrd(NewBoard,Square)):-%if Square is already down ... but the piece here and return the newBoard and this square as the place it fall into
		location(Square,down),
		setSquareValue(cbrd(Board,Square),Player,NewBoard),	!.
	setChoice(cbrd(Board,Square),Player,NewCBoard):-%if next square is empty place ... go into it
		adj(Square,down,SouthSquare),
		getSquareValue(cbrd(Board,SouthSquare),ReturnPlayer),	ReturnPlayer = none,
		setChoice(cbrd(Board,SouthSquare),Player,NewCBoard),	!.
	setChoice(cbrd(Board,Square),Player,cbrd(NewBoard,Square)):-%else ... there is a piece below me ... but me here and you know what to do
		setSquareValue(cbrd(Board,Square),Player,NewBoard).	

	%returns the nextPlays in CBoards ( Which they are every board with the place ( LastPlay ) I played into ), it trys every column
	getChildren(Board,Player,CBList):-
		getChildrenAux(Board,Player,1,CBList).
	getChildrenaux(_,_,Input,[]):-%passed the last column ... return an empty board
		Input > 7,	!.
	getChildrenAux(Board,Player,Input,[NewHead|Tail]):-%if the top square in this column is empty ... (setChoice) in it and return the place it fall into
		charValue(Char,Input),	Square = sqr(Char,6),
		getSquareValue(cbrd(Board,Square),ReturnPlayer),	ReturnPlayer = none,
		setChoice(cbrd(Board,Square),Player,NewHead),
		NewInput = Input + 1,
		getChildrenAux(Board,Player,NewInput,Tail),	!.
	getChildrenAux(Board,Player,Input,CBoard):-%the top square isn't empty ... continue
		NewInput = Input + 1,
		getChildrenAux(Board,Player,NewInput,CBoard).
	
	%counts the spaces in the board .. if zero ... it is terminal
	isTerminal(Board):-
		countSpaces(Board,Number),
		Number = 0.
	
	%counts number of spaces in a board ... to check if it is terminal of not
	countSpaces(brd([]),0):-	!.%empty  ... return 0
	countSpaces(brd([Head|Tail]),NewNumber):-%head is Spaces ... reutrn tail  + 1
		Head = " ",
		countSpaces(brd(Tail),Number),
		NewNumber = Number + 1,	!.
	countSpaces(brd([_|Tail]),Number):-%Head isn't Space ... return tail
		countSpaces(brd(Tail),Number).

	%gets the square's Value or Player
	getSquareValue(cbrd(Board,Square),Player):-
		toNumber(Square,Number),%convert the square to a number
		getElement(Board,Number,Player).%get the Player at this number in the board
	%set a Player in a board		
	setSquareValue(cbrd(Board,Square),Player,NewBoard):-
		toNumber(Square,Number),%convert square to a number
		setElement(Board,Number,Player,NewBoard).%set the Player at this number in the board
		
	toNumber(sqr(Char,Integer),Number):-%converts the Square to a number from the upperLeft Square ( First ) to the LowerRight Square ( Last ) ... from 1 to 42
		NewInteger = 6 - Integer,
		Row = NewInteger * 7,
		charValue(Char,CharValue),
		Number = Row + CharValue.
		
	%gets a player form a certain place in the board	
	getElement(brd([Head|_]),1,ReturnPlayer):-%number is 1 ... reutrn the Player of the head's char
		playerChar(ReturnPlayer,Head),	!.
	getElement(brd([_|Tail]),Number,Player):-%else ... continue
		NewNumber = Number - 1,
		getElement(brd(Tail),NewNumber,Player).
		
	setElement(brd([_|Tail]),1,Player,brd([PlayerChar|Tail])):-%number is 1 .. set the Player's Char at the head
		playerChar(Player,PlayerChar),	!.
	setElement(brd([Head|Tail]),Number,Player,brd([Head|NewTail])):-%else continue
		NewNumber = Number - 1,
		setElement(brd(Tail),NewNumber,Player,brd(NewTail)).

	%next char in english ... to navigate using Squares
	nextChar("a","b").	nextChar("b","c").	nextChar("c","d").	nextChar("d","e").	nextChar("e","f").	nextChar("f","g").
	%english Char value ... from 1 to 7 ... from "a" to "g"
	charValue("a",1).	charValue("b",2).	charValue("c",3).	charValue("d",4).	charValue("e",5).	charValue("f",6).	charValue("g",7).
	%location of the Square ... Up or Down .. maybe Left Or Right .. not yet .. you should be at the middle of the board
	location(sqr(_,6),up):-		!.	location(sqr(_,1),down):-	!.	location(sqr("a",_),left):-	!.	location(sqr("g",_),right):-	!.	location(_,middle).
	
	firstSquare(sqr("a",6)).%just First ... to know where to print board from ... ahhh ... I remember the days of playing at the console windows, what a bad days :):)
	nextSquare(Square,Square):-%gets the next Square .. until the LastSquare appears ( same order as in the List )
		lastSquare(Square),	!.
	nextSquare(sqr("g",Number),sqr("a",NewNumber)):-
		NewNumber = Number - 1,	!.
	nextSquare(sqr(Symbol,Number),sqr(NewSymbol,Number)):-
		nextChar(Symbol,NewSymbol).
	lastSquare(sqr("g",1)).%Last Square ... stop here
	
	%The Adjecent of any Square from the 8 directions around it ... if returns the Same Square as Input ... so there is no element in the desired direction .. ( condition ) ... try to look a the board ( maybe a chess board ) to trace this code
	%increasing the number means I go Up ... decreasing it means I go down.
	%getting the next char ( care from i put the input char in the first or the second attribute in the nextChar Predicate ) is a right move ... previousChar ( put the input char in the second predicate ) a left move 
	%I return the same square ... desired move doesn't exist
	adj(Square,up,Square):-
		location(Square,up),	!.%if up return the same square ... no up
	adj(sqr(Symbol,Integer),up,sqr(Symbol,NewInteger)):-
		NewInteger = Integer + 1,	!.%return the same char with the number increased form sqr("a",1) to sqr("a",2) 
		
	adj(Square,upperRight,Square):-
		location(Square,up),	!.%if up
	adj(Square,upperRight,Square):-
		location(Square,right),	!.%or even right ... return the same 
	adj(sqr(Symbol,Integer),upperRight,sqr(NewSymbol,NewInteger)):-
		nextChar(Symbol,NewSymbol),%get the next char
		NewInteger = Integer + 1,	!.%increase the number
	
	%the rest are same as the first 2 
		
	adj(Square,right,Square):-
		location(Square,right),	!.
	adj(sqr(Symbol,Integer),right,sqr(NewSymbol,Integer)):-
		nextChar(Symbol,NewSymbol),	!.
		
	adj(Square,lowerRight,Square):-
		location(Square,down),	!.
	adj(Square,lowerRight,Square):-
		location(Square,right),	!.
	adj(sqr(Symbol,Integer),lowerRight,sqr(NewSymbol,NewInteger)):-
		nextChar(Symbol,NewSymbol),
		NewInteger = Integer - 1,	!.
		
	adj(Square,down,Square):-
		location(Square,down),	!.
	adj(sqr(Symbol,Integer),down,sqr(Symbol,NewInteger)):-
		NewInteger = Integer - 1,	!.
		
	adj(Square,lowerLeft,Square):-
		location(Square,down),	!.
	adj(Square,lowerLeft,Square):-
		location(Square,left),	!.
	adj(sqr(Symbol,Integer),lowerLeft,sqr(NewSymbol,NewInteger)):-
		nextChar(NewSymbol,Symbol),
		NewInteger = Integer - 1,	!.
		
	adj(Square,left,Square):-
		location(Square,left),	!.
	adj(sqr(Symbol,Integer),left,sqr(NewSymbol,Integer)):-
		nextChar(NewSymbol,Symbol),	!.
		
	adj(Square,upperLeft,Square):-
		location(Square,up),	!.
	adj(Square,upperLeft,Square):-
		location(Square,left),	!.
	adj(sqr(Symbol,Integer),upperLeft,sqr(NewSymbol,NewInteger)):-
		nextChar(NewSymbol,Symbol),
		NewInteger = Integer + 1,	!.
	
	%it maximizes or minimizes accordint to the player ... to not write the code twice in the alphaBeta
	chooseMaxOrMinCBoard(ex,A,ACBoard,B,BCBoard,ReturnI,ReturnCBoard):-
		maxWithCBoard(A,ACBoard,B,BCBoard,ReturnI,ReturnCBoard),	!.
	chooseMaxOrMinCBoard(oh,A,ACBoard,B,BCBoard,ReturnI,ReturnCBoard):-
		minWithCBoard(A,ACBoard,B,BCBoard,ReturnI,ReturnCBoard).
	
	%maximize with CBoard .. to know the maximum Heuristic and the maximum related CBoard I have.
	maxWithCBoard(A,ACBoard,B,_,A,ACBoard):-
		A > B,	!.
	maxWithCBoard(_,_,B,BCBoard,B,BCBoard).
	
	%same as Maximizing
	minWithCBoard(A,ACBoard,B,_,A,ACBoard):-
		A < B,	!.
	minWithCBoard(_,_,B,BCBoard,B,BCBoard).
	
	max(A,B,A):-
		A > B,	!.
	max(_,B,B).
	
	min(A,B,A):-
		A < B,	!.
	min(_,B,B).
	
	%Just to be global
	minusInfinity(-9999999).
	plusInfinity(9999999).
	
	%to return the heuristic in the Player's Value ( for maximizing or minimizing )
	playerValue(ex,1):-	!.
	playerValue(oh,-1).
	
	%another global variable
	emptyBoard(brd([" "," "," "," "," "," "," ",
		        " "," "," "," "," "," "," ",
     		        " "," "," "," "," "," "," ",
		        " "," "," "," "," "," "," ",
		        " "," "," "," "," "," "," ",
		        " "," "," "," "," "," "," "])).
		
	%prints a board on the screen
	printBoard(Board):-
		firstSquare(FirstSquare),
		write("||------------------------------------||"),	nl,
		write("|| 1 | 2  | 3 | 4 | 5 | 6 | 7  ||"),	nl,
		write("||    |     |    |    |    |    |     ||"),	nl,
		write("|| "),
		printBoardAux(Board,FirstSquare).
		
	printBoardAux(brd([]),_):-	!.
	printBoardAux(brd([Head|Tail]),sqr("g",Number)):-
		printElement(Head),	write("|"),	nl,
		write("||    |     |    |    |    |     |    ||"),	nl,
		write("|| "),
		nextSquare(sqr("g",Number),NextSquare),
		printBoardAux(brd(Tail),NextSquare),	!.
	printBoardAux(brd([Head|Tail]),Square):-
		getSquareValue(cbrd(brd([Head|Tail]),Square),Player),
		Player = none,
		printElement(Head),	write(" "),
		nextSquare(Square,NextSquare),
		printBoardAux(brd(Tail),NextSquare),	!.
	printBoardAux(brd([Head|Tail]),Square):-
		printElement(Head),	write(" "),
		nextSquare(Square,NextSquare),
		printBoardAux(brd(Tail),NextSquare).
		
	printElement(" "):-%if element is spaces ... write "L"
		write("L |"),	!.
	printElement(Symbol):-%else ... write the char
		write(Symbol," |").

	%prints a boardList
	printBoardList([]):-	!.
	printBoardList([Head|Tail]):-
		printBoard(Head),
		printBoardList(Tail).
		
	%opponentPlayer ... to not write a condition for every player ( just a general rule )
	opponentPlayer(ex,oh):-	!.
	opponentPlayer(oh,ex):-	!.
	opponentPlayer(none,none):-	!.

	%to not write a condition for every player ( just write the Player's Char ) or get or set  ....
	playerChar(ex,"X"):-	!.
	playerChar(oh,"O"):-	!.
	playerChar(none," "):-	!.

	%just return the values inside it
	extractCBoard(cbrd(Board,Square),Board,Square).
	
	%Chooses between alpha&beta .. to reduce the code ( inside ) the alphaBeta
	chooseValue(ex,Alpha,_,Alpha):-	!.
	chooseValue(oh,_,Beta,Beta).
	
	%take the player and assert the won condition for him
	assertWhoWonTheGame(_):-
		retract(currentSituation(_)),
		fail.
	assertWhoWonTheGame(ex):-
		assert(currentSituation(exWon)),	!.
	assertWhoWonTheGame(oh):-
		assert(currentSituation(ohWon)),	!.

	%if input was 0 ( for first message ) .. so it is the human .. Oh
	handleSelectedUser(0):-
		assert(currentPlayer(oh)),	!.
	handleSelectedUser(1):-
		assert(currentPlayer(ex)),	!.
		
	%retract all from the DB and assert New Clear data
	startNewGame:-
		retractall(_,myDB),
		emptyBoard(EmptyBoard),
		assert(currentCBoard(cbrd(EmptyBoard,sqr("a",1)))),
		assert(currentSituation(playing)),
		assert(inputValidation(notValid)),
		assert(userInput(sqr("a",6))),
		dlg_ListSelect ("Choose who plays first",["Don't Choose The Mortal Human","But choose Me, The Computer ... ur Luv :)"],0,_,Player),
		handleSelectedUser(Player).
		
	%outputs a note for the game situation
  	handleGameEnd:-
  		currentSituation(exWon),
		dlg_note("Halaloya, I Won, Congrats for me, hehehe."),	!.
  	handleGameEnd:-
  		currentSituation(ohWon),
		dlg_note("Congrats. You Won."),	!.
  	handleGameEnd:-
  		currentSituation(draw),
		dlg_note("Ha3, You Can't Beat me Dude !"),	!.

	drawImage(Win):-

		Pict1=pict_load("Connect.bmp"),
		SourceRct1=rct(0,0,640,480),
		DestRct1=rct(0,0,640,480),
		pict_Draw(Win,Pict1,DestRct1,SourceRct1,rop_SrcCopy).

	drawCircle(_," ",_).
	
	drawCircle(Win,"X",X):-
		A=10+(X mod 7)*54,
		B=10+(X div 7)*53,
		NB=B+53,
		NA=A+54,
		Pict1=pict_load("First.bmp"),
		SourceRct1=rct(0,0,55,55),
		DestRct1=rct(A,B,NA,NB),
		pict_Draw(Win,Pict1,DestRct1,SourceRct1,rop_SrcCopy).
	
	drawCircle(Win,"O",X):- 	
		A=10+(X mod 7)*54,
		B=10+trunc(X/7)*53,
		NB=B+53,
		NA=A+54,
		Pict1=pict_load("Second.bmp"),
		SourceRct1=rct(0,0,55,55),
		DestRct1=rct(A,B,NA,NB),
		pict_Draw(Win,Pict1,DestRct1,SourceRct1,rop_SrcCopy).
 
	drawScene(Win,L):-
		drawImage(Win),drawSceneAux(Win,L,0).

	drawSceneAux(_,[],_):-!.
	drawSceneAux(_,_,42):-!.
	drawSceneAux(Win,[H|T],X):-
		drawCircle(Win,H,X),
		NX=X+1,
		drawSceneAux(Win,T,NX).
	
	getColomn(X,0):-
		X<10,!.
	getColomn(X,N):-
		getColomnAux(X,N,0).

	getColomnAux(_,0,7):-!.
	getColomnAux(X,N,A):- 
		X<(10+(A mod 7)*54)+54,!,N=A+1,!.
	getColomnAux(X,N,A):-
		 NA=A+1,NA<7,!,
		 getColomnAux(X,N,NA).

	win_playing_Create(_Parent):-	
		win_Create(win_playing_WinType,win_playing_RCT,win_playing_Title,
		win_playing_Menu,_Parent,win_playing_Flags,win_playing_eh,0).  
		   
%BEGIN Playing, e_Create
	win_playing_eh(_Win,e_Create(_),0):-
	
	startNewGame,%assert the new data
	
%		The Three test cases solved ( the problem was that the end of the tree was the same player as the start ( depth is 3 ) with neglecting last one  .. now ( depth is 2 ) with neglecting last one
	
/*		

%		TestCase_1

	retract(currentCBoard(_)),
	assert(currentCBoard(cbrd(brd([ " "," "," "," "," "," "," ",
		     		        " "," "," "," "," "," "," ",
					" "," "," "," "," "," "," ",
					" "," "," "," "," "," "," ",
					" ","X","X","X"," ","X"," ",
					" ","O","O","X","O","O"," "]),sqr("a",1)))),
	retract(currentPlayer(_)),
	assert(currentPlayer(ex)),
	
*/

/*		

%		TestCase_2

	retract(currentCBoard(_)),
	assert(currentCBoard(cbrd(brd([ " "," "," "," "," "," "," ",
		     		        " "," "," "," "," "," "," ",
					" ","X"," "," "," "," "," ",
					" ","X","X"," "," "," "," ",
					"O","O","O","X"," "," "," ",
					"O","O","X","O"," "," "," "]),sqr("a",1)))),
	retract(currentPlayer(_)),
	assert(currentPlayer(ex)),
	
*/

/*		

%		TestCase_3

	retract(currentCBoard(_)),
	assert(currentCBoard(cbrd(brd([ " "," "," "," "," "," "," ",
		     		        " "," "," "," "," "," "," ",
					" "," "," "," "," "," "," ",
					" "," "," "," "," "," "," ",
					" "," "," ","X"," "," "," ",
					" "," ","O","O"," "," "," "]),sqr("a",1)))),
	retract(currentPlayer(_)),
	assert(currentPlayer(ex)),
	
*/

/*

%		TestCase_4 ( not solved yet ... why it missed the fork in b3 or e6 ... I should but the fork as a terminal node

	retract(currentCBoard(_)),
	assert(currentCBoard(cbrd(brd([ " "," "," ","X"," "," "," ",
		     		        " "," ","O","X","X"," "," ",
					" "," ","X","O","O","X"," ",
					" "," ","O","X","X","O"," ",
					" ","O","X","O","O","O"," ",
					"X","X","O","O","O","X"," "]),sqr("a",1)))),
	retract(currentPlayer(_)),
	assert(currentPlayer(ex)),
	
*/
	
	win_Invalidate(_Win),%then update
	
	
%BEGIN Playing, InitControls, 15:32:16-30.5.2011, Code automatically updated!
%END Playing, InitControls
%BEGIN Playing, ToolbarCreate, 15:32:16-30.5.2011, Code automatically updated!
%END Playing, ToolbarCreate
		!.
%END Playing, e_Create
%MARK Playing, new events
		
%BEGIN Playing, e_KeyDown
	win_playing_eh(_Win,e_KeyDown(k_up,_ShiftCtrlAlt),0):-%if key up pressed ... a prompot of restart appears
  		
		dlg_ListSelect ("Really wanna restart ?",["Yes, Restart","No, Continue"],1,_,RestartOrNot),
		
		RestartOrNot = 0,%if first choice ... restart
		
		startNewGame,%retract all and assert new clear data
		
		win_Invalidate(_Win),	!.%update the game
	win_playing_eh(_Win,e_KeyDown(k_up,_ShiftCtrlAlt),0):-%if not restarting ...
		win_Invalidate(_Win),	!.%just update the game
%END Playing, e_KeyDown	

%BEGIN Playing, e_MouseDown
  	
	win_playing_eh(_Win,e_MouseDown(_,_ShiftCtlAlt,_Button),0):-%Game Ended ( not playing ) ...
	
		not(currentSituation(playing)),
		
		handleGameEnd,%output the game status
	
		startNewGame,%retractall and assert new and clear data
	
		win_Invalidate(_Win),	!.%update
		
	win_playing_eh(_Win,e_MouseDown(_,_ShiftCtlAlt,_Button),0):-%Ex's turn .. do thing ( just a condition to secure the beep down there )
		currentPlayer(ex),	!.%just a stopping condition
		
	win_playing_eh(_Win,e_MouseDown(_,_ShiftCtlAlt,_Button),0):-%Oh's turn .. but the input is valid ( just a condition to secure the beep down there )
		currentPlayer(oh),	inputValidation(valid),	!.%another stopping condition
	
		
	win_playing_eh(_Win,e_MouseDown(pnt(X,_),_ShiftCtlAlt,_Button),0):-%if Human and input validation wasn't valid ( waiting for input ) .. enter set the user input and set the input validation to valid
	
		currentPlayer(oh),
		inputValidation(notValid),
	
		currentCBoard(cbrd(Board,_)),
	
		getColomn(X,Column),%get column ( from 1 to 7 )
		
		charValue(Char,Column),%get the column's char
		Square = sqr(Char,6),%put it in a top row square
		getSquareValue(cbrd(Board,Square),none), %condition ... this square must be empty
	
		retract(inputValidation(_)),
		assert(inputValidation(valid)),%assert inputValidation as valid ... for Oh's play next time.
	
		retract(userInput(_)),
		asserta(userInput(Square)),%assert the user's Input in database
	
		win_Invalidate(_Win),	!.%update the game
		
	win_playing_eh(_Win,e_MouseDown(_,_ShiftCtlAlt,_Button),0):-%means one thing only and one thing only ... I am oh and input is notValid .. but the getSquareValue() return a full column .. so beep for a wrong input column.
		beep(),	!.
%END Playing, e_MouseDown

%BEGIN Playing, idc_playing_2 _CtlInfo
%  win_playing_eh(_Win,e_Control(idc_playing_2,_CtrlType,_CtrlWin,_CtlInfo),0):-!,
%	Answer = dlg_MessageBox( "Title", "Checked", mesbox_iconquestion, mesbox_buttonsokcancel, mesbox_defaultfirst, mesbox_suspendapplication ),!.
%END Playing, idc_playing_2 _CtlInfo

%BEGIN Playing, e_Update
	win_playing_eh(_Win,e_Update(_UpdateRct),0):-%if CurrentPlayer is Human(Oh) and the input Validation isn't Valid ... just draw the board then stop
	
		currentCBoard(cbrd(brd(List),_)),
		drawScene(_Win,List),
	
		currentPlayer(oh),
		inputValidation(notValid),	!.
			
	win_playing_eh(_Win,e_Update(_UpdateRct),0):-%else if The game is running ... go play ... then update again.
		
		currentCBoard(cbrd(brd(List),_)),
		drawScene(_Win,List),
		
		currentSituation(playing),
	
		play,	play,	play,%it won't affect the game .. but it will force the game to Change the currentSituation if needed ... because it handles this play next time, and why 3 not 2 ... I tried 2 and it had some unkown issues for me.
		
		currentCBoard(cbrd(brd(List),_)),
		drawScene(_Win,List),

		/*win_Invalidate(_Win),*/	!.
	win_playing_eh(_Win,e_Update(_UpdateRct),0):-%just else ... draw
		currentCBoard(cbrd(brd(List),_)),
		drawScene(_Win,List),	!.
	
	
%END Playing, e_Update

%BEGIN Playing, e_Size
  win_playing_eh(_Win,e_Size(_Width,_Height),0):-!,
ifdef use_tbar
	toolbar_Resize(_Win),
enddef
                 !.
%END Playing, e_Size

%BEGIN Playing, e_Menu, Parent window 
  win_playing_eh(Win,e_Menu(ID,CAS),0):-!,
	PARENT = win_GetParent(Win),
	win_SendEvent(PARENT,e_Menu(ID,CAS)),
	!.
%END Playing, e_Menu, Parent window

%END_WIN Playing

