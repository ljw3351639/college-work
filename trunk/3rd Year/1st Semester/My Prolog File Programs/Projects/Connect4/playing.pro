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

	evaluationFunction(cBoard,player,evaluationState,integer).
%	evaluationFunction(CurrentCBoard,Player,EvaluationState,return:Value).%Player matters here !


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

	evaluateBoard(board,player,integer).
	evaluate_Board(board,player,sqrList,integer).
	evaluateBoardAux(board,sqrList,integer).
	
	
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


	
	maxWithCBoard(integer,cBoard,integer,cBoard,integer,cBoard).
%	maxWithBoard(Integer1,cbrd(Board1,Play1),Integer2,cbrd(Board2,Play2),return:MaxInteger,return:cbrd(MaxBoard(alongWithMaxInteger),MaxPlay(alongWithMaxInteger))).

	minWithCBoard(integer,cBoard,integer,cBoard,integer,cBoard).
%	maxWithBoard(Integer1,cbrd(Board1,Play1),Integer2,cbrd(Board2,Play2),return:MinInteger,return:cbrd(MinBoard(alongWithMinInteger),MinPlay(alongWithMinInteger))).


	
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
	handleSelectedUser(integer).
	

	win_playing_eh : EHANDLER  
	drawImage(Window)
	drawScene(Window,sList)
	drawSceneAux(Window,sList,integer)
	drawCircle(Window,symbol,integer)
	getColomn(integer,integer)
	getColomnAux(integer,integer,integer)
	outMsg(integer).
	endGame(integer,integer)
	chooseBeginner(integer)	
  
clauses


	aB(CBoard,ex,NewCBoard):-
		minusInfinity(MinusInfinity),
		plusInfinity(PlusInfinity),
		alphaBeta(CBoard,MinusInfinity,PlusInfinity,ex,4,_,NewCBoard),
		!.
	aB(CBoard,oh,NewCBoard):-
		minusInfinity(MinusInfinity),
		plusInfinity(PlusInfinity),
		alphaBeta(CBoard,MinusInfinity,PlusInfinity,oh,4,_,NewCBoard).
		
	
	
	alphaBeta(CBoard,_,_,ex,0,1000,CBoard):-
		didWin(CBoard,ex),	!.
	alphaBeta(CBoard,_,_,oh,0,-1000,CBoard):-
		didWin(CBoard,oh),	!.
		
	alphaBeta(CBoard,_,_,ex,_,-1000,CBoard):-
		didWin(CBoard,oh),	!.
	alphaBeta(CBoard,_,_,oh,_,1000,CBoard):-
		didWin(CBoard,ex),	!.
		
	alphaBeta(cbrd(Board,LastPlay),_,_,_,_,0,cbrd(Board,LastPlay)):-
		isTerminal(Board),	!.

	alphaBeta(cbrd(Board,LastPlay),_,_,Player,0,Heuristic,cbrd(Board,LastPlay)):-
		evaluateBoard(Board,Player,Heuristic),	!.
		
	alphaBeta(cbrd(Board,_),Alpha,Beta,Player,Depth,Heuristic,NewCBoard):-
		getChildren(Board,Player,[Head|Tail]),
		NewDepth = Depth - 1,
		alphaBetaAux([Head|Tail],Alpha,Beta,Head,Player,NewDepth,Heuristic,NewCBoard),
		write("----------------------------------------------------------------------"),	nl.
	
%			Evaluate Node ( LastPlay )
		
	evaluationFunction(_,ex,win,1000):-	!.%static win value for X
	evaluationFunction(_,oh,win,-1000):-	!.%static win value for O
	evaluationFunction(_,_,draw,0):-	!.%static win value for Draw State
	
	evaluationFunction(cbrd(Board,LastPlay),ex,check,Sum):-%evaluate LastPlay in Board
	
		winningLines(cbrd(Board,LastPlay),ex,WinningLines),
		piecesInLine(cbrd(Board,LastPlay),ex,PiecesInLine),
		
		setSquareValue(cbrd(Board,LastPlay),oh,NewBoard),
		winningLines(cbrd(NewBoard,LastPlay),oh,WinningLines2),
		piecesInLine(cbrd(NewBoard,LastPlay),oh,PiecesInLine2),
		
		EvalEx = WinningLines + PiecesInLine,
		EvalOh = WinningLines2 + PiecesInLine2,
		
%/*
		Sum = EvalEx - EvalOh,
		write(EvalEx," ",EvalOh," ex, Sum = Ex - Oh : ",Sum," ",LastPlay),	nl,
%*/

