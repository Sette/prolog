livro(nome('C completo e total'), autor('Schildt'), pal_chave([linguagemc, programacao, computacao])).
livro(nome('LISP'), autor('Winston, P. ; Horn, B.'), pal_chave([lisp, programacao, list])).
livro(nome('Introdu��o � Programa��o Orientada a Objetos usando JAVA'), autor('Santos, R.'), pal_chave([poo, classes, objetos])).
pertence(X,[X|_]).
pertence(X,[_|Y]) :- pertence(X,Y).
busca_livro(Lista,Nome,Autor):- livro(nome(Nome),autor(Autor),pal_chave(L)),tem_palavra(Lista,L).
tem_palavra([X|_],Lista):- pertence(X,Lista),!.
tem_palavra([X|C],[Y|L]):- tem_palavra(C,L).



