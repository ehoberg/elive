%% ---
%% loops and prints
%%---
-module(one).

-export([start/0]).

start() -> 
	     spawn(fun() -> counter(0) end).

cancel(Pid) -> Pid ! cancel.

counter(10) -> void; 
counter(N) -> 
	io:format("hi ~p ~n", [N]),
    receive    
		cancel->
			void;
		anything ->
			io:format("stopping~n"),
			void
		after 1500 ->
			counter(N+1)
    end.

