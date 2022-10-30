% ----------------------------------------------------------------------- ФАКТЫ
% Женские особи
female(dgena).
female(ira).
female(masha).
female(dasha).
female(galina).

% Мужские особи
male(kola).
male(vasya).
male(peta).
male(sasha).
male(adam).
male(anatolii).
male(gena).

% Древо потомков
parent(galina, ira).

parent(anatolii, ira).

parent(vasya, peta).
parent(vasya, gena).

parent(masha, peta).

parent(peta, kola).
parent(peta, sasha).
parent(peta, dasha).
parent(peta, adam).

parent(kola, dgena).

parent(ira, sasha).
parent(ira, dasha).
parent(ira, adam).

% ----------------------------------------------------------------------- ПРАВИЛА
% Переменные для управления древом потомков
allChildrenOf(Parent):- parent(Parent,Child), write(Child).
allSonsOf(Parent):- parent(Parent,Child), male(Child), write(Child).
allDaughters(Parent):- parent(Parent,Child), female(Child), write(Child).
allSistersOf(Child):- parent(Mother, Child), parent(Father, Child), allDaughters(Mother); allDaughters(Father). 
allBrothersOf(Child):- parent(Father, Child), allSonsOf(Father).
allBrothersOrSisters(Child):- allBrothersOf(Child); allSistersOf(Child).

areHeSon(Son,Father):- parent(Father,Son), male(Son).
areSheDaughter(Daughter, Father):- parent(Father, Daughter), female(Daughter).
areSheMother(Mother):- parent(Mother, _), female(Mother).
areHeFather(Father):- parent(Father, _), male(Father).


doTheyHaveSomeParent(FirstChild,SecondChild):- parent(Father, FirstChild), parent(Father, SecondChild), parent(Mother, FirstChild), parent(Mother, SecondChild).
theyAreBrothers(FirstChild,SecondChild):- doTheyHaveSomeParent(FirstChild,SecondChild), male(FirstChild), male(SecondChild).
theyAreSisters(FirstChild,SecondChild):-  doTheyHaveSomeParent(FirstChild,SecondChild), female(FirstChild), female(SecondChild).
