--Réinitialisation
DROP TABLE ARCHIVES;

DROP TABLE LOCATAIRES;

DROP TABLE ACTIONNAIRES;

DROP TABLE ENTRETIENS;

DROP TABLE LOGEMENTS;

DROP TABLE OCCUPATIONS;

DROP TABLE IMMEUBLES;

DROP TABLE VILLES;

DROP TABLE CONCIERGES;

DROP TABLE EMPLOYES;

DROP TABLE CHAUFFAGES;

DROP TABLE TAUX_METIERS;

--Création des tables
CREATE TABLE
    VILLES (
        NOM_VILLE VARCHAR2(12),
        TAUX_TAXES NUMBER(4, 2),
        PRIMARY KEY (NOM_VILLE)
    );

CREATE TABLE
    CONCIERGES (
        NOM_CONCIERGE VARCHAR2(25),
        ADRESSE VARCHAR2(30),
        SALAIRE_MENSUEL NUMBER(6, 2),
        PRIMARY KEY (NOM_CONCIERGE)
    );

CREATE TABLE
    CHAUFFAGES (
        CHAU_CODE VARCHAR2(1),
        CHAU_DESCRIPTION VARCHAR2(12),
        PRIMARY KEY (CHAU_CODE)
    );

CREATE TABLE
    OCCUPATIONS (
        OCC_CODE VARCHAR2(1),
        OCC_DESCRIPTION VARCHAR2(10),
        PRIMARY KEY (OCC_CODE)
    );

CREATE TABLE
    TAUX_METIERS (
        CODE_METIER VARCHAR2(2),
        DESCRIPTION_METIER VARCHAR2(20),
        TAUX_HORAIRE NUMBER(5, 2),
        PRIMARY KEY (CODE_METIER)
    );

CREATE TABLE
    ACTIONNAIRES (
        NO_ACTIONNAIRE NUMBER(5),
        ADRESSE VARCHAR2(30),
        NOM_ACTIONNAIRE VARCHAR2(30),
        TELEPHONE VARCHAR2(10),
        NB_PARTS NUMBER(7, 3),
        PROFIT_A_DISTRIBUER NUMBER(8, 2),
        VALEUR_PART NUMBER(7, 3),
        PRIMARY KEY (NO_ACTIONNAIRE)
    );

CREATE TABLE
    ARCHIVES (
        NO_IMMEUBLE NUMBER(4),
        ANNEE NUMBER(4),
        EVALUATION NUMBER(9),
        TAXES NUMBER(8, 2),
        FRAIS_HYPOTHEQUE NUMBER(8, 2),
        CONCIERGERIE NUMBER(8, 2),
        ASSURANCES NUMBER(6, 2),
        ENTRETIEN NUMBER(8, 2),
        REVENU_LOYER NUMBER(8),
        PRIMARY KEY (NO_IMMEUBLE, ANNEE)
    );

CREATE TABLE
    EMPLOYES (
        EMP_NOM VARCHAR2(25),
        EMP_ADR VARCHAR2(30),
        TAUX_CODE_METIER VARCHAR2(2),
        PRIMARY KEY (EMP_NOM),
        FOREIGN KEY (TAUX_CODE_METIER) REFERENCES TAUX_METIERS (CODE_METIER)
    );

CREATE TABLE
    IMMEUBLES (
        NO_IMMEUBLE NUMBER(4),
        ADRESSE VARCHAR2(30),
        NB_ETAGES NUMBER(2),
        NB_LOGEMENTS NUMBER(2),
        ANNEE_EN_COURS NUMBER(4),
        ASSURANCE NUMBER(6, 2),
        CONCIERGERIE NUMBER(6, 2),
        CUMUL_LOYER NUMBER(8),
        ENTRETIEN NUMBER(8, 2),
        EVALUATION NUMBER(7),
        PRIX_ACHAT NUMBER(7),
        HYPOTHEQUE NUMBER(7),
        TAUX_HYPOTHEQUE NUMBER(9, 2),
        VIL_NOM_VILLE VARCHAR2(12),
        CON_NOM_CONCIERGE VARCHAR2(25),
        PRIMARY KEY (NO_IMMEUBLE),
        FOREIGN KEY (VIL_NOM_VILLE) REFERENCES VILLES (NOM_VILLE),
        FOREIGN KEY (CON_NOM_CONCIERGE) REFERENCES CONCIERGES (NOM_CONCIERGE)
    );

CREATE TABLE
    LOGEMENTS (
        NO_IMMEUBLE NUMBER(4),
        NO_LOGEMENT NUMBER(4),
        LOYER NUMBER(6, 2),
        NB_CHAMBRES NUMBER(2),
        NB_SALLE_BAINS NUMBER(2),
        A_LOUER VARCHAR2(1),
        CHAUFFAGE VARCHAR2(1),
        FOYER VARCHAR2(1),
        MEUBLE VARCHAR2(1),
        SALLE_A_DINER VARCHAR2(1),
        OCC_CODE VARCHAR2(1),
        PRIMARY KEY (NO_IMMEUBLE, NO_LOGEMENT),
        FOREIGN KEY (NO_IMMEUBLE) REFERENCES IMMEUBLES (NO_IMMEUBLE),
        FOREIGN KEY (CHAUFFAGE) REFERENCES CHAUFFAGES (CHAU_CODE),
        FOREIGN KEY (OCC_CODE) REFERENCES OCCUPATIONS (OCC_CODE)
    );

CREATE TABLE
    ENTRETIENS (
        NO_ENTRETIEN NUMBER(4),
        ENT_DATE DATE,
        NB_HEURES NUMBER(3, 1),
        IMM_NO_IMMEUBLE NUMBER(4),
        LOG_NO_LOGEMENT NUMBER(4),
        EMP_EMP_NOM VARCHAR2(25),
        PRIMARY KEY (NO_ENTRETIEN),
        FOREIGN KEY (IMM_NO_IMMEUBLE) REFERENCES IMMEUBLES (NO_IMMEUBLE),
        FOREIGN KEY (IMM_NO_IMMEUBLE, LOG_NO_LOGEMENT) REFERENCES LOGEMENTS (NO_IMMEUBLE, NO_LOGEMENT),
        FOREIGN KEY (EMP_EMP_NOM) REFERENCES EMPLOYES (EMP_NOM)
    );