/*
		Sum = EvalEx + EvalOh,
		write(EvalEx," ",EvalOh," ex, Sum = Ex + Oh : ",Sum," ",LastPlay),	nl,
*/
		!.

	evaluationFunction(cbrd(Board,LastPlay),oh,check,Sum):-%evaluate LastPlay in Board
		winningLines(cbrd(Board,LastPlay),oh,WinningLines),
		piecesInLine(cbrd(Board,LastPlay),oh,PiecesInLine),
		
		setSquareValue(cbrd(Board,LastPlay),ex,NewBoard),
		winningLines(cbrd(NewBoard,LastPlay),ex,WinningLines2),
		piecesInLine(cbrd(NewBoard,LastPlay),ex,PiecesInLine2),
		
		EvalOh = WinningLines + PiecesInLine,
		EvalEx = WinningLines2 + PiecesInLine2,
%/*	
		Sum = EvalOh - EvalEx,
		write(EvalEx," ",EvalOh," oh, Sum = Oh - Ex : ",Sum," ",LastPlay),	nl,
%*/

/*
		Sum = EvalOh + EvalEx,
		write(EvalEx," ",EvalOh," oh, Sum = Oh + Ex : ",Sum," ",LastPlay),	nl,
*/	
		!.
		
%			End of Evaluate Node ( LastPlay )
		
		
	alphaBetaAux([],Alpha,_,NewBoard,ex,_,Alpha,NewBoard):-	!.
	alphaBetaAux([],_,Beta,NewBoard,oh,_,Beta,NewBoard):-	!.
	
	alphaBetaAux(_,Alpha,Beta,NewCBoard,ex,_,Alpha,NewCBoard):-
		Beta <= Alpha,	!.
	alphaBetaAux(_,Alpha,Beta,NewCBoard,oh,_,Beta,NewCBoard):-
		Beta <= Alpha,	!.
	alphaBetaAux([Head|Tail],Alpha,Beta,TmpCBoard,ex,0,NewAlpha,NewCBoard):-
		write("Depth is : 0 Playing as : Ex "),	nl,
		alphaBeta(Head,Alpha,Beta,ex,0,Heuristic,_),
		maxWithCBoard(Heuristic,Head,Alpha,TmpCBoard,NewAlphaAux,NewTmpCBoard),
		alphaBetaAux(Tail,NewAlphaAux,Beta,NewTmpCBoard,ex,0,NewAlpha,NewCBoard),	!.
	alphaBetaAux([Head|Tail],Alpha,Beta,TmpCBoard,ex,Depth,NewAlpha,NewCBoard):-
		write("Depth is : " , Depth, " Playing as : Ex "),	nl,
		alphaBeta(Head,Alpha,Beta,oh,Depth,Heuristic,_),
		maxWithCBoard(Heuristic,Head,Alpha,TmpCBoard,NewAlphaAux,NewTmpCBoard),
		alphaBetaAux(Tail,NewAlphaAux,Beta,NewTmpCBoard,ex,Depth,NewAlpha,NewCBoard),	!.
	alphaBetaAux([Head|Tail],Alpha,Beta,TmpCBoard,oh,0,NewBeta,NewCBoard):-
		write("Depth is : 0 Playing as : Oh "),	nl,
		alphaBeta(Head,Alpha,Beta,oh,0,Heuristic,_),
		minWithCBoard(Heuristic,Head,Beta,TmpCBoard,NewBetaAux,NewTmpCBoard),
		alphaBetaAux(Tail,Alpha,NewBetaAux,NewTmpCBoard,oh,0,NewBeta,NewCBoard),
		!.
	alphaBetaAux([Head|Tail],Alpha,Beta,TmpCBoard,oh,Depth,NewBeta,NewCBoard):-
		write("Depth is : " , Depth, " Playing as : Oh "),	nl,
		alphaBeta(Head,Alpha,Beta,ex,Depth,Heuristic,_),
		minWithCBoard(Heuristic,Head,Beta,TmpCBoard,NewBetaAux,NewTmpCBoard),
		alphaBetaAux(Tail,Alpha,NewBetaAux,NewTmpCBoard,oh,Depth,NewBeta,NewCBoard).
	
