--Tema pentru acasa

Use Furnizor_Servicii_Telefonice

Create table Strada
(
	ID_Strada int primary key identity (1,1),
	Strada varchar(20),
)

Create table Raion
(
	ID_Raion int primary key identity (1,1),
	Raion varchar(20),
)

Create table Localitate
(
	ID_Localitate int primary key identity (1,1),
	ID_Raion int foreign key references Raion(ID_Raion),
	Localitatea varchar(20),
)

Create table Adresa
(
	ID_Adresa int primary key identity (1,1),
	ID_Localitate int foreign key references Localitate(ID_Localitate),
	ID_Strada int foreign key references Strada(ID_Strada),
	Scara varchar(5),
	Blocul varchar(5),
	Apartamentul varchar(5),
)

Create table Nr_Telefon
(
	ID_Nr_Telefon int primary key identity (1,1),
	Nr_Telefon varchar(10),
)

Create table Destinatie_Apel
(
	ID_Destinatie_Apel int primary key identity (1,1),
	Destinatie_Apel varchar(20),

)

Create table Apel
(
	ID_Apel int primary key identity (1,1),
	ID_Nr_telefon int foreign key references Nr_Telefon(ID_Nr_Telefon),
	ID_Destinatie_apel int foreign key references Destinatie_Apel(ID_Destinatie_Apel),
	Durata_Apel time,
	Interval_orar_inceput time,
	Interval_orar_sfarsit time,
	Tarif_apel float(24),
)

Create table Abonat
(
	ID_Abonat int primary key identity(1,1),
	Nume varchar(20),
	Prenume varchar(20),
	ID_Adresa int foreign key references Adresa(ID_Adresa),
	ID_Apel int foreign key references Apel(ID_Apel),
)