CREATE TABLE
    LOCATAIRES (
        LOC_NOM VARCHAR2(30),
        LOC_TELEPHONE VARCHAR2(10),
        DATE_ENTREE DATE,
        DATE_FIN_BAIL DATE,
        OCCUPANT VARCHAR2(1),
        LOG_NO_IMMEUBLE NUMBER(4),
        LOG_NO_LOGEMENT NUMBER(4),
        PRIMARY KEY (LOC_NOM),
        FOREIGN KEY (LOG_NO_IMMEUBLE, LOG_NO_LOGEMENT) REFERENCES LOGEMENTS (NO_IMMEUBLE, NO_LOGEMENT)
    );

-- Insertions des enregistrements
INSERT INTO
    TAUX_METIERS (CODE_METIER, DESCRIPTION_METIER, TAUX_HORAIRE)
VALUES
    ('SE', 'Software Engineer', 25.00);

INSERT INTO
    TAUX_METIERS (CODE_METIER, DESCRIPTION_METIER, TAUX_HORAIRE)
VALUES
    ('GD', 'Graphic Designer', 20.50);

INSERT INTO
    TAUX_METIERS (CODE_METIER, DESCRIPTION_METIER, TAUX_HORAIRE)
VALUES
    ('SR', 'Sales Representative', 18.75);

INSERT INTO
    TAUX_METIERS (CODE_METIER, DESCRIPTION_METIER, TAUX_HORAIRE)
VALUES
    ('AC', 'Accountant', 22.50);

INSERT INTO
    TAUX_METIERS (CODE_METIER, DESCRIPTION_METIER, TAUX_HORAIRE)
VALUES
    ('MS', 'Marketing Specialist', 19.80);

INSERT INTO
    TAUX_METIERS (CODE_METIER, DESCRIPTION_METIER, TAUX_HORAIRE)
VALUES
    ('PM', 'Project Manager', 24.50);

INSERT INTO
    TAUX_METIERS (CODE_METIER, DESCRIPTION_METIER, TAUX_HORAIRE)
VALUES
    ('PI', 'Pilot', 36.75);

INSERT INTO
    TAUX_METIERS (CODE_METIER, DESCRIPTION_METIER, TAUX_HORAIRE)
VALUES
    ('CS', 'Computer Scientist', 21.00);

INSERT INTO
    TAUX_METIERS (CODE_METIER, DESCRIPTION_METIER, TAUX_HORAIRE)
VALUES
    ('FA', 'Financial Analyst', 27.50);

INSERT INTO
    TAUX_METIERS (CODE_METIER, DESCRIPTION_METIER, TAUX_HORAIRE)
VALUES
    ('DO', 'Doctor', 17.25);

INSERT INTO
    EMPLOYES (EMP_NOM, EMP_ADR, TAUX_CODE_METIER)
VALUES
    ('John Smith', '123 Main St', 'SE');

INSERT INTO
    EMPLOYES (EMP_NOM, EMP_ADR, TAUX_CODE_METIER)
VALUES
    ('Jane Doe', '456 Elm St', 'GD');

INSERT INTO
    EMPLOYES (EMP_NOM, EMP_ADR, TAUX_CODE_METIER)
VALUES
    ('Michael Johnson', '789 Oak St', 'SR');

INSERT INTO
    EMPLOYES (EMP_NOM, EMP_ADR, TAUX_CODE_METIER)
VALUES
    ('Emily Williams', '987 Maple Ave', 'SR');

INSERT INTO
    EMPLOYES (EMP_NOM, EMP_ADR, TAUX_CODE_METIER)
VALUES
    ('Robert Brown', '654 Pine Rd', 'SE');

INSERT INTO
    EMPLOYES (EMP_NOM, EMP_ADR, TAUX_CODE_METIER)
VALUES
    ('Jennifer Davis', '321 Cedar Ln', 'CS');

INSERT INTO
    EMPLOYES (EMP_NOM, EMP_ADR, TAUX_CODE_METIER)
VALUES
    ('David Wilson', '789 Walnut Blvd', 'PI');

INSERT INTO
    EMPLOYES (EMP_NOM, EMP_ADR, TAUX_CODE_METIER)
VALUES
    ('Sarah Taylor', '555 Cherry St', 'CS');

INSERT INTO
    EMPLOYES (EMP_NOM, EMP_ADR, TAUX_CODE_METIER)
VALUES
    ('Daniel Anderson', '888 Birch Ave', 'DO');

INSERT INTO
    EMPLOYES (EMP_NOM, EMP_ADR, TAUX_CODE_METIER)
VALUES
    ('Lisa Thomas', '222 Spruce Rd', 'FA');

INSERT INTO
    CONCIERGES (NOM_CONCIERGE, ADRESSE, SALAIRE_MENSUEL)
VALUES
    ('Thomas Johnson', '423 Main St', 2500.00);

INSERT INTO
    CONCIERGES (NOM_CONCIERGE, ADRESSE, SALAIRE_MENSUEL)
VALUES
    ('Sophia Anderson', '1456 Elm St', 2800.00);

INSERT INTO
    CONCIERGES (NOM_CONCIERGE, ADRESSE, SALAIRE_MENSUEL)
VALUES
    ('Oliver Smith', '7892 Oak St', 2700.00);

INSERT INTO
    CONCIERGES (NOM_CONCIERGE, ADRESSE, SALAIRE_MENSUEL)
VALUES
    ('Emma Davis', '98 Maple Blv', 2900.00);

INSERT INTO
    CONCIERGES (NOM_CONCIERGE, ADRESSE, SALAIRE_MENSUEL)
VALUES
    ('Liam Wilson', '65 AlPine Rd', 2600.00);

INSERT INTO
    CONCIERGES (NOM_CONCIERGE, ADRESSE, SALAIRE_MENSUEL)
VALUES
    ('Ava Brown', '31 Cedar Ln', 2800.00);

INSERT INTO
    CONCIERGES (NOM_CONCIERGE, ADRESSE, SALAIRE_MENSUEL)
VALUES
    ('Noah Taylor', '89 Walnut Blvd', 2700.00);

INSERT INTO
    CONCIERGES (NOM_CONCIERGE, ADRESSE, SALAIRE_MENSUEL)
VALUES
    ('Isabella Martin', '55 Cherry St', 3000.00);

INSERT INTO
    CONCIERGES (NOM_CONCIERGE, ADRESSE, SALAIRE_MENSUEL)
VALUES
    ('Lucas Johnson', '43 Birch Ave', 2650.00);