%			Evaluate Board


	evaluateBoard(Board,Player,Number):-
		getNextPlays(Board,SqrList),
		evaluate_Board(Board,Player,SqrList,Number).
		
		
	evaluate_Board(Board,Player,SqrList,Number):-
		doesFork(Board,SqrList,Player),
		playerValue(Player,Value),
		Number = Value * 800,	!.
		
	evaluate_Board(Board,ex,SqrList,-800):-
		doesFork(Board,SqrList,oh),	!.
		
	evaluate_Board(Board,oh,SqrList,800):-
		doesFork(Board,SqrList,ex),	!.
		
	evaluate_Board(Board,_,SqrList,Number):-
		evaluateBoardAux(Board,SqrList,Number),	!.
		
	evaluateBoardAux(_,[],0):-	!.
	evaluateBoardAux(Board,[Head|Tail],Number):-
		adj(Head,down,Bottom),
		getSquareValue(cbrd(Board,Bottom),Player),
		Player = ex,
		evaluationFunction(cbrd(Board,Bottom),ex,check,Ex),
		evaluateBoardAux(Board,Tail,Return),
		Number = Return + Ex,	!.
	evaluateBoardAux(Board,[Head|Tail],Number):-
		adj(Head,down,Bottom),
		getSquareValue(cbrd(Board,Bottom),Player),
		Player = oh,
		evaluationFunction(cbrd(Board,Bottom),oh,check,Oh),
		evaluateBoardAux(Board,Tail,Return),
		Number = Return + Oh,	!.
	evaluateBoardAux(Board,[Head|Tail],Number):-
		adj(Head,down,Bottom),
		getSquareValue(cbrd(Board,Bottom),Player),
		Player = none,
		evaluateBoardAux(Board,Tail,Number),	!.
	
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
		
	
	doesHorizontalFork(Board,SqrList,Player):-
		doesHorizontalForkAux(Board,SqrList,Player,NumberOfWins),
		NumberOfWins > 1.
		
	doesHorizontalForkAux(_,[],_,0):-	!.
	doesHorizontalForkAux(Board,[Head|Tail],Player,Number):-
		
		setSquareValue(cbrd(Board,Head),Player,NewBoard),
		didWin(cbrd(NewBoard,Head),Player),
		doesHorizontalForkAux(Board,Tail,Player,Return),
		Number = Return + 1,	!.
	doesHorizontalForkAux(Board,[_|Tail],Player,Number):-
		doesHorizontalForkAux(Board,Tail,Player,Number).

	doesVerticalFork(Board,[Head|Tail],Player):-%An UpperRow Element .. continue
		Head = sqr(_,6),
		doesVerticalFork(Board,Tail,Player),	!.
	doesVerticalFork(Board,[Head|_],Player):-%A Vertical Fork
	
		setSquareValue(cbrd(Board,Head),Player,Lower),
		didWin(cbrd(Lower,Head),Player),
		
		adj(Head,up,SquareAbove),
		
		setSquareValue(cbrd(Board,SquareAbove),Player,Upper),
		didWin(cbrd(Upper,SquareAbove),Player),	!.
	doesVerticalFork(Board,[_|Tail],Player):-%nothing ?! ... continue
		doesVerticalFork(Board,Tail,Player).
		
	doesFork(Board,SqrList,Player):-
		doesHorizontalFork(Board,SqrList,Player),	!.
	doesFork(Board,SqrList,Player):-
		doesVerticalFork(Board,SqrList,Player).	

%			End of Evaluate Board

		
	countPossibilities(_,_,_,0,0):-	!.%Depth is 0
%			ex
	countPossibilities(cbrd(Board,LastPlay),ex,_,_,0):-%Square is oh
		getSquareValue(cbrd(Board,LastPlay),oh),	!.
	countPossibilities(cbrd(Board,LastPlay),oh,_,_,0):-%Square is ex
		getSquareValue(cbrd(Board,LastPlay),ex),	!.
	countPossibilities(cbrd(Board,Square),Player,Location,Depth,Number):-%Same Player and go check next Square
		adj(Square,Location,NextSquare),	not(Square = NextSquare),
		NewDepth = Depth - 1,
		countPossibilities(cbrd(Board,NextSquare),Player,Location,NewDepth,ReturnNumber),
		Number = ReturnNumber + 1,	!.
	countPossibilities(_,_,_,_,1).%Same Player but next Square isn't
	
	winChances(Number,0):-
		Number < 4,	!.
	winChances(Number,Return):-%ex : for a 5 consecutive nodes you can win in 2 ways.
		Return = Number - 4  + 1.
		
	winningLines(CBoard,Player,Number):-
		winningLinesAux(CBoard,Player,vertical,Vertical),
		winningLinesAux(CBoard,Player,horizontal,Horizontal),
		winningLinesAux(CBoard,Player,diagonalRight,DiagonalRight),
		winningLinesAux(CBoard,Player,diagonalLeft,DiagonalLeft),
