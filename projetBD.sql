/*
*@author = Mustapha Nezzari 
*@author = Erwan Delbrouque--Prial
*
*Creation des tables (PREMIERE PARTIE)
*/

/*
*Table Eleve
*/
CREATE TABLE Eleve(
  e_id NUMBER(6) CONSTRAINT Eleve_id_PK primary key,
  e_nom VARCHAR2(64) NOT NULL,
  e_prenom VARCHAR2(64)NOT NULL,
  e_date_naiss DATE NOT NULL,
  e_tel VARCHAR2(10) NOT NULL,
  e_date_dossier DATE NOT NULL,
  e_date_code DATE DEFAULT NULL
);

/*
* Table trajet
*/
CREATE TABLE Trajet(
  t_id NUMBER(6) CONSTRAINT Trajet_id_PK primary key,
  t_date DATE,
  t_nb_km NUMBER(3,1),
  t_type VARCHAR2(20) CONSTRAINT check_type CHECK(t_type IN('route','ville','autoroute')),
  e_id NUMBER(6) CONSTRAINT e_id_Trajet_FK references Eleve
);