INSERT INTO
    CONCIERGES (NOM_CONCIERGE, ADRESSE, SALAIRE_MENSUEL)
VALUES
    ('Mia Thompson', '22 Spruce Rd', 2750.00);

INSERT INTO
    VILLES (NOM_VILLE, TAUX_TAXES)
VALUES
    ('Boucherville', 7.5);

INSERT INTO
    VILLES (NOM_VILLE, TAUX_TAXES)
VALUES
    ('St Bruno', 8.2);

INSERT INTO
    VILLES (NOM_VILLE, TAUX_TAXES)
VALUES
    ('Longueuil', 7.8);

INSERT INTO
    ACTIONNAIRES (
        NO_ACTIONNAIRE,
        ADRESSE,
        NOM_ACTIONNAIRE,
        TELEPHONE,
        NB_PARTS,
        PROFIT_A_DISTRIBUER,
        VALEUR_PART
    )
VALUES
    (
        10001,
        '123 Rue des Acacias',
        'Jean Dupont',
        '5141234587',
        1000.25,
        7500.00,
        7.50
    );

INSERT INTO
    ACTIONNAIRES (
        NO_ACTIONNAIRE,
        ADRESSE,
        NOM_ACTIONNAIRE,
        TELEPHONE,
        NB_PARTS,
        PROFIT_A_DISTRIBUER,
        VALEUR_PART
    )
VALUES
    (
        10002,
        '456 Rue des Lilas',
        'Marie Lambert',
        '5149876534',
        800.50,
        6200.00,
        7.75
    );

INSERT INTO
    ACTIONNAIRES (
        NO_ACTIONNAIRE,
        ADRESSE,
        NOM_ACTIONNAIRE,
        TELEPHONE,
        NB_PARTS,
        PROFIT_A_DISTRIBUER,
        VALEUR_PART
    )
VALUES
    (
        10003,
        '789 Avenue des Roses',
        'Pierre Tremblay',
        '5145115258',
        500.75,
        4000.50,
        8.00
    );

INSERT INTO
    ACTIONNAIRES (
        NO_ACTIONNAIRE,
        ADRESSE,
        NOM_ACTIONNAIRE,
        TELEPHONE,
        NB_PARTS,
        PROFIT_A_DISTRIBUER,
        VALEUR_PART
    )
VALUES
    (
        10004,
        '321 Rue des Chênes',
        'Sophie Gagnon',
        '5148889999',
        1200.00,
        9500.25,
        7.90
    );

INSERT INTO
    ACTIONNAIRES (
        NO_ACTIONNAIRE,
        ADRESSE,
        NOM_ACTIONNAIRE,
        TELEPHONE,
        NB_PARTS,
        PROFIT_A_DISTRIBUER,
        VALEUR_PART
    )
VALUES
    (
        10005,
        '987 Avenue des Bouleaux',
        'Patrick Martin',
        '5147771111',
        700.25,
        5500.75,
        7.85
    );

INSERT INTO
    ACTIONNAIRES (
        NO_ACTIONNAIRE,
        ADRESSE,
        NOM_ACTIONNAIRE,
        TELEPHONE,
        NB_PARTS,
        PROFIT_A_DISTRIBUER,
        VALEUR_PART
    )
VALUES
    (
        10006,
        '654 Rue des Érables',
        'Isabelle Roy',
        '5142223333',
        900.50,
        7200.00,
        8.20
    );

INSERT INTO
    ACTIONNAIRES (
        NO_ACTIONNAIRE,
        ADRESSE,
        NOM_ACTIONNAIRE,
        TELEPHONE,
        NB_PARTS,
        PROFIT_A_DISTRIBUER,
        VALEUR_PART
    )
VALUES
    (
        10007,
        '852 Avenue des Pommiers',
        'François Leblanc',
        '5144445555',
        1500.75,
        12000.50,
        8.40
    );

INSERT INTO
    ACTIONNAIRES (
        NO_ACTIONNAIRE,
        ADRESSE,
        NOM_ACTIONNAIRE,
        TELEPHONE,
        NB_PARTS,
        PROFIT_A_DISTRIBUER,
        VALEUR_PART
    )
VALUES
    (
        10008,
        '147 Rue des Sapins',
        'Martine Lavoie',
        '5149998888',
        1100.00,
        8800.25,
        7.70
    );

INSERT INTO
    ACTIONNAIRES (
        NO_ACTIONNAIRE,
        ADRESSE,
        NOM_ACTIONNAIRE,
        TELEPHONE,
        NB_PARTS,
        PROFIT_A_DISTRIBUER,
        VALEUR_PART
    )
VALUES
    (
        10009,
        '369 Avenue des Tilleuls',
        'Luc Dubois',
        '5146667777',
        600.25,
        4800.75,
        7.60
    );

INSERT INTO
    ACTIONNAIRES (
        NO_ACTIONNAIRE,
        ADRESSE,
        NOM_ACTIONNAIRE,
        TELEPHONE,
        NB_PARTS,
        PROFIT_A_DISTRIBUER,
        VALEUR_PART
    )
VALUES
    (
        10010,
        '963 Rue des Peupliers',
        'Nathalie Bergeron',
        '5143332222',
        850.50,
        6800.00,
        7.95
    );

INSERT INTO
    CHAUFFAGES (CHAU_CODE, CHAU_DESCRIPTION)
VALUES
    ('G', 'Gaz');

INSERT INTO
    CHAUFFAGES (CHAU_CODE, CHAU_DESCRIPTION)
VALUES
    ('E', 'Électricite');

INSERT INTO
    CHAUFFAGES (CHAU_CODE, CHAU_DESCRIPTION)
VALUES
    ('H', 'Huile');

INSERT INTO
    CHAUFFAGES (CHAU_CODE, CHAU_DESCRIPTION)
VALUES
    ('B', 'Bois');

INSERT INTO
    OCCUPATIONS (OCC_CODE, OCC_DESCRIPTION)
VALUES
    ('L', 'Libre');

INSERT INTO
    OCCUPATIONS (OCC_CODE, OCC_DESCRIPTION)
VALUES
    ('R', 'Regulier');

INSERT INTO
    OCCUPATIONS (OCC_CODE, OCC_DESCRIPTION)
VALUES
    ('C', 'Concierge');