%		write(Vertical, " ",Horizontal," ",DiagonalRight," ",DiagonalLeft),nl,
		playerValue(Player,Value),
		Number = Value * (Vertical + Horizontal + DiagonalRight + DiagonalLeft),	!.
				
	winningLinesAux(CBoard,Player,vertical,Number):-
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
		
		
	countPiecesInLine(_,_,_,0,_,0):-	!.%Depth is 0
	countPiecesInLine(cbrd(Board,Square),Player,Location,Depth,Spaces,Number):-%Space
		getSquareValue(cbrd(Board,Square),none),
		adj(Square,Location,NextSquare),
		NewSpaces = Spaces + 1,
		NewDepth = Depth - 1,
		countPiecesInLine(cbrd(Board,NextSquare),Player,Location,NewDepth,NewSpaces,Number),	!.
	countPiecesInLine(CBoard,Player,_,_,_,0):-%Not Space & Not Me !
		getSquareValue(CBoard,ReturnPlayer),
		not(Player = ReturnPlayer),	!.
	%			ex
	countPiecesInLine(cbrd(Board,Square),ex,Location,Depth,Spaces,Number):-%Same Player and go check next Square
		adj(Square,Location,NextSquare),	not(Square = NextSquare),
		NewDepth = Depth - 1,
		countPiecesInLine(cbrd(Board,NextSquare),ex,Location,NewDepth,0,ReturnNumber),
		Number = ReturnNumber + Spaces + 1,	!.
	countPiecesInLine(_,ex,_,_,Spaces,Number):-
		Number = Spaces + 1,	!.%Same Player but next Square isn't
%			oh
	countPiecesInLine(cbrd(Board,Square),oh,Location,Depth,Spaces,Number):-%Same Player and go check next Square
		adj(Square,Location,NextSquare),	not(Square = NextSquare),
		NewDepth = Depth - 1,
		countPiecesInLine(cbrd(Board,NextSquare),oh,Location,NewDepth,0,ReturnNumber),
		Number = ReturnNumber + Spaces + 1,	!.
	countPiecesInLine(_,oh,_,_,Spaces,Number):-
		Number = Spaces + 1.%Same Player but next Square isn't
	
	piecesInLineAux(CBoard,Player,vertical,Number):-
		countPiecesInLine(CBoard,Player,up,4,0,Up),
		countPiecesInLine(CBoard,Player,down,4,0,Down),
%		write(Up," ",Down),	nl,
		countPieces(Up,Down,Number),	!.
	piecesInLineAux(CBoard,Player,horizontal,Number):-
		countPiecesInLine(CBoard,Player,right,4,0,Right),
		countPiecesInLine(CBoard,Player,left,4,0,Left),
%		write(Right," ",Left),	nl,
		countPieces(Right,Left,Number),	!.
	piecesInLineAux(CBoard,Player,diagonalRight,Number):-
		countPiecesInLine(CBoard,Player,upperRight,4,0,UpperRight),
		countPiecesInLine(CBoard,Player,lowerLeft,4,0,LowerLeft),
%		write(UpperRight," ",LowerLeft),	nl,
		countPieces(UpperRight,LowerLeft,Number),	!.
	piecesInLineAux(CBoard,Player,diagonalLeft,Number):-
		countPiecesInLine(CBoard,Player,upperLeft,4,0,UpperLeft),
		countPiecesInLine(CBoard,Player,lowerRight,4,0,LowerRight),
