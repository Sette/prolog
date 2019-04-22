shift_esq([],[]):-!.
shift_esq([X],[X]):-!.
shift_esq([X|Y],L):-add_ultimo(X,Y,L).
add_ultimo(X,[],[X]):-!.
add_ultimo(X,[E|Y],[E|Z]):-add_ultimo(X,Y,Z).

add_primeiro(X,L,[X|L]):-!.

exclui_ultimo([E],[],E):-!.
exclui_ultimo([X|Y],[X|C],E):- exclui_ultimo(Y,C,E).

shift([X],[X]):-!.
shift([],[]):-!.
shift(X,L):- exclui_ultimo(X,L1,E), add_primeiro(E,L1,L).

shift_n_es(0,X,X):-!.
shift_n_es(N,X,L):- shift_esq(X,L1), N1 is N-1, shift_n_es(N1,L1,L).

max2(X,Y,X):- X>=Y,!.
max2(_,Y,Y).
max_list2([X],X):-!.
max_list2([],_):-!.
max_list2([X|Y],Max) :- max_list2(Y,Max1),max2(X,Max1,Max).

between_2(X,Y,_):- X>Y,!.
between_2(X,X,[X]):-!.
between_2(X,Y,[X|T]):- X1 is X+1, between_2(X1,Y,T).

split_n([],[],[]):-!.
split_n([X|Y],[X|P],N):- X>=0, split_n(Y,P,N),!.
split_n([X|Y],P,[X|N]):- split_n(Y,P,N),!.

split_n2([],[],[]).
split_n2([X|Y],[X|P],N):- X>=0, split_n(Y,P,N).
split_n2([X|Y],P,[X|N]):- X<0, split_n(Y,P,N),!.

inter2([ ], _, [ ]):-!.
inter2([X|Y], Z, [X|W]) :- member(X,Z),inter2(Y,Z,W), not(member(X,W)),!.
inter2([_|Y], Z, W):-inter2(Y,Z,W).

sub(_,_,[],[]):-!.
sub(E1,E2,[E1],[E2]):-!.
sub(E1,E2,[E1|Y],[E2|C]):- sub(E1,E2,Y,C),!.
sub(E1,E2,[Z|_],[C]):- is_list(Z), sub(E1,E2,Z,C).
sub(E1,E2,[Z|Y],[Z|C]):- sub(E1,E2,Y,C).

life(ingles,vermelha,_,_,_,_).
life(espanhol,_,cao,_,_,_).
life(_,verde,_,cafe,_,N):- life(_,marfim,_,_,_,K), N == K+1.
life(ucraniano,_,cha,_,_,_).
life(_,_,caracois,_,old_gold,_).
life(_,amarela,_,_,kools,N):-  life(_,_,cavalo,_,_,K), (N==K+1;N==K-1).
life(noruegues,_,_,_,_,1):- life(_,azul,_,_,_,2).
life(_,_,_,_,chesterfields,N) :- life(_,_,raposa,_,_,K), (N==K+1;N==K-1).
life(_,_,_,laranja,lucky_strike,_).
life(japones,_,_,_,parliaments,_).
life(_,_,_,agua,_,_).
life(_,_,zebra,_,_,_).