INSERT INTO
    IMMEUBLES (
        NO_IMMEUBLE,
        ADRESSE,
        NB_ETAGES,
        NB_LOGEMENTS,
        ANNEE_EN_COURS,
        ASSURANCE,
        CONCIERGERIE,
        CUMUL_LOYER,
        ENTRETIEN,
        EVALUATION,
        PRIX_ACHAT,
        HYPOTHEQUE,
        TAUX_HYPOTHEQUE,
        VIL_NOM_VILLE,
        CON_NOM_CONCIERGE
    )
VALUES
    (
        1001,
        '123 Rue Principale',
        5,
        33,
        2023,
        1500.00,
        1000.00,
        80000,
        5000.00,
        500000,
        750000,
        350000,
        3.5,
        'Boucherville',
        'Thomas Johnson'
    );

INSERT INTO
    IMMEUBLES (
        NO_IMMEUBLE,
        ADRESSE,
        NB_ETAGES,
        NB_LOGEMENTS,
        ANNEE_EN_COURS,
        ASSURANCE,
        CONCIERGERIE,
        CUMUL_LOYER,
        ENTRETIEN,
        EVALUATION,
        PRIX_ACHAT,
        HYPOTHEQUE,
        TAUX_HYPOTHEQUE,
        VIL_NOM_VILLE,
        CON_NOM_CONCIERGE
    )
VALUES
    (
        1002,
        '456 Rue Secondaire',
        3,
        6,
        2023,
        1200.00,
        800.00,
        60000,
        4000.00,
        400000,
        600000,
        300000,
        4.2,
        'St Bruno',
        'Sophia Anderson'
    );

INSERT INTO
    IMMEUBLES (
        NO_IMMEUBLE,
        ADRESSE,
        NB_ETAGES,
        NB_LOGEMENTS,
        ANNEE_EN_COURS,
        ASSURANCE,
        CONCIERGERIE,
        CUMUL_LOYER,
        ENTRETIEN,
        EVALUATION,
        PRIX_ACHAT,
        HYPOTHEQUE,
        TAUX_HYPOTHEQUE,
        VIL_NOM_VILLE,
        CON_NOM_CONCIERGE
    )
VALUES
    (
        1003,
        '789 Rue Tertiaire',
        4,
        33,
        2023,
        1400.00,
        900.00,
        70000,
        4500.00,
        450000,
        650000,
        320000,
        3.8,
        'Boucherville',
        'Oliver Smith'
    );

INSERT INTO
    IMMEUBLES (
        NO_IMMEUBLE,
        ADRESSE,
        NB_ETAGES,
        NB_LOGEMENTS,
        ANNEE_EN_COURS,
        ASSURANCE,
        CONCIERGERIE,
        CUMUL_LOYER,
        ENTRETIEN,
        EVALUATION,
        PRIX_ACHAT,
        HYPOTHEQUE,
        TAUX_HYPOTHEQUE,
        VIL_NOM_VILLE,
        CON_NOM_CONCIERGE
    )
VALUES
    (
        1004,
        '987 Rue Quartième',
        6,
        12,
        2023,
        1800.00,
        1200.00,
        90000,
        6000.00,
        600000,
        900000,
        400000,
        3.2,
        'Boucherville',
        'Emma Davis'
    );

INSERT INTO
    IMMEUBLES (
        NO_IMMEUBLE,
        ADRESSE,
        NB_ETAGES,
        NB_LOGEMENTS,
        ANNEE_EN_COURS,
        ASSURANCE,
        CONCIERGERIE,
        CUMUL_LOYER,
        ENTRETIEN,
        EVALUATION,
        PRIX_ACHAT,
        HYPOTHEQUE,
        TAUX_HYPOTHEQUE,
        VIL_NOM_VILLE,
        CON_NOM_CONCIERGE
    )
VALUES
    (
        1005,
        '654 Rue Cinquième',
        2,
        4,
        2023,
        1000.00,
        700.00,
        50000,
        3500.00,
        350000,
        550000,
        280000,
        4.0,
        'St Bruno',
        'Liam Wilson'
    );

INSERT INTO
    IMMEUBLES (
        NO_IMMEUBLE,
        ADRESSE,
        NB_ETAGES,
        NB_LOGEMENTS,
        ANNEE_EN_COURS,
        ASSURANCE,
        CONCIERGERIE,
        CUMUL_LOYER,
        ENTRETIEN,
        EVALUATION,
        PRIX_ACHAT,
        HYPOTHEQUE,
        TAUX_HYPOTHEQUE,
        VIL_NOM_VILLE,
        CON_NOM_CONCIERGE
    )
VALUES
    (
        1006,
        '321 Rue Sixième',
        4,
        27,
        2023,
        1400.00,
        900.00,
        70000,
        4500.00,
        450000,
        650000,
        320000,
        3.8,
        'Longueuil',
        'Ava Brown'
    );

INSERT INTO
    IMMEUBLES (
        NO_IMMEUBLE,
        ADRESSE,
        NB_ETAGES,
        NB_LOGEMENTS,
        ANNEE_EN_COURS,
        ASSURANCE,
        CONCIERGERIE,
        CUMUL_LOYER,
        ENTRETIEN,
        EVALUATION,
        PRIX_ACHAT,
        HYPOTHEQUE,
        TAUX_HYPOTHEQUE,
        VIL_NOM_VILLE,
        CON_NOM_CONCIERGE
    )
VALUES
    (
        1007,
        '789 Rue Septième',
        5,
        10,
        2023,
        1500.00,
        1000.00,
        80000,
        5000.00,
        500000,
        750000,
        350000,
        3.5,
        'Boucherville',
        'Noah Taylor'
    );

INSERT INTO
    IMMEUBLES (
        NO_IMMEUBLE,
        ADRESSE,
        NB_ETAGES,
        NB_LOGEMENTS,
        ANNEE_EN_COURS,
        ASSURANCE,
        CONCIERGERIE,
        CUMUL_LOYER,
        ENTRETIEN,
        EVALUATION,
        PRIX_ACHAT,
        HYPOTHEQUE,
        TAUX_HYPOTHEQUE,
        VIL_NOM_VILLE,
        CON_NOM_CONCIERGE
    )
VALUES
    (
        1008,
        '789 Rue Huitième',
        3,
        6,
        2023,
        1200.00,
        800.00,
        60000,
        4000.00,
        400000,
        600000,
        300000,
        4.2,
        'Longueuil',
        'Isabella Martin'
    );

