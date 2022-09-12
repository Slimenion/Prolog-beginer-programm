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
allGrandFathers(Grandson):- areHeGrandFather(Grandson, GrandFather), write(GrandFather).
allGrandGrandMothers(Grandson):- areSheGrandMother(Grandson, GrandMother), write(GrandMother).
allUncleOf(Nephew):- parent(Father, Nephew), allBrothersOf(Father).
allAuntOf(Nephew):- parent(Father, Nephew), allSistersOf(Father).

areHeSon(Son,Father):- parent(Father,Son), male(Son).
areSheDaughter(Daughter, Father):- parent(Father, Daughter), female(Daughter).
areSheMother(Mother):- parent(Mother, _), female(Mother).
areHeFather(Father):- parent(Father, _), male(Father).
areHeGrandFather(Grandson, GrandFather):- parent(Parent, Grandson), parent(GrandFather, Parent), male(GrandFather).
areSheGrandMother(Grandson, GrandMother):- parent(Parent, Grandson), parent(GrandMother, Parent), female(GrandMother).
areHeGrandsonAndGrandFather(Grandson, GrandFather):- areHeGrandFather(Grandson, GrandFather), male(Grandson).
areHeGranddaughterAndGrandFather(Grandson, GrandFather):- areHeGrandFather(Grandson, GrandFather), female(Grandson).
areHeUncleOf(Uncle, Nephew):- parent(Father, Nephew), theyAreBrothers(Father, Uncle).
areSheAuntOf(Aunt, Nephew):- parent(Father, Nephew), theyAreSisters(Father, Aunt).

doTheyHaveSomeParent(FirstChild,SecondChild):- parent(Father, FirstChild), parent(Father, SecondChild), parent(Mother, FirstChild), parent(Mother, SecondChild).
theyAreBrothers(FirstChild,SecondChild):- doTheyHaveSomeParent(FirstChild,SecondChild), male(FirstChild), male(SecondChild).
theyAreSisters(FirstChild,SecondChild):-  doTheyHaveSomeParent(FirstChild,SecondChild), female(FirstChild), female(SecondChild).