%		write(UpperLeft," ",LowerRight),	nl,
		countPieces(UpperLeft,LowerRight,Number).
	
	countPieces(0,OppositeDir,OppositeDir):-
		OppositeDir > 1,	!.
	countPieces(Dir,0,Dir):-
		Dir > 1,	!.
	countPieces(Dir,OppositeDir,Sum):-
		Sum = Dir + OppositeDir - 1,
		Sum > 1,	!.
	countPieces(_,_,0).
	
	piecesInLine(CBoard,Player,Number):-
		piecesInLineAux(CBoard,Player,vertical,Vertical),
		piecesInLineAux(CBoard,Player,horizontal,Horizontal),
		piecesInLineAux(CBoard,Player,diagonalRight,DiagonalRight),
		piecesInLineAux(CBoard,Player,diagonalLeft,DiagonalLeft),
		playerValue(Player,Value),
		Number = Value * (Vertical + Horizontal + DiagonalRight + DiagonalLeft),	!.
		
	didWin(CBoard,Player):-
		checkNodeWin(CBoard,Player,vertical),	!.
	didWin(CBoard,Player):-
		checkNodeWin(CBoard,Player,horizontal),	!.
	didWin(CBoard,Player):-
		checkNodeWin(CBoard,Player,diagonalRight),	!.
	didWin(CBoard,Player):-
		checkNodeWin(CBoard,Player,diagonalLeft),	!.
		
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
	countSymbols(cbrd(Board,Square),Player,_,_,0):-%Square is Diff Player
		getSquareValue(cbrd(Board,Square),ReturnPlayer),
		not(ReturnPlayer = Player),	!.
	countSymbols(cbrd(Board,Square),Player,Location,Depth,Number):-%Same Player and go check next Square
		adj(Square,Location,NextSquare),	not(Square = NextSquare),
		NewDepth = Depth - 1,
		countSymbols(cbrd(Board,NextSquare),Player,Location,NewDepth,ReturnNumber),
		Number = ReturnNumber + 1,	!.
	countSymbols(_,_,_,_,1).%Same Player but Next Square isn't
	
		
	setChoice(cbrd(Board,Square),Player,cbrd(NewBoard,Square)):-
		location(Square,down),
		setSquareValue(cbrd(Board,Square),Player,NewBoard),	!.
	setChoice(cbrd(Board,Square),Player,NewCBoard):-
		adj(Square,down,SouthSquare),
		getSquareValue(cbrd(Board,SouthSquare),ReturnPlayer),	ReturnPlayer = none,
		setChoice(cbrd(Board,SouthSquare),Player,NewCBoard),	!.
	setChoice(cbrd(Board,Square),Player,cbrd(NewBoard,Square)):-
		setSquareValue(cbrd(Board,Square),Player,NewBoard).	

	getChildren(Board,Player,CBList):-
		getChildrenAux(Board,Player,1,CBList).
	getChildrenaux(_,_,Input,[]):-
		Input > 7,	!.
	getChildrenAux(Board,Player,Input,[NewHead|Tail]):-
		charValue(Char,Input),	Square = sqr(Char,6),
		getSquareValue(cbrd(Board,Square),ReturnPlayer),	ReturnPlayer = none,
		setChoice(cbrd(Board,Square),Player,NewHead),
		NewInput = Input + 1,
		getChildrenAux(Board,Player,NewInput,Tail),	!.
	getChildrenAux(Board,Player,Input,CBoard):-
		NewInput = Input + 1,
		getChildrenAux(Board,Player,NewInput,CBoard).
	
	countSpaces(brd([]),0):-	!.
	countSpaces(brd([Head|Tail]),NewNumber):-
		Head = " ",
		countSpaces(brd(Tail),Number),
		NewNumber = Number + 1,	!.
	countSpaces(brd([Head|Tail]),Number):-
		Head <> " ",
		countSpaces(brd(Tail),Number).
	isTerminal(Board):-
		countSpaces(Board,Number),
		Number = 0.

	getSquareValue(cbrd(Board,Square),Player):-
		toNumber(Square,Number),
		getElement(Board,Number,Player).
	setSquareValue(cbrd(Board,Square),Player,NewBoard):-
		toNumber(Square,Number),
		setElement(Board,Number,Player,NewBoard).
		
	toNumber(sqr(Char,Integer),Number):-
		NewInteger = 6 - Integer,
		Row = NewInteger * 7,
		charValue(Char,CharValue),
		Number = Row + CharValue.	
		
	getElement(brd([Head|_]),1,ex):-
		Head = "X",	!.
	getElement(brd([Head|_]),1,oh):-
		Head = "O",	!.
	getElement(brd([Head|_]),1,none):-
		Head = " ",	!.
	getElement(brd([_|Tail]),Number,Player):-
		NewNumber = Number - 1,
		getElement(brd(Tail),NewNumber,Player).
	setElement(brd([_|Tail]),1,ex,brd(["X"|Tail])):-	!.
	setElement(brd([_|Tail]),1,oh,brd(["O"|Tail])):-	!.
	setElement(brd([_|Tail]),1,none,brd([" "|Tail])):-	!.
	setElement(brd([Head|Tail]),Number,Player,brd([Head|NewTail])):-
		NewNumber = Number - 1,
		setElement(brd(Tail),NewNumber,Player,brd(NewTail)).

	nextChar("a","b").	nextChar("b","c").	nextChar("c","d").	nextChar("d","e").	nextChar("e","f").	nextChar("f","g").
	charValue("a",1).	charValue("b",2).	charValue("c",3).	charValue("d",4).	charValue("e",5).	charValue("f",6).	charValue("g",7).
	location(sqr(_,6),up):-		!.	location(sqr(_,1),down):-	!.	location(sqr("a",_),left):-	!.	location(sqr("g",_),right):-	!.	location(_,middle).
	
	firstSquare(sqr("a",6)).
	nextSquare(Square,Square):-
		lastSquare(Square),	!.
	nextSquare(sqr("g",Number),sqr("a",NewNumber)):-
		NewNumber = Number - 1,	!.
	nextSquare(sqr(Symbol,Number),sqr(NewSymbol,Number)):-
		nextChar(Symbol,NewSymbol).
	lastSquare(sqr("g",1)).
	
	adj(Square,up,Square):-
		location(Square,up),	!.
	adj(sqr(Symbol,Integer),up,sqr(Symbol,NewInteger)):-
		NewInteger = Integer + 1,	!.
		
	adj(Square,upperRight,Square):-
		location(Square,up),	!.
	adj(Square,upperRight,Square):-
		location(Square,right),	!.
	adj(sqr(Symbol,Integer),upperRight,sqr(NewSymbol,NewInteger)):-
		nextChar(Symbol,NewSymbol),
		NewInteger = Integer + 1,	!.
		
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
		
	
	maxWithCBoard(A,ACBoard,B,_,A,ACBoard):-
		A > B,	!.
	maxWithCBoard(_,_,B,BCBoard,B,BCBoard).
	
	minWithCBoard(A,ACBoard,B,_,A,ACBoard):-
		A < B,	!.
	minWithCBoard(_,_,B,BCBoard,B,BCBoard).
	

	minusInfinity(-9999999).
	plusInfinity(9999999).
	
	
	playerValue(ex,1):-	!.
	playerValue(oh,-1).
	
	emptyBoard(brd([" "," "," "," "," "," "," ",
		        " "," "," "," "," "," "," ",
     		        " "," "," "," "," "," "," ",
		        " "," "," "," "," "," "," ",
		        " "," "," "," "," "," "," ",
		        " "," "," "," "," "," "," "])).
	
	printElement(" "):-
		write("L |"),	!.
	printElement(Symbol):-
		write(Symbol," |").
		printBoardAux(brd([]),_):-	!.
	printBoardAux(brd([Head|Tail]),sqr("g",Number)):-
		printElement(Head),	write("|"),	nl,