INSERT INTO
    IMMEUBLES (
        NO_IMMEUBLE,
        ADRESSE,
        NB_ETAGES,
        NB_LOGEMENTS,
        ANNEE_EN_COURS,
        ASSURANCE,
        CONCIERGERIE,
        CUMUL_LOYER,
        ENTRETIEN,
        EVALUATION,
        PRIX_ACHAT,
        HYPOTHEQUE,
        TAUX_HYPOTHEQUE,
        VIL_NOM_VILLE,
        CON_NOM_CONCIERGE
    )
VALUES
    (
        1009,
        '654 Rue Neuvième',
        4,
        27,
        2023,
        1400.00,
        900.00,
        70000,
        4500.00,
        450000,
        650000,
        320000,
        3.8,
        'Boucherville',
        'Lucas Johnson'
    );

INSERT INTO
    IMMEUBLES (
        NO_IMMEUBLE,
        ADRESSE,
        NB_ETAGES,
        NB_LOGEMENTS,
        ANNEE_EN_COURS,
        ASSURANCE,
        CONCIERGERIE,
        CUMUL_LOYER,
        ENTRETIEN,
        EVALUATION,
        PRIX_ACHAT,
        HYPOTHEQUE,
        TAUX_HYPOTHEQUE,
        VIL_NOM_VILLE,
        CON_NOM_CONCIERGE
    )
VALUES
    (
        1010,
        '321 Rue Dixième',
        6,
        12,
        2023,
        1800.00,
        1200.00,
        90000,
        6000.00,
        600000,
        900000,
        400000,
        3.2,
        'Longueuil',
        'Mia Thompson'
    );

INSERT INTO
    IMMEUBLES (
        NO_IMMEUBLE,
        ADRESSE,
        NB_ETAGES,
        NB_LOGEMENTS,
        ANNEE_EN_COURS,
        ASSURANCE,
        CONCIERGERIE,
        CUMUL_LOYER,
        ENTRETIEN,
        EVALUATION,
        PRIX_ACHAT,
        HYPOTHEQUE,
        TAUX_HYPOTHEQUE,
        VIL_NOM_VILLE,
        CON_NOM_CONCIERGE
    )
VALUES
    (
        1297,
        '453 Rue FEROVIER',
        7,
        23,
        2022,
        1543.00,
        1200.00,
        60000,
        4000.00,
        100000,
        150000,
        450000,
        2.5,
        'Boucherville',
        'Noah Taylor'
    );

INSERT INTO
    ARCHIVES (
        NO_IMMEUBLE,
        ANNEE,
        EVALUATION,
        TAXES,
        FRAIS_HYPOTHEQUE,
        CONCIERGERIE,
        ASSURANCES,
        ENTRETIEN,
        REVENU_LOYER
    )
VALUES
    (
        1003,
        2019,
        500000,
        120001.50,
        500000.00,
        100000.00,
        1500.00,
        222000.00,
        8000
    );

INSERT INTO
    ARCHIVES (
        NO_IMMEUBLE,
        ANNEE,
        EVALUATION,
        TAXES,
        FRAIS_HYPOTHEQUE,
        CONCIERGERIE,
        ASSURANCES,
        ENTRETIEN,
        REVENU_LOYER
    )
VALUES
    (
        1001,
        2019,
        400000,
        110000.75,
        466000.00,
        812700.00,
        1200.00,
        111800.00,
        7000
    );

INSERT INTO
    ARCHIVES (
        NO_IMMEUBLE,
        ANNEE,
        EVALUATION,
        TAXES,
        FRAIS_HYPOTHEQUE,
        CONCIERGERIE,
        ASSURANCES,
        ENTRETIEN,
        REVENU_LOYER
    )
VALUES
    (
        1002,
        2020,
        600000,
        175000.25,
        609000.00,
        189200.00,
        1800.00,
        211500.00,
        9000
    );

INSERT INTO
    ARCHIVES (
        NO_IMMEUBLE,
        ANNEE,
        EVALUATION,
        TAXES,
        FRAIS_HYPOTHEQUE,
        CONCIERGERIE,
        ASSURANCES,
        ENTRETIEN,
        REVENU_LOYER
    )
VALUES
    (
        1004,
        2020,
        450000,
        121000.50,
        423500.00,
        111900.00,
        1400.00,
        200100.00,
        7500
    );

INSERT INTO
    ARCHIVES (
        NO_IMMEUBLE,
        ANNEE,
        EVALUATION,
        TAXES,
        FRAIS_HYPOTHEQUE,
        CONCIERGERIE,
        ASSURANCES,
        ENTRETIEN,
        REVENU_LOYER
    )
VALUES
    (
        1005,
        2020,
        550000,
        133000.75,
        533500.00,
        113700.00,
        1600.00,
        233300.00,
        8500
    );

INSERT INTO
    ARCHIVES (
        NO_IMMEUBLE,
        ANNEE,
        EVALUATION,
        TAXES,
        FRAIS_HYPOTHEQUE,
        CONCIERGERIE,
        ASSURANCES,
        ENTRETIEN,
        REVENU_LOYER
    )
VALUES
    (
        1006,
        2023,
        520000,
        112500.50,
        125200.00,
        151050.00,
        1550.00,
        222150.00,
        8200
    );

INSERT INTO
    ARCHIVES (
        NO_IMMEUBLE,
        ANNEE,
        EVALUATION,
        TAXES,
        FRAIS_HYPOTHEQUE,
        CONCIERGERIE,
        ASSURANCES,
        ENTRETIEN,
        REVENU_LOYER
    )
VALUES
    (
        1008,
        2023,
        410000,
        110500.75,
        114100.00,
        111820.00,
        1250.00,
        341950.00,
        6800
    );

INSERT INTO
    ARCHIVES (
        NO_IMMEUBLE,
        ANNEE,
        EVALUATION,
        TAXES,
        FRAIS_HYPOTHEQUE,
        CONCIERGERIE,
        ASSURANCES,
        ENTRETIEN,
        REVENU_LOYER
    )
VALUES
    (
        1007,
        2024,
        620000,
        316000.25,
        645200.00,
        135500.00,
        1900.00,
        562700.00,
        10500
    );

INSERT INTO
    ARCHIVES (
        NO_IMMEUBLE,
        ANNEE,
        EVALUATION,
        TAXES,
        FRAIS_HYPOTHEQUE,
        CONCIERGERIE,
        ASSURANCES,
        ENTRETIEN,
        REVENU_LOYER
    )
