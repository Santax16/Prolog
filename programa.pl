% Aquí va el código.
entrenador(pikachu).

universidad(utn).
universidad(uba).

trabaja(tito, utn, 2000).
trabaja(dani, uba, 2500).

empleo(garrahan, publico).
empleo(google, privado).
empleo(bit, privado).


docenteEn(Persona,Universidad):-
    trabaja(Persona,Universidad,_),
    universidad(Universidad).


esPublico(Trabajo):-universidad(Trabajo).
esPublico(Trabajo):-empleo(Trabajo,publico).

% PARA MAÑANA 

% figurita(FigNro).
% persona(Nombre).

% paquete(Persona,Orden, [Figuritas]).
% canje(Da, Recibe, Figurita).

paquete(andy,1,[2,4]).
paquete(andy,2,[7,6]).
paquete(andy,3,[8,1,3,5]).
paquete(flor,1,[5]).
paquete(flor,2,[5]).
paquete(bobby,1,[3,5]).
paquete(bobby,2,[7]).
paquete(lala,1,[3,7,1]).
paquete(toto,1,[1]).

canje(andy,flor,4).
canje(andy,flor,7).
canje(flor,andy,1).
canje(bobby,flor,2).
canje(flor,bobby,1).
canje(flor,bobby,4).
canje(flor,bobby,6).
canje(lala, pablito,1).
canje(pablito, lala, 5).
canje(toto, pablito, 2).
canje(pablito, toto, 6).


vieneDePaquete(Persona, Figurita):-
    paquete(Persona, _, Figuritas),
    member(Figurita,Figuritas).

tiene(Persona, Figurita):-
    vieneDePaquete(Persona,Figurita).
tiene(Persona, Figurita):-
    canje(_, Persona, Figurita).
% 2    
figuritasRepetidas(Persona, ListaFiguritasRepetidas):-
    findall(Figurita, (
        tiene(Persona, Figurita),
        findall(figuritaRepetida, (
            (paquete(Persona, _, Figuritas), member(Figurita, Figuritas));
            canje(_, Persona, Figurita)
        ), VecesRepetida),
        length(VecesRepetida, Cantidad),
        Cantidad > 1
    ), ListaFiguritasRepetidas).
% 3
colecciona(Persona):-
    tiene(Persona,_).
tieneRepetida(Persona, Figurita):-
    tiene(Persona, Figurita),
    findall(figuritaRepetida, (
        (paquete(Persona, _, Figuritas), member(Figurita, Figuritas));
        canje(_, Persona, Figurita)
    ), VecesRepetida),
    length(VecesRepetida, Cantidad),
    Cantidad > 1.    

esRara(Figurita):-
    not((paquete(_,Orden,Figuritas), Orden =<2, member(Figurita,Figuritas))).

esRara(Figurita):-
    findall(Persona, colecciona(Persona),PersonasQueColeccionan),
    length(PersonasQueColeccionan, CantTotal),
    Mitad is CantTotal // 2 ,
   % esto lo podemos hacer de otra forma si consideramos que juanchi no existe 
    findall(Persona, tiene(Persona,Figurita), PersonasQueLaTienen),
    length(PersonasQueLaTienen, Cantidad),
    Cantidad < Mitad,
    not(tieneRepetida(_, Figurita)).

% 4 base de conocimiento
% popularidad(nombre, nrodepopularidad)
% rareza(nro, tipoRareza)
% imagen(nro, [listadenombres]) o imagen(nro, nombre)








   
    









