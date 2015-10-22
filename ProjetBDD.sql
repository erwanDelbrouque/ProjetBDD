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
  e_tel VARCHAR2(10),
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
  e_id NUMBER(6) CONSTRAINT e_id_Trajet_FK REFERENCES Eleve NOT NULL
);


/* Table Inscription
 * 
 * Vérification : On ne peut pas insérer de ligne tant que e_date_code est null
 */
CREATE TABLE Inscription (
  i_id NUMBER(3) CONSTRAINT INSCRIPTION_PK PRIMARY KEY,
  i_date_inscr DATE NOT NULL,
  i_type VARCHAR2(20) CONSTRAINT type_check CHECK(i_type IN('classique','supervise','anticipe')),
  i_date_examen DATE DEFAULT NULL,
  i_resultat NUMBER(2) DEFAULT NULL,
  i_num NUMBER(2),
  CONSTRAINT resultat_check CHECK(i_resultat IN (0,1)), /* 0 : Ne l'a pas eu | 1 : l'a eu | NULL : Pas encore passé */
  l_eleve NUMBER(6) CONSTRAINT Insc_Elev_fk REFERENCES Eleve NOT NULL
  

);


/* 
 *Table Moniteur
 */
CREATE TABLE Moniteur (
  m_id NUMBER(3) CONSTRAINT MONITEUR_PK PRIMARY KEY,
  m_nom VARCHAR2(20) NOT NULL,
  m_prenom VARCHAR2(20) NOT NULL
  
);


/* 
 * Table Lecon
 */
CREATE TABLE Lecon (
  l_id NUMBER(3) CONSTRAINT LECON_PK PRIMARY KEY,
  l_date DATE NOT NULL,
  l_duree NUMBER(3) NOT NULL, /* Duree en minutes */
  l_eleve CONSTRAINT lec_elev_fk references Eleve NOT NULL,
  le_moniteur CONSTRAINT lec_moni_fk references Moniteur NOT NULL
);