VALUES
    (
        1009,
        2021,
        470000,
        131500.50,
        422700.00,
        123950.00,
        1450.00,
        102250.00,
        7300
    );

INSERT INTO
    ARCHIVES (
        NO_IMMEUBLE,
        ANNEE,
        EVALUATION,
        TAXES,
        FRAIS_HYPOTHEQUE,
        CONCIERGERIE,
        ASSURANCES,
        ENTRETIEN,
        REVENU_LOYER
    )
VALUES
    (
        1010,
        2021,
        570000,
        113500.75,
        521700.00,
        100150.00,
        1650.00,
        102450.00,
        9200
    );

INSERT INTO
    LOGEMENTS (
        NO_IMMEUBLE,
        NO_LOGEMENT,
        LOYER,
        NB_CHAMBRES,
        NB_SALLE_BAINS,
        A_LOUER,
        CHAUFFAGE,
        FOYER,
        MEUBLE,
        SALLE_A_DINER,
        OCC_CODE
    )
VALUES
    (1001, 1, 1500, 2, 1, 'O', 'G', 'N', 'N', 'O', 'L');

INSERT INTO
    LOGEMENTS (
        NO_IMMEUBLE,
        NO_LOGEMENT,
        LOYER,
        NB_CHAMBRES,
        NB_SALLE_BAINS,
        A_LOUER,
        CHAUFFAGE,
        FOYER,
        MEUBLE,
        SALLE_A_DINER,
        OCC_CODE
    )
VALUES
    (
        1001,
        2,
        1100.00,
        3,
        1,
        'O',
        'E',
        'N',
        'N',
        'N',
        'C'
    );

INSERT INTO
    LOGEMENTS (
        NO_IMMEUBLE,
        NO_LOGEMENT,
        LOYER,
        NB_CHAMBRES,
        NB_SALLE_BAINS,
        A_LOUER,
        CHAUFFAGE,
        FOYER,
        MEUBLE,
        SALLE_A_DINER,
        OCC_CODE
    )
VALUES
    (
        1002,
        1,
        1500.00,
        3,
        2,
        'N',
        'E',
        'O',
        'N',
        'N',
        'R'
    );

INSERT INTO
    LOGEMENTS (
        NO_IMMEUBLE,
        NO_LOGEMENT,
        LOYER,
        NB_CHAMBRES,
        NB_SALLE_BAINS,
        A_LOUER,
        CHAUFFAGE,
        FOYER,
        MEUBLE,
        SALLE_A_DINER,
        OCC_CODE
    )
VALUES
    (1002, 2, 1500, 2, 1, 'O', 'H', 'N', 'N', 'O', 'L');

INSERT INTO
    LOGEMENTS (
        NO_IMMEUBLE,
        NO_LOGEMENT,
        LOYER,
        NB_CHAMBRES,
        NB_SALLE_BAINS,
        A_LOUER,
        CHAUFFAGE,
        FOYER,
        MEUBLE,
        SALLE_A_DINER,
        OCC_CODE
    )
VALUES
    (
        1003,
        1,
        900.00,
        4,
        1,
        'N',
        'B',
        'N',
        'O',
        'N',
        'C'
    );

INSERT INTO
    LOGEMENTS (
        NO_IMMEUBLE,
        NO_LOGEMENT,
        LOYER,
        NB_CHAMBRES,
        NB_SALLE_BAINS,
        A_LOUER,
        CHAUFFAGE,
        FOYER,
        MEUBLE,
        SALLE_A_DINER,
        OCC_CODE
    )
VALUES
    (
        1003,
        2,
        1100.00,
        8,
        2,
        'N',
        'G',
        'O',
        'O',
        'N',
        'R'
    );

INSERT INTO
    LOGEMENTS (
        NO_IMMEUBLE,
        NO_LOGEMENT,
        LOYER,
        NB_CHAMBRES,
        NB_SALLE_BAINS,
        A_LOUER,
        CHAUFFAGE,
        FOYER,
        MEUBLE,
        SALLE_A_DINER,
        OCC_CODE
    )
VALUES
    (
        1004,
        1,
        1500,
        13,
        2,
        'N',
        'H',
        'O',
        'O',
        'O',
        'L'
    );

INSERT INTO
    LOGEMENTS (
        NO_IMMEUBLE,
        NO_LOGEMENT,
        LOYER,
        NB_CHAMBRES,
        NB_SALLE_BAINS,
        A_LOUER,
        CHAUFFAGE,
        FOYER,
        MEUBLE,
        SALLE_A_DINER,
        OCC_CODE
    )
VALUES
    (
        1004,
        2,
        1250.00,
        2,
        1,
        'O',
        'E',
        'N',
        'O',
        'N',
        'C'
    );

INSERT INTO
    LOGEMENTS (
        NO_IMMEUBLE,
        NO_LOGEMENT,
        LOYER,
        NB_CHAMBRES,
        NB_SALLE_BAINS,
        A_LOUER,
        CHAUFFAGE,
        FOYER,
        MEUBLE,
        SALLE_A_DINER,
        OCC_CODE
    )
VALUES
    (1005, 1, 1500, 1, 1, 'O', 'G', 'N', 'O', 'N', 'L');

INSERT INTO
    LOGEMENTS (
        NO_IMMEUBLE,
        NO_LOGEMENT,
        LOYER,
        NB_CHAMBRES,
        NB_SALLE_BAINS,
        A_LOUER,
        CHAUFFAGE,
        FOYER,
        MEUBLE,
        SALLE_A_DINER,
        OCC_CODE
    )
VALUES
    (
        1005,
        2,
        1150.00,
        2,
        1,
        'O',
        'B',
        'O',
        'O',
        'O',
        'R'
    );

INSERT INTO
    LOGEMENTS (
        NO_IMMEUBLE,
        NO_LOGEMENT,
        LOYER,
        NB_CHAMBRES,
        NB_SALLE_BAINS,
        A_LOUER,
        CHAUFFAGE,
        FOYER,
        MEUBLE,
        SALLE_A_DINER,
        OCC_CODE
    )
VALUES
    (1006, 1, 1500, 3, 2, 'O', 'H', 'O', 'O', 'O', 'L');

