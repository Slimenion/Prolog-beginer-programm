process_append:- write ("Введите имя файла”), nl,

readln (Filename), nl, write ("Программа готова принять данное для записи”), nl,

openappend (datafile, Filename), writedevice (datafile), readln (Kstr),

concat (Ksrt, "\13\10”, Fstr), readin (Kstr, Fstr), closefile (datafile).