%		write("||------------------------------------||"),	nl,
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
	printBoard(Board):-
		firstSquare(FirstSquare),
		write("||------------------------------------||"),	nl,
		write("|| 1 | 2  | 3 | 4 | 5 | 6 | 7  ||"),	nl,
		write("||    |     |    |    |    |    |     ||"),	nl,
		write("|| "),
		printBoardAux(Board,FirstSquare).
	
	printBoardList([]):-	!.
	printBoardList([Head|Tail]):-
		printBoard(Head),
		printBoardList(Tail).

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
drawSceneAux(Win,[H|T],X):-drawCircle(Win,H,X),NX=X+1,drawSceneAux(Win,T,NX).

getColomn(X,0):-X<10,!.
getColomn(X,N):-getColomnAux(X,N,0).

getColomnAux(_,0,7):-!.
getColomnAux(X,N,A):- X<(10+(A mod 7)*54)+54,!,N=A+1,/*outMsg(N),*/!.
getColomnAux(X,N,A):- NA=A+1,NA<7,!, getColomnAux(X,N,NA).


outMsg(0):-
	dlg_MessageBox( "Title", "0", mesbox_iconquestion, mesbox_buttonsokcancel, mesbox_defaultfirst, mesbox_suspendapplication ).
outMsg(1):-
	dlg_MessageBox( "Title", "1", mesbox_iconquestion, mesbox_buttonsokcancel, mesbox_defaultfirst, mesbox_suspendapplication ).
outMsg(2):-
	dlg_MessageBox( "Title", "2", mesbox_iconquestion, mesbox_buttonsokcancel, mesbox_defaultfirst, mesbox_suspendapplication ).
outMsg(3):-
	dlg_MessageBox( "Title", "3", mesbox_iconquestion, mesbox_buttonsokcancel, mesbox_defaultfirst, mesbox_suspendapplication ).
outMsg(4):-
	dlg_MessageBox( "Title", "4", mesbox_iconquestion, mesbox_buttonsokcancel, mesbox_defaultfirst, mesbox_suspendapplication ).
outMsg(5):-
	 dlg_MessageBox( "Title", "5", mesbox_iconquestion, mesbox_buttonsokcancel, mesbox_defaultfirst, mesbox_suspendapplication ).
outMsg(6):-
	 dlg_MessageBox( "Title", "6", mesbox_iconquestion, mesbox_buttonsokcancel, mesbox_defaultfirst, mesbox_suspendapplication ).
outMsg(7):-
	 dlg_MessageBox( "Title", "7", mesbox_iconquestion, mesbox_buttonsokcancel, mesbox_defaultfirst, mesbox_suspendapplication ).