INSERT INTO
    LOGEMENTS (
        NO_IMMEUBLE,
        NO_LOGEMENT,
        LOYER,
        NB_CHAMBRES,
        NB_SALLE_BAINS,
        A_LOUER,
        CHAUFFAGE,
        FOYER,
        MEUBLE,
        SALLE_A_DINER,
        OCC_CODE
    )
VALUES
    (
        1006,
        2,
        1050.00,
        2,
        1,
        'O',
        'B',
        'N',
        'O',
        'N',
        'C'
    );

INSERT INTO
    LOGEMENTS (
        NO_IMMEUBLE,
        NO_LOGEMENT,
        LOYER,
        NB_CHAMBRES,
        NB_SALLE_BAINS,
        A_LOUER,
        CHAUFFAGE,
        FOYER,
        MEUBLE,
        SALLE_A_DINER,
        OCC_CODE
    )
VALUES
    (
        1007,
        1,
        1250.00,
        2,
        2,
        'N',
        'B',
        'N',
        'S',
        'O',
        'R'
    );

INSERT INTO
    LOGEMENTS (
        NO_IMMEUBLE,
        NO_LOGEMENT,
        LOYER,
        NB_CHAMBRES,
        NB_SALLE_BAINS,
        A_LOUER,
        CHAUFFAGE,
        FOYER,
        MEUBLE,
        SALLE_A_DINER,
        OCC_CODE
    )
VALUES
    (1007, 2, 1500, 3, 1, 'N', 'H', 'N', 'S', 'N', 'L');

INSERT INTO
    LOGEMENTS (
        NO_IMMEUBLE,
        NO_LOGEMENT,
        LOYER,
        NB_CHAMBRES,
        NB_SALLE_BAINS,
        A_LOUER,
        CHAUFFAGE,
        FOYER,
        MEUBLE,
        SALLE_A_DINER,
        OCC_CODE
    )
VALUES
    (
        1008,
        1,
        1100.00,
        12,
        4,
        'O',
        'E',
        'N',
        'S',
        'O',
        'C'
    );

INSERT INTO
    LOGEMENTS (
        NO_IMMEUBLE,
        NO_LOGEMENT,
        LOYER,
        NB_CHAMBRES,
        NB_SALLE_BAINS,
        A_LOUER,
        CHAUFFAGE,
        FOYER,
        MEUBLE,
        SALLE_A_DINER,
        OCC_CODE
    )
VALUES
    (1009, 2, 1500, 3, 6, 'N', 'H', 'N', 'S', 'N', 'L');

INSERT INTO
    LOGEMENTS (
        NO_IMMEUBLE,
        NO_LOGEMENT,
        LOYER,
        NB_CHAMBRES,
        NB_SALLE_BAINS,
        A_LOUER,
        CHAUFFAGE,
        FOYER,
        MEUBLE,
        SALLE_A_DINER,
        OCC_CODE
    )
VALUES
    (
        1010,
        1,
        2100.00,
        10,
        4,
        'O',
        'E',
        'N',
        'S',
        'O',
        'C'
    );

INSERT INTO
    ENTRETIENS (
        NO_ENTRETIEN,
        ENT_DATE,
        NB_HEURES,
        IMM_NO_IMMEUBLE,
        LOG_NO_LOGEMENT,
        EMP_EMP_NOM
    )
VALUES
    (
        1,
        TO_DATE('2023-06-01', 'YYYY-MM-DD'),
        3.5,
        1001,
        1,
        'John Smith'
    );

INSERT INTO
    ENTRETIENS (
        NO_ENTRETIEN,
        ENT_DATE,
        NB_HEURES,
        IMM_NO_IMMEUBLE,
        LOG_NO_LOGEMENT,
        EMP_EMP_NOM
    )
VALUES
    (
        2,
        TO_DATE('2023-06-02', 'YYYY-MM-DD'),
        2.0,
        1002,
        2,
        'Jane Doe'
    );

INSERT INTO
    ENTRETIENS (
        NO_ENTRETIEN,
        ENT_DATE,
        NB_HEURES,
        IMM_NO_IMMEUBLE,
        LOG_NO_LOGEMENT,
        EMP_EMP_NOM
    )
VALUES
    (
        3,
        TO_DATE('2023-06-03', 'YYYY-MM-DD'),
        1.5,
        1003,
        1,
        'Michael Johnson'
    );

INSERT INTO
    ENTRETIENS (
        NO_ENTRETIEN,
        ENT_DATE,
        NB_HEURES,
        IMM_NO_IMMEUBLE,
        LOG_NO_LOGEMENT,
        EMP_EMP_NOM
    )
VALUES
    (
        4,
        TO_DATE('2023-06-04', 'YYYY-MM-DD'),
        2.5,
        1004,
        2,
        'Emily Williams'
    );

INSERT INTO
    ENTRETIENS (
        NO_ENTRETIEN,
        ENT_DATE,
        NB_HEURES,
        IMM_NO_IMMEUBLE,
        LOG_NO_LOGEMENT,
        EMP_EMP_NOM
    )
VALUES
    (
        5,
        TO_DATE('2023-06-05', 'YYYY-MM-DD'),
        3.0,
        1005,
        1,
        'Robert Brown'
    );

INSERT INTO
    ENTRETIENS (
        NO_ENTRETIEN,
        ENT_DATE,
        NB_HEURES,
        IMM_NO_IMMEUBLE,
        LOG_NO_LOGEMENT,
        EMP_EMP_NOM
    )
VALUES
    (
        6,
        TO_DATE('2023-06-06', 'YYYY-MM-DD'),
        1.0,
        1006,
        2,
        'Jennifer Davis'
    );

INSERT INTO
    ENTRETIENS (
        NO_ENTRETIEN,
        ENT_DATE,
        NB_HEURES,
        IMM_NO_IMMEUBLE,
        LOG_NO_LOGEMENT,
        EMP_EMP_NOM
    )
VALUES
    (
        7,
        TO_DATE('2023-06-07', 'YYYY-MM-DD'),
        2.5,
        1007,
        1,
        'David Wilson'
    );

INSERT INTO
    ENTRETIENS (
        NO_ENTRETIEN,
        ENT_DATE,
        NB_HEURES,
        IMM_NO_IMMEUBLE,
        LOG_NO_LOGEMENT,
        EMP_EMP_NOM
    )
VALUES
    (
        8,
        TO_DATE('2023-06-08', 'YYYY-MM-DD'),
        1.5,
        1008,
        1,
        'Sarah Taylor'
    );

