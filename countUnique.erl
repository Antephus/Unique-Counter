%% Carrie Morris
-module (countUnique).
-export ([uniqueNums/1, countWords/1]).

%%% Unique Numbers Count %%%
uniqueNums(List)
->
	UniqueNums = getUniqueNums(List),
	io:fwrite("Unique Numers: ~w~n", [UniqueNums]),
	io:fwrite("Unique Numbers Count: ~w ", [countNums(UniqueNums, 0)]).
	
getUniqueNums([])
-> [];
getUniqueNums([Pivot|Tail])
->
	[Pivot] ++ getUniqueNums([Num || Num <- Tail, Num /= Pivot]).
	
countNums([], Count)
-> Count;	
countNums([_H|T], Count)
->
	countNums(T, Count + 1).


	
%%% Unique Word Count %%%
countWords(Filename)
->
	{ok, WordList} = file:read_file(Filename),
	Words = binary:split(WordList, [<<"\ ">>,<<"\n">>,<<"--">>,<<".">>,<<"!">>,<<",">>,<<";">>,<<":">>,<<"?">>,<<"[">>,<<"]">>], [global]),
	UniqueWords = getUniqueWords(Words),
	io:fwrite("Unique Word Count: ~w ", [countWords(UniqueWords, 0)]).
	
getUniqueWords([])
-> [];
getUniqueWords([Pivot|Tail])
->
	[Pivot] ++ getUniqueWords([Word || Word <- Tail, Word /= Pivot]).
	
countWords([], Count)
-> Count;
countWords([_H|T], Count)
->
	%%% Un-comment to see list of seperated words in output
	%io:fwrite("~s~n", [H]),
	countWords(T, Count + 1).