%endGame(0,ANSWER):-
%	ANSWER = dlg_Ask("GameOver","YOU LOSE, play again ??"/*Prompt*/,["&OK","&Cancel"]/*ButtonTitlesList*/).
%
%endGame(1,ANSWER):-
%	ANSWER = dlg_Ask("Congratulations","YOU WIN, play again ??"/*Prompt*/,["&OK","&Cancel"]/*ButtonTitlesList*/).
	
endGame(0,ANSWER):-
	ANSWER = dlg_MessageBox("GameOver","YOU LOSE,  play again ??", mesbox_iconquestion, mesbox_buttonsokcancel, mesbox_defaultfirst, mesbox_suspendapplication ).

endGame(1,ANSWER):-
	ANSWER = dlg_MessageBox("Congratulations","YOU WIN,  play again ??", mesbox_iconquestion, mesbox_buttonsokcancel, mesbox_defaultfirst, mesbox_suspendapplication ).

chooseBeginner(ANSWER):-
	ANSWER = dlg_MessageBox("Hello","Play First ??", mesbox_iconquestion, mesbox_buttonsokcancel, mesbox_defaultfirst, mesbox_suspendapplication ).


%userPlay(0,0):-!.
%userPlay(CNum,X):- FarX=X+(7*5), userPlayAux( not implemented yet )
	
	
	
  win_playing_Create(_Parent):-
	win_Create(win_playing_WinType,win_playing_RCT,win_playing_Title,
		   win_playing_Menu,_Parent,win_playing_Flags,win_playing_eh,0).
		   
	play:-
		currentSituation(Situation),
		not(Situation = playing),
		!.
	play:-
		currentCBoard(CBoard),
		currentPlayer(ex),
		didWin(CBoard,oh),
		retract(currentSituation(_)),
		assert(currentSituation(ohWins)),
		write("O Wins"),	nl,	!.
	play:-
		currentCBoard(CBoard),
		currentPlayer(oh),
		didWin(CBoard,ex),
		retract(currentSituation(_)),
		assert(currentSituation(exWins)),
		write("X Wins"),	nl,	!.
	play:-
		currentCBoard(cbrd(Board,_)),
		isTerminal(Board),
		retract(currentSituation(_)),
		assert(currentSituation(draw)),
		write("Draw"),	nl,	!.
	play:-
		currentCBoard(CBoard),
		currentPlayer(ex),
		
		aB(CBoard,ex,NewCBoard),
		
		retract(currentCBoard(_)),
		assert(currentCBoard(NewCBoard)),
		
		retract(currentPlayer(_)),
		assert(currentPlayer(oh)),	!.
/*
	play:-
		currentCBoard(cbrd(Board,LastPlay)),
		currentPlayer(oh),
		
		aB(cbrd(Board,LastPlay),oh,NewCBoard),
		
		retract(currentCBoard(_)),
		assert(currentCBoard(NewCBoard)),
		
		retract(currentPlayer(_)),
		assert(currentPlayer(ex)),	!.
*/
%/*
	play:-
		currentCBoard(cbrd(Board,_)),
		currentPlayer(oh),
		
		inputValidation(valid),
		
		userInput(Square),
		setChoice(cbrd(Board,Square),oh,NewCBoard),
		
		retract(inputValidation(_)),
		assert(inputValidation(notValid)),
		
		retract(currentCBoard(_)),
		assert(currentCBoard(NewCBoard)),
		
		retract(currentPlayer(_)),
		assert(currentPlayer(ex)),	!.
%*/
	
	play.



	handleSelectedUser(0):-
		retract(currentPlayer(_)),
		asserta(currentPlayer(oh)),
		!.
	handleSelectedUser(_):-
		retract(currentPlayer(_)),
		asserta(currentPlayer(ex)),
		!.

%BEGIN Playing, e_Create
  win_playing_eh(_Win,e_Create(_),0):-
  
%/*
  	assert(currentCBoard(cbrd(brd([" "," "," "," "," "," "," ",
		                       " "," "," "," "," "," "," ",
     		                       " "," "," "," "," "," "," ",
		                       " "," "," "," "," "," "," ",
		                       " "," "," "," "," "," "," ",
		                       " "," "," "," "," "," "," "]),sqr("a",1)))),
%*/
/*
  	assert(currentCBoard(cbrd(brd([" "," "," "," "," "," "," ",
		                       " "," "," "," "," "," "," ",
     		                       " "," "," "," "," "," "," ",
		                       " "," "," ","O","O"," "," ",
		                       " "," "," ","X","X","X"," ",
		                       " "," "," ","O","O","X"," "]),sqr("a",1)))),
*/
	assert(currentSituation(playing)),
	assert(inputValidation(notValid)),
	assert(userInput(sqr("d",6))),
  
	SLISTStringList = ["Play first","Play second"],
	dlg_ListSelect ("Choose who plays first",SLISTStringList,0,
	_, SelectedIndex),
	assert(currentPlayer(oh)),
	
	handleSelectedUser(SelectedIndex),
	