INSERT INTO
    ENTRETIENS (
        NO_ENTRETIEN,
        ENT_DATE,
        NB_HEURES,
        IMM_NO_IMMEUBLE,
        LOG_NO_LOGEMENT,
        EMP_EMP_NOM
    )
VALUES
    (
        9,
        TO_DATE('2023-06-09', 'YYYY-MM-DD'),
        2.0,
        1009,
        2,
        'Daniel Anderson'
    );

INSERT INTO
    ENTRETIENS (
        NO_ENTRETIEN,
        ENT_DATE,
        NB_HEURES,
        IMM_NO_IMMEUBLE,
        LOG_NO_LOGEMENT,
        EMP_EMP_NOM
    )
VALUES
    (
        10,
        TO_DATE('2023-06-10', 'YYYY-MM-DD'),
        3.5,
        1010,
        1,
        'Lisa Thomas'
    );

INSERT INTO
    LOCATAIRES (
        LOC_NOM,
        LOC_TELEPHONE,
        DATE_ENTREE,
        DATE_FIN_BAIL,
        OCCUPANT,
        LOG_NO_IMMEUBLE,
        LOG_NO_LOGEMENT
    )
VALUES
    (
        'Emma Thompson',
        '1341116781',
        TO_DATE('2015-08-11', 'YYYY-MM-DD'),
        TO_DATE('2020-06-11', 'YYYY-MM-DD'),
        'Y',
        1001,
        1
    );

INSERT INTO
    LOCATAIRES (
        LOC_NOM,
        LOC_TELEPHONE,
        DATE_ENTREE,
        DATE_FIN_BAIL,
        OCCUPANT,
        LOG_NO_IMMEUBLE,
        LOG_NO_LOGEMENT
    )
VALUES
    (
        'Abdelkader Serhani',
        '256387901',
        TO_DATE('2023-02-01', 'YYYY-MM-DD'),
        TO_DATE('2023-11-11', 'YYYY-MM-DD'),
        'N',
        1002,
        2
    );

INSERT INTO
    LOCATAIRES (
        LOC_NOM,
        LOC_TELEPHONE,
        DATE_ENTREE,
        DATE_FIN_BAIL,
        OCCUPANT,
        LOG_NO_IMMEUBLE,
        LOG_NO_LOGEMENT
    )
VALUES
    (
        'Sophia Anderson',
        '3435887993',
        TO_DATE('2015-08-11', 'YYYY-MM-DD'),
        TO_DATE('2020-08-01', 'YYYY-MM-DD'),
        'Y',
        1003,
        1
    );

INSERT INTO
    LOCATAIRES (
        LOC_NOM,
        LOC_TELEPHONE,
        DATE_ENTREE,
        DATE_FIN_BAIL,
        OCCUPANT,
        LOG_NO_IMMEUBLE,
        LOG_NO_LOGEMENT
    )
VALUES
    (
        'Ismail Gharbi',
        '1233456222',
        TO_DATE('2023-04-01', 'YYYY-MM-DD'),
        TO_DATE('2023-07-20', 'YYYY-MM-DD'),
        'N',
        1004,
        2
    );

INSERT INTO
    LOCATAIRES (
        LOC_NOM,
        LOC_TELEPHONE,
        DATE_ENTREE,
        DATE_FIN_BAIL,
        OCCUPANT,
        LOG_NO_IMMEUBLE,
        LOG_NO_LOGEMENT
    )
VALUES
    (
        'Manel Aouar',
        '7778210909',
        TO_DATE('2015-08-11', 'YYYY-MM-DD'),
        TO_DATE('2020-06-11', 'YYYY-MM-DD'),
        'Y',
        1005,
        1
    );

INSERT INTO
    LOCATAIRES (
        LOC_NOM,
        LOC_TELEPHONE,
        DATE_ENTREE,
        DATE_FIN_BAIL,
        OCCUPANT,
        LOG_NO_IMMEUBLE,
        LOG_NO_LOGEMENT
    )
VALUES
    (
        'Noureddine Yahia',
        '6453240981',
        TO_DATE('2023-06-01', 'YYYY-MM-DD'),
        TO_DATE('2023-06-28', 'YYYY-MM-DD'),
        'N',
        1006,
        2
    );

INSERT INTO
    LOCATAIRES (
        LOC_NOM,
        LOC_TELEPHONE,
        DATE_ENTREE,
        DATE_FIN_BAIL,
        OCCUPANT,
        LOG_NO_IMMEUBLE,
        LOG_NO_LOGEMENT
    )
VALUES
    (
        'Zinedine Zidane',
        '4389200787',
        TO_DATE('2015-08-11', 'YYYY-MM-DD'),
        TO_DATE('2020-08-01', 'YYYY-MM-DD'),
        'Y',
        1007,
        1
    );

INSERT INTO
    LOCATAIRES (
        LOC_NOM,
        LOC_TELEPHONE,
        DATE_ENTREE,
        DATE_FIN_BAIL,
        OCCUPANT,
        LOG_NO_IMMEUBLE,
        LOG_NO_LOGEMENT
    )
VALUES
    (
        'Lucas Paqueta',
        '8884551234',
        TO_DATE('2023-08-01', 'YYYY-MM-DD'),
        TO_DATE('2024-08-01', 'YYYY-MM-DD'),
        'N',
        1008,
        1
    );

INSERT INTO
    LOCATAIRES (
        LOC_NOM,
        LOC_TELEPHONE,
        DATE_ENTREE,
        DATE_FIN_BAIL,
        OCCUPANT,
        LOG_NO_IMMEUBLE,
        LOG_NO_LOGEMENT
    )
VALUES
    (
        'Houssem Aouar',
        '9324353457',
        TO_DATE('2015-08-11', 'YYYY-MM-DD'),
        TO_DATE('2020-08-01', 'YYYY-MM-DD'),
        'Y',
        1009,
        2
    );

INSERT INTO
    LOCATAIRES (
        LOC_NOM,
        LOC_TELEPHONE,
        DATE_ENTREE,
        DATE_FIN_BAIL,
        OCCUPANT,
        LOG_NO_IMMEUBLE,
        LOG_NO_LOGEMENT
    )
VALUES
    (
        'Farid Lekhal',
        '1111784932',
        TO_DATE('2023-10-01', 'YYYY-MM-DD'),
        TO_DATE('2024-10-01', 'YYYY-MM-DD'),
        'N',
        1010,
        1
    );