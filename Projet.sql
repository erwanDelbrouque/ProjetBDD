/* Table Inscription
 * 
 * Vérification : On ne peut pas insérer de ligne tant que e_date_code est null
 */
CREATE TABLE Inscription (
  i_id NUMBER(3) CONSTRAINT INSCRIPTION_PK PRIMARY KEY,
  i_date_inscr DATE NOT NULL,
  i_type VARCHAR2(20) CONSTRAINT type_check CHECK(i_type IN('classique','supervise','anticipe')),
  i_date_examen DATE DEFAULT NULL,
  i_resultat NUMBER(2),
  i_num NUMBER(2),
  l_eleve CONSTRAINT Insc_Elev_fk REFERENCES Eleve
  

);

/* 
 * Table Lecon
 */
CREATE TABLE Lecon (
  l_id NUMBER(3) CONSTRAINT LECON_PK PRIMARY KEY,
  l_date DATE NOT NULL,
  l_duree TIME NOT NULL,
  l_eleve CONSTRAINT lec_elev_fk references Eleve,
  le_moniteur CONSTRAINT lec_moni_fk references Moniteur

);

/* 
 *Table Moniteur
 */
CREATE TABLE Moniteur (
  m_id NUMBER(3) CONSTRAINT MONITEUR_PK PRIMARY KEY,
  m_nom VARCHAR2(20) NOT NULL,
  m_prenom VARCHAR2(20) NOT NULL
  
);