%BEGIN Playing, InitControls, 15:32:16-30.5.2011, Code automatically updated!
%END Playing, InitControls
%BEGIN Playing, ToolbarCreate, 15:32:16-30.5.2011, Code automatically updated!
%END Playing, ToolbarCreate
		!.
%END Playing, e_Create
%MARK Playing, new events

%BEGIN Playing, e_KeyDown
  win_playing_eh(_Win,e_KeyDown('r',_),0):-!,
  	
  	write("Shit"),	nl,
  	retract(currentCBoard(_)),
	asserta(currentCBoard(cbrd(brd([" "," "," "," "," "," "," ",
		                       " "," "," "," "," "," "," ",
     		                       " "," "," "," "," "," "," ",
		                       " "," "," "," "," "," "," ",
		                       " "," "," "," "," "," "," ",
		                       " "," "," "," "," "," "," "]),sqr("a",1)))),
	
	dlg_ListSelect ("Choose who plays first",["Play first","Play second"],0,
	_, Player),
	
	retract(currentSituation(_)),
	retract(inputValidation(_)),
	
	asserta(currentSituation(playing)),
	asserta(inputValidation(notValid)),
	
	handleSelectedUser(Player),
	
	!.
%END Playing, e_KeyDown

%BEGIN Playing, e_MouseDown
  %win_playing_eh(_Win,e_MouseDown(_PNT,_ShiftCtlAlt,_Button),0):-!,
win_playing_eh(_Win,e_MouseDown(_,_ShiftCtlAlt,_Button),0):-
	
	not(currentSituation(playing)),
	
	!,
	retract(currentCBoard(_)),
	asserta(currentCBoard(cbrd(brd([" "," "," "," "," "," "," ",
		                       " "," "," "," "," "," "," ",
     		                       " "," "," "," "," "," "," ",
		                       " "," "," "," "," "," "," ",
		                       " "," "," "," "," "," "," ",
		                       " "," "," "," "," "," "," "]),sqr("a",1)))),
  
	
	dlg_ListSelect ("Choose who plays first",["Play first","Play second"],0,
	_, Player),
	
	retract(currentSituation(_)),
	retract(inputValidation(_)),
	
	asserta(currentSituation(playing)),
	asserta(inputValidation(notValid)),
	
	handleSelectedUser(Player),
	
	win_Invalidate(_Win),
	
	!.
win_playing_eh(_Win,e_MouseDown(pnt(X,_),_ShiftCtlAlt,_Button),0):-
	
	currentPlayer(oh),
	inputValidation(notValid),
	
	currentCBoard(cbrd(Board,_)),
	
	getColomn(X,CNUM),
	charValue(Char,CNUM),
	Square = sqr(Char,6),
	getSquareValue(cbrd(Board,Square),none),
	
	retract(inputValidation(_)),
	assert(inputValidation(valid)),
	
	retract(userInput(_)),
	asserta(userInput(Square)),
	
	win_Invalidate(_Win),
	
	!.
%win_playing_eh(_Win,e_MouseDown(_,_ShiftCtlAlt,_Button),0):-
%	!.
%END Playing, e_MouseDown

%BEGIN Playing, idc_playing_2 _CtlInfo
%  win_playing_eh(_Win,e_Control(idc_playing_2,_CtrlType,_CtrlWin,_CtlInfo),0):-!,
%	Answer = dlg_MessageBox( "Title", "Checked", mesbox_iconquestion, mesbox_buttonsokcancel, mesbox_defaultfirst, mesbox_suspendapplication ),!.
%END Playing, idc_playing_2 _CtlInfo

%BEGIN Playing, e_Update
/*
	win_playing_eh(_Win,e_Update(_UpdateRct),0):-
	
		currentCBoard(cbrd(brd(List),_)),
		drawScene(_Win,List),
		sleep(5),
		
		currentPlayer(oh),
		inputValidation(notValid),
		
		win_Invalidate(_Win),
		!.
*/
	win_playing_eh(_Win,e_Update(_UpdateRct),0):-
		currentPlayer(oh),
		inputValidation(notValid),
		currentCBoard(cbrd(brd(List),_)),
		drawScene(_Win,List),	!.
			
	win_playing_eh(_Win,e_Update(_UpdateRct),0):-
		
		currentCBoard(cbrd(brd(List),_)),
		drawScene(_Win,List),
	
		play,
		
		currentSituation(playing),
	
		win_Invalidate(_Win),
		
		!.
	
	
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

