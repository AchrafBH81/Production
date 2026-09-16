-- Script généré par WINDEV Suite SaaS le 15/09/2026 23:13:23
-- Tables de l'analyse Production.wda
-- pour SQL générique (ANSI 92)

-- Création de la table ArchiveEmail
CREATE TABLE "ArchiveEmail" (
    "IDArchiveEmail" INTEGER PRIMARY KEY NOT NULL,
    "noClient" VARCHAR(10) NOT NULL,
    "IdClient" INTEGER NOT NULL,
    "dateEmail" TIMESTAMP NOT NULL,
    "lFichierAttaché" LONGVARCHAR NOT NULL,
    "lSujet" VARCHAR(200) NOT NULL,
    "lExpediteur" VARCHAR(50) NOT NULL,
    "lDestinataire" LONGVARCHAR NOT NULL,
    "ltexte" LONGVARCHAR NOT NULL,
    "lTypeDocument" SMALLINT NOT NULL,
    "ItypeEnvoi" SMALLINT NOT NULL);
CREATE INDEX "WDIDX_ArchiveEmail_dateEmail" ON "ArchiveEmail" ("dateEmail");
CREATE INDEX "WDIDX_ArchiveEmail_lTypeDocument" ON "ArchiveEmail" ("lTypeDocument");
CREATE INDEX "WDIDX_ArchiveEmail_noClientdateEmail" ON "ArchiveEmail" ("noClient","dateEmail");

-- Création de la table ArchivePrep
CREATE TABLE "TQtePrep" (
    "TNoProd" VARCHAR(10) NOT NULL,
    "TtypeCalcul" VARCHAR(20) NOT NULL,
    "TDimension" FLOAT NOT NULL,
    "tType" SMALLINT NOT NULL,
    "tdesc" VARCHAR(50) NOT NULL,
    "tqte" NUMERIC(10,0) NOT NULL,
    "TNoLot" NUMERIC(10,0) NOT NULL);
CREATE INDEX "WDIDX_ArchivePrep_TNoLot" ON "TQtePrep" ("TNoLot");
CREATE INDEX "WDIDX_ArchivePrep_TNoProdTtypeCalcul" ON "TQtePrep" ("TNoProd","TtypeCalcul");

-- Création de la table Barrotin
CREATE TABLE "Barrotin" (
    "IDBarrotin" INTEGER PRIMARY KEY NOT NULL,
    "Bdescription" VARCHAR(50),
    "TCCLEUNIK" INTEGER,
    "ExtraNumber" VARCHAR(10));
CREATE INDEX "WDIDX_Barrotin_TCCLEUNIK" ON "Barrotin" ("TCCLEUNIK");

-- Création de la table BonLivraison
CREATE TABLE "BonLivraison" (
    "IDBonLivraison" INTEGER PRIMARY KEY NOT NULL,
    "Bnumero" INTEGER NOT NULL UNIQUE,
    "Bdate" DATE NOT NULL,
    "Bclient" VARCHAR(10) NOT NULL,
    "Bfacture" INTEGER NOT NULL,
    "BDateFacture" DATE NOT NULL,
    "BStotal" FLOAT NOT NULL,
    "BTVH" FLOAT NOT NULL,
    "Btransfere" SMALLINT NOT NULL,
    "Berreur" VARCHAR(50) NOT NULL,
    "brien" VARCHAR(1) NOT NULL,
    "bTauxTvh" REAL NOT NULL,
    "btauxtvq" REAL NOT NULL,
    "BTPS" FLOAT NOT NULL,
    "BTVQ" FLOAT NOT NULL,
    "Bsurcharge" FLOAT NOT NULL,
    "BCommandeClient" VARCHAR(20) NOT NULL,
    "BnoCommande" NUMERIC(10,0) NOT NULL,
    "BidLivreA" INTEGER NOT NULL,
    "bTauxTaxe1" REAL NOT NULL,
    "bTauxTaxe2" REAL NOT NULL,
    "bCalculTaux2sur1" BIT NOT NULL,
    "bDescTaux1" VARCHAR(10) NOT NULL,
    "bDescTaux2" VARCHAR(10) NOT NULL,
    "cvendeur" INTEGER NOT NULL,
    "surchargeTauxPourc" REAL NOT NULL);
CREATE INDEX "WDIDX_BonLivraison_Bdate" ON "BonLivraison" ("Bdate");
CREATE INDEX "WDIDX_BonLivraison_Bclient" ON "BonLivraison" ("Bclient");
CREATE INDEX "WDIDX_BonLivraison_Bfacture" ON "BonLivraison" ("Bfacture");
CREATE INDEX "WDIDX_BonLivraison_Btransfere" ON "BonLivraison" ("Btransfere");
CREATE INDEX "WDIDX_BonLivraison_BnoCommande" ON "BonLivraison" ("BnoCommande");
CREATE INDEX "WDIDX_BonLivraison_cvendeur" ON "BonLivraison" ("cvendeur");

-- Création de la table Camions
CREATE TABLE "Camions" (
    "IDCamions" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "NoCamion" VARCHAR(2) UNIQUE,
    "Description" VARCHAR(50),
    "Ordre" SMALLINT,
    "PickUp" BIT,
    "Abreviation" VARCHAR(5) UNIQUE);

-- Création de la table carrdim
CREATE TABLE "carrdim" (
    "carrnumero" VARCHAR(10) NOT NULL,
    "carrlarga" VARCHAR(20) NOT NULL,
    "carrhauta" VARCHAR(20) NOT NULL,
    "carrlargm" VARCHAR(20) NOT NULL,
    "carrhautm" VARCHAR(20) NOT NULL,
    "carrnbcarlarg" SMALLINT NOT NULL,
    "carrnbcarhaut" SMALLINT NOT NULL,
    "carrlargaconvert" VARCHAR(20) NOT NULL,
    "carrhautaconvert" VARCHAR(20) NOT NULL);
CREATE INDEX "WDIDX_carrdim_carrclea" ON "carrdim" ("carrnumero","carrlargaconvert","carrhautaconvert");
CREATE INDEX "WDIDX_carrdim_carrclem" ON "carrdim" ("carrnumero","carrlargm","carrhautm");

-- Création de la table carrelag
CREATE TABLE "carrelag" (
    "C0CLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "c0numero" VARCHAR(10) NOT NULL UNIQUE,
    "c0description" VARCHAR(40) NOT NULL,
    "c0type" VARCHAR(20) NOT NULL);
CREATE INDEX "WDIDX_carrelag_c0type" ON "carrelag" ("c0type");

-- Création de la table categclt
CREATE TABLE "categclt" (
    "categorie" VARCHAR(2) NOT NULL UNIQUE,
    "catdescription" VARCHAR(40) NOT NULL,
    "catminimum" SMALLINT NOT NULL,
    "catminmontant" FLOAT NOT NULL,
    "catchargetransport" SMALLINT NOT NULL);

-- Création de la table Categori
CREATE TABLE "Categori" (
    "Description" VARCHAR(80) NOT NULL UNIQUE,
    "cnumero" VARCHAR(3) NOT NULL UNIQUE,
    "ccarrelage" SMALLINT NOT NULL,
    "CCoulissant" SMALLINT NOT NULL);

-- Création de la table CatSpacer
CREATE TABLE "CatSpacer" (
    "IDCatSpacer" INTEGER PRIMARY KEY NOT NULL,
    "Description" VARCHAR(20) NOT NULL,
    "Abreviation" VARCHAR(5) NOT NULL,
    "Identifiant" VARCHAR(1) NOT NULL,
    "OrdreAffichage" SMALLINT NOT NULL);
CREATE INDEX "WDIDX_CatSpacer_OrdreAffichage" ON "CatSpacer" ("OrdreAffichage");

-- Création de la table client
CREATE TABLE "client" (
    "IDClient" INTEGER PRIMARY KEY NOT NULL,
    "nom" VARCHAR(45) NOT NULL,
    "numero" VARCHAR(10) NOT NULL UNIQUE,
    "fini" SMALLINT NOT NULL,
    "tolerancei" SMALLINT NOT NULL,
    "tolerances" SMALLINT NOT NULL,
    "secteur" VARCHAR(2) NOT NULL,
    "crue" VARCHAR(45) NOT NULL,
    "cville" VARCHAR(45) NOT NULL,
    "ccodepostal" VARCHAR(7) NOT NULL,
    "ctelephone" VARCHAR(12) NOT NULL,
    "cfax" VARCHAR(12) NOT NULL,
    "CEMAIL" VARCHAR(50) NOT NULL,
    "cmesure" SMALLINT NOT NULL,
    "cescompteinex" FLOAT NOT NULL,
    "cescomptecap" FLOAT NOT NULL,
    "cescomptecapillaire" FLOAT NOT NULL,
    "cformatvideojet" SMALLINT NOT NULL,
    "bulletinspecial" SMALLINT NOT NULL,
    "cgazargon3" FLOAT NOT NULL,
    "cgazargon4" FLOAT NOT NULL,
    "cgazargon5" FLOAT NOT NULL,
    "cgazargon6" FLOAT NOT NULL,
    "videojet" VARCHAR(2) NOT NULL,
    "ctransfertspecial" SMALLINT NOT NULL,
    "cactivationchampspecuaix" SMALLINT NOT NULL,
    "cforme99defaut" SMALLINT NOT NULL,
    "cimprimecarrelagenon" SMALLINT NOT NULL,
    "surcharge" SMALLINT NOT NULL,
    "cdelaidegrace" SMALLINT NOT NULL,
    "cintercallaire" SMALLINT NOT NULL,
    "cachatminimum" FLOAT NOT NULL,
    "ctransport" FLOAT NOT NULL,
    "categorie" VARCHAR(2) NOT NULL,
    "ckilomatre" SMALLINT NOT NULL,
    "cimpvideojetnon" SMALLINT NOT NULL,
    "csurchargebase" FLOAT NOT NULL,
    "csurchargeverreunite" FLOAT NOT NULL,
    "cnomcourt" VARCHAR(20) NOT NULL,
    "cspacerdefaut" VARCHAR(2) NOT NULL,
    "cminimuma" FLOAT NOT NULL,
    "cminimumm" FLOAT NOT NULL,
    "CImpressionAngMet" SMALLINT NOT NULL,
    "CalculCarrPied" BIT NOT NULL,
    "cDateDerniereListe" DATE NOT NULL,
    "ccourrielFacture" VARCHAR(50) NOT NULL,
    "cQteSpecialeContour" BIT NOT NULL,
    "CLangue" SMALLINT NOT NULL,
    "cminimuma3" FLOAT NOT NULL,
    "Cminimuma4" FLOAT NOT NULL,
    "cminimuma5" FLOAT NOT NULL,
    "cminimuma6" FLOAT NOT NULL,
    "cminimumm3" FLOAT NOT NULL,
    "cminimumm4" FLOAT NOT NULL,
    "cminimumm5" FLOAT NOT NULL,
    "cminimumm6" FLOAT NOT NULL,
    "cminimumPeinture" FLOAT NOT NULL,
    "CPrixSpecialPeintureCarrelage" FLOAT NOT NULL,
    "cconfirmation" SMALLINT NOT NULL,
    "Cpourescompte" REAL NOT NULL,
    "ccondpaiement" VARCHAR(30) NOT NULL,
    "Cextracarrelagedemi" REAL NOT NULL,
    "Calculsurfacereelle" BIT NOT NULL,
    "CaDresselivraison" BIT NOT NULL,
    "ccontact" VARCHAR(50) NOT NULL,
    "ccontacttitre" VARCHAR(25) NOT NULL,
    "ccontactTel" VARCHAR(25) NOT NULL,
    "cBolqueLivraison" BIT NOT NULL,
    "ccourrielBonLivraison" VARCHAR(50) NOT NULL,
    "ccourrielConfirmation" VARCHAR(50) NOT NULL,
    "LivraisonPourVideojet" BIT NOT NULL,
    "Csurchargecarrelage" REAL NOT NULL,
    "Csurchargeforme" REAL NOT NULL,
    "surchargeverreunite" BIT NOT NULL,
    "SUrchargecarrelage" BIT NOT NULL,
    "SUrchargeforme" BIT NOT NULL,
    "CourrielListePrix" VARCHAR(50) NOT NULL,
    "cetat" SMALLINT NOT NULL,
    "dateDerniereCommande" DATE NOT NULL,
    "DateMiseInactif" DATE NOT NULL,
    "cminimumatrempe" FLOAT NOT NULL,
    "cminimummtrempe" FLOAT NOT NULL,
    "IDTaxeGroupe" INTEGER NOT NULL,
    "cInterurbain" BIT NOT NULL,
    "Cscellant" SMALLINT NOT NULL,
    "cmessage" LONGVARCHAR NOT NULL,
    "cRapportLivraisonDetaille" BIT NOT NULL,
    "cvendeur" INTEGER NOT NULL,
    "cfacture" SMALLINT NOT NULL,
    "CSurchargeTauxBase" REAL NOT NULL,
    "CSurchargeTauxVerreUnite" REAL NOT NULL,
    "CSurchargeTauxCarrelage" REAL NOT NULL,
    "CSurchargeTauxForme" REAL NOT NULL,
    "SUrchargeTaux" BIT NOT NULL,
    "SUrchargeTauxCarrelage" BIT NOT NULL,
    "SUrchargeTauxVerreUnite" BIT NOT NULL,
    "SurchargeTauxForme" BIT NOT NULL,
    "ediType" SMALLINT NOT NULL,
    "limiteCredit" FLOAT NOT NULL,
    "Soldefacture" FLOAT NOT NULL,
    "TotalCommande" FLOAT NOT NULL,
    "TYpeQuestionCredit" SMALLINT NOT NULL,
    "dateLimite" DATE NOT NULL,
    "SoldeDisponible" FLOAT NOT NULL,
    "IDHeuresOuverture" INTEGER NOT NULL,
    "DateDeReference" DATE NOT NULL,
    "Frequence" SMALLINT NOT NULL,
    "IdDefaultCamion" INTEGER NOT NULL,
    "IDLoadingType" NUMERIC(19,0) NOT NULL,
    "cUnitemesureImpression" SMALLINT NOT NULL,
    "DateAdhesion" DATE NOT NULL,
    "Note" LONGVARCHAR NOT NULL,
    "GroupShippingBill" BIT NOT NULL);
CREATE INDEX "WDIDX_client_nom" ON "client" ("nom");
CREATE INDEX "WDIDX_client_secteur" ON "client" ("secteur");
CREATE INDEX "WDIDX_client_cetat" ON "client" ("cetat");
CREATE INDEX "WDIDX_client_IDTaxeGroupe" ON "client" ("IDTaxeGroupe");
CREATE INDEX "WDIDX_client_cvendeur" ON "client" ("cvendeur");
CREATE INDEX "WDIDX_client_IDHeuresOuverture" ON "client" ("IDHeuresOuverture");
CREATE INDEX "WDIDX_client_numerocetat" ON "client" ("numero","cetat");

-- Création de la table ClientComposanteInterdite
CREATE TABLE "ClientComposanteInterdite" (
    "IDClientComposanteInterdite" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "CustomerID" NUMERIC(19,0),
    "ProductNumber" VARCHAR(10),
    "ProductDescription" VARCHAR(50));
CREATE INDEX "WDIDX_ClientComposanteInterdite_CustomerIDProductNumber" ON "ClientComposanteInterdite" ("CustomerID","ProductNumber");

-- Création de la table ClientGarantie
CREATE TABLE "ClientGarantie" (
    "IDClientGarantie" INTEGER PRIMARY KEY NOT NULL,
    "IDclient" INTEGER NOT NULL,
    "Idgarantie" INTEGER NOT NULL,
    "date" DATE NOT NULL,
    "DateFin" DATE NOT NULL);
CREATE INDEX "WDIDX_ClientGarantie_IDclient" ON "ClientGarantie" ("IDclient");
CREATE INDEX "WDIDX_ClientGarantie_Idgarantie" ON "ClientGarantie" ("Idgarantie");
CREATE INDEX "WDIDX_ClientGarantie_IDclientIdgarantie" ON "ClientGarantie" ("IDclient","Idgarantie");

-- Création de la table ClientLivraison
CREATE TABLE "ClientLivraison" (
    "IDClientLivraison" INTEGER PRIMARY KEY NOT NULL,
    "lNom" VARCHAR(50) NOT NULL,
    "lRue" VARCHAR(50) NOT NULL,
    "lVille" VARCHAR(50) NOT NULL,
    "lprovince" VARCHAR(50) NOT NULL,
    "lCodePostal" VARCHAR(10) NOT NULL,
    "lContact" VARCHAR(50) NOT NULL,
    "idclient" VARCHAR(10) NOT NULL,
    "ltelephone" VARCHAR(12) NOT NULL,
    "lDefaut" BIT NOT NULL,
    "lNumeroVideojet" VARCHAR(2) NOT NULL,
    "Identifiant" VARCHAR(20) NOT NULL,
    "Note" LONGVARCHAR NOT NULL,
    "lJourCamionMaster" BIT NOT NULL,
    "Frequences" SMALLINT NOT NULL,
    "DateDeReference" DATE NOT NULL,
    "EstPickUp" BIT NOT NULL,
    "IdDefaultCamion" INTEGER NOT NULL,
    "IDLoadingType" NUMERIC(19,0) NOT NULL);
CREATE INDEX "WDIDX_ClientLivraison_lNom" ON "ClientLivraison" ("lNom");
CREATE INDEX "WDIDX_ClientLivraison_idclient" ON "ClientLivraison" ("idclient");
CREATE INDEX "WDIDX_ClientLivraison_IDClientLivraisonIdentifiant" ON "ClientLivraison" ("idclient","Identifiant");

-- Création de la table ClientLivraisonFrequence
CREATE TABLE "ClientLivraisonFrequence" (
    "IDClientLivraisonFrequence" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "IDClientLivraison" INTEGER,
    "IDSaisonLivraison" NUMERIC(19,0),
    "Frequence" SMALLINT,
    "DateDeReference" DATE);
CREATE INDEX "WDIDX_ClientLivraisonFrequence_IDClientLivraison" ON "ClientLivraisonFrequence" ("IDClientLivraison");
CREATE INDEX "WDIDX_ClientLivraisonFrequence_IDClientLivraisonIDSaisonLivraison" ON "ClientLivraisonFrequence" ("IDClientLivraison","IDSaisonLivraison");

-- Création de la table clitmp
CREATE TABLE "clitmp" (
    "C1CLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "c1numero" VARCHAR(10) NOT NULL UNIQUE,
    "c1nom" VARCHAR(45) NOT NULL,
    "c1rue" VARCHAR(45) NOT NULL,
    "c1ville" VARCHAR(45) NOT NULL,
    "c1province" VARCHAR(20) NOT NULL,
    "c1pays" VARCHAR(20) NOT NULL,
    "c1codepostal" VARCHAR(7) NOT NULL,
    "c1telephone" VARCHAR(12) NOT NULL,
    "c1fax" VARCHAR(12) NOT NULL,
    "c1email" VARCHAR(50) NOT NULL);
CREATE INDEX "WDIDX_clitmp_c1nom" ON "clitmp" ("c1nom");

-- Création de la table CommandeAchat
CREATE TABLE "CommandeAchat" (
    "IDCommandeAchat" INTEGER PRIMARY KEY NOT NULL,
    "CaNumero" NUMERIC(10,0) NOT NULL UNIQUE,
    "CaDate" DATE NOT NULL,
    "CaFournisseur" VARCHAR(15) NOT NULL,
    "CaEtat" SMALLINT NOT NULL,
    "CaNote" VARCHAR(240) NOT NULL,
    "CaDateprevu" DATE NOT NULL,
    "CaPreparePar" VARCHAR(50) NOT NULL,
    "CanoCommande" VARCHAR(10) NOT NULL,
    "CaNomFournisseur" VARCHAR(50) NOT NULL,
    "CaRecuPartiel" BIT NOT NULL,
    "CaFermeExterieur" BIT NOT NULL,
    "CaThermosVerre" VARCHAR(1) NOT NULL,
    "caSended" BIT NOT NULL,
    "caCommentaire" VARCHAR(50) NOT NULL);
CREATE INDEX "WDIDX_CommandeAchat_CaDate" ON "CommandeAchat" ("CaDate");
CREATE INDEX "WDIDX_CommandeAchat_CaFournisseur" ON "CommandeAchat" ("CaFournisseur");
CREATE INDEX "WDIDX_CommandeAchat_CaNote" ON "CommandeAchat" ("CaNote");
CREATE INDEX "WDIDX_CommandeAchat_CaDateprevu" ON "CommandeAchat" ("CaDateprevu");
CREATE INDEX "WDIDX_CommandeAchat_CanoCommande" ON "CommandeAchat" ("CanoCommande");
CREATE INDEX "WDIDX_CommandeAchat_CaNomFournisseur" ON "CommandeAchat" ("CaNomFournisseur");
CREATE INDEX "WDIDX_CommandeAchat_CaRecuPartiel" ON "CommandeAchat" ("CaRecuPartiel");

-- Création de la table CommandeAchatDessin
CREATE TABLE "CommandeAchatDessin" (
    "IDCommandeAchatDessin" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "IDCommandeAchat" INTEGER,
    "Dessin" LONGVARBINARY,
    "Master" BIT,
    "FileDescription" VARCHAR(50));
CREATE INDEX "WDIDX_CommandeAchatDessin_IDCommandeAchat" ON "CommandeAchatDessin" ("IDCommandeAchat");
CREATE INDEX "WDIDX_CommandeAchatDessin_Master" ON "CommandeAchatDessin" ("Master");
CREATE INDEX "WDIDX_CommandeAchatDessin_IDCommandeAchatMaster" ON "CommandeAchatDessin" ("IDCommandeAchat","Master");

-- Création de la table CommandeAchatDetail
CREATE TABLE "CommandeAchatDetail" (
    "IDCommandeAchatDetail" INTEGER PRIMARY KEY NOT NULL,
    "cadNoProduit" VARCHAR(20) NOT NULL,
    "cadQte" FLOAT NOT NULL,
    "cadCout" FLOAT NOT NULL,
    "cadDescription" VARCHAR(250) NOT NULL,
    "IDCommandeAchat" INTEGER NOT NULL,
    "cNoLigne" INTEGER NOT NULL,
    "cadTotalLigne" FLOAT NOT NULL,
    "canoProdFrn" VARCHAR(20) NOT NULL,
    "caDescProdFrn" VARCHAR(50) NOT NULL,
    "cadQteRecue" FLOAT NOT NULL,
    "StickerDescriptionEDIRV" VARCHAR(30) NOT NULL,
    "QtyEDIRV" NUMERIC(10,0) NOT NULL,
    "ThermosWidthEDIRV" VARCHAR(5) NOT NULL,
    "ThermosHeightEDIRV" VARCHAR(5) NOT NULL,
    "ThermosFinishEDIRV" VARCHAR(10) NOT NULL,
    "ThermosCodeEDIRV" VARCHAR(30) NOT NULL,
    "ThermosSpacerEDIRV" VARCHAR(20) NOT NULL,
    "GridDescriptionEDIRV" VARCHAR(30) NOT NULL,
    "GrillWidthEDIRV" VARCHAR(2) NOT NULL,
    "GrillHeightEDIRV" VARCHAR(2) NOT NULL,
    "GrillPaintEDIRV" VARCHAR(30) NOT NULL,
    "GrillTypeEDIRV" VARCHAR(10) NOT NULL,
    "GrillDTH" VARCHAR(10) NOT NULL,
    "NoteEDIRV" VARCHAR(64) NOT NULL,
    "BarrotinEDIRV" VARCHAR(20) NOT NULL,
    "WithShape" BIT NOT NULL);
CREATE INDEX "WDIDX_CommandeAchatDetail_IDCommandeAchat" ON "CommandeAchatDetail" ("IDCommandeAchat");
CREATE INDEX "WDIDX_CommandeAchatDetail_IDCommandeAchatcNoLigne" ON "CommandeAchatDetail" ("IDCommandeAchat","cNoLigne");

-- Création de la table compagni
CREATE TABLE "compagni" (
    "SOCLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "NOSiret" VARCHAR(17) NOT NULL,
    "CEEIDENT" VARCHAR(20) NOT NULL,
    "MotPasse" VARCHAR(10) NOT NULL,
    "DateDebut" DATE NOT NULL,
    "DateFin" DATE NOT NULL,
    "SAUVEGARDE" SMALLINT NOT NULL,
    "NomSociete" VARCHAR(40) NOT NULL,
    "Adresse" VARCHAR(80) NOT NULL,
    "CodePostal" VARCHAR(5) NOT NULL,
    "Ville" VARCHAR(50) NOT NULL,
    "Telephone" VARCHAR(20) NOT NULL,
    "FAX" VARCHAR(20) NOT NULL,
    "Email" VARCHAR(41) NOT NULL);
CREATE INDEX "WDIDX_compagni_NOSiret" ON "compagni" ("NOSiret");
CREATE INDEX "WDIDX_compagni_CEEIDENT" ON "compagni" ("CEEIDENT");
CREATE INDEX "WDIDX_compagni_CodePostal" ON "compagni" ("CodePostal");

-- Création de la table config
CREATE TABLE "config" (
    "COCLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "NomCompagnie" VARCHAR(30) NOT NULL,
    "RueCompagnie" VARCHAR(30) NOT NULL,
    "VilleCompagnie" VARCHAR(30) NOT NULL,
    "CodePostalCompagnie" VARCHAR(7) NOT NULL,
    "TelephoneCompagnie" VARCHAR(12) NOT NULL,
    "FaxCompagnie" VARCHAR(12) NOT NULL,
    "EmailCompagnie" VARCHAR(30) NOT NULL,
    "SiteWebCompagnie" VARCHAR(30) NOT NULL,
    "NumFact" INTEGER NOT NULL,
    "DossierComptabilite" VARCHAR(150) NOT NULL,
    "DossierData" VARCHAR(150) NOT NULL,
    "Numcomm" INTEGER NOT NULL,
    "imprimantefacture" VARCHAR(30) NOT NULL,
    "imprimanteetiquette" VARCHAR(30) NOT NULL,
    "imprimanterapport" VARCHAR(30) NOT NULL,
    "conversionam" REAL NOT NULL,
    "conversionma" REAL NOT NULL,
    "intercallaireinexd" REAL NOT NULL,
    "intercallaireinext" REAL NOT NULL,
    "intercallaireinexnd" REAL NOT NULL,
    "intercallaireinexnt" REAL NOT NULL,
    "gazargond" REAL NOT NULL,
    "gazargont" REAL NOT NULL,
    "capd" REAL NOT NULL,
    "capt" REAL NOT NULL,
    "capillaired" REAL NOT NULL,
    "capillairet" REAL NOT NULL,
    "texteinex" VARCHAR(10) NOT NULL,
    "texteinexnoir" VARCHAR(10) NOT NULL,
    "textecap" VARCHAR(10) NOT NULL,
    "textegaz" VARCHAR(10) NOT NULL,
    "textecapillaire" VARCHAR(10) NOT NULL,
    "tauxtps" REAL NOT NULL,
    "tauxtvq" REAL NOT NULL,
    "glventedefaut" VARCHAR(10) NOT NULL,
    "gltps" VARCHAR(10) NOT NULL,
    "gltvq" VARCHAR(10) NOT NULL,
    "DossierOptimisation" VARCHAR(150) NOT NULL,
    "vjthermafix" VARCHAR(20) NOT NULL,
    "vjstnazaire" VARCHAR(20) NOT NULL,
    "vjindcover" VARCHAR(20) NOT NULL,
    "vjlw" VARCHAR(20) NOT NULL,
    "vjz" VARCHAR(20) NOT NULL,
    "vjintercallaire" SMALLINT NOT NULL,
    "vjvariable1" VARCHAR(20) NOT NULL,
    "vjvariable2" VARCHAR(20) NOT NULL,
    "vjvariable3" VARCHAR(20) NOT NULL,
    "vjvariable4" VARCHAR(20) NOT NULL,
    "vjclient" SMALLINT NOT NULL,
    "vjclientjust" SMALLINT NOT NULL,
    "vjnumcommclient" SMALLINT NOT NULL,
    "vjnumcommclientjust" SMALLINT NOT NULL,
    "vjnumcommthermafix" SMALLINT NOT NULL,
    "vjnumcommthermafixjust" SMALLINT NOT NULL,
    "numeropreparation" INTEGER NOT NULL,
    "canneeencoursdebut" DATE NOT NULL,
    "canneeencoursfin" DATE NOT NULL,
    "cformatdedate" VARCHAR(10) NOT NULL,
    "cenergiethermos" FLOAT NOT NULL,
    "cenergieverre" FLOAT NOT NULL,
    "nombredejour" SMALLINT NOT NULL,
    "dimensionmaxanglais" FLOAT NOT NULL,
    "dimensionmaximetrique" FLOAT NOT NULL,
    "surchargebase" FLOAT NOT NULL,
    "surchargeadd" FLOAT NOT NULL,
    "surchargeverreunite" FLOAT NOT NULL,
    "surchargeactive" SMALLINT NOT NULL,
    "surchargedescription" VARCHAR(75) NOT NULL,
    "surchargegl" VARCHAR(10) NOT NULL,
    "transportdesc" VARCHAR(30) NOT NULL,
    "trasportgl" VARCHAR(10) NOT NULL,
    "formulecontour" VARCHAR(40) NOT NULL,
    "formulesemicontour" VARCHAR(40) NOT NULL,
    "secteurcredit" INTEGER NOT NULL,
    "cArrAnglais" INTEGER NOT NULL,
    "cArrMet" INTEGER NOT NULL,
    "cArrDefaut" SMALLINT NOT NULL,
    "Cnbmilcap" INTEGER NOT NULL,
    "calculcapactif" BIT NOT NULL,
    "CheminTrsfVidéojet" VARCHAR(150) NOT NULL,
    "Supprimelot" BIT NOT NULL,
    "NumBL" INTEGER NOT NULL,
    "Taxedescription" VARCHAR(15) NOT NULL,
    "TaxeTaux" REAL NOT NULL,
    "ToleranceMilli" INTEGER NOT NULL,
    "FichierThermosCommun" BIT NOT NULL,
    "Dossierforme" VARCHAR(150) NOT NULL,
    "nbcopiefacture" INTEGER NOT NULL,
    "nbcopieBlivraison" INTEGER NOT NULL,
    "LienAcomba" SMALLINT NOT NULL,
    "texteigma" VARCHAR(10) NOT NULL,
    "CapGL" VARCHAR(7) NOT NULL,
    "ExtraFormeGL" VARCHAR(7) NOT NULL,
    "CfNomConstante" VARCHAR(50) NOT NULL,
    "ServeurSMTP" VARCHAR(50) NOT NULL,
    "EmailGestionErreur" VARCHAR(50) NOT NULL,
    "ProchainErreur" NUMERIC(10,0) NOT NULL,
    "SujetFrancais" VARCHAR(50) NOT NULL,
    "SujetAnglais" VARCHAR(50) NOT NULL,
    "TexteFrancais" VARCHAR(500) NOT NULL,
    "TexteAnglais" VARCHAR(500) NOT NULL,
    "DossierFichierPDF" VARCHAR(150) NOT NULL,
    "descriptionFourniture" VARCHAR(20) NOT NULL,
    "Cformulegaz" VARCHAR(100) NOT NULL,
    "CFormulecap" VARCHAR(100) NOT NULL,
    "cProduitAssocieGaz" VARCHAR(10) NOT NULL,
    "cProduitAssocieCap" VARCHAR(10) NOT NULL,
    "cHauteurTest" INTEGER NOT NULL,
    "cLargeurTest" INTEGER NOT NULL,
    "CDefautFourniture" VARCHAR(10) NOT NULL,
    "CMDO" REAL NOT NULL,
    "CMDOformule" VARCHAR(100) NOT NULL,
    "CFournitureAutre" REAL NOT NULL,
    "cFournitureAutreFormule" VARCHAR(100) NOT NULL,
    "cPourcPerteVerre" REAL NOT NULL,
    "cPourcPerteCarrelage" REAL NOT NULL,
    "cPourcPerteSpacer" REAL NOT NULL,
    "CFraisGeneraux" REAL NOT NULL,
    "CFraisGenerauxFormule" VARCHAR(100) NOT NULL,
    "cUniteMDO" SMALLINT NOT NULL,
    "cUniteFRG" SMALLINT NOT NULL,
    "cUniteAut" SMALLINT NOT NULL,
    "cMDOCarrelage" REAL NOT NULL,
    "cMDOFormuleCarrelage" VARCHAR(100) NOT NULL,
    "cUniteMDOCarrelage" SMALLINT NOT NULL,
    "cNbCarreauL" SMALLINT NOT NULL,
    "cNbCarreauH" SMALLINT NOT NULL,
    "NumCF" NUMERIC(10,0) NOT NULL,
    "cMDOM" REAL NOT NULL,
    "cMDOcarrelageM" REAL NOT NULL,
    "cFraisgenerauxM" REAL NOT NULL,
    "cFournitureAutreM" REAL NOT NULL,
    "conversionamlineaire" REAL NOT NULL,
    "NoTaxeCompagnie" VARCHAR(20) NOT NULL,
    "AenleverInex" INTEGER NOT NULL,
    "AenleverInexArgon" INTEGER NOT NULL,
    "AenleverAlu" INTEGER NOT NULL,
    "AenleverAluArgon" INTEGER NOT NULL,
    "prixMinimumPeinture" FLOAT NOT NULL,
    "ImpressionFeuilleTravail" SMALLINT NOT NULL,
    "ValeurAlum" INTEGER NOT NULL,
    "LongueurbarreCarrelageA" REAL NOT NULL,
    "LongueurbarreCarrelageM" REAL NOT NULL,
    "glTVH" VARCHAR(10) NOT NULL,
    "Province" SMALLINT NOT NULL,
    "SUrchargeSurForme" BIT NOT NULL,
    "GlPeinturecarrelage" VARCHAR(10) NOT NULL,
    "NoTvqCompagnie" VARCHAR(20) NOT NULL,
    "NoGlrecevable" VARCHAR(10) NOT NULL,
    "NoGlPeinture" VARCHAR(10) NOT NULL,
    "DescSurchargePeinture" VARCHAR(50) NOT NULL,
    "Exception5" REAL NOT NULL,
    "Exception10" REAL NOT NULL,
    "lMaxCote" REAL NOT NULL,
    "SmaxDouble" REAL NOT NULL,
    "SmaxTriple" REAL NOT NULL,
    "AffichageCoutantOuTotal" SMALLINT NOT NULL,
    "cDoubleScellant" REAL NOT NULL,
    "Exception5desc" VARCHAR(30) NOT NULL,
    "Exception10Desc" VARCHAR(30) NOT NULL,
    "NbCopieFactureCourriel" SMALLINT NOT NULL,
    "NbCopieBlivraisonCourriel" SMALLINT NOT NULL,
    "NbCopieConfirmation" SMALLINT NOT NULL,
    "NbCopieConfirmationCourriel" SMALLINT NOT NULL,
    "CheminTrsfCarrelage" VARCHAR(150) NOT NULL,
    "SupprimeLotCarrelage" BIT NOT NULL,
    "cMotDePasseSpecial" VARCHAR(10) NOT NULL,
    "SUrchargeforme" INTEGER NOT NULL,
    "SUrchargecarrelage" REAL NOT NULL,
    "NbJourPdf" INTEGER NOT NULL,
    "NbJourLogFile" INTEGER NOT NULL,
    "ImprimeCondPmt" BIT NOT NULL,
    "TableSpacerAngMet" SMALLINT NOT NULL,
    "cDoubleScellantA" REAL NOT NULL,
    "ActiveSecurite" BIT NOT NULL,
    "MaxCase" INTEGER NOT NULL,
    "TimeOutEmail" INTEGER NOT NULL,
    "NoClientComptant" VARCHAR(10) NOT NULL,
    "MaxQteClair1300Plus" SMALLINT NOT NULL,
    "MaxQteClair1300Moins" SMALLINT NOT NULL,
    "MaxQteHER1300Plus" SMALLINT NOT NULL,
    "MaxQteHER1300Moins" SMALLINT NOT NULL,
    "MaxQteTableSiIdentique" SMALLINT NOT NULL,
    "MaxQteTriDeux" SMALLINT NOT NULL,
    "DimensionAverifierPrep" INTEGER NOT NULL,
    "EcartHauteur" INTEGER NOT NULL,
    "EcartLargeur" INTEGER NOT NULL,
    "cDoubleScellantTous" BIT NOT NULL,
    "cDoubleScellantAI" REAL NOT NULL,
    "cDoubleScellantMI" REAL NOT NULL,
    "cDoubleScellantAT" REAL NOT NULL,
    "cDoubleScellantMT" REAL NOT NULL,
    "AEnleverICN" INTEGER NOT NULL,
    "AEnleverICNArgon" INTEGER NOT NULL,
    "DimensionThermosTop" INTEGER NOT NULL,
    "EcartHauteurTriFinal" INTEGER NOT NULL,
    "EcartLargeurTriFinal" INTEGER NOT NULL,
    "vAleurICN" INTEGER NOT NULL,
    "NomCompagnie2" VARCHAR(30) NOT NULL,
    "cDoubleScellantMS" REAL NOT NULL,
    "cDoubleScellantAS" REAL NOT NULL,
    "Exception5desca" VARCHAR(30) NOT NULL,
    "Exception10desca" VARCHAR(30) NOT NULL,
    "DescSurchargePeinturea" VARCHAR(50) NOT NULL,
    "ValeurArgon" INTEGER NOT NULL,
    "VariableIntercalaire1" VARCHAR(10) NOT NULL,
    "VariableIntercalaire2" VARCHAR(10) NOT NULL,
    "VariableIntercalaire3" VARCHAR(10) NOT NULL,
    "VariableIntercalaire4" VARCHAR(10) NOT NULL,
    "VariableIntercalaire5" VARCHAR(10) NOT NULL,
    "TexteBasConfirmation" LONGVARCHAR NOT NULL,
    "lienDemiThermos" VARCHAR(10) NOT NULL,
    "CMessageAjout" BIT NOT NULL,
    "CMessageModification" BIT NOT NULL,
    "textebaspage1listeprix" LONGVARCHAR NOT NULL,
    "textebaspageformelisteprix" LONGVARCHAR NOT NULL,
    "SUrchargeTauxActive" BIT NOT NULL,
    "SurChargeTauxBase" REAL NOT NULL,
    "SUrchargeTauxDescription" VARCHAR(75) NOT NULL,
    "SUrchargeTauxGl" VARCHAR(10) NOT NULL,
    "TexteBasConfirmationAnglais" LONGVARCHAR NOT NULL,
    "TexteBasPage1ListePrixAnglais" LONGVARCHAR NOT NULL,
    "TexteBasPageFormeListePrixAnglais" LONGVARCHAR NOT NULL,
    "ratioDoubleTripleForme" REAL NOT NULL,
    "calculTauxSurSurcharge" BIT NOT NULL,
    "message1" LONGVARCHAR NOT NULL,
    "message2" LONGVARCHAR NOT NULL,
    "message3" LONGVARCHAR NOT NULL,
    "UserSMTP" VARCHAR(50) NOT NULL,
    "MdpSMTP" VARCHAR(50) NOT NULL,
    "EmailCommandeAchat" VARCHAR(30) NOT NULL,
    "EmailListePrix" VARCHAR(30) NOT NULL,
    "EmailFacture" VARCHAR(30) NOT NULL,
    "EmailConfirmation" VARCHAR(30) NOT NULL,
    "EmailBonLivraison" VARCHAR(30) NOT NULL,
    "EmailSoumission" VARCHAR(30) NOT NULL,
    "EmailSpacer1" VARCHAR(50) NOT NULL,
    "EmailSpacer2" VARCHAR(50) NOT NULL,
    "EmailSpacer3" VARCHAR(50) NOT NULL,
    "EmailSpacer4" VARCHAR(50) NOT NULL,
    "EmailSpacer5" VARCHAR(50) NOT NULL,
    "EmailSpacer6" VARCHAR(50) NOT NULL,
    "EmailSpacer7" VARCHAR(50) NOT NULL,
    "EmailSpacer8" VARCHAR(50) NOT NULL,
    "CheminPdfSpacer" VARCHAR(100) NOT NULL,
    "AdresseWebService" VARCHAR(50) NOT NULL,
    "SujetSpacer" VARCHAR(50) NOT NULL,
    "TexteSpacer" VARCHAR(500) NOT NULL,
    "EmailPreparation" VARCHAR(30) NOT NULL,
    "LienExtraArgon" VARCHAR(10) NOT NULL,
    "LienExtraWarranty" VARCHAR(10) NOT NULL,
    "BascoUser" VARCHAR(20) NOT NULL,
    "BascoPassWord" VARCHAR(20) NOT NULL,
    "BascoFTPAddress" VARCHAR(50) NOT NULL,
    "SupportName" VARCHAR(30) NOT NULL,
    "SupportPhoneNumber" VARCHAR(14) NOT NULL,
    "SupportEmail" VARCHAR(50) NOT NULL,
    "NIR" VARCHAR(25) NOT NULL,
    "ComponentPositionForPrep" BIT NOT NULL);

-- Création de la table ConfigSurveillance
CREATE TABLE "ConfigSurveillance" (
    "IDConfigSurveillance" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "Intervalle" INTEGER,
    "NbJours" INTEGER,
    "JourDepart" SMALLINT,
    "PremierNiveau_HotMelt" NUMERIC(10,0),
    "COULEUR_hotMelt_N1" NUMERIC(10,0),
    "DeuxiemeNiveau_HotMel" NUMERIC(10,0),
    "COULEUR_HotMelt_N2" NUMERIC(10,0),
    "PremierNiveau_Polyurethane" NUMERIC(10,0),
    "COULEUR_Polyurethane_N1" NUMERIC(10,0),
    "DeuxiemeNiveau_Polyurethane" NUMERIC(10,0),
    "COULEUR_Polyurethane_N2" NUMERIC(10,0),
    "PremierNiveau_Total" NUMERIC(10,0),
    "COULEUR_Total_N1" NUMERIC(10,0),
    "DeuxiemeNiveau_Total" NUMERIC(10,0),
    "COULEUR_Total_N2" NUMERIC(10,0),
    "Exclusion" VARCHAR(300),
    "Trempe" VARCHAR(300),
    "Couleur_20Pi2_N1" NUMERIC(10,0),
    "Couleur_20Pi2_N2" NUMERIC(10,0),
    "PremierNiveau_20Pi2" NUMERIC(10,0),
    "DeuxiemeNiveau_20Pi2" NUMERIC(10,0),
    "PremierNiveauTT" INTEGER,
    "CouleurTT_n1" INTEGER,
    "DeuxiemeNiveauTT" INTEGER,
    "CouleurTT_n2" INTEGER,
    "PremierNiveau_16pi2" NUMERIC(10,0),
    "Couleur_16Pi2_n1" NUMERIC(10,0),
    "Couleur_16Pi2_n2" NUMERIC(10,0),
    "TrempePietage" VARCHAR(300),
    "DeuxiemeNiveau_16Pi2" NUMERIC(10,0));

-- Création de la table Cotation
CREATE TABLE "Cotation" (
    "IDCotation" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "CotationNumber" VARCHAR(12),
    "CotationDate" DATE,
    "Notes" LONGVARCHAR,
    "IsDeleted" BIT,
    "Identification" VARCHAR(100),
    "IdCustomer" NUMERIC(20,0),
    "CotationTotal" NUMERIC(24,6),
    "CalculType" VARCHAR(1),
    "FifteenYearsWarrantyTotal" NUMERIC(24,6),
    "ExtraArgonGazTotal" NUMERIC(24,6),
    "Jobnumber" VARCHAR(25),
    "FifteenYearsWarrantyBilledSurface" REAL,
    "ArgonGazBilledSurface" REAL,
    "EnergyOverCharge" NUMERIC(24,6),
    "CustomerCotation" LONGVARBINARY,
    "CustomerCotationExist" BIT,
    "ThermosCotationRate" REAL,
    "TemperedThermosCotationrate" REAL,
    "GridCotationRate" REAL,
    "ShapeCotationrate" REAL,
    "PaintCotationrate" REAL,
    "CotationNote" LONGVARCHAR,
    "CotationHourNumber" REAL,
    "TotalInstallation" NUMERIC(24,6),
    "TaxGroup" SMALLINT,
    "AdditionalDiscount" NUMERIC(24,6) NOT NULL);
CREATE INDEX "WDIDX_Cotation_Identification" ON "Cotation" ("Identification");
CREATE INDEX "WDIDX_Cotation_IdCustomer" ON "Cotation" ("IdCustomer");

-- Création de la table CotationDetails
CREATE TABLE "CotationDetails" (
    "IDCotationDetails" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "ThermosCode" VARCHAR(10),
    "ThermosDescription" VARCHAR(50),
    "SpacerType" VARCHAR(20),
    "SpacerDimension" VARCHAR(10),
    "Finish" VARCHAR(10),
    "ThermosHeight" VARCHAR(10),
    "ThermosWidth" VARCHAR(10),
    "Pane1" VARCHAR(10),
    "Pane2" VARCHAR(10),
    "Pane3" VARCHAR(10),
    "GridCode" VARCHAR(15),
    "GridBase" SMALLINT,
    "Gridheight" SMALLINT,
    "GridHalfThermos" BIT,
    "IDCotation" NUMERIC(19,0),
    "IsDeleted" BIT,
    "Quantity" INTEGER,
    "GridDescription" VARCHAR(50),
    "InteriorColorCode" VARCHAR(15),
    "InteriorColorDescription" VARCHAR(50),
    "exteriorColorCode" VARCHAR(15),
    "ExteriorColorDescription" VARCHAR(50),
    "DrawingType" VARCHAR(50),
    "NumberOfTiles" SMALLINT,
    "ShapeCode" VARCHAR(3),
    "Surface" FLOAT,
    "EnergySurcharge" NUMERIC(24,6),
    "Price5X" NUMERIC(24,6),
    "Price10X" NUMERIC(24,6),
    "PriceShape" NUMERIC(24,6),
    "ThermosUnitPrice" NUMERIC(24,6),
    "ShapeUnitPrice" NUMERIC(24,6),
    "ShapeDescription" VARCHAR(50),
    "TotalThermosPrice" NUMERIC(24,6),
    "GridTilePrice" NUMERIC(24,6),
    "GridBaseprice" NUMERIC(24,6),
    "GridUnitPrice" NUMERIC(24,6),
    "PaintUnitPrice" NUMERIC(24,6),
    "Pane1description" VARCHAR(50),
    "pane2description" VARCHAR(50),
    "Pane3description" VARCHAR(50),
    "BilledSurface" FLOAT,
    "SquarefeetPrice" NUMERIC(24,6),
    "TotalGridprice" NUMERIC(24,6),
    "NumberOfTilesExt" INTEGER,
    "NumberOfTilesInt" INTEGER,
    "PaintUnitPriceExt" NUMERIC(24,6),
    "PaintUnitpriceInt" NUMERIC(24,6),
    "PaintTilePriceExt" NUMERIC(24,6),
    "PaintTilepriceInt" NUMERIC(24,6),
    "TotalPaintPrice" NUMERIC(24,6),
    "GridType" VARCHAR(10),
    "TotalShapeprice" NUMERIC(24,6),
    "CalculType" VARCHAR(1),
    "HalfGridPrice" NUMERIC(24,6),
    "Width" VARCHAR(10),
    "Width1" VARCHAR(10),
    "Width2" VARCHAR(10),
    "Height" VARCHAR(10),
    "Height1" VARCHAR(10),
    "Height2" VARCHAR(10),
    "Diameter" VARCHAR(10),
    "Radius" VARCHAR(10),
    "Radius1" VARCHAR(10),
    "Radius2" VARCHAR(10),
    "ThermosHeight1" VARCHAR(10),
    "FifteenYearsWarranty" BIT,
    "ExtraGazArgon" BIT,
    "FifteenYearsWarrantyTotal" NUMERIC(24,6),
    "ExtraArgonGazTotal" NUMERIC(24,6),
    "DTH" INTEGER,
    "BarrotinID" INTEGER,
    "GrillNote" LONGVARCHAR,
    "BarrotinDescription" VARCHAR(30),
    "BarrotinPrice" NUMERIC(24,6),
    "ThermosHeightCalculate" VARCHAR(10),
    "ThermosWidthCalculate" VARCHAR(10),
    "BaseProduct" VARCHAR(10),
    "ThermosGL" VARCHAR(10),
    "GridGL" VARCHAR(10),
    "RealSurface" REAL,
    "TemplateToCome" BIT,
    "Withgrid" BIT,
    "Tag" VARCHAR(40),
    "IsEnergyGlass" BIT,
    "IsTemperedGlass" BIT,
    "ThermosHeight1Calculate" VARCHAR(10),
    "SqFeetPriceLock" BIT,
    "GridBasePriceLock" BIT,
    "PaintExtPricelock" BIT,
    "paintIntPricelock" BIT);
CREATE INDEX "WDIDX_CotationDetails_IDCotation" ON "CotationDetails" ("IDCotation");

-- Création de la table CotationdetailSketches
CREATE TABLE "CotationdetailSketches" (
    "IDCotationdetailSketches" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "IDCotation" NUMERIC(19,0),
    "IDCotationDetails" NUMERIC(19,0),
    "LineNumber" INTEGER,
    "SketchImage" LONGVARCHAR,
    "ImageName" VARCHAR(25));
CREATE INDEX "WDIDX_CotationdetailSketches_IDCotation" ON "CotationdetailSketches" ("IDCotation");
CREATE INDEX "WDIDX_CotationdetailSketches_IDCotationDetails" ON "CotationdetailSketches" ("IDCotationDetails");

-- Création de la table coulisse
CREATE TABLE "coulisse" (
    "C2CLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "nbcopie" SMALLINT NOT NULL,
    "Hautetbas" VARCHAR(50) NOT NULL,
    "Poignees" VARCHAR(50) NOT NULL,
    "Teteamovible" VARCHAR(50) NOT NULL,
    "tetefixe" VARCHAR(50) NOT NULL,
    "seuil" VARCHAR(50) NOT NULL,
    "cote" VARCHAR(50) NOT NULL,
    "Moustiquairelargeur" VARCHAR(50) NOT NULL,
    "Moustiquairehauteur" VARCHAR(50) NOT NULL,
    "hautetbasqtebase" SMALLINT NOT NULL,
    "Poigneesqtebase" SMALLINT NOT NULL,
    "Teteamovibleqtebase" SMALLINT NOT NULL,
    "Tetefixeqtebase" SMALLINT NOT NULL,
    "seuilqtebase" SMALLINT NOT NULL,
    "coteqtebase" SMALLINT NOT NULL,
    "Moustlargqtebase" SMALLINT NOT NULL,
    "Mousthautqtebase" SMALLINT NOT NULL,
    "largeurkit" VARCHAR(50) NOT NULL,
    "Hauteurkit" VARCHAR(50) NOT NULL,
    "teinte" VARCHAR(15) NOT NULL,
    "type" VARCHAR(10) NOT NULL,
    "epaisseur" VARCHAR(2) NOT NULL,
    "descriptionkit" VARCHAR(50) NOT NULL);

-- Création de la table CustomerrackNumber
CREATE TABLE "CustomerrackNumber" (
    "IDCustomerrackNumber" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "CurrentRackNumber" INTEGER NOT NULL,
    "NewRackNumber" INTEGER NOT NULL,
    "Rackdate" DATE NOT NULL);
CREATE INDEX "WDIDX_CustomerrackNumber_RackdateCurrentRackNumber" ON "CustomerrackNumber" ("Rackdate","CurrentRackNumber");

-- Création de la table DetailCompta
CREATE TABLE "DetailCompta" (
    "IDDetailCompta" INTEGER PRIMARY KEY NOT NULL,
    "numeroBL" INTEGER NOT NULL,
    "NoGlivre" VARCHAR(7) NOT NULL,
    "MontantGlivre" FLOAT NOT NULL,
    "noLigne" INTEGER NOT NULL,
    "EstTaxe" BIT NOT NULL);
CREATE INDEX "WDIDX_DetailCompta_numeroBL" ON "DetailCompta" ("numeroBL");

-- Création de la table dimcoul
CREATE TABLE "dimcoul" (
    "dnumero" VARCHAR(10) NOT NULL,
    "dlargeura" VARCHAR(10) NOT NULL,
    "dhauteura" VARCHAR(10) NOT NULL,
    "dhauteuraconv" VARCHAR(10) NOT NULL,
    "dlargeuraconv" VARCHAR(10) NOT NULL,
    "dlargeurm" VARCHAR(10) NOT NULL,
    "dhauteurm" VARCHAR(10) NOT NULL,
    "dprix" FLOAT NOT NULL,
    "dprixfutur" FLOAT NOT NULL);
CREATE INDEX "WDIDX_dimcoul_dclea" ON "dimcoul" ("dnumero","dlargeuraconv","dhauteuraconv");
CREATE INDEX "WDIDX_dimcoul_dclem" ON "dimcoul" ("dnumero","dlargeurm","dhauteurm");

-- Création de la table DimensionAlias
CREATE TABLE "DimensionAlias" (
    "DImensionMaitre" VARCHAR(10) NOT NULL UNIQUE,
    "DimensionAlias" VARCHAR(100) NOT NULL);
CREATE INDEX "WDIDX_DimensionAlias_DimensionAlias" ON "DimensionAlias" ("DimensionAlias");

-- Création de la table dimstand
CREATE TABLE "dimstand" (
    "DICLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "slargeurm" VARCHAR(5) NOT NULL,
    "shauteurm" VARCHAR(5) NOT NULL,
    "slargeura" VARCHAR(10) NOT NULL,
    "shauteura" VARCHAR(10) NOT NULL,
    "scarreaul" SMALLINT NOT NULL,
    "scarreauh" SMALLINT NOT NULL,
    "sspacer" VARCHAR(10) NOT NULL,
    "sprixa" FLOAT NOT NULL,
    "sprixm" FLOAT NOT NULL,
    "srack" SMALLINT NOT NULL);
CREATE INDEX "WDIDX_dimstand_cleanglais" ON "dimstand" ("slargeura","shauteura");
CREATE INDEX "WDIDX_dimstand_clemetrique" ON "dimstand" ("slargeurm","shauteurm");

-- Création de la table Dummy
CREATE TABLE "Dummy" (
    "CLIENT" VARCHAR(10),
    "REFERENCE" VARCHAR(9),
    "DATE" DATE,
    "MONTANT" NUMERIC(24,6),
    "TYPEGL" SMALLINT,
    "COMPGL" VARCHAR(6),
    "COUTANT" NUMERIC(24,6));

-- Création de la table EdiRelation
CREATE TABLE "EdiRelation" (
    "IDEdiRelation" INTEGER PRIMARY KEY NOT NULL,
    "noClient" VARCHAR(50),
    "nOmControle" VARCHAR(20),
    "vAleurClient" VARCHAR(50),
    "vAleurInterne" VARCHAR(50));
CREATE INDEX "WDIDX_EdiRelation_noClientnOmControlevAleurClient" ON "EdiRelation" ("noClient","nOmControle","vAleurClient");

-- Création de la table ENSEMBLE
CREATE TABLE "ENSEMBLE" (
    "ENCLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "ennumero" VARCHAR(20) NOT NULL,
    "endescription" VARCHAR(60) NOT NULL,
    "encomposant1" VARCHAR(10) NOT NULL,
    "encomposant2" VARCHAR(10) NOT NULL,
    "encomposant3" VARCHAR(10) NOT NULL,
    "encodegl" VARCHAR(10) NOT NULL,
    "epbase" VARCHAR(10) NOT NULL,
    "elien" VARCHAR(10) NOT NULL,
    "encap" SMALLINT NOT NULL,
    "engaz" SMALLINT NOT NULL,
    "enstandard" SMALLINT NOT NULL,
    "EndescriptionA" VARCHAR(60) NOT NULL);
CREATE INDEX "WDIDX_ENSEMBLE_endescription" ON "ENSEMBLE" ("endescription");
CREATE INDEX "WDIDX_ENSEMBLE_clecomposant" ON "ENSEMBLE" ("encomposant1","encomposant2","encomposant3");
CREATE INDEX "WDIDX_ENSEMBLE_Spqcomposant" ON "ENSEMBLE" ("encomposant1","encomposant2","encomposant3");

-- Création de la table etiqxopt
CREATE TABLE "etiqxopt" (
    "E0CLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "Ligneetiquette" VARCHAR(45) NOT NULL);

-- Création de la table ExternalOrder
CREATE TABLE "ExternalOrder" (
    "IDCotation" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "CotationNumber" VARCHAR(12),
    "CotationDate" DATE,
    "Notes" LONGVARCHAR,
    "IsDeleted" BIT,
    "Identification" VARCHAR(100),
    "IdCustomer" NUMERIC(20,0),
    "CotationTotal" NUMERIC(24,6),
    "CalculType" VARCHAR(1),
    "FifteenYearsWarrantyTotal" NUMERIC(24,6),
    "ExtraArgonGazTotal" NUMERIC(24,6),
    "Sended" BIT,
    "Jobnumber" VARCHAR(25),
    "RequiredDate" DATE,
    "ShippingAddressID" INTEGER,
    "TruckID" INTEGER,
    "FifteenYearsWarrantyBilledSurface" REAL,
    "ArgonGazBilledSurface" REAL,
    "EnergyOverCharge" NUMERIC(24,6),
    "ManualOrderNumber" VARCHAR(25));
CREATE INDEX "WDIDX_ExternalOrder_Identification" ON "ExternalOrder" ("Identification");
CREATE INDEX "WDIDX_ExternalOrder_IdCustomer" ON "ExternalOrder" ("IdCustomer");

-- Création de la table ExternalOrderDetails
CREATE TABLE "ExternalOrderDetails" (
    "IDCotation" NUMERIC(19,0),
    "IDCotationDetails" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "ThermosCode" VARCHAR(10),
    "ThermosDescription" VARCHAR(50),
    "SpacerType" VARCHAR(20),
    "SpacerDimension" VARCHAR(10),
    "Finish" VARCHAR(10),
    "ThermosHeight" VARCHAR(10),
    "ThermosWidth" VARCHAR(10),
    "Pane1" VARCHAR(10),
    "Pane2" VARCHAR(10),
    "Pane3" VARCHAR(10),
    "GridCode" VARCHAR(15),
    "GridBase" SMALLINT,
    "Gridheight" SMALLINT,
    "GridHalfThermos" BIT,
    "IsDeleted" BIT,
    "Quantity" INTEGER,
    "GridDescription" VARCHAR(50),
    "InteriorColorCode" VARCHAR(15),
    "InteriorColorDescription" VARCHAR(50),
    "exteriorColorCode" VARCHAR(15),
    "ExteriorColorDescription" VARCHAR(50),
    "DrawingType" VARCHAR(50),
    "NumberOfTiles" SMALLINT,
    "ShapeCode" VARCHAR(3),
    "Surface" FLOAT,
    "EnergySurcharge" NUMERIC(24,6),
    "Price5X" NUMERIC(24,6),
    "Price10X" NUMERIC(24,6),
    "PriceShape" NUMERIC(24,6),
    "ThermosUnitPrice" NUMERIC(24,6),
    "ShapeUnitPrice" NUMERIC(24,6),
    "ShapeDescription" VARCHAR(50),
    "TotalThermosPrice" NUMERIC(24,6),
    "GridTilePrice" NUMERIC(24,6),
    "GridBaseprice" NUMERIC(24,6),
    "GridUnitPrice" NUMERIC(24,6),
    "PaintUnitPrice" NUMERIC(24,6),
    "Pane1description" VARCHAR(50),
    "pane2description" VARCHAR(50),
    "Pane3description" VARCHAR(50),
    "BilledSurface" FLOAT,
    "SquarefeetPrice" NUMERIC(24,6),
    "TotalGridprice" NUMERIC(24,6),
    "NumberOfTilesExt" INTEGER,
    "NumberOfTilesInt" INTEGER,
    "PaintUnitPriceExt" NUMERIC(24,6),
    "PaintUnitpriceInt" NUMERIC(24,6),
    "PaintTilePriceExt" NUMERIC(24,6),
    "PaintTilepriceInt" NUMERIC(24,6),
    "TotalPaintPrice" NUMERIC(24,6),
    "GridType" VARCHAR(10),
    "TotalShapeprice" NUMERIC(24,6),
    "CalculType" VARCHAR(1),
    "HalfGridPrice" NUMERIC(24,6),
    "Width" VARCHAR(10),
    "Width1" VARCHAR(10),
    "Width2" VARCHAR(10),
    "Height" VARCHAR(10),
    "Height1" VARCHAR(10),
    "Height2" VARCHAR(10),
    "Diameter" VARCHAR(10),
    "Radius" VARCHAR(10),
    "Radius1" VARCHAR(10),
    "Radius2" VARCHAR(10),
    "ThermosHeight1" VARCHAR(10),
    "FifteenYearsWarranty" BIT,
    "ExtraGazArgon" BIT,
    "FifteenYearsWarrantyTotal" NUMERIC(24,6),
    "ExtraArgonGazTotal" NUMERIC(24,6),
    "DTH" INTEGER,
    "BarrotinID" INTEGER,
    "GrillNote" LONGVARCHAR,
    "BarrotinDescription" VARCHAR(30),
    "BarrotinPrice" NUMERIC(24,6),
    "ThermosHeightCalculate" VARCHAR(10),
    "ThermosWidthCalculate" VARCHAR(10),
    "BaseProduct" VARCHAR(10),
    "ThermosGL" VARCHAR(10),
    "GridGL" VARCHAR(10),
    "RealSurface" REAL,
    "TemplateToCome" BIT,
    "Withgrid" BIT,
    "Tag" VARCHAR(40),
    "IsEnergyGlass" BIT,
    "IsTemperedGlass" BIT,
    "ThermosHeight1Calculate" VARCHAR(10),
    "SqFeetPriceLock" BIT,
    "GridBasePriceLock" BIT,
    "paintIntPricelock" BIT,
    "PaintExtPricelock" BIT);
CREATE INDEX "WDIDX_ExternalOrderDetails_IDCotation" ON "ExternalOrderDetails" ("IDCotation");

-- Création de la table ExternalOrderDetailSketches
CREATE TABLE "ExternalOrderDetailSketches" (
    "IDExternalOrderDetailSketches" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "LineNumber" INTEGER,
    "SketchImage" LONGVARCHAR,
    "ImageName" VARCHAR(25),
    "IDCotation" NUMERIC(19,0),
    "IDCotationDetails" NUMERIC(19,0));
CREATE INDEX "WDIDX_ExternalOrderDetailSketches_IDCotation" ON "ExternalOrderDetailSketches" ("IDCotation");
CREATE INDEX "WDIDX_ExternalOrderDetailSketches_IDCotationDetails" ON "ExternalOrderDetailSketches" ("IDCotationDetails");

-- Création de la table ExternalUsers
CREATE TABLE "ExternalUsers" (
    "IDExternalUsers" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "UserCode" VARCHAR(15) UNIQUE,
    "UserName" VARCHAR(50),
    "UserPassWord" VARCHAR(25),
    "CustomerNumber" VARCHAR(15),
    "MasterCode" VARCHAR(15),
    "Ismaster" BIT,
    "IsActive" BIT,
    "IsNew" BIT,
    "CustomerName" VARCHAR(50),
    "Credentials" VARCHAR(15));
CREATE INDEX "WDIDX_ExternalUsers_CustomerNumber" ON "ExternalUsers" ("CustomerNumber");
CREATE INDEX "WDIDX_ExternalUsers_MasterCode" ON "ExternalUsers" ("MasterCode");
CREATE INDEX "WDIDX_ExternalUsers_CustomerNumberIsmaster" ON "ExternalUsers" ("CustomerNumber","Ismaster");

-- Création de la table Facture
CREATE TABLE "Facture" (
    "FACLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "fanumero" INTEGER NOT NULL UNIQUE,
    "fadate" DATE NOT NULL,
    "fadatefacture" DATE NOT NULL,
    "fatype" VARCHAR(1) NOT NULL,
    "faclient" VARCHAR(10) NOT NULL,
    "fanofacture" INTEGER NOT NULL,
    "fanocommande" VARCHAR(20) NOT NULL,
    "fanojob" VARCHAR(32) NOT NULL,
    "fasecteur" VARCHAR(2) NOT NULL,
    "facalcul" SMALLINT NOT NULL,
    "FPREPARATION" VARCHAR(1) NOT NULL,
    "FAIMPRIMER" SMALLINT NOT NULL,
    "fasurcharge" REAL NOT NULL,
    "fatotal" REAL NOT NULL,
    "fatps" REAL NOT NULL,
    "fatvq" REAL NOT NULL,
    "futilise" SMALLINT NOT NULL,
    "FDATEREQUISE" DATE NOT NULL,
    "FSURCHARGEENERGIE" SMALLINT NOT NULL,
    "fatypedocument" SMALLINT NOT NULL,
    "fareference" VARCHAR(20) NOT NULL,
    "fatransportouinon" SMALLINT NOT NULL,
    "fafraistransport" FLOAT NOT NULL,
    "fabonlivraison" VARCHAR(20) NOT NULL,
    "commentaire" LONGVARCHAR NOT NULL,
    "NoLot" NUMERIC(10,0) NOT NULL,
    "fainexalu" BIT NOT NULL,
    "fsurchargepeinture" FLOAT NOT NULL,
    "NoGlSurchargePeinture" VARCHAR(10) NOT NULL,
    "idLivraison" INTEGER NOT NULL,
    "fpeinture" SMALLINT NOT NULL,
    "livrepartiel" VARCHAR(1) NOT NULL,
    "SUrchargePeinture" BIT NOT NULL,
    "IDClient" INTEGER NOT NULL,
    "nom" VARCHAR(45) NOT NULL,
    "adresse" VARCHAR(50) NOT NULL,
    "ville" VARCHAR(50) NOT NULL,
    "CodePostal" VARCHAR(7) NOT NULL,
    "noTelephone" VARCHAR(12) NOT NULL,
    "FImprimeFeuille" BIT NOT NULL,
    "fCombineTaxe" BIT NOT NULL,
    "Ftypecredit" NUMERIC(10,0) NOT NULL,
    "cvendeur" INTEGER NOT NULL,
    "messagedejaafiche" BIT NOT NULL,
    "lNom" VARCHAR(50) NOT NULL,
    "lRue" VARCHAR(50) NOT NULL,
    "lVille" VARCHAR(50) NOT NULL,
    "lprovince" VARCHAR(50) NOT NULL,
    "lCodePostal" VARCHAR(10) NOT NULL,
    "lContact" VARCHAR(50) NOT NULL,
    "ltelephone" VARCHAR(12) NOT NULL,
    "lAdresseManuelle" BIT NOT NULL,
    "surchargeTauxChange" FLOAT NOT NULL,
    "surchargeTauxPourc" REAL NOT NULL,
    "IdPurchaseOrderEdi" VARCHAR(50) NOT NULL,
    "IdEdiKey" VARCHAR(50) NOT NULL,
    "fTotalOptions" REAL NOT NULL,
    "lNote" LONGVARCHAR NOT NULL,
    "IDCamions" NUMERIC(19,0) NOT NULL,
    "AvecCarrelage" BIT NOT NULL,
    "AvecForme" BIT NOT NULL,
    "AvecProduitSpeciaux" BIT NOT NULL,
    "EpaisseurVerre" SMALLINT NOT NULL,
    "AvecPinede" BIT NOT NULL,
    "AvecSatine" BIT NOT NULL,
    "NewEdiOrder" BIT NOT NULL,
    "AvecTriple" BIT NOT NULL,
    "IsEDI" BIT NOT NULL,
    "Computername" VARCHAR(50) NOT NULL,
    "ConfirmationSended" BIT NOT NULL,
    "Username" VARCHAR(20) NOT NULL,
    "CreatedTime" TIME NOT NULL,
    "OnHold" BIT NOT NULL,
    "AvecUltraClair" BIT NOT NULL,
    "AvecEnergiverre" BIT NOT NULL,
    "AvecTrempe" BIT NOT NULL,
    "AvecEnergiVerreESC" BIT NOT NULL,
    "NumberOfThermosToProduce" INTEGER NOT NULL,
    "IsAllOrderProduced" BIT NOT NULL,
    "NumberOfThermosProduced" INTEGER NOT NULL,
    "Started" BIT NOT NULL,
    "Completed" BIT NOT NULL,
    "NumberOfThermosBackOrdered" NUMERIC(10,0) NOT NULL);
CREATE INDEX "WDIDX_Facture_faclient" ON "Facture" ("faclient");
CREATE INDEX "WDIDX_Facture_FDATEREQUISE" ON "Facture" ("FDATEREQUISE");
CREATE INDEX "WDIDX_Facture_NoLot" ON "Facture" ("NoLot");
CREATE INDEX "WDIDX_Facture_IDClient" ON "Facture" ("IDClient");
CREATE INDEX "WDIDX_Facture_nom" ON "Facture" ("nom");
CREATE INDEX "WDIDX_Facture_noTelephone" ON "Facture" ("noTelephone");
CREATE INDEX "WDIDX_Facture_cvendeur" ON "Facture" ("cvendeur");
CREATE INDEX "WDIDX_Facture_lNom" ON "Facture" ("lNom");
CREATE INDEX "WDIDX_Facture_IDCamions" ON "Facture" ("IDCamions");
CREATE INDEX "WDIDX_Facture_AvecCarrelage" ON "Facture" ("AvecCarrelage");
CREATE INDEX "WDIDX_Facture_AvecForme" ON "Facture" ("AvecForme");
CREATE INDEX "WDIDX_Facture_AvecProduitSpeciaux" ON "Facture" ("AvecProduitSpeciaux");
CREATE INDEX "WDIDX_Facture_EpaisseurVerre" ON "Facture" ("EpaisseurVerre");
CREATE INDEX "WDIDX_Facture_AvecPinede" ON "Facture" ("AvecPinede");
CREATE INDEX "WDIDX_Facture_AvecSatine" ON "Facture" ("AvecSatine");
CREATE INDEX "WDIDX_Facture_AvecTriple" ON "Facture" ("AvecTriple");
CREATE INDEX "WDIDX_Facture_AvecUltraClair" ON "Facture" ("AvecUltraClair");
CREATE INDEX "WDIDX_Facture_AvecEnergiverre" ON "Facture" ("AvecEnergiverre");
CREATE INDEX "WDIDX_Facture_AvecTrempe" ON "Facture" ("AvecTrempe");
CREATE INDEX "WDIDX_Facture_AvecEnergiVerreESC" ON "Facture" ("AvecEnergiVerreESC");
CREATE INDEX "WDIDX_Facture_cleclientfacture" ON "Facture" ("faclient","fanumero");
CREATE INDEX "WDIDX_Facture_faclientfanocommande1" ON "Facture" ("faclient","fanocommande");
CREATE INDEX "WDIDX_Facture_IDClientfanumero" ON "Facture" ("IDClient","fanumero");
CREATE INDEX "WDIDX_Facture_IDClientfanocommande" ON "Facture" ("IDClient","fanocommande");

-- Création de la table FactureInternet
CREATE TABLE "FactureInternet" (
    "FACLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "FiNumeroCommande" VARCHAR(20) NOT NULL,
    "fiDateCommande" DATE NOT NULL,
    "fiDateRequise" DATE NOT NULL,
    "fiClient" VARCHAR(50) NOT NULL,
    "FiNoPorte" VARCHAR(10) NOT NULL,
    "fiAcheteur" VARCHAR(50) NOT NULL,
    "fiTelAchat" VARCHAR(20) NOT NULL,
    "fiTelLivraison" VARCHAR(20) NOT NULL);

-- Création de la table FaxEnCours
CREATE TABLE "FaxEnCours" (
    "IDFaxEnCours" INTEGER PRIMARY KEY NOT NULL,
    "TypeFax" VARCHAR(1) NOT NULL,
    "idDocument" INTEGER NOT NULL,
    "EtatFax" VARCHAR(50) NOT NULL,
    "IDFournisseur" INTEGER NOT NULL,
    "NODocument" VARCHAR(15) NOT NULL,
    "noClient" VARCHAR(10) NOT NULL,
    "NOMCLIENT" VARCHAR(50) NOT NULL,
    "TypeDocument" VARCHAR(15) NOT NULL,
    "DerniereTentative" TIMESTAMP NOT NULL,
    "NbTentative" SMALLINT NOT NULL,
    "NoTelephone" VARCHAR(15) NOT NULL,
    "FaxRefresh" BIT NOT NULL,
    "NomFichier" VARCHAR(200) NOT NULL,
    "EnTraitement" BIT NOT NULL);
CREATE INDEX "WDIDX_FaxEnCours_idDocument" ON "FaxEnCours" ("idDocument");

-- Création de la table FclientExtra
CREATE TABLE "FclientExtra" (
    "IDFclientExtra" INTEGER PRIMARY KEY NOT NULL,
    "IdClient" INTEGER NOT NULL,
    "PrixAnglais" FLOAT NOT NULL,
    "PrixMetrique" FLOAT NOT NULL,
    "PrixAnglaisD" FLOAT NOT NULL,
    "PrixAnglaisT" FLOAT NOT NULL,
    "PrixMetriqueD" FLOAT NOT NULL,
    "PrixMetriqueT" FLOAT NOT NULL,
    "ListeDePrix" BIT NOT NULL,
    "prixSpecial" BIT NOT NULL,
    "NoProduit" VARCHAR(10) NOT NULL,
    "Pbase" BIT NOT NULL);
CREATE INDEX "WDIDX_FclientExtra_IdClient" ON "FclientExtra" ("IdClient");
CREATE INDEX "WDIDX_FclientExtra_IdClientNoProduit" ON "FclientExtra" ("IdClient","NoProduit");

-- Création de la table FClientProduitCouleur
CREATE TABLE "FClientProduitCouleur" (
    "IDFCouleurClient" INTEGER PRIMARY KEY NOT NULL,
    "noClient" VARCHAR(10) NOT NULL,
    "NoCouleur" VARCHAR(10) NOT NULL,
    "fcextraunite" FLOAT NOT NULL,
    "NoProduit" VARCHAR(10) NOT NULL,
    "fcdesccouleur" VARCHAR(50) NOT NULL,
    "IDProduitClient" INTEGER NOT NULL);
CREATE INDEX "WDIDX_FClientProduitCouleur_noClient" ON "FClientProduitCouleur" ("noClient");
CREATE INDEX "WDIDX_FClientProduitCouleur_IDProduitClient" ON "FClientProduitCouleur" ("IDProduitClient");
CREATE INDEX "WDIDX_FClientProduitCouleur_NoClientNoProduitNoCouleur" ON "FClientProduitCouleur" ("noClient","NoProduit","NoCouleur");
CREATE INDEX "WDIDX_FClientProduitCouleur_noClientNoProduit" ON "FClientProduitCouleur" ("noClient","NoProduit");

-- Création de la table FCouleur
CREATE TABLE "FCouleur" (
    "IDFCouleur" INTEGER PRIMARY KEY NOT NULL,
    "noCouleur" VARCHAR(10) NOT NULL UNIQUE,
    "DescriptionCouleur" VARCHAR(50) NOT NULL,
    "NbPiedBarre" INTEGER NOT NULL,
    "cExtraLineaire" FLOAT NOT NULL,
    "cExtracarreau" FLOAT NOT NULL,
    "cextraUnite" FLOAT NOT NULL,
    "CExtraLineaireM" FLOAT NOT NULL,
    "DescriptionCouleurA" VARCHAR(50) NOT NULL,
    "IsActive" BIT NOT NULL);
CREATE INDEX "WDIDX_FCouleur_DescriptionCouleur" ON "FCouleur" ("DescriptionCouleur");

-- Création de la table FCouleurClient
CREATE TABLE "FCouleurClient" (
    "IDFCouleurClient" INTEGER PRIMARY KEY NOT NULL,
    "noClient" VARCHAR(10) NOT NULL,
    "NoCouleur" VARCHAR(10) NOT NULL,
    "fcExtralineaire" FLOAT NOT NULL,
    "fcextraCarreau" FLOAT NOT NULL,
    "fcextraunite" FLOAT NOT NULL,
    "fcextralineaireM" FLOAT NOT NULL);
CREATE INDEX "WDIDX_FCouleurClient_noClient" ON "FCouleurClient" ("noClient");
CREATE INDEX "WDIDX_FCouleurClient_noClientNoCouleur" ON "FCouleurClient" ("noClient","NoCouleur");

-- Création de la table Fcoutant
CREATE TABLE "Fcoutant" (
    "cNoCommande" NUMERIC(10,0) NOT NULL,
    "cNoLigne" INTEGER NOT NULL,
    "cType" SMALLINT NOT NULL,
    "cSousType" SMALLINT NOT NULL,
    "cqte" FLOAT NOT NULL,
    "cCoutUnitaire" FLOAT NOT NULL,
    "CPourPerte" REAL NOT NULL,
    "CPerte" FLOAT NOT NULL,
    "ccouttotal" FLOAT NOT NULL,
    "CDimension" REAL NOT NULL,
    "CFourniture" VARCHAR(20) NOT NULL,
    "nolot" NUMERIC(10,0) NOT NULL,
    "cNoClient" VARCHAR(10) NOT NULL,
    "cDAteFacture" DATE NOT NULL,
    "CdateLivraison" DATE NOT NULL,
    "CNoBlivraison" INTEGER NOT NULL,
    "Cdatecommande" DATE NOT NULL);
CREATE INDEX "WDIDX_Fcoutant_cNoCommande" ON "Fcoutant" ("cNoCommande");
CREATE INDEX "WDIDX_Fcoutant_nolot" ON "Fcoutant" ("nolot");
CREATE INDEX "WDIDX_Fcoutant_cNoClient" ON "Fcoutant" ("cNoClient");
CREATE INDEX "WDIDX_Fcoutant_cDAteFacture" ON "Fcoutant" ("cDAteFacture");
CREATE INDEX "WDIDX_Fcoutant_CdateLivraison" ON "Fcoutant" ("CdateLivraison");
CREATE INDEX "WDIDX_Fcoutant_cNoCommandecNoLignecTypecSousType" ON "Fcoutant" ("cNoCommande","cNoLigne","cType","cSousType");
CREATE INDEX "WDIDX_Fcoutant_cNoCommandecNoLigne" ON "Fcoutant" ("cNoCommande","cNoLigne");

-- Création de la table FcoutantLigne
CREATE TABLE "Fcoutant" (
    "cNoCommande" NUMERIC(10,0) NOT NULL,
    "cNoLigne" INTEGER NOT NULL,
    "cType" SMALLINT NOT NULL,
    "cqte" FLOAT NOT NULL,
    "ccouttotal" FLOAT NOT NULL,
    "cdesc" VARCHAR(50) NOT NULL,
    "NoLot" NUMERIC(10,0) NOT NULL,
    "cNoClient" VARCHAR(10) NOT NULL,
    "cDAteFacture" DATE NOT NULL,
    "CdateLivraison" DATE NOT NULL,
    "CNoBlivraison" INTEGER NOT NULL,
    "Cdatecommande" DATE NOT NULL,
    "CNoCommandeClient" VARCHAR(20) NOT NULL);
CREATE INDEX "WDIDX_FcoutantLigne_cNoCommande" ON "Fcoutant" ("cNoCommande");
CREATE INDEX "WDIDX_FcoutantLigne_NoLot" ON "Fcoutant" ("NoLot");
CREATE INDEX "WDIDX_FcoutantLigne_cNoClient" ON "Fcoutant" ("cNoClient");
CREATE INDEX "WDIDX_FcoutantLigne_cDAteFacture" ON "Fcoutant" ("cDAteFacture");
CREATE INDEX "WDIDX_FcoutantLigne_CdateLivraison" ON "Fcoutant" ("CdateLivraison");
CREATE INDEX "WDIDX_FcoutantLigne_cNoCommandecNoLigne" ON "Fcoutant" ("cNoCommande","cNoLigne");

-- Création de la table Fdetail
CREATE TABLE "fdetail" (
    "fdligne" NUMERIC(19,0) NOT NULL,
    "fdnocomm" INTEGER NOT NULL,
    "fdnumprod" VARCHAR(10) NOT NULL,
    "fddesc" VARCHAR(65) NOT NULL,
    "fdqte" REAL NOT NULL,
    "fdqteafacturer" REAL NOT NULL,
    "fdqtedejafacture" REAL NOT NULL,
    "fdcap" SMALLINT NOT NULL,
    "fdespace" VARCHAR(10) NOT NULL,
    "fdespaceinex" VARCHAR(10) NOT NULL,
    "fdforme99" SMALLINT NOT NULL,
    "fdlargeur" VARCHAR(10) NOT NULL,
    "fdlargeura" VARCHAR(10) NOT NULL,
    "fdhauteur" VARCHAR(10) NOT NULL,
    "fdhauteura" VARCHAR(10) NOT NULL,
    "fdhauteur1" VARCHAR(10) NOT NULL,
    "fdhauteur1a" VARCHAR(10) NOT NULL,
    "fdprixu" REAL NOT NULL,
    "fdlien" SMALLINT NOT NULL,
    "fdcarrelage" SMALLINT NOT NULL,
    "fdcarreauv" SMALLINT NOT NULL,
    "fdcarreauh" SMALLINT NOT NULL,
    "fdcomposant1" VARCHAR(10) NOT NULL,
    "fdcomposant2" VARCHAR(10) NOT NULL,
    "fdcomposant3" VARCHAR(10) NOT NULL,
    "fdnumcarr" VARCHAR(10) NOT NULL,
    "ftype" SMALLINT NOT NULL,
    "fdprixtotal" REAL NOT NULL,
    "fdcarrpruxuc" REAL NOT NULL,
    "frcarrprixu" REAL NOT NULL,
    "fdcarrprixtotal" REAL NOT NULL,
    "fdprixupied" REAL NOT NULL,
    "fdcodegl" VARCHAR(10) NOT NULL,
    "fdimprimecarr" SMALLINT NOT NULL,
    "ffini" VARCHAR(10) NOT NULL,
    "fcapgaztube" VARCHAR(5) NOT NULL,
    "fnumeroregroupement" VARCHAR(10) NOT NULL,
    "fregroupement" VARCHAR(10) NOT NULL,
    "fdverreunite" SMALLINT NOT NULL,
    "fdenergiverre" SMALLINT NOT NULL,
    "fdcalculescbasecarr" SMALLINT NOT NULL,
    "FDJOBLIGNE" VARCHAR(40) NOT NULL,
    "fimprime" SMALLINT NOT NULL,
    "surchargeenergie" REAL NOT NULL,
    "fdescoriginale" VARCHAR(40) NOT NULL,
    "fdcarrprixdebase" REAL NOT NULL,
    "fdspecdim" SMALLINT NOT NULL,
    "fdcommentaire" VARCHAR(50) NOT NULL,
    "fdlargeuru" VARCHAR(10) NOT NULL,
    "fdhauteuru" VARCHAR(10) NOT NULL,
    "fdforme" VARCHAR(3) NOT NULL,
    "fdw" VARCHAR(8) NOT NULL,
    "fdw1" VARCHAR(8) NOT NULL,
    "fdw2" VARCHAR(8) NOT NULL,
    "fdh" VARCHAR(8) NOT NULL,
    "fdh1" VARCHAR(8) NOT NULL,
    "fdh2" VARCHAR(8) NOT NULL,
    "fdd" VARCHAR(8) NOT NULL,
    "fdr" VARCHAR(8) NOT NULL,
    "fdr1" VARCHAR(8) NOT NULL,
    "fdr2" VARCHAR(8) NOT NULL,
    "fds" VARCHAR(8) NOT NULL,
    "fdf" VARCHAR(8) NOT NULL,
    "fdt1" VARCHAR(1) NOT NULL,
    "fdt2" VARCHAR(1) NOT NULL,
    "fdt3" VARCHAR(1) NOT NULL,
    "fdt4" VARCHAR(1) NOT NULL,
    "fdcapw" SMALLINT NOT NULL,
    "fdcapw1" SMALLINT NOT NULL,
    "fdcapw2" SMALLINT NOT NULL,
    "fdcaph" SMALLINT NOT NULL,
    "fdcaph1" SMALLINT NOT NULL,
    "fdcaph2" SMALLINT NOT NULL,
    "fdcapd" SMALLINT NOT NULL,
    "fdcapr" SMALLINT NOT NULL,
    "fdcapr1" SMALLINT NOT NULL,
    "fdcapr2" SMALLINT NOT NULL,
    "fdcaps" SMALLINT NOT NULL,
    "fdcapf" SMALLINT NOT NULL,
    "fnombre" SMALLINT NOT NULL,
    "fdextraforme" REAL NOT NULL,
    "fdmatch" INTEGER NOT NULL,
    "fdmatchvh" SMALLINT NOT NULL,
    "FDnbmorceau" VARCHAR(10) NOT NULL,
    "fddimension" VARCHAR(10) NOT NULL,
    "fdhauteuranglais" VARCHAR(10) NOT NULL,
    "fdlargeuranglais" VARCHAR(10) NOT NULL,
    "fdpiedcarre" FLOAT NOT NULL,
    "fdpiedcarrefacture" REAL NOT NULL,
    "ftypespacer" VARCHAR(2) NOT NULL,
    "FDespace2" VARCHAR(10) NOT NULL,
    "fdprixupiedfacture" FLOAT NOT NULL,
    "fdtypecalcul" VARCHAR(20) NOT NULL,
    "fdvariablex" REAL NOT NULL,
    "fnotes" VARCHAR(32) NOT NULL,
    "FDEXTRACAP" FLOAT NOT NULL,
    "FDvariablex1" REAL NOT NULL,
    "Imagecarrelage" LONGVARBINARY NOT NULL,
    "fdDDH" REAL NOT NULL,
    "fdDDV" REAL NOT NULL,
    "vnbmorceau" INTEGER NOT NULL,
    "vDimensionMorceau" FLOAT NOT NULL,
    "vMarquageHC" REAL NOT NULL,
    "vMarquageLC" REAL NOT NULL,
    "vMarquageHS" REAL NOT NULL,
    "vMarquageLS" REAL NOT NULL,
    "fdnbcarreau" SMALLINT NOT NULL,
    "fnotes1" VARCHAR(32) NOT NULL,
    "fTypePeinture" SMALLINT NOT NULL,
    "fNoPeintureExtTout" VARCHAR(10) NOT NULL,
    "FnopeintureInterieure" VARCHAR(10) NOT NULL,
    "fdescpeintureExtTout" VARCHAR(50) NOT NULL,
    "fDescPeintureInterieure" VARCHAR(50) NOT NULL,
    "fPreparationPeinture" FLOAT NOT NULL,
    "fPrixCarreauPeinture" FLOAT NOT NULL,
    "fTotalPeinture" FLOAT NOT NULL,
    "Ftotalcarreaupeinture" INTEGER NOT NULL,
    "fpeinture" BIT NOT NULL,
    "libelleNbcarreauinterieur" VARCHAR(30) NOT NULL,
    "libelleNbCarreauExtTlt" VARCHAR(30) NOT NULL,
    "FtotalbarrePeinture" FLOAT NOT NULL,
    "fnopeinture" VARCHAR(10) NOT NULL,
    "fdescpeinture" VARCHAR(50) NOT NULL,
    "fextrapeinture" FLOAT NOT NULL,
    "ftypepeinture1" SMALLINT NOT NULL,
    "FDescpeinture1" VARCHAR(50) NOT NULL,
    "fnopeinture1" VARCHAR(10) NOT NULL,
    "FDnbcarreauPeinture1" SMALLINT NOT NULL,
    "fdprixcarreaupeinture1" REAL NOT NULL,
    "TDemiCarrelage" BIT NOT NULL,
    "FDextra5x" REAL NOT NULL,
    "FDextra10X" REAL NOT NULL,
    "FDextraCarrelagedemi" REAL NOT NULL,
    "FDfabrication" BIT NOT NULL,
    "SUrchargeafacturer" FLOAT NOT NULL,
    "SUrchargedejafacture" FLOAT NOT NULL,
    "fdintercalaire" BIT NOT NULL,
    "fdpiedcarrereel" REAL NOT NULL,
    "fdsurfacemodifie" BIT NOT NULL,
    "FDprixmodifie" BIT NOT NULL,
    "fdNoteSpeciale" BIT NOT NULL,
    "fdcommentaireVideojet" VARCHAR(100) NOT NULL,
    "FDdescriptionmorceau" VARCHAR(8) NOT NULL,
    "fdt" REAL NOT NULL,
    "TDeA" VARCHAR(15) NOT NULL,
    "fNoLot" VARCHAR(6) NOT NULL,
    "fdbase" VARCHAR(10) NOT NULL,
    "FDPrixExtraFormeModifie" BIT NOT NULL,
    "FDPrixCarreauModifie" BIT NOT NULL,
    "FDPrixExtraDemiModifie" BIT NOT NULL,
    "FDPrixBaseModifie" BIT NOT NULL,
    "FDmessageAffiche" BIT NOT NULL,
    "SUrchargeTaux" FLOAT NOT NULL,
    "surchargeTauxDejaFacture" FLOAT NOT NULL,
    "surchargeTauxafacturer" FLOAT NOT NULL,
    "fdbarrotin" INTEGER NOT NULL,
    "FDdesccarr" VARCHAR(65) NOT NULL,
    "IDPurchaseOrderItemEdi" VARCHAR(50) NOT NULL,
    "fdligneEdi" INTEGER NOT NULL,
    "QteFactureReel" REAL NOT NULL,
    "ThermosType" VARCHAR(1) NOT NULL,
    "PoidsUnitaire" NUMERIC(7,3) NOT NULL,
    "fdhauteuranglais1" VARCHAR(10) NOT NULL,
    "CalculArgon" BIT NOT NULL,
    "PietageArgon" REAL NOT NULL,
    "ExtraArgonPrice" REAL NOT NULL,
    "ExceptionForShippingBill" BIT NOT NULL,
    "Fdqte_Produced" NUMERIC(10,0) NOT NULL,
    "Is_guaranty" BIT NOT NULL,
    "Fdqte_BackOrder" NUMERIC(10,0) NOT NULL,
    "Fdqte_BackOrderreason" VARCHAR(50) NOT NULL);
CREATE INDEX "WDIDX_Fdetail_fdnocomm" ON "fdetail" ("fdnocomm");
CREATE INDEX "WDIDX_Fdetail_fdcle" ON "fdetail" ("fdnocomm","fdligne");
CREATE INDEX "WDIDX_Fdetail_fdnocommfdligne" ON "fdetail" ("fdnocomm","fdligne");

-- Création de la table FdetailInternet
CREATE TABLE "FdetailInternet" (
    "FDCLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "noLigne" INTEGER NOT NULL,
    "QUANTITE" SMALLINT NOT NULL,
    "LARGEUR" VARCHAR(10) NOT NULL,
    "HAUTEUR" VARCHAR(10) NOT NULL,
    "NbVerre" INTEGER NOT NULL,
    "TYpeVerre1" VARCHAR(15) NOT NULL,
    "TYpeVerre2" VARCHAR(15) NOT NULL,
    "TYpeVerre3" VARCHAR(15) NOT NULL,
    "descriptionVerre" VARCHAR(50) NOT NULL,
    "TYpeIntercalaire" VARCHAR(50) NOT NULL,
    "fini" VARCHAR(10) NOT NULL,
    "Intercalaire1" VARCHAR(10) NOT NULL,
    "Intercalaire2" VARCHAR(10) NOT NULL,
    "cap" VARCHAR(10) NOT NULL,
    "Gaz" VARCHAR(10) NOT NULL,
    "réfClient" VARCHAR(50) NOT NULL,
    "tYpecarrelage" VARCHAR(20) NOT NULL,
    "NbCarreauHorizontal" VARCHAR(5) NOT NULL,
    "NbCarreauVertical" VARCHAR(5) NOT NULL,
    "DoubleSeal" VARCHAR(5) NOT NULL,
    "ProportionTete" VARCHAR(10) NOT NULL,
    "type" VARCHAR(10) NOT NULL,
    "dImensionSiContour" VARCHAR(10) NOT NULL,
    "COmmandeAlignement" VARCHAR(10) NOT NULL,
    "ligneAlignement" VARCHAR(10) NOT NULL,
    "typeAlignement" VARCHAR(10) NOT NULL,
    "FACLEUNIK" INTEGER NOT NULL,
    "UniteMesure" SMALLINT NOT NULL);
CREATE INDEX "WDIDX_FdetailInternet_tYpecarrelage" ON "FdetailInternet" ("tYpecarrelage");
CREATE INDEX "WDIDX_FdetailInternet_FACLEUNIK" ON "FdetailInternet" ("FACLEUNIK");

-- Création de la table Fdetailtempo
CREATE TABLE "Fdetailtempo" (
    "IDFdetailtempo" INTEGER PRIMARY KEY NOT NULL,
    "HAUTEUR" REAL NOT NULL,
    "fdnocomm" INTEGER NOT NULL,
    "fdligne" NUMERIC(19,0) NOT NULL,
    "LARGEUR" REAL NOT NULL,
    "fNoForme" VARCHAR(3) NOT NULL,
    "fEspace" VARCHAR(10) NOT NULL,
    "fEspaceTri" NUMERIC(10,0) NOT NULL,
    "Tposition" INTEGER NOT NULL,
    "TPositionTempo" INTEGER NOT NULL,
    "tbase" VARCHAR(10) NOT NULL,
    "deleted" BIT NOT NULL,
    "tqte" INTEGER NOT NULL,
    "Differe" BIT NOT NULL,
    "rupture" BIT NOT NULL,
    "TQteRupture" INTEGER NOT NULL,
    "tDimensionTotale" REAL NOT NULL,
    "TNoTable" INTEGER NOT NULL,
    "tenergiverre" SMALLINT NOT NULL,
    "tHauteurReelle" VARCHAR(10) NOT NULL,
    "tLargeurReelle" VARCHAR(10) NOT NULL,
    "tnorack" VARCHAR(20) NOT NULL,
    "tNoThermos" VARCHAR(20) NOT NULL,
    "tGroupe" INTEGER NOT NULL,
    "fdbase" VARCHAR(10) NOT NULL,
    "fQteTotal" INTEGER NOT NULL,
    "Tcarrelage" VARCHAR(1) NOT NULL,
    "tscellant" SMALLINT NOT NULL,
    "PoidsUnitaire" NUMERIC(7,3) NOT NULL);
CREATE INDEX "WDIDX_Fdetailtempo_fEspaceTri" ON "Fdetailtempo" ("fEspaceTri");
CREATE INDEX "WDIDX_Fdetailtempo_Tposition" ON "Fdetailtempo" ("Tposition");
CREATE INDEX "WDIDX_Fdetailtempo_tDimensionTotale" ON "Fdetailtempo" ("tDimensionTotale");
CREATE INDEX "WDIDX_Fdetailtempo_HAUTEURLARGEURfNoForme" ON "Fdetailtempo" ("tbase","fEspaceTri","HAUTEUR","LARGEUR");
CREATE INDEX "WDIDX_Fdetailtempo_HAUTEURLARGEUR" ON "Fdetailtempo" ("HAUTEUR","LARGEUR");
CREATE INDEX "WDIDX_Fdetailtempo_fEspaceTriTposition" ON "Fdetailtempo" ("fEspaceTri","Tposition");
CREATE INDEX "WDIDX_Fdetailtempo_TNoTableTposition" ON "Fdetailtempo" ("TNoTable","Tposition");

-- Création de la table fEdiRelation
CREATE TABLE "fEdiRelation" (
    "IDfEdiRelation" INTEGER PRIMARY KEY NOT NULL,
    "NOMCLIENT" VARCHAR(50),
    "TYpeRelation" VARCHAR(20),
    "Critere1in" VARCHAR(50),
    "Critere2in" VARCHAR(50),
    "Critere1out" VARCHAR(50),
    "Critere2out" VARCHAR(50));
CREATE INDEX "WDIDX_fEdiRelation_NOMCLIENTTYpeRelation" ON "fEdiRelation" ("NOMCLIENT","TYpeRelation");

-- Création de la table fMessage
CREATE TABLE "fMessage" (
    "IDfMessage" INTEGER PRIMARY KEY NOT NULL,
    "Description" VARCHAR(50),
    "action1" SMALLINT,
    "operateuregalite1" SMALLINT,
    "Schoix1" VARCHAR(20),
    "Cbchoix1" SMALLINT,
    "Cboperateur1" SMALLINT,
    "action2" SMALLINT,
    "operateuregalite2" SMALLINT,
    "Schoix2" VARCHAR(20),
    "Cbchoix2" SMALLINT,
    "Cboperateur2" SMALLINT,
    "action3" SMALLINT,
    "operateuregalite3" SMALLINT,
    "Schoix3" VARCHAR(20),
    "Cbchoix3" SMALLINT,
    "MessageAffiche" LONGVARCHAR,
    "TYpeAffichage" SMALLINT,
    "EstActif" BIT,
    "vAlideLigneouTotal" SMALLINT,
    "Schoix1_1" VARCHAR(20),
    "Schoix2_1" VARCHAR(20),
    "Schoix3_1" VARCHAR(20),
    "mFocus" SMALLINT,
    "mBloquant" BIT,
    "Liste_intercalaire1" VARCHAR(100),
    "Liste_intercalaire2" VARCHAR(100),
    "Liste_intercalaire3" VARCHAR(100),
    "Liste_composante1" VARCHAR(300),
    "Liste_composante2" VARCHAR(300),
    "Liste_composante3" VARCHAR(300));

-- Création de la table forme
CREATE TABLE "forme" (
    "FOCLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "fnumero" VARCHAR(3) NOT NULL UNIQUE,
    "fdescription" VARCHAR(40) NOT NULL,
    "wactif" SMALLINT NOT NULL,
    "wpositionx" SMALLINT NOT NULL,
    "wpositiony" SMALLINT NOT NULL,
    "w1actif" SMALLINT NOT NULL,
    "w1positionx" SMALLINT NOT NULL,
    "w1positiony" SMALLINT NOT NULL,
    "w2actif" SMALLINT NOT NULL,
    "w2positionx" SMALLINT NOT NULL,
    "w2positiony" SMALLINT NOT NULL,
    "hactif" SMALLINT NOT NULL,
    "hpositionx" SMALLINT NOT NULL,
    "hpositiony" SMALLINT NOT NULL,
    "h1actif" SMALLINT NOT NULL,
    "h1positionx" SMALLINT NOT NULL,
    "h1positiony" SMALLINT NOT NULL,
    "h2actif" SMALLINT NOT NULL,
    "h2positionx" SMALLINT NOT NULL,
    "h2positiony" SMALLINT NOT NULL,
    "t1actif" SMALLINT NOT NULL,
    "t1positionx" SMALLINT NOT NULL,
    "t1positiony" SMALLINT NOT NULL,
    "t2actif" SMALLINT NOT NULL,
    "t2positionx" SMALLINT NOT NULL,
    "t2positiony" SMALLINT NOT NULL,
    "t3actif" SMALLINT NOT NULL,
    "t3positionx" SMALLINT NOT NULL,
    "t3positiony" SMALLINT NOT NULL,
    "t4actif" SMALLINT NOT NULL,
    "t4positionx" SMALLINT NOT NULL,
    "t4positiony" SMALLINT NOT NULL,
    "dactif" SMALLINT NOT NULL,
    "dpositionx" SMALLINT NOT NULL,
    "dpositiony" SMALLINT NOT NULL,
    "ractif" SMALLINT NOT NULL,
    "rpositionx" SMALLINT NOT NULL,
    "rpositiony" SMALLINT NOT NULL,
    "r1actif" SMALLINT NOT NULL,
    "r1positionx" SMALLINT NOT NULL,
    "r1positiony" SMALLINT NOT NULL,
    "r2actif" SMALLINT NOT NULL,
    "r2positionx" SMALLINT NOT NULL,
    "r2positiony" SMALLINT NOT NULL,
    "sactif" SMALLINT NOT NULL,
    "spositionx" SMALLINT NOT NULL,
    "spositiony" SMALLINT NOT NULL,
    "factif" SMALLINT NOT NULL,
    "fpositionx" SMALLINT NOT NULL,
    "fpositiony" SMALLINT NOT NULL,
    "fchemin" VARCHAR(60) NOT NULL,
    "wdefaut" VARCHAR(8) NOT NULL,
    "w1defaut" VARCHAR(8) NOT NULL,
    "w2defaut" VARCHAR(8) NOT NULL,
    "h0defaut" VARCHAR(8) NOT NULL,
    "h1defaut" VARCHAR(8) NOT NULL,
    "h2defaut" VARCHAR(8) NOT NULL,
    "t1defaut" VARCHAR(1) NOT NULL,
    "t2defaut" VARCHAR(1) NOT NULL,
    "t3defaut" VARCHAR(1) NOT NULL,
    "t4defaut" VARCHAR(1) NOT NULL,
    "ddefaut" VARCHAR(8) NOT NULL,
    "rdefaut" VARCHAR(8) NOT NULL,
    "r1defaut" VARCHAR(8) NOT NULL,
    "r2defaut" VARCHAR(8) NOT NULL,
    "sdefaut" VARCHAR(8) NOT NULL,
    "fdefaut" VARCHAR(8) NOT NULL,
    "formulelargeur" VARCHAR(50) NOT NULL,
    "formulehauteur" VARCHAR(50) NOT NULL,
    "formulehauteur1" VARCHAR(50) NOT NULL,
    "wcap" SMALLINT NOT NULL,
    "w1cap" SMALLINT NOT NULL,
    "w2cap" SMALLINT NOT NULL,
    "hcap" SMALLINT NOT NULL,
    "h1cap" SMALLINT NOT NULL,
    "h2cap" SMALLINT NOT NULL,
    "dcap" SMALLINT NOT NULL,
    "r1cap" SMALLINT NOT NULL,
    "r2cap" SMALLINT NOT NULL,
    "rcap" SMALLINT NOT NULL,
    "scap" SMALLINT NOT NULL,
    "fcap" SMALLINT NOT NULL,
    "wordre" SMALLINT NOT NULL,
    "w1ordre" SMALLINT NOT NULL,
    "w2ordre" SMALLINT NOT NULL,
    "hordre" SMALLINT NOT NULL,
    "h1ordre" SMALLINT NOT NULL,
    "h2ordre" SMALLINT NOT NULL,
    "t1ordre" SMALLINT NOT NULL,
    "t2ordre" SMALLINT NOT NULL,
    "t3ordre" SMALLINT NOT NULL,
    "t4ordre" SMALLINT NOT NULL,
    "rordre" SMALLINT NOT NULL,
    "r1ordre" SMALLINT NOT NULL,
    "r2ordre" SMALLINT NOT NULL,
    "dordre" SMALLINT NOT NULL,
    "sordre" SMALLINT NOT NULL,
    "fordre" SMALLINT NOT NULL,
    "extradouble" REAL NOT NULL,
    "extratriple" REAL NOT NULL,
    "extradoublem" REAL NOT NULL,
    "extratriplem" REAL NOT NULL,
    "fdescriptiona" VARCHAR(40) NOT NULL,
    "IsActive" BIT NOT NULL,
    "MandatoryOnWall" BIT NOT NULL,
    "ShowTemplateToCome" BIT NOT NULL);

-- Création de la table FormeClient
CREATE TABLE "FormeClient" (
    "IDFormeClient" INTEGER PRIMARY KEY NOT NULL,
    "NoClient" VARCHAR(10) NOT NULL,
    "NoForme" VARCHAR(3) NOT NULL,
    "fPrixSpecial" BIT NOT NULL,
    "fListePrix" BIT NOT NULL,
    "fPrixdouble" FLOAT NOT NULL,
    "FpRixtriple" FLOAT NOT NULL);
CREATE INDEX "WDIDX_FormeClient_NoClient" ON "FormeClient" ("NoClient");
CREATE INDEX "WDIDX_FormeClient_IdClientNoForme" ON "FormeClient" ("NoClient","NoForme");

-- Création de la table Fournisseur
CREATE TABLE "Fournisseur" (
    "IDFournisseur" INTEGER PRIMARY KEY NOT NULL,
    "Fnumero" VARCHAR(15) NOT NULL UNIQUE,
    "Fnom" VARCHAR(50) NOT NULL,
    "Frue" VARCHAR(50) NOT NULL,
    "Fville" VARCHAR(50) NOT NULL,
    "Fprovince" VARCHAR(20) NOT NULL,
    "Fcodepostal" VARCHAR(7) NOT NULL,
    "Ftelephone" VARCHAR(14) NOT NULL,
    "Ffax" VARCHAR(14) NOT NULL,
    "Fcontact" VARCHAR(50) NOT NULL,
    "Femail" VARCHAR(50) NOT NULL,
    "Flangue" SMALLINT NOT NULL,
    "Femail2" VARCHAR(50) NOT NULL,
    "Femail3" VARCHAR(50) NOT NULL,
    "Femail4" VARCHAR(50) NOT NULL,
    "fIsEDI" SMALLINT NOT NULL,
    "fEdiSendBy" INTEGER NOT NULL,
    "fEdiFtpAddress" VARCHAR(50) NOT NULL,
    "fEdiFtpUser" VARCHAR(20) NOT NULL,
    "fEdiFtpPassword" VARCHAR(20) NOT NULL);
CREATE INDEX "WDIDX_Fournisseur_Fnom" ON "Fournisseur" ("Fnom");

-- Création de la table fraction
CREATE TABLE "fraction" (
    "FRCLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "decimale" VARCHAR(4) NOT NULL UNIQUE,
    "fraction" VARCHAR(5) NOT NULL);

-- Création de la table gabcoul
CREATE TABLE "gabcoul" (
    "gnumero" SMALLINT NOT NULL,
    "glargeura" VARCHAR(10) NOT NULL,
    "ghauteura" VARCHAR(10) NOT NULL,
    "glargeuraconv" VARCHAR(10) NOT NULL,
    "ghauteuraconv" VARCHAR(10) NOT NULL,
    "glargeurm" VARCHAR(10) NOT NULL,
    "ghauteurm" VARCHAR(10) NOT NULL);
CREATE INDEX "WDIDX_gabcoul_gcle" ON "gabcoul" ("gnumero","glargeura","ghauteura");

-- Création de la table Garantie
CREATE TABLE "Garantie" (
    "IDGarantie" INTEGER PRIMARY KEY NOT NULL,
    "numero" VARCHAR(10) NOT NULL UNIQUE,
    "Description" VARCHAR(100) NOT NULL);

-- Création de la table Glivre
CREATE TABLE "Glivre" (
    "IDGlivre" INTEGER PRIMARY KEY NOT NULL,
    "numerogl" VARCHAR(10) NOT NULL UNIQUE,
    "Description" VARCHAR(100) NOT NULL);

-- Création de la table Grandlivre
CREATE TABLE "Grandlivre" (
    "IDGrandlivre" INTEGER PRIMARY KEY NOT NULL,
    "nogl" VARCHAR(10) NOT NULL UNIQUE,
    "descgl" VARCHAR(50) NOT NULL);

-- Création de la table HeuresOuverture
CREATE TABLE "HeuresOuverture" (
    "IDHeuresOuverture" INTEGER PRIMARY KEY NOT NULL,
    "HODescription" VARCHAR(100));
CREATE INDEX "WDIDX_HeuresOuverture_HODescription" ON "HeuresOuverture" ("HODescription");

-- Création de la table hfacture
CREATE TABLE "hfacture" (
    "HFCLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "fanumero" INTEGER NOT NULL,
    "fadate" DATE NOT NULL,
    "fatype" VARCHAR(1) NOT NULL,
    "faclient" VARCHAR(10) NOT NULL,
    "fanofacture" INTEGER NOT NULL,
    "fanocommande" VARCHAR(20) NOT NULL,
    "fanojob" VARCHAR(32) NOT NULL,
    "fasecteur" INTEGER NOT NULL,
    "facalcul" SMALLINT NOT NULL,
    "FPREPARATION" VARCHAR(1) NOT NULL,
    "FAIMPRIMER" SMALLINT NOT NULL,
    "fasurcharge" REAL NOT NULL,
    "fatotal" REAL NOT NULL,
    "fatps" REAL NOT NULL,
    "fatvq" REAL NOT NULL,
    "fadatecommande" DATE NOT NULL,
    "ftransfere" SMALLINT NOT NULL,
    "fatypedocument" SMALLINT NOT NULL,
    "fareference" VARCHAR(20) NOT NULL,
    "fatransportouinon" SMALLINT NOT NULL,
    "fafraistransport" FLOAT NOT NULL,
    "fabonlivraison" VARCHAR(20) NOT NULL,
    "Bnumero" INTEGER NOT NULL,
    "NoLot" NUMERIC(10,0) NOT NULL,
    "fsurchargepeinture" FLOAT NOT NULL,
    "NoGlSurchargePeinture" VARCHAR(10) NOT NULL,
    "idlivraison" INTEGER NOT NULL,
    "SUrchargePeinture" BIT NOT NULL,
    "fpeinture" SMALLINT NOT NULL,
    "nom" VARCHAR(45) NOT NULL,
    "Adresse" VARCHAR(50) NOT NULL,
    "Ville" VARCHAR(50) NOT NULL,
    "CodePostal" VARCHAR(7) NOT NULL,
    "noTelephone" VARCHAR(12) NOT NULL,
    "ftypecredit" NUMERIC(10,0) NOT NULL,
    "cvendeur" INTEGER NOT NULL,
    "lNom" VARCHAR(50) NOT NULL,
    "lRue" VARCHAR(50) NOT NULL,
    "lVille" VARCHAR(50) NOT NULL,
    "lCodePostal" VARCHAR(10) NOT NULL,
    "lAdresseManuelle" BIT NOT NULL,
    "surchargeTauxChange" FLOAT NOT NULL,
    "surchargeTauxPourc" REAL NOT NULL,
    "IdPurchaseOrderEdi" VARCHAR(50) NOT NULL,
    "IdEdiKey" VARCHAR(50) NOT NULL,
    "lNote" LONGVARCHAR NOT NULL,
    "IDCamions" NUMERIC(19,0) NOT NULL,
    "AvecCarrelage" BIT NOT NULL,
    "AvecForme" BIT NOT NULL,
    "AvecProduitSpeciaux" BIT NOT NULL,
    "EpaisseurVerre" SMALLINT NOT NULL);
CREATE INDEX "WDIDX_hfacture_fanumero" ON "hfacture" ("fanumero");
CREATE INDEX "WDIDX_hfacture_faclient" ON "hfacture" ("faclient");
CREATE INDEX "WDIDX_hfacture_fanofacture" ON "hfacture" ("fanofacture");
CREATE INDEX "WDIDX_hfacture_fanocommande" ON "hfacture" ("fanocommande");
CREATE INDEX "WDIDX_hfacture_fanojob" ON "hfacture" ("fanojob");
CREATE INDEX "WDIDX_hfacture_fadatecommande" ON "hfacture" ("fadatecommande");
CREATE INDEX "WDIDX_hfacture_fareference" ON "hfacture" ("fareference");
CREATE INDEX "WDIDX_hfacture_Bnumero" ON "hfacture" ("Bnumero");
CREATE INDEX "WDIDX_hfacture_NoLot" ON "hfacture" ("NoLot");
CREATE INDEX "WDIDX_hfacture_nom" ON "hfacture" ("nom");
CREATE INDEX "WDIDX_hfacture_noTelephone" ON "hfacture" ("noTelephone");
CREATE INDEX "WDIDX_hfacture_cvendeur" ON "hfacture" ("cvendeur");
CREATE INDEX "WDIDX_hfacture_lNom" ON "hfacture" ("lNom");
CREATE INDEX "WDIDX_hfacture_IDCamions" ON "hfacture" ("IDCamions");
CREATE INDEX "WDIDX_hfacture_cleclientfacture" ON "hfacture" ("faclient","fanofacture");
CREATE INDEX "WDIDX_hfacture_clefacturetransfere" ON "hfacture" ("fanofacture","ftransfere");
CREATE INDEX "WDIDX_hfacture_faclientfanocommande" ON "hfacture" ("faclient","fanocommande");
CREATE INDEX "WDIDX_hfacture_OptimCleComp_fanoj_Bnume" ON "hfacture" ("fanojob","Bnumero");

-- Création de la table hfdetail
CREATE TABLE "hfdetail" (
    "H0CLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "fdligne" INTEGER NOT NULL,
    "fdnocomm" INTEGER NOT NULL,
    "fdnumprod" VARCHAR(10) NOT NULL,
    "fddesc" VARCHAR(65) NOT NULL,
    "fdqte" REAL NOT NULL,
    "fdqteafacturer" REAL NOT NULL,
    "fdqtedejafacture" REAL NOT NULL,
    "fdcap" SMALLINT NOT NULL,
    "fdespace" VARCHAR(10) NOT NULL,
    "fdespaceinex" VARCHAR(10) NOT NULL,
    "fdforme99" SMALLINT NOT NULL,
    "fdlargeur" VARCHAR(10) NOT NULL,
    "fdlargeura" VARCHAR(10) NOT NULL,
    "fdhauteur" VARCHAR(10) NOT NULL,
    "fdhauteura" VARCHAR(10) NOT NULL,
    "fdhauteur1" VARCHAR(10) NOT NULL,
    "fdhauteur1a" VARCHAR(10) NOT NULL,
    "fdprixu" REAL NOT NULL,
    "fdlien" SMALLINT NOT NULL,
    "fdcarrelage" SMALLINT NOT NULL,
    "fdcarreauv" SMALLINT NOT NULL,
    "fdcarreauh" SMALLINT NOT NULL,
    "fdcomposant1" VARCHAR(10) NOT NULL,
    "fdcomposant2" VARCHAR(10) NOT NULL,
    "fdcomposant3" VARCHAR(10) NOT NULL,
    "fdnumcarr" VARCHAR(10) NOT NULL,
    "ftype" SMALLINT NOT NULL,
    "fdprixtotal" REAL NOT NULL,
    "fdcarrpruxuc" REAL NOT NULL,
    "frcarrprixu" REAL NOT NULL,
    "fdcarrprixtotal" REAL NOT NULL,
    "fdprixupied" REAL NOT NULL,
    "fdcodegl" VARCHAR(10) NOT NULL,
    "fdimprimecarr" SMALLINT NOT NULL,
    "ffini" VARCHAR(10) NOT NULL,
    "fcapgaztube" VARCHAR(5) NOT NULL,
    "fnumeroregroupement" VARCHAR(10) NOT NULL,
    "fregroupement" VARCHAR(10) NOT NULL,
    "fdverreunite" SMALLINT NOT NULL,
    "fdnofact" INTEGER NOT NULL,
    "FDJOBLIGNE" VARCHAR(40) NOT NULL,
    "surchargeenergie" REAL NOT NULL,
    "fdcarrprixdebase" REAL NOT NULL,
    "fdspecdim" SMALLINT NOT NULL,
    "fdcommentaire" VARCHAR(50) NOT NULL,
    "fdlargeuru" VARCHAR(10) NOT NULL,
    "fdhauteuru" VARCHAR(10) NOT NULL,
    "fdforme" VARCHAR(3) NOT NULL,
    "fdw" VARCHAR(8) NOT NULL,
    "fdw1" VARCHAR(8) NOT NULL,
    "fdw2" VARCHAR(8) NOT NULL,
    "fdh" VARCHAR(8) NOT NULL,
    "fdh1" VARCHAR(8) NOT NULL,
    "fdh2" VARCHAR(8) NOT NULL,
    "fdd" VARCHAR(8) NOT NULL,
    "fdr" VARCHAR(8) NOT NULL,
    "fdr1" VARCHAR(8) NOT NULL,
    "fdr2" VARCHAR(8) NOT NULL,
    "fds" VARCHAR(8) NOT NULL,
    "fdf" VARCHAR(8) NOT NULL,
    "fdt1" VARCHAR(1) NOT NULL,
    "fdt2" VARCHAR(1) NOT NULL,
    "fdt3" VARCHAR(1) NOT NULL,
    "fdt4" VARCHAR(1) NOT NULL,
    "fdcapw" SMALLINT NOT NULL,
    "fdcapw1" SMALLINT NOT NULL,
    "fdcapw2" SMALLINT NOT NULL,
    "fdcaph" SMALLINT NOT NULL,
    "fdcaph1" SMALLINT NOT NULL,
    "fdcaph2" SMALLINT NOT NULL,
    "fdcapd" SMALLINT NOT NULL,
    "fdcapr" SMALLINT NOT NULL,
    "fdcapr1" SMALLINT NOT NULL,
    "fdcapr2" SMALLINT NOT NULL,
    "fdcaps" SMALLINT NOT NULL,
    "fdcapf" SMALLINT NOT NULL,
    "fnombre" SMALLINT NOT NULL,
    "fdextraforme" REAL NOT NULL,
    "HFCLEUNIK" INTEGER NOT NULL,
    "fdhauteuranglais" VARCHAR(10) NOT NULL,
    "fdlargeuranglais" VARCHAR(10) NOT NULL,
    "fdpiedcarre" FLOAT NOT NULL,
    "fdpiedcarrefacture" REAL NOT NULL,
    "ftypespacer" VARCHAR(2) NOT NULL,
    "FDespace2" VARCHAR(10) NOT NULL,
    "fdprixupiedfacture" FLOAT NOT NULL,
    "fdtypecalcul" VARCHAR(20) NOT NULL,
    "fdvariablex" REAL NOT NULL,
    "Fnotes" VARCHAR(32) NOT NULL,
    "FDExtraCap" FLOAT NOT NULL,
    "fdvariablex1" REAL NOT NULL,
    "fdDDH" REAL NOT NULL,
    "fdDDV" REAL NOT NULL,
    "fnotes1" VARCHAR(32) NOT NULL,
    "fdnbcarreau" SMALLINT NOT NULL,
    "fTypePeinture" SMALLINT NOT NULL,
    "fNoPeintureExtTout" VARCHAR(10) NOT NULL,
    "FnopeintureInterieure" VARCHAR(10) NOT NULL,
    "fdescpeintureExtTout" VARCHAR(50) NOT NULL,
    "fDescPeintureInterieure" VARCHAR(50) NOT NULL,
    "fPreparationPeinture" FLOAT NOT NULL,
    "fTotalPeinture" FLOAT NOT NULL,
    "fPrixCarreauPeinture" FLOAT NOT NULL,
    "Ftotalcarreaupeinture" INTEGER NOT NULL,
    "fpeinture" SMALLINT NOT NULL,
    "libelleNbcarreauinterieur" VARCHAR(30) NOT NULL,
    "libelleNbCarreauExtTlt" VARCHAR(30) NOT NULL,
    "FtotalbarrePeinture" FLOAT NOT NULL,
    "fnopeinture" VARCHAR(10) NOT NULL,
    "fdescpeinture" VARCHAR(50) NOT NULL,
    "fextrapeinture" FLOAT NOT NULL,
    "ftypepeinture1" SMALLINT NOT NULL,
    "FDescpeinture1" VARCHAR(50) NOT NULL,
    "fnopeinture1" VARCHAR(10) NOT NULL,
    "FDnbcarreauPeinture1" SMALLINT NOT NULL,
    "fdprixcarreaupeinture1" REAL NOT NULL,
    "TDemiCarrelage" BIT NOT NULL,
    "FDextra10X" REAL NOT NULL,
    "FDextra5x" REAL NOT NULL,
    "FDextraCarrelagedemi" REAL NOT NULL,
    "fdfabrication" BIT NOT NULL,
    "SUrchargeafacturer" FLOAT NOT NULL,
    "SUrchargedejafacture" FLOAT NOT NULL,
    "fdintercalaire" BIT NOT NULL,
    "fdpiedcarrereel" REAL NOT NULL,
    "fdsurfacemodifie" BIT NOT NULL,
    "FDprixmodifie" BIT NOT NULL,
    "fdt" REAL NOT NULL,
    "fdbase" VARCHAR(10) NOT NULL,
    "SUrchargeTaux" FLOAT NOT NULL,
    "surchargeTauxDejaFacture" FLOAT NOT NULL,
    "surchargeTauxafacturer" FLOAT NOT NULL,
    "fdbarrotin" INTEGER NOT NULL,
    "IDPurchaseOrderItemEdi" VARCHAR(50) NOT NULL,
    "fdligneEdi" INTEGER NOT NULL,
    "fdhauteuranglais1" VARCHAR(10) NOT NULL,
    "ExtraArgonPrice" REAL NOT NULL,
    "CalculArgon" BIT NOT NULL,
    "PietageArgon" REAL NOT NULL,
    "ExceptionForShippingBill" BIT NOT NULL,
    "fNoLot" VARCHAR(6) NOT NULL);
CREATE INDEX "WDIDX_hfdetail_fdnocomm" ON "hfdetail" ("fdnocomm");
CREATE INDEX "WDIDX_hfdetail_fdnumprod" ON "hfdetail" ("fdnumprod");
CREATE INDEX "WDIDX_hfdetail_fdnofact" ON "hfdetail" ("fdnofact");
CREATE INDEX "WDIDX_hfdetail_FDJOBLIGNE" ON "hfdetail" ("FDJOBLIGNE");
CREATE INDEX "WDIDX_hfdetail_HFCLEUNIK" ON "hfdetail" ("HFCLEUNIK");
CREATE INDEX "WDIDX_hfdetail_fdcle" ON "hfdetail" ("fdnofact","fdnocomm","fdligne");
CREATE INDEX "WDIDX_hfdetail_clecomposant" ON "hfdetail" ("fdcomposant1","fdcomposant2","fdcomposant3");
CREATE INDEX "WDIDX_hfdetail_fdnocommfdligne1" ON "hfdetail" ("fdnocomm","fdligne");

-- Création de la table HistoAnneeMois
CREATE TABLE "HistoAnneeMois" (
    "hClient" VARCHAR(10) NOT NULL,
    "lAnnee" VARCHAR(4) NOT NULL,
    "lmois" VARCHAR(2) NOT NULL,
    "lvente" FLOAT NOT NULL,
    "lqte" FLOAT NOT NULL,
    "cvendeur" INTEGER NOT NULL);
CREATE INDEX "WDIDX_HistoAnneeMois_cvendeur" ON "HistoAnneeMois" ("cvendeur");
CREATE INDEX "WDIDX_HistoAnneeMois_lanneeMois" ON "HistoAnneeMois" ("hClient","lAnnee","lmois");
CREATE INDEX "WDIDX_HistoAnneeMois_LvendeurClientAnneeMois" ON "HistoAnneeMois" ("cvendeur","hClient","lAnnee","lmois");

-- Création de la table HistoAnneeMoisProduit
CREATE TABLE "HistoAnneeMois" (
    "hClient" VARCHAR(10) NOT NULL,
    "lAnnee" VARCHAR(4) NOT NULL,
    "lmois" VARCHAR(2) NOT NULL,
    "lvente" FLOAT NOT NULL,
    "lqte" FLOAT NOT NULL,
    "lProduit" VARCHAR(10) NOT NULL,
    "lComp1" VARCHAR(10) NOT NULL,
    "lcomp2" VARCHAR(10) NOT NULL,
    "lcomp3" VARCHAR(10) NOT NULL,
    "lsurcharge" FLOAT NOT NULL,
    "lperiode" VARCHAR(6) NOT NULL,
    "ldescription" VARCHAR(50) NOT NULL,
    "peinturecarrelage" FLOAT NOT NULL,
    "lpied" FLOAT NOT NULL,
    "lType" VARCHAR(1) NOT NULL);
CREATE INDEX "WDIDX_HistoAnneeMoisProduit_hClient" ON "HistoAnneeMois" ("hClient");
CREATE INDEX "WDIDX_HistoAnneeMoisProduit_lperiode" ON "HistoAnneeMois" ("lperiode");
CREATE INDEX "WDIDX_HistoAnneeMoisProduit_hClientlComp1lcomp2lcomp3lAnneelmois" ON "HistoAnneeMois" ("hClient","lProduit","lComp1","lcomp2","lcomp3","lAnnee","lmois");
CREATE INDEX "WDIDX_HistoAnneeMoisProduit_hClientlperiode" ON "HistoAnneeMois" ("hClient","lperiode");

-- Création de la table HistoJourProduit
CREATE TABLE "HistoJourProduit" (
    "hClient" VARCHAR(10) NOT NULL,
    "lDate" DATE NOT NULL,
    "lvente" FLOAT NOT NULL,
    "lqte" FLOAT NOT NULL);
CREATE INDEX "WDIDX_HistoJourProduit_hClient" ON "HistoJourProduit" ("hClient");
CREATE INDEX "WDIDX_HistoJourProduit_lDate" ON "HistoJourProduit" ("lDate");
CREATE INDEX "WDIDX_HistoJourProduit_Hclientldate" ON "HistoJourProduit" ("hClient","lDate");

-- Création de la table impvideo
CREATE TABLE "impvideo" (
    "IMCLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "vcommande" INTEGER NOT NULL,
    "vlignecommande" SMALLINT NOT NULL,
    "vclientnom" VARCHAR(50) NOT NULL,
    "vdate" DATE NOT NULL,
    "vespace" VARCHAR(10) NOT NULL,
    "vcommandeclient" VARCHAR(10) NOT NULL,
    "vcapgazlowe" VARCHAR(10) NOT NULL,
    "vtraitementspecial" VARCHAR(1) NOT NULL,
    "vpbase" VARCHAR(10) NOT NULL,
    "vlargeur" VARCHAR(10) NOT NULL,
    "vhauteur" VARCHAR(10) NOT NULL,
    "vnoprep" INTEGER NOT NULL,
    "vnoligne" INTEGER NOT NULL,
    "vimprime" VARCHAR(1) NOT NULL,
    "vlowe" VARCHAR(5) NOT NULL,
    "vargon" VARCHAR(5) NOT NULL,
    "vcap" VARCHAR(3) NOT NULL,
    "vesptype" VARCHAR(8) NOT NULL,
    "vdoubletriple" VARCHAR(6) NOT NULL,
    "vqte" SMALLINT NOT NULL,
    "vdescription" VARCHAR(45) NOT NULL,
    "vcar" VARCHAR(20) NOT NULL,
    "vcarrelage" SMALLINT NOT NULL,
    "vepaisseur" VARCHAR(4) NOT NULL,
    "vligneaimprimer" VARCHAR(110) NOT NULL,
    "vcode" VARCHAR(10) NOT NULL,
    "vforme" SMALLINT NOT NULL,
    "vnbmorceau" INTEGER NOT NULL,
    "vnbmorceau1" VARCHAR(10) NOT NULL,
    "vnbmorceau2" VARCHAR(10) NOT NULL,
    "vnbmorceau3" VARCHAR(10) NOT NULL,
    "vnbmorceau4" VARCHAR(10) NOT NULL,
    "vnbmorceau5" VARCHAR(10) NOT NULL,
    "vnbmorceau6" VARCHAR(10) NOT NULL,
    "vnbmorceau7" VARCHAR(10) NOT NULL,
    "vnbmorceau8" VARCHAR(10) NOT NULL,
    "vnbmorceau9" VARCHAR(10) NOT NULL,
    "vnbmorceau10" VARCHAR(10) NOT NULL,
    "vnbdimension1" VARCHAR(10) NOT NULL,
    "vnbdimension2" VARCHAR(10) NOT NULL,
    "vnbdimension3" VARCHAR(10) NOT NULL,
    "vnbdimension4" VARCHAR(10) NOT NULL,
    "vnbdimension5" VARCHAR(10) NOT NULL,
    "vnbdimension6" VARCHAR(10) NOT NULL,
    "vnbdimension7" VARCHAR(10) NOT NULL,
    "vnbdimension8" VARCHAR(10) NOT NULL,
    "vnbdimension9" VARCHAR(10) NOT NULL,
    "vnbdimension10" VARCHAR(10) NOT NULL,
    "vcarreauh" SMALLINT NOT NULL,
    "vcarreauv" SMALLINT NOT NULL,
    "Vnumcarr" VARCHAR(10) NOT NULL,
    "vespace2" VARCHAR(10) NOT NULL,
    "vTypeSpacer" VARCHAR(5) NOT NULL,
    "vDescCarr" VARCHAR(50) NOT NULL,
    "vTypeCalcul" VARCHAR(20) NOT NULL,
    "vVariableX" INTEGER NOT NULL,
    "vMatch" INTEGER NOT NULL,
    "VNoetiq" INTEGER NOT NULL,
    "VordreXopt" INTEGER NOT NULL,
    "vDimensionMorceau" FLOAT NOT NULL,
    "vNbMorceauFlag" BIT NOT NULL,
    "vMarquageLC" REAL NOT NULL,
    "vMarquageHC" REAL NOT NULL,
    "vmarquageLCFlag" BIT NOT NULL,
    "vmarquageHCFlag" BIT NOT NULL,
    "vMarquageLS" REAL NOT NULL,
    "vMarquageHS" REAL NOT NULL,
    "vMarquageLSFlag" BIT NOT NULL,
    "vMarquageHSFlag" BIT NOT NULL,
    "vHauteurtete" VARCHAR(10) NOT NULL,
    "vLargeurContour" INTEGER NOT NULL,
    "vHauteurContour" INTEGER NOT NULL,
    "vVariablex1" INTEGER NOT NULL,
    "VMarqueTigerstop2" VARCHAR(1) NOT NULL,
    "VmarqueTigerStop1" VARCHAR(1) NOT NULL,
    "VNote" VARCHAR(15) NOT NULL,
    "VdescCourteCarr" VARCHAR(10) NOT NULL,
    "vTypeDessin" SMALLINT NOT NULL,
    "VCaseGauche" BIT NOT NULL,
    "vCaseDroite" BIT NOT NULL,
    "vCaseHaut" BIT NOT NULL,
    "vCaseBas" BIT NOT NULL,
    "vAjustementCarLargeur" SMALLINT NOT NULL,
    "vAjustementCarhauteur" SMALLINT NOT NULL,
    "Vnote2" VARCHAR(20) NOT NULL,
    "VNoForme" VARCHAR(3) NOT NULL,
    "vtypeintercalaire" VARCHAR(1) NOT NULL,
    "Vcouleurfond" INTEGER NOT NULL,
    "Vcouleurtexte" INTEGER NOT NULL,
    "vgras" BIT NOT NULL,
    "vitalique" BIT NOT NULL,
    "VNoteSpeciale" VARCHAR(300) NOT NULL,
    "Vdescriptionmorceau" VARCHAR(8) NOT NULL,
    "vAenlever" REAL NOT NULL);
CREATE INDEX "WDIDX_impvideo_clecommandeligne" ON "impvideo" ("vnoprep","vtraitementspecial","vpbase","vespace","vcommande","vlignecommande");
CREATE INDEX "WDIDX_impvideo_clecommandelignefdetail" ON "impvideo" ("vnoprep","vcommande","vlignecommande","VNoetiq");
CREATE INDEX "WDIDX_impvideo_CommLigXopt" ON "impvideo" ("vnoprep","VordreXopt","vcommande","vlignecommande","vnoligne");

-- Création de la table impvidf9
CREATE TABLE "impvidf9" (
    "I5CLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "vcommande" VARCHAR(10) NOT NULL,
    "vlignecommande" SMALLINT NOT NULL,
    "vclientnom" VARCHAR(50) NOT NULL,
    "vdate" DATE NOT NULL,
    "vespace" VARCHAR(10) NOT NULL,
    "vcommandeclient" VARCHAR(10) NOT NULL,
    "vcapgazlowe" VARCHAR(10) NOT NULL,
    "vtraitementspecial" VARCHAR(1) NOT NULL,
    "vpbase" VARCHAR(10) NOT NULL,
    "vlargeur" VARCHAR(10) NOT NULL,
    "vhauteur" VARCHAR(10) NOT NULL,
    "vnoprep" INTEGER NOT NULL,
    "vnoligne" INTEGER NOT NULL,
    "vimprime" VARCHAR(1) NOT NULL,
    "vlowe" VARCHAR(5) NOT NULL,
    "vargon" VARCHAR(5) NOT NULL,
    "vcap" VARCHAR(3) NOT NULL,
    "vesptype" VARCHAR(8) NOT NULL,
    "vdoubletriple" VARCHAR(6) NOT NULL,
    "vqte" SMALLINT NOT NULL,
    "vdescription" VARCHAR(45) NOT NULL,
    "vcar" VARCHAR(20) NOT NULL,
    "vcarrelage" SMALLINT NOT NULL,
    "vepaisseur" VARCHAR(4) NOT NULL,
    "vligneaimprimer" VARCHAR(110) NOT NULL,
    "vcode" VARCHAR(10) NOT NULL,
    "vforme" SMALLINT NOT NULL,
    "vnbmorceau" INTEGER NOT NULL,
    "vnbmorceau1" VARCHAR(10) NOT NULL,
    "Vnbmorceau2" VARCHAR(10) NOT NULL,
    "vnbmorceau3" VARCHAR(10) NOT NULL,
    "vnbmorceau4" VARCHAR(10) NOT NULL,
    "vnbmorceau5" VARCHAR(10) NOT NULL,
    "vnbmorceau6" VARCHAR(10) NOT NULL,
    "vnbmorceau7" VARCHAR(10) NOT NULL,
    "vnbmorceau8" VARCHAR(10) NOT NULL,
    "vnbmorceau9" VARCHAR(10) NOT NULL,
    "vnbmorceau10" VARCHAR(10) NOT NULL,
    "vnbdimension1" VARCHAR(10) NOT NULL,
    "vnbdimension2" VARCHAR(10) NOT NULL,
    "vnbdimension3" VARCHAR(10) NOT NULL,
    "vnbdimension4" VARCHAR(10) NOT NULL,
    "vnbdimension5" VARCHAR(10) NOT NULL,
    "vnbdimension6" VARCHAR(10) NOT NULL,
    "vnbdimension7" VARCHAR(10) NOT NULL,
    "vnbdimension8" VARCHAR(10) NOT NULL,
    "vnbdimension9" VARCHAR(10) NOT NULL,
    "vnbdimension10" VARCHAR(10) NOT NULL,
    "vcarreauh" SMALLINT NOT NULL,
    "vcarreauv" SMALLINT NOT NULL,
    "Vnumcarr" VARCHAR(10) NOT NULL,
    "vespace2" VARCHAR(10) NOT NULL,
    "vTypeSpacer" VARCHAR(5) NOT NULL,
    "vDescCarr" VARCHAR(50) NOT NULL,
    "vTypeCalcul" VARCHAR(20) NOT NULL,
    "vVariableX" INTEGER NOT NULL,
    "vMatch" INTEGER NOT NULL,
    "vdimensionmorceau" FLOAT NOT NULL,
    "vnbmorceauflag" BIT NOT NULL,
    "vmarquagelc" REAL NOT NULL,
    "vmarquageHC" REAL NOT NULL,
    "vmarquagelcflag" BIT NOT NULL,
    "vmarquageHCFlag" BIT NOT NULL,
    "vMarquageLS" REAL NOT NULL,
    "vMarquageHS" REAL NOT NULL,
    "vMarquageLSFlag" BIT NOT NULL,
    "vMarquageHSFlag" BIT NOT NULL,
    "vHauteurtete" VARCHAR(10) NOT NULL,
    "vLargeurContour" INTEGER NOT NULL,
    "vHauteurContour" INTEGER NOT NULL,
    "vVariablex1" INTEGER NOT NULL,
    "VMarqueTigerstop2" VARCHAR(1) NOT NULL,
    "VmarqueTigerStop1" VARCHAR(1) NOT NULL,
    "VNote" VARCHAR(15) NOT NULL,
    "VdescCourteCarr" VARCHAR(10) NOT NULL,
    "vTypeDessin" SMALLINT NOT NULL,
    "VCaseGauche" BIT NOT NULL,
    "VCaseDroite" BIT NOT NULL,
    "VCaseHaut" BIT NOT NULL,
    "VCaseBas" BIT NOT NULL,
    "vAjustementCarhauteur" SMALLINT NOT NULL,
    "vAjustementCarLargeur" SMALLINT NOT NULL,
    "Vcouleurfond" INTEGER NOT NULL,
    "vcouleurtexte" INTEGER NOT NULL,
    "vgras" BIT NOT NULL,
    "vitalique" BIT NOT NULL);
CREATE INDEX "WDIDX_impvidf9_clecommandeligne" ON "impvidf9" ("vcommande","vlignecommande");
CREATE INDEX "WDIDX_impvidf9_clecommandelignefdetail" ON "impvidf9" ("vnoprep","vcommande","vnoligne");

-- Création de la table infoprep
CREATE TABLE "infoprep" (
    "I1CLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "ipdate" DATE NOT NULL,
    "ipsecteur" VARCHAR(20) NOT NULL,
    "ipCarrelage" SMALLINT NOT NULL,
    "ipForme" SMALLINT NOT NULL,
    "ipproduitSpeciaux" SMALLINT NOT NULL,
    "ipEpaisseur" VARCHAR(10) NOT NULL,
    "IpCamion" VARCHAR(20) NOT NULL);

-- Création de la table inter
CREATE TABLE "inter" (
    "I2CLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "iclient" VARCHAR(10) NOT NULL,
    "iproduit" VARCHAR(10) NOT NULL,
    "icomposant1" VARCHAR(10) NOT NULL,
    "icomposant2" VARCHAR(10) NOT NULL,
    "icomposant3" VARCHAR(10) NOT NULL,
    "ifini" VARCHAR(40) NOT NULL,
    "ialuminium" SMALLINT NOT NULL,
    "iespace" VARCHAR(10) NOT NULL,
    "iinex" SMALLINT NOT NULL,
    "iespaceinex" VARCHAR(10) NOT NULL,
    "Iespace2" VARCHAR(10) NOT NULL,
    "Iespaceinex2" VARCHAR(10) NOT NULL,
    "IThermoPlastique" BIT NOT NULL,
    "IEspaceThermoPlastique" VARCHAR(10) NOT NULL,
    "IEspaceThermoPlastique2" VARCHAR(10) NOT NULL,
    "IespaceSuperspacer" VARCHAR(10) NOT NULL,
    "IespaceSuperSpacer2" VARCHAR(10) NOT NULL,
    "ISuperSpacer" BIT NOT NULL);
CREATE INDEX "WDIDX_inter_iclient" ON "inter" ("iclient");
CREATE INDEX "WDIDX_inter_cleclientproduit" ON "inter" ("iclient","icomposant1","icomposant2","icomposant3","ifini");
CREATE INDEX "WDIDX_inter_clecomposant" ON "inter" ("icomposant1","icomposant2","icomposant3");

-- Création de la table intercal
CREATE TABLE "intercal" (
    "I3CLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "inumero" VARCHAR(10) NOT NULL UNIQUE,
    "ispaceralu" REAL NOT NULL,
    "ialumetrique" REAL NOT NULL UNIQUE,
    "idescalu" VARCHAR(10) NOT NULL UNIQUE,
    "ispacerinex" REAL NOT NULL UNIQUE,
    "iinexmetrique" REAL NOT NULL,
    "idescinex" VARCHAR(10) NOT NULL UNIQUE,
    "icommentaire" VARCHAR(50) NOT NULL,
    "icommentaireactif" SMALLINT NOT NULL);

-- Création de la table IntercalaireCouleurDimensions
CREATE TABLE "IntercalaireCouleurDimensions" (
    "IDIntercalaireCouleurDimensions" INTEGER PRIMARY KEY NOT NULL,
    "numero" VARCHAR(10) NOT NULL,
    "Description" VARCHAR(40) NOT NULL,
    "DimensionI" REAL NOT NULL,
    "TolerancePlus" REAL NOT NULL,
    "ToleranceMoins" REAL NOT NULL,
    "IDIntercalaireCouleurs" INTEGER NOT NULL,
    "Varinter1A" REAL NOT NULL,
    "Varinter1" REAL NOT NULL,
    "varinter2" REAL NOT NULL,
    "varinter2a" REAL NOT NULL,
    "varinter3" REAL NOT NULL,
    "varinter3a" REAL NOT NULL,
    "varinter4" REAL NOT NULL,
    "varinter4a" REAL NOT NULL,
    "varinter5" REAL NOT NULL,
    "varinter5a" REAL NOT NULL,
    "AenleverVideojet" REAL NOT NULL,
    "AenleverVideojetArgon" REAL NOT NULL);
CREATE INDEX "WDIDX_IntercalaireCouleurDimensions_numero" ON "IntercalaireCouleurDimensions" ("numero");
CREATE INDEX "WDIDX_IntercalaireCouleurDimensions_Description" ON "IntercalaireCouleurDimensions" ("Description");
CREATE INDEX "WDIDX_IntercalaireCouleurDimensions_IDIntercalaireCouleurs" ON "IntercalaireCouleurDimensions" ("IDIntercalaireCouleurs");
CREATE INDEX "WDIDX_IntercalaireCouleurDimensions_IDIntercalaireCouleursDimensionI" ON "IntercalaireCouleurDimensions" ("IDIntercalaireCouleurs","DimensionI");
CREATE INDEX "WDIDX_IntercalaireCouleurDimensions_IDIntercalaireCouleursnumero" ON "IntercalaireCouleurDimensions" ("IDIntercalaireCouleurs","numero");

-- Création de la table IntercalaireCouleurs
CREATE TABLE "IntercalaireCouleurs" (
    "IDIntercalaireCouleurs" INTEGER PRIMARY KEY NOT NULL,
    "Description" VARCHAR(30) NOT NULL UNIQUE,
    "DescriptionCourte" VARCHAR(6) NOT NULL UNIQUE,
    "CouleurFond" INTEGER NOT NULL,
    "CouleurTexte" INTEGER NOT NULL,
    "idIntercalaires" INTEGER NOT NULL,
    "ordreaffichage" SMALLINT NOT NULL,
    "DescriptionAnglais" VARCHAR(30) NOT NULL,
    "DesctiptionCourteAnglais" VARCHAR(6) NOT NULL,
    "VarInter1" REAL NOT NULL,
    "VarInter2" REAL NOT NULL,
    "VarInter3" REAL NOT NULL,
    "VarInter4" REAL NOT NULL,
    "VarInter5" REAL NOT NULL,
    "InGras" BIT NOT NULL,
    "InItalique" BIT NOT NULL,
    "VarInter1A" REAL NOT NULL,
    "VarInter2A" REAL NOT NULL,
    "VarInter3A" REAL NOT NULL,
    "VarInter4A" REAL NOT NULL,
    "VarInter5A" REAL NOT NULL,
    "IsActive" BIT NOT NULL,
    "IsActiveWeb" BIT NOT NULL,
    "Extra28feets56" REAL NOT NULL,
    "Extra28feets56M" REAL NOT NULL);
CREATE INDEX "WDIDX_IntercalaireCouleurs_idIntercalaires" ON "IntercalaireCouleurs" ("idIntercalaires");
CREATE INDEX "WDIDX_IntercalaireCouleurs_ordreaffichage" ON "IntercalaireCouleurs" ("ordreaffichage");
CREATE INDEX "WDIDX_IntercalaireCouleurs_idIntercalairesDescriptionCourte" ON "IntercalaireCouleurs" ("idIntercalaires","DescriptionCourte");

-- Création de la table Intercalaires
CREATE TABLE "Intercalaires" (
    "IDIntercalaires" INTEGER PRIMARY KEY NOT NULL,
    "Description" VARCHAR(30) NOT NULL,
    "Abreviation" VARCHAR(5) NOT NULL,
    "OrdreAffichage" SMALLINT NOT NULL,
    "dimdoublescellantM" REAL NOT NULL,
    "dimdoublescellantA" REAL NOT NULL,
    "AenleverVideojet" REAL NOT NULL,
    "AenleverVideojetArgon" REAL NOT NULL,
    "EpaisseurCadre" REAL NOT NULL,
    "ImpressionIgmacVideojet" BIT NOT NULL);
CREATE INDEX "WDIDX_Intercalaires_OrdreAffichage" ON "Intercalaires" ("OrdreAffichage");

-- Création de la table InterClient
CREATE TABLE "InterClient" (
    "IDInterClient" INTEGER PRIMARY KEY NOT NULL,
    "iClient" VARCHAR(10) NOT NULL,
    "icomposant1" VARCHAR(10) NOT NULL,
    "icomposant2" VARCHAR(10) NOT NULL,
    "icomposant3" VARCHAR(10) NOT NULL,
    "ifini" VARCHAR(15) NOT NULL,
    "iDClient" INTEGER NOT NULL);
CREATE INDEX "WDIDX_InterClient_iClient" ON "InterClient" ("iClient");
CREATE INDEX "WDIDX_InterClient_iDClient" ON "InterClient" ("iDClient");
CREATE INDEX "WDIDX_InterClient_CleClientProduit" ON "InterClient" ("iClient","icomposant1","icomposant2","icomposant3","ifini");

-- Création de la table InterClientDetail
CREATE TABLE "InterClientDetail" (
    "IDInterClientDetail" INTEGER PRIMARY KEY NOT NULL,
    "Spacer1" VARCHAR(50) NOT NULL,
    "Spacer2" VARCHAR(50) NOT NULL,
    "IdInterClient" INTEGER NOT NULL,
    "idintercalairecouleurs" INTEGER NOT NULL);
CREATE INDEX "WDIDX_InterClientDetail_IdInterClient" ON "InterClientDetail" ("IdInterClient");
CREATE INDEX "WDIDX_InterClientDetail_idintercalairecouleurs" ON "InterClientDetail" ("idintercalairecouleurs");

-- Création de la table intkilo
CREATE TABLE "intkilo" (
    "ikcategorie" VARCHAR(2) NOT NULL,
    "ikborneinferieure" SMALLINT NOT NULL,
    "ikbornesuperieure" SMALLINT NOT NULL,
    "ikfraistransport" FLOAT NOT NULL,
    "iknumero" SMALLINT NOT NULL);
CREATE INDEX "WDIDX_intkilo_ikcategorie" ON "intkilo" ("ikcategorie");
CREATE INDEX "WDIDX_intkilo_ikclecatnum" ON "intkilo" ("ikcategorie","iknumero");

-- Création de la table invent
CREATE TABLE "invent" (
    "INUM" VARCHAR(10) NOT NULL UNIQUE,
    "IDESC" VARCHAR(80) NOT NULL,
    "IUNITA" VARCHAR(10) NOT NULL,
    "IPRIXA" FLOAT NOT NULL,
    "IMINA" FLOAT NOT NULL,
    "IUNITM" VARCHAR(10) NOT NULL,
    "IPRIXM" FLOAT NOT NULL,
    "IMINM" FLOAT NOT NULL,
    "ICODEGL" VARCHAR(10) NOT NULL,
    "ICOMM" VARCHAR(20) NOT NULL,
    "ICOMP1" VARCHAR(10) NOT NULL,
    "ICOMP2" VARCHAR(10) NOT NULL,
    "ICOMP3" VARCHAR(10) NOT NULL,
    "IUNITE" SMALLINT NOT NULL,
    "icategorie" VARCHAR(3) NOT NULL,
    "IPRIXDOUBLE" FLOAT NOT NULL,
    "iprixtriple" FLOAT NOT NULL,
    "itypecarr" VARCHAR(20) NOT NULL,
    "ibase" SMALLINT NOT NULL,
    "IPBASE" VARCHAR(10) NOT NULL,
    "ipextrat" VARCHAR(10) NOT NULL,
    "ipextra" VARCHAR(10) NOT NULL,
    "ipsuivant" VARCHAR(10) NOT NULL,
    "isurfmax" FLOAT NOT NULL,
    "idateprixfutur" DATE NOT NULL,
    "iprixfutur" FLOAT NOT NULL,
    "iprixfuturdouble" FLOAT NOT NULL,
    "iprixfuturtriple" FLOAT NOT NULL,
    "itype" INTEGER NOT NULL,
    "ihauteurmax" FLOAT NOT NULL,
    "ilargeurmax" FLOAT NOT NULL,
    "iepaisseur" REAL NOT NULL,
    "iprixunite" FLOAT NOT NULL,
    "idesccourte" VARCHAR(25) NOT NULL,
    "iimprimeetiq" SMALLINT NOT NULL,
    "tccadre" FLOAT NOT NULL,
    "tctigevert" FLOAT NOT NULL,
    "tctigehor" FLOAT NOT NULL,
    "imprimecarr" SMALLINT NOT NULL,
    "isaisietotalcarreau" SMALLINT NOT NULL,
    "iprixcarreau" FLOAT NOT NULL,
    "isaisiedimension" SMALLINT NOT NULL,
    "iprixdoublem" FLOAT NOT NULL,
    "iprixtriplem" FLOAT NOT NULL,
    "iprixunitem" FLOAT NOT NULL,
    "iminimumunite" FLOAT NOT NULL,
    "iunitea" VARCHAR(20) NOT NULL,
    "iunitem" VARCHAR(20) NOT NULL,
    "iiminimumunitem" FLOAT NOT NULL,
    "iprixfuturunite" FLOAT NOT NULL,
    "iprixfuturunitem" FLOAT NOT NULL,
    "iprixunitaire" FLOAT NOT NULL,
    "iprixbasecarrelage" FLOAT NOT NULL,
    "iunitetype" SMALLINT NOT NULL,
    "iprix1000pied" FLOAT NOT NULL,
    "ipiedparboite" FLOAT NOT NULL,
    "idimension1" VARCHAR(10) NOT NULL,
    "idimensionspeciale" SMALLINT NOT NULL,
    "inumerotraitementspec" VARCHAR(10) NOT NULL,
    "idimension2" VARCHAR(10) NOT NULL,
    "itraitementspecial" SMALLINT NOT NULL,
    "inumerodimensionspeciale" VARCHAR(10) NOT NULL,
    "ienergieverre" SMALLINT NOT NULL,
    "iuniterouleau" VARCHAR(10) NOT NULL,
    "iunitemultiplicateur" FLOAT NOT NULL,
    "iprixuniterouleau" FLOAT NOT NULL,
    "iescbasecarr" SMALLINT NOT NULL,
    "inbcarreaudefaut" SMALLINT NOT NULL,
    "iprixfuturm" FLOAT NOT NULL,
    "iprixfuturdoublem" FLOAT NOT NULL,
    "iprixfuturtriplem" FLOAT NOT NULL,
    "iprixfuturu" FLOAT NOT NULL,
    "iprixfuturuniterouleau" FLOAT NOT NULL,
    "iprixfuturbasecarrelage" FLOAT NOT NULL,
    "iprixfuturcarreau" FLOAT NOT NULL,
    "itableauprix" SMALLINT NOT NULL,
    "itypecalculcarr" SMALLINT NOT NULL,
    "ipriorite" SMALLINT NOT NULL,
    "isurfaceinterieure" SMALLINT NOT NULL,
    "icoutanta" FLOAT NOT NULL,
    "icoutantm" FLOAT NOT NULL,
    "iactif" BIT NOT NULL,
    "Iepaisinter" VARCHAR(1) NOT NULL,
    "tYpecalculDefaut" VARCHAR(20) NOT NULL,
    "idesca" VARCHAR(80) NOT NULL,
    "IProduitAssocieCarrelage" VARCHAR(10) NOT NULL,
    "IdescriptionProduitAssociecarrelage" VARCHAR(40) NOT NULL,
    "ICoutantcarrelage" FLOAT NOT NULL,
    "iUniteMesure" SMALLINT NOT NULL,
    "icoutantcarrelageM" FLOAT NOT NULL,
    "iNoProduitFournisseur" VARCHAR(20) NOT NULL,
    "icoutUnite" FLOAT NOT NULL,
    "IdescProduitFournisseur" VARCHAR(50) NOT NULL,
    "IdescProduitFournisseurA" VARCHAR(50) NOT NULL,
    "icoutunitem" FLOAT NOT NULL,
    "inumprodfrn" VARCHAR(20) NOT NULL,
    "idescprodfrnf" VARCHAR(50) NOT NULL,
    "idescprodfrna" VARCHAR(50) NOT NULL,
    "iprixbasePeinture" FLOAT NOT NULL,
    "iprixPeinture" FLOAT NOT NULL,
    "iprixpeintureM" FLOAT NOT NULL,
    "iprixbasepeintureC" FLOAT NOT NULL,
    "iprixcarreauPeinture" FLOAT NOT NULL,
    "iCalculSimplePeinture" BIT NOT NULL,
    "iprixFuturPeinture" FLOAT NOT NULL,
    "iprixfuturpeinturem" FLOAT NOT NULL,
    "INumerotraitementspecial2" VARCHAR(10) NOT NULL,
    "INumerotraitementspecial3" VARCHAR(10) NOT NULL,
    "iRangTrtSpe1" VARCHAR(2) NOT NULL,
    "iRangTrtSpe2" VARCHAR(2) NOT NULL,
    "iRangTrtSpe3" VARCHAR(2) NOT NULL,
    "iordreImpression" NUMERIC(10,0) NOT NULL,
    "IRationDoubleTriple" REAL NOT NULL,
    "iCatPourListe" SMALLINT NOT NULL,
    "IEpaisseurPourListe" SMALLINT NOT NULL,
    "IproduitSpecial" BIT NOT NULL,
    "ISatine" BIT NOT NULL,
    "IPinede" BIT NOT NULL,
    "iTypecarrDemi" VARCHAR(20) NOT NULL,
    "iDimensionMinimum" INTEGER NOT NULL,
    "DefaultBarrotin" INTEGER NOT NULL,
    "IsUltraClair" BIT NOT NULL,
    "IsTempered" BIT NOT NULL,
    "iOrderWebGrid" INTEGER NOT NULL,
    "ienergieverreESC" BIT NOT NULL);
CREATE INDEX "WDIDX_invent_IDESC" ON "invent" ("IDESC");
CREATE INDEX "WDIDX_invent_iNoProduitFournisseur" ON "invent" ("iNoProduitFournisseur");
CREATE INDEX "WDIDX_invent_itypeiactif" ON "invent" ("itype","iactif");

-- Création de la table JourLivraisonClient
CREATE TABLE "JourLivraisonClient" (
    "IDJourLivraisonClient" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "IDClient" INTEGER,
    "IDSaisonLivraison" NUMERIC(19,0),
    "JourLivraison" INTEGER,
    "IDCamions" NUMERIC(19,0),
    "IdAdresseLivraison" INTEGER,
    "ShippingSequence" INTEGER);
CREATE INDEX "WDIDX_JourLivraisonClient_IdAdresseLivraison" ON "JourLivraisonClient" ("IdAdresseLivraison");
CREATE INDEX "WDIDX_JourLivraisonClient_IDClientIDSaisonLivraison" ON "JourLivraisonClient" ("IDClient","IDSaisonLivraison","IdAdresseLivraison");

-- Création de la table JoursFeries
CREATE TABLE "JoursFeries" (
    "IDJoursFeries" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "DateJourFerie" DATE NOT NULL UNIQUE,
    "Description" VARCHAR(50),
    "AnneeJourferie" LONGVARCHAR);

-- Création de la table ListeHisto
CREATE TABLE "ListeHisto" (
    "IDListeHisto" INTEGER PRIMARY KEY NOT NULL,
    "lClient" VARCHAR(10) NOT NULL,
    "lDate" DATE NOT NULL,
    "IdateRemplace" DATE NOT NULL);
CREATE INDEX "WDIDX_ListeHisto_lClient" ON "ListeHisto" ("lClient");

-- Création de la table ListeHistoDetail
CREATE TABLE "ListeHistoDetail" (
    "INoProduit" VARCHAR(20) NOT NULL,
    "iDescription" VARCHAR(50) NOT NULL,
    "iPrixa" FLOAT NOT NULL,
    "IPRIXM" FLOAT NOT NULL,
    "IPierCarre" FLOAT NOT NULL,
    "iMetreCarre" FLOAT NOT NULL,
    "IDListeHisto" INTEGER NOT NULL,
    "ITypeProduit" SMALLINT NOT NULL,
    "IPrixaT" FLOAT NOT NULL,
    "IPrixMT" FLOAT NOT NULL,
    "ibase" BIT NOT NULL);
CREATE INDEX "WDIDX_ListeHistoDetail_IDListeHisto" ON "ListeHistoDetail" ("IDListeHisto");

-- Création de la table LoadingType
CREATE TABLE "LoadingType" (
    "IDLoadingType" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "Description" VARCHAR(20),
    "Abreviation" VARCHAR(1) UNIQUE);

-- Création de la table LogDuplicateOrderNumber
CREATE TABLE "LogDuplicateOrderNumber" (
    "IDLogDuplicateOrderNumber" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "OrderNumber" VARCHAR(20),
    "CustomerNumber" VARCHAR(15),
    "Username" VARCHAR(20),
    "DuplicateDateTime" TIMESTAMP);
CREATE INDEX "WDIDX_LogDuplicateOrderNumber_OrderNumber" ON "LogDuplicateOrderNumber" ("OrderNumber");
CREATE INDEX "WDIDX_LogDuplicateOrderNumber_CustomerNumber" ON "LogDuplicateOrderNumber" ("CustomerNumber");
CREATE INDEX "WDIDX_LogDuplicateOrderNumber_Username" ON "LogDuplicateOrderNumber" ("Username");

-- Création de la table LogFile
CREATE TABLE "LogFile" (
    "lUtilisateur" VARCHAR(20) NOT NULL,
    "lHeure" TIME NOT NULL,
    "lDate" DATE NOT NULL,
    "lFonction" VARCHAR(50) NOT NULL,
    "lEtatPreparation" VARCHAR(1) NOT NULL,
    "lNoCommande" NUMERIC(10,0) NOT NULL,
    "lFenetre" VARCHAR(50) NOT NULL,
    "lNoClient" VARCHAR(10) NOT NULL,
    "lnoproduit" VARCHAR(20) NOT NULL,
    "lprixa" FLOAT NOT NULL,
    "lignevide" VARCHAR(1) NOT NULL,
    "lPoste" VARCHAR(20) NOT NULL);
CREATE INDEX "WDIDX_LogFile_lNoCommandelDatelHeure" ON "LogFile" ("lNoCommande","lDate","lHeure");

-- Création de la table logtrx
CREATE TABLE "logtrx" (
    "LOCLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "Date" DATE NOT NULL,
    "Nofacture" VARCHAR(10) NOT NULL,
    "notransaction" VARCHAR(6) NOT NULL,
    "Messageerreur" VARCHAR(80) NOT NULL,
    "nomusager" VARCHAR(20) NOT NULL);
CREATE INDEX "WDIDX_logtrx_Date" ON "logtrx" ("Date");
CREATE INDEX "WDIDX_logtrx_Nofacture" ON "logtrx" ("Nofacture");

-- Création de la table Match
CREATE TABLE "Match" (
    "IDMatch" INTEGER PRIMARY KEY NOT NULL,
    "mNoCommande" INTEGER NOT NULL,
    "mNoLigne" INTEGER NOT NULL,
    "MnoLignereference" INTEGER NOT NULL,
    "mTypeMatch" SMALLINT NOT NULL);
CREATE INDEX "WDIDX_Match_mNoCommande" ON "Match" ("mNoCommande");
CREATE INDEX "WDIDX_Match_mNoCommandemNoLigneRef" ON "Match" ("mNoCommande","MnoLignereference");
CREATE INDEX "WDIDX_Match_mNoCommandemNoLigne" ON "Match" ("mNoCommande","mNoLigne");

-- Création de la table mesure
CREATE TABLE "mesure" (
    "M0CLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "unitedescription" VARCHAR(10) NOT NULL UNIQUE,
    "unitemultiplicateur" FLOAT NOT NULL);

-- Création de la table OptionMenu
CREATE TABLE "OptionMenu" (
    "IDOptionMenu" INTEGER PRIMARY KEY NOT NULL,
    "NomOption" VARCHAR(50) NOT NULL,
    "LibelleOption" VARCHAR(100) NOT NULL,
    "NiveauSuperieur" NVARCHAR(50) NOT NULL,
    "NiveauOption" INTEGER NOT NULL,
    "NomComplet" VARCHAR(100) NOT NULL,
    "IsButton" BIT NOT NULL);
CREATE INDEX "WDIDX_OptionMenu_NiveauSuperieur" ON "OptionMenu" ("NiveauSuperieur");

-- Création de la table OrdreTrtXopt
CREATE TABLE "OrdreTrtXopt" (
    "NoOrdre" INTEGER NOT NULL,
    "Composant1" VARCHAR(10) NOT NULL,
    "Composant2" VARCHAR(10) NOT NULL,
    "Composant3" VARCHAR(10) NOT NULL,
    "Argon" VARCHAR(1) NOT NULL,
    "QteUnPrep" BIT NOT NULL);
CREATE INDEX "WDIDX_OrdreTrtXopt_NoOrdre" ON "OrdreTrtXopt" ("NoOrdre");
CREATE INDEX "WDIDX_OrdreTrtXopt_Composant1Composant2Composant3Argon" ON "OrdreTrtXopt" ("Composant1","Composant2","Composant3","Argon");

-- Création de la table persoens
CREATE TABLE "persoens" (
    "PECLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "ennumero" VARCHAR(20) NOT NULL UNIQUE,
    "endescription" VARCHAR(60) NOT NULL,
    "encomposant1" VARCHAR(10) NOT NULL,
    "encomposant2" VARCHAR(10) NOT NULL,
    "encomposant3" VARCHAR(10) NOT NULL,
    "encodegl" VARCHAR(10) NOT NULL,
    "epbase" VARCHAR(10) NOT NULL,
    "elien" VARCHAR(10) NOT NULL,
    "encap" SMALLINT NOT NULL,
    "engaz" SMALLINT NOT NULL,
    "enactif" BIT NOT NULL,
    "enprixa" FLOAT NOT NULL,
    "enprixm" FLOAT NOT NULL,
    "enprixfutura" FLOAT NOT NULL,
    "enprixfuturm" FLOAT NOT NULL,
    "endescriptiona" VARCHAR(60) NOT NULL,
    "enfabrication" BIT NOT NULL,
    "enpas5X10X" BIT NOT NULL,
    "EnIntercalaire" BIT NOT NULL,
    "IdClientIdhermos" VARBINARY(30) NOT NULL,
    "nbThermosPArRack" SMALLINT NOT NULL,
    "OrdreTrtXopt" INTEGER NOT NULL,
    "enDescriptionF" VARCHAR(60) NOT NULL,
    "enVerreUnite" BIT NOT NULL,
    "EnPrior" BIT NOT NULL,
    "ENShowOrder" INTEGER NOT NULL);
CREATE INDEX "WDIDX_persoens_endescription" ON "persoens" ("endescription");
CREATE INDEX "WDIDX_persoens_enactif" ON "persoens" ("enactif");
CREATE INDEX "WDIDX_persoens_IdClientIdhermos" ON "persoens" ("IdClientIdhermos");
CREATE INDEX "WDIDX_persoens_OrdreTrtXopt" ON "persoens" ("OrdreTrtXopt");
CREATE INDEX "WDIDX_persoens_clecomposant" ON "persoens" ("encomposant1","encomposant2","encomposant3");
CREATE INDEX "WDIDX_persoens_clecomposantcapgaz" ON "persoens" ("encomposant1","encomposant2","encomposant3","encap","engaz");
CREATE INDEX "WDIDX_persoens_ActifComposant" ON "persoens" ("enactif","encomposant1","encomposant2","encomposant3");
CREATE INDEX "WDIDX_persoens_ennumeroenactif" ON "persoens" ("ennumero","enactif");

-- Création de la table PrixSurchargeClient
CREATE TABLE "PrixSurchargeClient" (
    "IDPrixSurchargeClient" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "IDClient" INTEGER NOT NULL,
    "ennumero" VARCHAR(20) NOT NULL,
    "PrixAnglais" FLOAT NOT NULL,
    "PrixMetrique" FLOAT NOT NULL);
CREATE INDEX "WDIDX_PrixSurchargeClient_IDClient" ON "PrixSurchargeClient" ("IDClient");
CREATE INDEX "WDIDX_PrixSurchargeClient_ennumero" ON "PrixSurchargeClient" ("ennumero");
CREATE INDEX "WDIDX_PrixSurchargeClient_IDClientennumero" ON "PrixSurchargeClient" ("IDClient","ennumero");

-- Création de la table ProduitClient
CREATE TABLE "ProduitClient" (
    "IDProduitClient" INTEGER PRIMARY KEY NOT NULL,
    "IdClient" VARCHAR(10) NOT NULL,
    "Idproruit" VARCHAR(10) NOT NULL,
    "IPrixa" FLOAT NOT NULL,
    "iprixm" FLOAT NOT NULL,
    "IPrixCarrPiedCarre" FLOAT NOT NULL,
    "IPrixCarrMetCarre" FLOAT NOT NULL,
    "IlisteDePrix" BIT NOT NULL,
    "IPprixSpecial" BIT NOT NULL,
    "ITypeProduit" INTEGER NOT NULL,
    "iunitetype" INTEGER NOT NULL,
    "ipricxcarreauPeinture" REAL NOT NULL,
    "IListePrixpeinture" BIT NOT NULL,
    "IPrixSpecialPeinture" BIT NOT NULL,
    "Numero" VARCHAR(10) NOT NULL,
    "icategorie" VARCHAR(3) NOT NULL);
CREATE INDEX "WDIDX_ProduitClient_Idproruit" ON "ProduitClient" ("Idproruit");
CREATE INDEX "WDIDX_ProduitClient_Numero" ON "ProduitClient" ("Numero");
CREATE INDEX "WDIDX_ProduitClient_IdClientIdproruit" ON "ProduitClient" ("IdClient","Idproruit");

-- Création de la table QuotationByCustomer
CREATE TABLE "QuotationByCustomer" (
    "IDQuotationByCustomer" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "CustomerNumber" VARCHAR(15) NOT NULL,
    "Quotationdate" DATE NOT NULL,
    "TotalNumber" NUMERIC(10,0) NOT NULL,
    "IdCustomer" NUMERIC(20,0) NOT NULL);
CREATE INDEX "WDIDX_QuotationByCustomer_CustomerNumber" ON "QuotationByCustomer" ("CustomerNumber");
CREATE INDEX "WDIDX_QuotationByCustomer_IdCustomer" ON "QuotationByCustomer" ("IdCustomer");
CREATE INDEX "WDIDX_QuotationByCustomer_IdCustomerQuotationdate" ON "QuotationByCustomer" ("IdCustomer","Quotationdate");

-- Création de la table Racking
CREATE TABLE "Racking" (
    "IDRacking" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "TruckNumber" SMALLINT,
    "RackNumber" INTEGER,
    "Rackingdate" DATE,
    "CustomerNumber" VARCHAR(15),
    "OrderNumber" VARCHAR(20),
    "LineNumber" SMALLINT,
    "Width" VARCHAR(10),
    "Height" VARCHAR(10),
    "IsLift" BIT,
    "ShippingSequence" INTEGER,
    "RackAuMur" BIT,
    "ShapeNumber" VARCHAR(3),
    "OrderDetailLine" NUMERIC(19,0),
    "AlreadyOnTag" BIT,
    "PrepNumber" INTEGER,
    "TruckChange" BIT,
    "AlreadyBatched" BIT,
    "CustomerName" VARCHAR(50),
    "Istriple" BIT,
    "Finish" VARCHAR(10),
    "IsFinishOverMax" BIT,
    "ShippingName" VARCHAR(50),
    "StickerNumber" SMALLINT,
    "MasterNumber" INTEGER);
CREATE INDEX "WDIDX_Racking_MasterNumber" ON "Racking" ("MasterNumber");
CREATE INDEX "WDIDX_Racking_RackingdateTruckNumberRackNumber" ON "Racking" ("Rackingdate","TruckNumber","RackNumber");
CREATE INDEX "WDIDX_Racking_OrderNumberOrderDetailLineAlreadyOnTag" ON "Racking" ("OrderNumber","OrderDetailLine","AlreadyOnTag");
CREATE INDEX "WDIDX_Racking_TruckNumberOrderNumberOrderDetailLineAlreadyOnTag" ON "Racking" ("Rackingdate","TruckNumber","OrderNumber","OrderDetailLine","StickerNumber");

-- Création de la table RackingMaster
CREATE TABLE "RackingMaster" (
    "IDRackingMaster" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "MasterNumber" INTEGER,
    "MasterDate" DATE UNIQUE);
CREATE INDEX "WDIDX_RackingMaster_MasterNumber" ON "RackingMaster" ("MasterNumber");

-- Création de la table Rapport
CREATE TABLE "Rapport" (
    "RACLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "RAPNOM" VARCHAR(20) NOT NULL UNIQUE,
    "RAPHAUTEUR" FLOAT NOT NULL,
    "RAPLARGEUR" FLOAT NOT NULL,
    "RAPORIENTATION" SMALLINT NOT NULL,
    "RAPSOURCE" VARCHAR(20) NOT NULL);

-- Création de la table RelationEDI
CREATE TABLE "RelationEDI" (
    "IDRelationEDI" INTEGER PRIMARY KEY NOT NULL,
    "IdClient" VARCHAR(10),
    "IDpersoEns" NUMERIC(10,0),
    "IDCarrelage" VARCHAR(10),
    "fini" VARCHAR(15),
    "IDSpacer" NUMERIC(10,0),
    "descriptionEDIClient" VARCHAR(50),
    "TYpeObjet" SMALLINT,
    "ClientEdi" VARCHAR(20),
    "IDForme" VARCHAR(10),
    "IsTempered" BIT,
    "IsEnergetic" BIT,
    "IsException" BIT,
    "ExtraSupplier" VARCHAR(10),
    "ExtraCustomer" VARCHAR(10),
    "ExceptionTexte" VARCHAR(50));
CREATE INDEX "WDIDX_RelationEDI_IdClient" ON "RelationEDI" ("IdClient");
CREATE INDEX "WDIDX_RelationEDI_IDpersoEns" ON "RelationEDI" ("IDpersoEns");
CREATE INDEX "WDIDX_RelationEDI_IdClientTYpeObjetExtraCustomerIsEnergeticIsException" ON "RelationEDI" ("IdClient","TYpeObjet","ExtraCustomer","IsEnergetic","IsTempered");

-- Création de la table Répétitif
CREATE TABLE "Répétitif" (
    "IDRépétitif" INTEGER PRIMARY KEY NOT NULL,
    "NomChamp" VARCHAR(50) NOT NULL UNIQUE,
    "RépétitifChamp" BIT NOT NULL,
    "LibelleChamp" VARCHAR(25) NOT NULL,
    "Condition" VARCHAR(50) NOT NULL,
    "Persistant" BIT NOT NULL,
    "formuleaexecuter" VARCHAR(50) NOT NULL);

-- Création de la table SaisonLivraison
CREATE TABLE "SaisonLivraison" (
    "IDSaisonLivraison" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "Description" VARCHAR(80) UNIQUE,
    "sActif" BIT,
    "JoursLivraison" INTEGER,
    "DateDebut" DATE,
    "DateFin" DATE);

-- Création de la table secteur
CREATE TABLE "secteur" (
    "SECLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "secteur" VARCHAR(2) NOT NULL UNIQUE,
    "sdescription" VARCHAR(20) NOT NULL);

-- Création de la table Securite
CREATE TABLE "Securite" (
    "OptionMenu" NUMERIC(19,0) NOT NULL,
    "OptionActif" BIT NOT NULL,
    "IDUserGroup" NUMERIC(19,0) NOT NULL);
CREATE INDEX "WDIDX_Securite_IDUserGroup" ON "Securite" ("IDUserGroup");
CREATE INDEX "WDIDX_Securite_IDUserGroupOptionMenu" ON "Securite" ("IDUserGroup","OptionMenu");

-- Création de la table spacer
CREATE TABLE "spacer" (
    "S0CLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "stype" VARCHAR(1) NOT NULL,
    "sdescription" VARCHAR(40) NOT NULL,
    "sverre" VARCHAR(1) NOT NULL,
    "Sinexnoir" BIT NOT NULL,
    "Sinexblanc" BIT NOT NULL,
    "sinexgris" BIT NOT NULL,
    "snumero" VARCHAR(10) NOT NULL,
    "Sdimension" REAL NOT NULL,
    "StoleranceB" REAL NOT NULL,
    "StoleranceG" REAL NOT NULL,
    "StoleranceN" REAL NOT NULL,
    "stoleranceBMoins" REAL NOT NULL,
    "stoleranceGmoins" REAL NOT NULL,
    "stoleranceNmoins" REAL NOT NULL,
    "sprixa" FLOAT NOT NULL,
    "sprixm" FLOAT NOT NULL,
    "Saluminium" BIT NOT NULL,
    "SDimensionBMoins" REAL NOT NULL,
    "SDimensionBPlus" REAL NOT NULL,
    "SDImensionGMoins" REAL NOT NULL,
    "SDimensionGPlus" REAL NOT NULL,
    "SDimensionNMoins" REAL NOT NULL,
    "SDimensionNPlus" REAL NOT NULL);
CREATE INDEX "WDIDX_spacer_stype" ON "spacer" ("stype");
CREATE INDEX "WDIDX_spacer_snumero" ON "spacer" ("snumero");
CREATE INDEX "WDIDX_spacer_stypeSdimension" ON "spacer" ("stype","Sdimension");
CREATE INDEX "WDIDX_spacer_stypesnumero" ON "spacer" ("stype","snumero");
CREATE INDEX "WDIDX_spacer_stypeSinexblancSdimension" ON "spacer" ("stype","Sinexblanc","Sdimension");
CREATE INDEX "WDIDX_spacer_stypeSinexnoirSdimension" ON "spacer" ("stype","Sinexnoir","Sdimension");
CREATE INDEX "WDIDX_spacer_stypesinexgrisSdimension" ON "spacer" ("stype","sinexgris","Sdimension");
CREATE INDEX "WDIDX_spacer_stypeSaluminiumSdimension" ON "spacer" ("stype","Saluminium","Sdimension");

-- Création de la table spacerTest
CREATE TABLE "spacer" (
    "S0CLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "stype" VARCHAR(1) NOT NULL,
    "sdescription" VARCHAR(40) NOT NULL,
    "sverre" VARCHAR(1) NOT NULL,
    "Sinexnoir" BIT NOT NULL,
    "Sinexblanc" BIT NOT NULL,
    "sinexgris" BIT NOT NULL,
    "snumero" VARCHAR(10) NOT NULL,
    "Sdimension" REAL NOT NULL,
    "StoleranceB" REAL NOT NULL,
    "StoleranceG" REAL NOT NULL,
    "StoleranceN" REAL NOT NULL,
    "stoleranceBMoins" REAL NOT NULL,
    "stoleranceGmoins" REAL NOT NULL,
    "stoleranceNmoins" REAL NOT NULL,
    "sprixa" FLOAT NOT NULL,
    "sprixm" FLOAT NOT NULL,
    "Saluminium" BIT NOT NULL,
    "SDimensionBPlus" REAL NOT NULL,
    "SDimensionBMoins" REAL NOT NULL,
    "SDimensionGPlus" REAL NOT NULL,
    "SDImensionGMoins" REAL NOT NULL,
    "SDimensionNPlus" REAL NOT NULL,
    "SDimensionNMoins" REAL NOT NULL);
CREATE INDEX "WDIDX_spacerTest_stype" ON "spacer" ("stype");
CREATE INDEX "WDIDX_spacerTest_snumero" ON "spacer" ("snumero");
CREATE INDEX "WDIDX_spacerTest_stypeSdimension" ON "spacer" ("stype","Sdimension");
CREATE INDEX "WDIDX_spacerTest_stypesnumero" ON "spacer" ("stype","snumero");
CREATE INDEX "WDIDX_spacerTest_stypeSinexblancSdimension" ON "spacer" ("stype","Sinexblanc","Sdimension");
CREATE INDEX "WDIDX_spacerTest_stypeSinexnoirSdimension" ON "spacer" ("stype","Sinexnoir","Sdimension");
CREATE INDEX "WDIDX_spacerTest_stypesinexgrisSdimension" ON "spacer" ("stype","sinexgris","Sdimension");
CREATE INDEX "WDIDX_spacerTest_stypeSaluminiumSdimension" ON "spacer" ("stype","Saluminium","Sdimension");

-- Création de la table spqte
CREATE TABLE "spqte" (
    "S2CLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "spqclient" VARCHAR(10) NOT NULL,
    "spqproduit" VARCHAR(10) NOT NULL,
    "spcomposant1" VARCHAR(10) NOT NULL,
    "spcomposant2" VARCHAR(10) NOT NULL,
    "spcomposant3" VARCHAR(10) NOT NULL,
    "spcomposantr1" VARCHAR(10) NOT NULL,
    "spcomposantr2" VARCHAR(10) NOT NULL,
    "spqsurfmindiff" SMALLINT NOT NULL,
    "spqsurfmina" FLOAT NOT NULL,
    "spqsurfminm" FLOAT NOT NULL,
    "spqtefraismontage" FLOAT NOT NULL,
    "spqtefraismontagem" FLOAT NOT NULL,
    "spqtefraismontaget" FLOAT NOT NULL,
    "spqtefraismontagemt" FLOAT NOT NULL,
    "spcomposant1c" VARCHAR(10) NOT NULL,
    "spcomposant2c" VARCHAR(10) NOT NULL,
    "spcomposant3c" VARCHAR(10) NOT NULL,
    "spcoutant" SMALLINT NOT NULL,
    "spcomposantr3" VARCHAR(10) NOT NULL);
CREATE INDEX "WDIDX_spqte_spqclientproduit" ON "spqte" ("spqclient","spcomposant1","spcomposant2","spcomposant3");
CREATE INDEX "WDIDX_spqte_SPQCLECOMPOSANT" ON "spqte" ("spcomposant1","spcomposant2","spcomposant3");

-- Création de la table spqteint
CREATE TABLE "spqteint" (
    "S3CLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "spqclient" VARCHAR(10) NOT NULL,
    "spqproduit" VARCHAR(10) NOT NULL,
    "spqcomposant1" VARCHAR(10) NOT NULL,
    "spqcomposant2" VARCHAR(10) NOT NULL,
    "spqcomposant3" VARCHAR(10) NOT NULL,
    "spqintervallenumero" SMALLINT NOT NULL,
    "spqborneinferieure" INTEGER NOT NULL,
    "spqbornesuperieure" INTEGER NOT NULL,
    "spqpourcentageescompte" FLOAT NOT NULL);
CREATE INDEX "WDIDX_spqteint_spqclientproduitintervalle" ON "spqteint" ("spqclient","spqcomposant1","spqcomposant2","spqcomposant3","spqintervallenumero");
CREATE INDEX "WDIDX_spqteint_spqcomposant" ON "spqteint" ("spqcomposant1","spqcomposant2","spqcomposant3");

-- Création de la table surchint
CREATE TABLE "surchint" (
    "SUCLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "numero" VARCHAR(10) NOT NULL,
    "sintercallaire" VARCHAR(10) NOT NULL,
    "smontant" REAL NOT NULL,
    "smontantm" REAL NOT NULL,
    "smontantt" REAL NOT NULL,
    "smontantmt" REAL NOT NULL);
CREATE INDEX "WDIDX_surchint_cleclientinter" ON "surchint" ("numero","sintercallaire");

-- Création de la table TaxeGroupe
CREATE TABLE "TaxeGroupe" (
    "IDTaxeGroupe" INTEGER PRIMARY KEY NOT NULL,
    "TaxeGroupeDescription" VARCHAR(50) NOT NULL);

-- Création de la table TaxeGroupeDate
CREATE TABLE "TaxeGroupeDate" (
    "IDTaxeGroupeDate" INTEGER PRIMARY KEY NOT NULL,
    "IDTaxeGroupe" INTEGER NOT NULL,
    "DateDebut" DATE NOT NULL,
    "DateFin" DATE NOT NULL);
CREATE INDEX "WDIDX_TaxeGroupeDate_IDTaxeGroupe" ON "TaxeGroupeDate" ("IDTaxeGroupe");
CREATE INDEX "WDIDX_TaxeGroupeDate_DateDebut" ON "TaxeGroupeDate" ("DateDebut");
CREATE INDEX "WDIDX_TaxeGroupeDate_DateDebutDateFin" ON "TaxeGroupeDate" ("IDTaxeGroupeDate","DateDebut","DateFin");

-- Création de la table TaxeGroupeDateTaux
CREATE TABLE "TaxeGroupeDateTaux" (
    "IDTaxeGroupeDateTaux" INTEGER PRIMARY KEY NOT NULL,
    "IDTaxeGroupeDate" INTEGER NOT NULL,
    "Description" VARCHAR(10) NOT NULL,
    "Taux" REAL NOT NULL,
    "Combine" BIT NOT NULL,
    "Ordre" SMALLINT NOT NULL,
    "nogl" VARCHAR(10) NOT NULL,
    "DescriptionAnglaise" VARCHAR(10) NOT NULL);
CREATE INDEX "WDIDX_TaxeGroupeDateTaux_IDTaxeGroupeDate" ON "TaxeGroupeDateTaux" ("IDTaxeGroupeDate");
CREATE INDEX "WDIDX_TaxeGroupeDateTaux_Ordre" ON "TaxeGroupeDateTaux" ("Ordre");

-- Création de la table TCommandeAchatDetail
CREATE TABLE "CommandeAchatDetail" (
    "cadNoProduit" VARCHAR(20) NOT NULL,
    "cadQte" FLOAT NOT NULL,
    "cadCout" FLOAT NOT NULL,
    "cadDescription" VARCHAR(250) NOT NULL,
    "IDCommandeAchat" INTEGER NOT NULL,
    "cNoLigne" INTEGER NOT NULL,
    "cadTotalLigne" FLOAT NOT NULL,
    "IdCommandeoriginale" INTEGER NOT NULL,
    "cadRaye" BIT NOT NULL,
    "canoProdFrn" VARCHAR(20) NOT NULL,
    "caDescProdFrn" VARCHAR(50) NOT NULL,
    "cadQteRecue" FLOAT NOT NULL,
    "StickerDescriptionEDIRV" VARCHAR(30) NOT NULL,
    "QtyEDIRV" NUMERIC(10,0) NOT NULL,
    "ThermosCodeEDIRV" VARCHAR(30) NOT NULL,
    "ThermosWidthEDIRV" VARCHAR(5) NOT NULL,
    "ThermosHeightEDIRV" VARCHAR(5) NOT NULL,
    "ThermosFinishEDIRV" VARCHAR(10) NOT NULL,
    "ThermosSpacerEDIRV" VARCHAR(20) NOT NULL,
    "GridDescriptionEDIRV" VARCHAR(30) NOT NULL,
    "GrillWidthEDIRV" VARCHAR(2) NOT NULL,
    "GrillHeightEDIRV" VARCHAR(2) NOT NULL,
    "GrillPaintEDIRV" VARCHAR(30) NOT NULL,
    "GrillTypeEDIRV" VARCHAR(10) NOT NULL,
    "GrillDTH" VARCHAR(10) NOT NULL,
    "NoteEDIRV" VARCHAR(64) NOT NULL,
    "BarrotinEDIRV" VARCHAR(20) NOT NULL,
    "WithShape" BIT NOT NULL);
CREATE INDEX "WDIDX_TCommandeAchatDetail_IDCommandeAchat" ON "CommandeAchatDetail" ("IDCommandeAchat");
CREATE INDEX "WDIDX_TCommandeAchatDetail_IDCommandeAchatcNoLigne" ON "CommandeAchatDetail" ("IDCommandeAchat","cNoLigne");

-- Création de la table Tempo
CREATE TABLE "Tempo" (
    "TECLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "tclient" VARCHAR(10) NOT NULL,
    "tnomclient" VARCHAR(45) NOT NULL,
    "tnomcourt" VARCHAR(20) NOT NULL,
    "tordre" VARCHAR(20) NOT NULL,
    "tcomm" INTEGER NOT NULL,
    "tjob" VARCHAR(32) NOT NULL,
    "tsecteur" VARCHAR(2) NOT NULL,
    "tcap" VARCHAR(1) NOT NULL,
    "tcommclient" VARCHAR(20) NOT NULL,
    "tproduit" VARCHAR(10) NOT NULL,
    "tforme" VARCHAR(1) NOT NULL,
    "ttype" VARCHAR(1) NOT NULL,
    "tdate" DATE NOT NULL,
    "tbase" VARCHAR(10) NOT NULL,
    "tqte" INTEGER NOT NULL,
    "tlargeur" VARCHAR(10) NOT NULL,
    "tespace" VARCHAR(10) NOT NULL,
    "tligne" INTEGER NOT NULL,
    "thauteur" VARCHAR(10) NOT NULL,
    "tqtebase" SMALLINT NOT NULL,
    "timprimeetiq" SMALLINT NOT NULL,
    "tprixuni" REAL NOT NULL,
    "tprixupied" REAL NOT NULL,
    "tcapgaztube" VARCHAR(5) NOT NULL,
    "tproduitdebase" SMALLINT NOT NULL,
    "tnoetiq" SMALLINT NOT NULL,
    "ttraitementspecial" VARCHAR(1) NOT NULL,
    "tcomposant1" VARCHAR(10) NOT NULL,
    "tcomposant2" VARCHAR(10) NOT NULL,
    "tcomposant3" VARCHAR(10) NOT NULL,
    "tlignedecommande" SMALLINT NOT NULL,
    "tenergiverre" SMALLINT NOT NULL,
    "tdescription" VARCHAR(30) NOT NULL,
    "tnumeroprep" INTEGER NOT NULL,
    "tcarrelage" SMALLINT NOT NULL,
    "tdoubletriple" VARCHAR(6) NOT NULL,
    "tlargeura" VARCHAR(10) NOT NULL,
    "thauteura" VARCHAR(10) NOT NULL,
    "ttransfertspecial" SMALLINT NOT NULL,
    "TJOBLIGNE" VARCHAR(40) NOT NULL,
    "tnumeroformule" SMALLINT NOT NULL,
    "tpriorite" SMALLINT NOT NULL,
    "tsurfaceinterieure" SMALLINT NOT NULL,
    "tienergiverre" SMALLINT NOT NULL,
    "tnoforme" VARCHAR(3) NOT NULL,
    "tw" VARCHAR(8) NOT NULL,
    "tw1" VARCHAR(8) NOT NULL,
    "tw2" VARCHAR(8) NOT NULL,
    "th" VARCHAR(8) NOT NULL,
    "th1" VARCHAR(8) NOT NULL,
    "th2" VARCHAR(8) NOT NULL,
    "td" VARCHAR(8) NOT NULL,
    "tr1" VARCHAR(8) NOT NULL,
    "tr" VARCHAR(8) NOT NULL,
    "tr2" VARCHAR(8) NOT NULL,
    "ts" VARCHAR(8) NOT NULL,
    "tf" VARCHAR(8) NOT NULL,
    "tt1" VARCHAR(8) NOT NULL,
    "tt2" VARCHAR(8) NOT NULL,
    "tt3" VARCHAR(8) NOT NULL,
    "tt4" VARCHAR(8) NOT NULL,
    "tcapw" SMALLINT NOT NULL,
    "tcapw1" SMALLINT NOT NULL,
    "tcapw2" SMALLINT NOT NULL,
    "tcaph" SMALLINT NOT NULL,
    "tcaph1" SMALLINT NOT NULL,
    "tcaph2" SMALLINT NOT NULL,
    "tcapd" SMALLINT NOT NULL,
    "tcapr" SMALLINT NOT NULL,
    "tcapr1" SMALLINT NOT NULL,
    "tcapr2" SMALLINT NOT NULL,
    "tcaps" SMALLINT NOT NULL,
    "tcapf" SMALLINT NOT NULL,
    "tnombre" SMALLINT NOT NULL,
    "twordre" SMALLINT NOT NULL,
    "tw1ordre" SMALLINT NOT NULL,
    "tw2ordre" SMALLINT NOT NULL,
    "thordre" SMALLINT NOT NULL,
    "th1ordre" SMALLINT NOT NULL,
    "th2ordre" SMALLINT NOT NULL,
    "tt1ordre" SMALLINT NOT NULL,
    "tt2ordre" SMALLINT NOT NULL,
    "tt3ordre" SMALLINT NOT NULL,
    "tt4ordre" SMALLINT NOT NULL,
    "trordre" SMALLINT NOT NULL,
    "tr1ordre" SMALLINT NOT NULL,
    "tr2ordre" SMALLINT NOT NULL,
    "tdordre" SMALLINT NOT NULL,
    "tsordre" SMALLINT NOT NULL,
    "tfordre" SMALLINT NOT NULL,
    "targon" SMALLINT NOT NULL,
    "tqteoriginale" INTEGER NOT NULL,
    "tnbmorceau1" VARCHAR(10) NOT NULL,
    "tnbmorceau2" VARCHAR(10) NOT NULL,
    "tnbmorceau3" VARCHAR(10) NOT NULL,
    "tnbmorceau4" VARCHAR(10) NOT NULL,
    "tnbmorceau5" VARCHAR(10) NOT NULL,
    "tnbmorceau6" VARCHAR(10) NOT NULL,
    "tnbmorceau7" VARCHAR(10) NOT NULL,
    "tnbmorceau8" VARCHAR(10) NOT NULL,
    "tnbmorceau9" VARCHAR(10) NOT NULL,
    "tnbmorceau10" VARCHAR(10) NOT NULL,
    "tnbdimension1" VARCHAR(10) NOT NULL,
    "tnbdimension2" VARCHAR(10) NOT NULL,
    "tnbdimension3" VARCHAR(10) NOT NULL,
    "tnbdimension4" VARCHAR(10) NOT NULL,
    "tnbdimension5" VARCHAR(10) NOT NULL,
    "tnbdimension6" VARCHAR(10) NOT NULL,
    "tnbdimension7" VARCHAR(10) NOT NULL,
    "tnbdimension8" VARCHAR(10) NOT NULL,
    "tnbdimension9" VARCHAR(10) NOT NULL,
    "tnbdimension10" VARCHAR(10) NOT NULL,
    "tcarreauv" SMALLINT NOT NULL,
    "tcarreauh" SMALLINT NOT NULL,
    "Tespace2" VARCHAR(10) NOT NULL,
    "Tnumcarr" VARCHAR(10) NOT NULL,
    "TtypeSpacer" VARCHAR(2) NOT NULL,
    "Tnotes" VARCHAR(32) NOT NULL,
    "TtypeCalcul" VARCHAR(20) NOT NULL,
    "Tvx" INTEGER NOT NULL,
    "TMatch" INTEGER NOT NULL,
    "Tnumligne" INTEGER NOT NULL,
    "Tfini" VARCHAR(10) NOT NULL,
    "TordreXopt" INTEGER NOT NULL,
    "THauteurContour" VARCHAR(10) NOT NULL,
    "TLargeurContour" VARCHAR(10) NOT NULL,
    "THauteurTete" VARCHAR(10) NOT NULL,
    "Tvx1" INTEGER NOT NULL,
    "tDDH" INTEGER NOT NULL,
    "tDDV" INTEGER NOT NULL,
    "tnote2" VARCHAR(32) NOT NULL,
    "Tfabrication" BIT NOT NULL,
    "tcouleurcarr" VARCHAR(32) NOT NULL,
    "tcouleurcarr2" VARCHAR(32) NOT NULL,
    "tnomLivraison" VARCHAR(45) NOT NULL,
    "Trngtrtspe" VARCHAR(10) NOT NULL,
    "tprodtrtspe" VARCHAR(10) NOT NULL,
    "TDemiCarrelage" BIT NOT NULL,
    "TIntercalaireSeulement" BIT NOT NULL,
    "tnoRecFdetail" INTEGER NOT NULL,
    "ttypeintercalaire" VARCHAR(1) NOT NULL,
    "tcouleurfond" INTEGER NOT NULL,
    "tcouleurtexte" INTEGER NOT NULL,
    "tgras" BIT NOT NULL,
    "Titalique" BIT NOT NULL,
    "tnoteSpeciale" VARCHAR(200) NOT NULL,
    "tdaterequise" DATE NOT NULL,
    "Tdt" REAL NOT NULL,
    "tnoRack" LONGVARCHAR NOT NULL,
    "TDeA" VARCHAR(15) NOT NULL,
    "tposition" INTEGER NOT NULL,
    "TdimensionTri" FLOAT NOT NULL,
    "tGroupe" VARCHAR(10) NOT NULL,
    "idfdetailtempo" INTEGER NOT NULL,
    "tQteTotal" INTEGER NOT NULL,
    "tscellant" SMALLINT NOT NULL,
    "TDescCarr" VARCHAR(32) NOT NULL,
    "PoidsUnitaire" NUMERIC(7,3) NOT NULL,
    "camion" VARCHAR(10) NOT NULL);
CREATE INDEX "WDIDX_Tempo_tcomm" ON "Tempo" ("tcomm");
CREATE INDEX "WDIDX_Tempo_tproduit" ON "Tempo" ("tproduit");
CREATE INDEX "WDIDX_Tempo_tbase" ON "Tempo" ("tbase");
CREATE INDEX "WDIDX_Tempo_tposition" ON "Tempo" ("tposition");
CREATE INDEX "WDIDX_Tempo_idfdetailtempo" ON "Tempo" ("idfdetailtempo");
CREATE INDEX "WDIDX_Tempo_base_comm" ON "Tempo" ("tbase","tcomm","tligne");
CREATE INDEX "WDIDX_Tempo_traitement_base" ON "Tempo" ("ttraitementspecial","tbase");
CREATE INDEX "WDIDX_Tempo_cletrait_base_esp_comm_ligne" ON "Tempo" ("ttraitementspecial","tbase","Trngtrtspe","tcomm","tlignedecommande","TECLEUNIK");
CREATE INDEX "WDIDX_Tempo_clecommandeligne" ON "Tempo" ("tcomm","tlignedecommande","TECLEUNIK");
CREATE INDEX "WDIDX_Tempo_clecomposant" ON "Tempo" ("tcomposant1","tcomposant2","tcomposant3");
CREATE INDEX "WDIDX_Tempo_cleprio_trai_base_esp_comm_lig" ON "Tempo" ("tpriorite","ttraitementspecial","tbase","tespace","tcomm","tlignedecommande");
CREATE INDEX "WDIDX_Tempo_Ordre_comm_ligne" ON "Tempo" ("TordreXopt","tcomm","tligne");
CREATE INDEX "WDIDX_Tempo_tcommTnumligne" ON "Tempo" ("tcomm","tlignedecommande","Tnumligne");
CREATE INDEX "WDIDX_Tempo_CleRang" ON "Tempo" ("tpriorite","ttraitementspecial","tbase","Trngtrtspe","tprodtrtspe");
CREATE INDEX "WDIDX_Tempo_tenergiverretposition" ON "Tempo" ("tenergiverre","tposition");

-- Création de la table TEMPO99
CREATE TABLE "TEMPO99" (
    "T0CLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "tclient" VARCHAR(10) NOT NULL,
    "tnomclient" VARCHAR(45) NOT NULL,
    "tnomcourt" VARCHAR(20) NOT NULL,
    "tordre" VARCHAR(20) NOT NULL,
    "tcomm" INTEGER NOT NULL,
    "tjob" VARCHAR(32) NOT NULL,
    "tsecteur" VARCHAR(1) NOT NULL,
    "tcap" VARCHAR(1) NOT NULL,
    "tcommclient" VARCHAR(20) NOT NULL,
    "tproduit" VARCHAR(10) NOT NULL,
    "tdescprod" VARCHAR(60) NOT NULL,
    "tforme" VARCHAR(1) NOT NULL,
    "ttype" VARCHAR(1) NOT NULL,
    "tdate" DATE NOT NULL,
    "tbase" VARCHAR(10) NOT NULL,
    "tqte" INTEGER NOT NULL,
    "tlargeur" VARCHAR(10) NOT NULL,
    "tespace" VARCHAR(10) NOT NULL,
    "tligne" INTEGER NOT NULL,
    "thauteur" VARCHAR(10) NOT NULL,
    "tqtebase" SMALLINT NOT NULL,
    "timprimeetiq" SMALLINT NOT NULL,
    "tprixuni" REAL NOT NULL,
    "tprixupied" REAL NOT NULL,
    "tcapgaztube" VARCHAR(5) NOT NULL,
    "tenergiverre" SMALLINT NOT NULL,
    "TJOBLIGNE" VARCHAR(40) NOT NULL,
    "tdaterequise" DATE NOT NULL,
    "tdescription" VARCHAR(20) NOT NULL,
    "tcarrelage" SMALLINT NOT NULL,
    "tdoubletriple" VARCHAR(6) NOT NULL,
    "tcomposant1" VARCHAR(10) NOT NULL,
    "tcomposant2" VARCHAR(10) NOT NULL,
    "tcomposant3" VARCHAR(10) NOT NULL,
    "tnumeroformule" SMALLINT NOT NULL,
    "tlargeurm" VARCHAR(10) NOT NULL,
    "thauteurm" VARCHAR(10) NOT NULL,
    "tqteoriginale" INTEGER NOT NULL,
    "tnbmorceau1" VARCHAR(10) NOT NULL,
    "tnbmorceau2" VARCHAR(10) NOT NULL,
    "tnbmorceau3" VARCHAR(10) NOT NULL,
    "tnbmorceau4" VARCHAR(10) NOT NULL,
    "tnbmorceau5" VARCHAR(10) NOT NULL,
    "tnbmorceau6" VARCHAR(10) NOT NULL,
    "tnbmorceau7" VARCHAR(10) NOT NULL,
    "tnbmorceau8" VARCHAR(10) NOT NULL,
    "tnbmorceau9" VARCHAR(10) NOT NULL,
    "tnbmorceau10" VARCHAR(10) NOT NULL,
    "tnbdimension1" VARCHAR(10) NOT NULL,
    "tnbdimension2" VARCHAR(10) NOT NULL,
    "tnbdimension3" VARCHAR(10) NOT NULL,
    "tnbdimension4" VARCHAR(10) NOT NULL,
    "tnbdimension5" VARCHAR(10) NOT NULL,
    "tnbdimension6" VARCHAR(10) NOT NULL,
    "tnbdimension7" VARCHAR(10) NOT NULL,
    "tnbdimension8" VARCHAR(10) NOT NULL,
    "tnbdimension9" VARCHAR(10) NOT NULL,
    "tnbdimension10" VARCHAR(10) NOT NULL,
    "tcarreauv" SMALLINT NOT NULL,
    "tcarreauh" SMALLINT NOT NULL,
    "Tespace2" VARCHAR(10) NOT NULL,
    "Tnumcarr" VARCHAR(10) NOT NULL,
    "TtypeSpacer" VARCHAR(2) NOT NULL,
    "Tnotes" VARCHAR(32) NOT NULL,
    "TtypeCalcul" VARCHAR(20) NOT NULL,
    "Tvx" INTEGER NOT NULL,
    "TMatch" INTEGER NOT NULL,
    "Tnumligne" INTEGER NOT NULL,
    "Ttest" VARCHAR(1) NOT NULL,
    "thauteurcontour" VARCHAR(10) NOT NULL,
    "tlargeurcontour" VARCHAR(10) NOT NULL,
    "tvx1" INTEGER NOT NULL,
    "tddh" INTEGER NOT NULL,
    "tddv" INTEGER NOT NULL,
    "THauteurTete" VARCHAR(10) NOT NULL,
    "Tnumeroprep" NUMERIC(19,0) NOT NULL,
    "Tdt" REAL NOT NULL);
CREATE INDEX "WDIDX_TEMPO99_tcomm" ON "TEMPO99" ("tcomm");
CREATE INDEX "WDIDX_TEMPO99_tproduit" ON "TEMPO99" ("tproduit");
CREATE INDEX "WDIDX_TEMPO99_tbase" ON "TEMPO99" ("tbase");
CREATE INDEX "WDIDX_TEMPO99_base_comm" ON "TEMPO99" ("tcomm","tligne");

-- Création de la table TempoAjustPrix
CREATE TABLE "TempoAjustPrix" (
    "numero" VARCHAR(10) NOT NULL,
    "PrixAnglais" FLOAT NOT NULL,
    "PrixMetrique" FLOAT NOT NULL,
    "PrixDeBase" FLOAT NOT NULL,
    "PrixCarreau" FLOAT NOT NULL,
    "PrixPiedCarre" FLOAT NOT NULL,
    "PrixMetreCarre" FLOAT NOT NULL);

-- Création de la table tempoHisto
CREATE TABLE "tempoHisto" (
    "noClient" VARCHAR(10),
    "QteQuotidienne" REAL,
    "VenteQuotidienne" FLOAT,
    "VenteDebutMois" FLOAT,
    "VenteDebutMoisPrec" FLOAT,
    "VenteDebutAnnee" FLOAT,
    "VenbteDebutAnneePres" FLOAT,
    "VentesEnCours" FLOAT,
    "QteEnCours" INTEGER,
    "NOMCLIENT" VARCHAR(50),
    "cvendeur" INTEGER,
    "NOmVendeur" VARCHAR(50),
    "CategClient" VARCHAR(2));
CREATE INDEX "WDIDX_tempoHisto_noClient" ON "tempoHisto" ("noClient");
CREATE INDEX "WDIDX_tempoHisto_cvendeur" ON "tempoHisto" ("cvendeur");
CREATE INDEX "WDIDX_tempoHisto_CategClient" ON "tempoHisto" ("CategClient");
CREATE INDEX "WDIDX_tempoHisto_cvendeurnoClient" ON "tempoHisto" ("cvendeur","noClient");

-- Création de la table tempoListe
CREATE TABLE "tempo" (
    "TECLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "tclient" VARCHAR(10) NOT NULL,
    "tnomclient" VARCHAR(45) NOT NULL,
    "tnomcourt" VARCHAR(20) NOT NULL,
    "tordre" VARCHAR(20) NOT NULL,
    "tcomm" INTEGER NOT NULL,
    "tjob" VARCHAR(32) NOT NULL,
    "tsecteur" VARCHAR(1) NOT NULL,
    "tcap" VARCHAR(1) NOT NULL,
    "tcommclient" VARCHAR(20) NOT NULL,
    "tproduit" VARCHAR(10) NOT NULL,
    "tforme" VARCHAR(1) NOT NULL,
    "ttype" VARCHAR(1) NOT NULL,
    "tdate" DATE NOT NULL,
    "tbase" VARCHAR(10) NOT NULL,
    "tqte" INTEGER NOT NULL,
    "tlargeur" VARCHAR(10) NOT NULL,
    "tespace" VARCHAR(10) NOT NULL,
    "tligne" INTEGER NOT NULL,
    "thauteur" VARCHAR(10) NOT NULL,
    "tqtebase" SMALLINT NOT NULL,
    "timprimeetiq" SMALLINT NOT NULL,
    "tprixuni" REAL NOT NULL,
    "tprixupied" REAL NOT NULL,
    "tcapgaztube" VARCHAR(5) NOT NULL,
    "tproduitdebase" SMALLINT NOT NULL,
    "tnoetiq" SMALLINT NOT NULL,
    "ttraitementspecial" VARCHAR(1) NOT NULL,
    "tcomposant1" VARCHAR(10) NOT NULL,
    "tcomposant2" VARCHAR(10) NOT NULL,
    "tcomposant3" VARCHAR(10) NOT NULL,
    "tlignedecommande" SMALLINT NOT NULL,
    "tenergiverre" SMALLINT NOT NULL,
    "tdescription" VARCHAR(20) NOT NULL,
    "tnumeroprep" INTEGER NOT NULL,
    "tcarrelage" SMALLINT NOT NULL,
    "tdoubletriple" VARCHAR(6) NOT NULL,
    "tlargeura" VARCHAR(10) NOT NULL,
    "thauteura" VARCHAR(10) NOT NULL,
    "ttransfertspecial" SMALLINT NOT NULL,
    "TJOBLIGNE" VARCHAR(40) NOT NULL,
    "tnumeroformule" SMALLINT NOT NULL,
    "tpriorite" SMALLINT NOT NULL,
    "tsurfaceinterieure" SMALLINT NOT NULL,
    "tienergiverre" SMALLINT NOT NULL,
    "tnoforme" VARCHAR(3) NOT NULL,
    "tw" VARCHAR(8) NOT NULL,
    "tw1" VARCHAR(8) NOT NULL,
    "tw2" VARCHAR(8) NOT NULL,
    "th" VARCHAR(8) NOT NULL,
    "th1" VARCHAR(8) NOT NULL,
    "th2" VARCHAR(8) NOT NULL,
    "td" VARCHAR(8) NOT NULL,
    "tr1" VARCHAR(8) NOT NULL,
    "tr" VARCHAR(8) NOT NULL,
    "tr2" VARCHAR(8) NOT NULL,
    "ts" VARCHAR(8) NOT NULL,
    "tf" VARCHAR(8) NOT NULL,
    "tt1" VARCHAR(8) NOT NULL,
    "tt2" VARCHAR(8) NOT NULL,
    "tt3" VARCHAR(8) NOT NULL,
    "tt4" VARCHAR(8) NOT NULL,
    "tcapw" SMALLINT NOT NULL,
    "tcapw1" SMALLINT NOT NULL,
    "tcapw2" SMALLINT NOT NULL,
    "tcaph" SMALLINT NOT NULL,
    "tcaph1" SMALLINT NOT NULL,
    "tcaph2" SMALLINT NOT NULL,
    "tcapd" SMALLINT NOT NULL,
    "tcapr" SMALLINT NOT NULL,
    "tcapr1" SMALLINT NOT NULL,
    "tcapr2" SMALLINT NOT NULL,
    "tcaps" SMALLINT NOT NULL,
    "tcapf" SMALLINT NOT NULL,
    "tnombre" SMALLINT NOT NULL,
    "twordre" SMALLINT NOT NULL,
    "tw1ordre" SMALLINT NOT NULL,
    "tw2ordre" SMALLINT NOT NULL,
    "thordre" SMALLINT NOT NULL,
    "th1ordre" SMALLINT NOT NULL,
    "th2ordre" SMALLINT NOT NULL,
    "tt1ordre" SMALLINT NOT NULL,
    "tt2ordre" SMALLINT NOT NULL,
    "tt3ordre" SMALLINT NOT NULL,
    "tt4ordre" SMALLINT NOT NULL,
    "trordre" SMALLINT NOT NULL,
    "tr1ordre" SMALLINT NOT NULL,
    "tr2ordre" SMALLINT NOT NULL,
    "tdordre" SMALLINT NOT NULL,
    "tsordre" SMALLINT NOT NULL,
    "tfordre" SMALLINT NOT NULL,
    "targon" SMALLINT NOT NULL,
    "tqteoriginale" INTEGER NOT NULL,
    "tnbmorceau1" VARCHAR(10) NOT NULL,
    "tnbmorceau2" VARCHAR(10) NOT NULL,
    "tnbmorceau3" VARCHAR(10) NOT NULL,
    "tnbmorceau4" VARCHAR(10) NOT NULL,
    "tnbmorceau5" VARCHAR(10) NOT NULL,
    "tnbmorceau6" VARCHAR(10) NOT NULL,
    "tnbmorceau7" VARCHAR(10) NOT NULL,
    "tnbmorceau8" VARCHAR(10) NOT NULL,
    "tnbmorceau9" VARCHAR(10) NOT NULL,
    "tnbmorceau10" VARCHAR(10) NOT NULL,
    "tnbdimension1" VARCHAR(10) NOT NULL,
    "tnbdimension2" VARCHAR(10) NOT NULL,
    "tnbdimension3" VARCHAR(10) NOT NULL,
    "tnbdimension4" VARCHAR(10) NOT NULL,
    "tnbdimension5" VARCHAR(10) NOT NULL,
    "tnbdimension6" VARCHAR(10) NOT NULL,
    "tnbdimension7" VARCHAR(10) NOT NULL,
    "tnbdimension8" VARCHAR(10) NOT NULL,
    "tnbdimension9" VARCHAR(10) NOT NULL,
    "tnbdimension10" VARCHAR(10) NOT NULL,
    "tcarreauv" SMALLINT NOT NULL,
    "tcarreauh" SMALLINT NOT NULL,
    "Tespace2" VARCHAR(10) NOT NULL,
    "Tnumcarr" VARCHAR(10) NOT NULL,
    "TtypeSpacer" VARCHAR(2) NOT NULL,
    "Tnotes" VARCHAR(32) NOT NULL,
    "TtypeCalcul" VARCHAR(20) NOT NULL,
    "Tvx" INTEGER NOT NULL,
    "TMatch" INTEGER NOT NULL,
    "Tnumligne" INTEGER NOT NULL,
    "Tfini" VARCHAR(10) NOT NULL,
    "TordreXopt" INTEGER NOT NULL,
    "THauteurContour" VARCHAR(10) NOT NULL,
    "TLargeurContour" VARCHAR(10) NOT NULL,
    "THauteurTete" VARCHAR(10) NOT NULL,
    "Tvx1" INTEGER NOT NULL,
    "tDDH" INTEGER NOT NULL,
    "tDDV" INTEGER NOT NULL,
    "tnote2" VARCHAR(32) NOT NULL,
    "Tfabrication" BIT NOT NULL,
    "tcouleurcarr" VARCHAR(32) NOT NULL,
    "tcouleurcarr2" VARCHAR(32) NOT NULL,
    "tnomLivraison" VARCHAR(45) NOT NULL,
    "tscellant" SMALLINT NOT NULL,
    "PoidsUnitaire" NUMERIC(7,3) NOT NULL);
CREATE INDEX "WDIDX_tempoListe_tcomm" ON "tempo" ("tcomm");
CREATE INDEX "WDIDX_tempoListe_tproduit" ON "tempo" ("tproduit");
CREATE INDEX "WDIDX_tempoListe_tbase" ON "tempo" ("tbase");
CREATE INDEX "WDIDX_tempoListe_base_comm" ON "tempo" ("tbase","tcomm","tligne");
CREATE INDEX "WDIDX_tempoListe_traitement_base" ON "tempo" ("ttraitementspecial","tbase");
CREATE INDEX "WDIDX_tempoListe_cletrait_base_esp_comm_ligne" ON "tempo" ("ttraitementspecial","tbase","tcomm","tlignedecommande","TECLEUNIK");
CREATE INDEX "WDIDX_tempoListe_clecommandeligne" ON "tempo" ("tcomm","tlignedecommande","TECLEUNIK");
CREATE INDEX "WDIDX_tempoListe_clecomposant" ON "tempo" ("tcomposant1","tcomposant2","tcomposant3");
CREATE INDEX "WDIDX_tempoListe_cleprio_trai_base_esp_comm_lig" ON "tempo" ("tpriorite","ttraitementspecial","tbase","tespace","tcomm","tlignedecommande");
CREATE INDEX "WDIDX_tempoListe_Ordre_comm_ligne" ON "tempo" ("TordreXopt","tcomm","tligne");
CREATE INDEX "WDIDX_tempoListe_tcommTnumligne" ON "tempo" ("tcomm","tlignedecommande","Tnumligne");

-- Création de la table TempoOrderNumber
CREATE TABLE "TempoOrderNumber" (
    "IDTempoOrderNumber" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "OrderNumber" VARCHAR(20),
    "Username" VARCHAR(30));
CREATE INDEX "WDIDX_TempoOrderNumber_OrderNumber" ON "TempoOrderNumber" ("OrderNumber");

-- Création de la table ThermosClient
CREATE TABLE "ThermosClient" (
    "IdClient" VARCHAR(10) NOT NULL,
    "IdThermos" VARCHAR(20) NOT NULL,
    "Tprixa" FLOAT NOT NULL,
    "Tprixm" FLOAT NOT NULL,
    "ListeDePrix" BIT NOT NULL,
    "prixSpecial" BIT NOT NULL);
CREATE INDEX "WDIDX_ThermosClient_IdThermos" ON "ThermosClient" ("IdThermos");
CREATE INDEX "WDIDX_ThermosClient_IdClientIdhermos" ON "ThermosClient" ("IdClient","IdThermos");

-- Création de la table ThermosPoids
CREATE TABLE "ThermosPoids" (
    "IDThermosPoids" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "Épaisseur" SMALLINT,
    "PoidsSimple" NUMERIC(5,3),
    "PoidsDouble" NUMERIC(5,3),
    "PoidsTriple" NUMERIC(5,3));

-- Création de la table TigerCarrelage
CREATE TABLE "TigerCarrelage" (
    "IMCLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "vcommande" VARCHAR(10) NOT NULL,
    "vlignecommande" SMALLINT NOT NULL,
    "vclientnom" VARCHAR(50) NOT NULL,
    "vdate" DATE NOT NULL,
    "vespace" VARCHAR(10) NOT NULL,
    "vcommandeclient" VARCHAR(10) NOT NULL,
    "vcapgazlowe" VARCHAR(10) NOT NULL,
    "vtraitementspecial" VARCHAR(1) NOT NULL,
    "vpbase" VARCHAR(10) NOT NULL,
    "vlargeur" VARCHAR(10) NOT NULL,
    "vhauteur" VARCHAR(10) NOT NULL,
    "vnoprep" INTEGER NOT NULL,
    "vnoligne" INTEGER NOT NULL,
    "vimprime" INTEGER NOT NULL,
    "vesptype" VARCHAR(8) NOT NULL,
    "vqte" SMALLINT NOT NULL,
    "vdescriptionCarr" VARCHAR(45) NOT NULL,
    "vcarrelage" VARCHAR(10) NOT NULL,
    "vligneaimprimer" VARCHAR(110) NOT NULL,
    "vcode" VARCHAR(10) NOT NULL,
    "vforme" SMALLINT NOT NULL,
    "vNbMorceau" INTEGER NOT NULL,
    "vDimesionMorceau" REAL NOT NULL,
    "vMarquageL" REAL NOT NULL,
    "vMarquageH" REAL NOT NULL,
    "vMarquageLc" REAL NOT NULL,
    "vMarquageHc" REAL NOT NULL,
    "vNbMorceauFlag" BIT NOT NULL,
    "vMarquageLFlag" BIT NOT NULL,
    "vMarquageHFlag" BIT NOT NULL,
    "vMarquageLcFlag" BIT NOT NULL,
    "vMarquageHcFlag" BIT NOT NULL,
    "vNbcarreauL" SMALLINT NOT NULL,
    "vNbCarreauH" SMALLINT NOT NULL,
    "vFlagVertical" BIT NOT NULL,
    "vMarquageLd" REAL NOT NULL,
    "vMarquageHd" REAL NOT NULL,
    "vMarquageLcd" REAL NOT NULL,
    "vmarquageHcd" REAL NOT NULL,
    "vMarquageLdFlag" BIT NOT NULL,
    "vMarquageHdFlag" BIT NOT NULL,
    "vMarquageLcdFlag" BIT NOT NULL,
    "vMarquageHcdFlag" BIT NOT NULL,
    "Vhauteurtete" VARCHAR(10) NOT NULL,
    "vlargeurcontour" VARCHAR(10) NOT NULL,
    "vhauteurcontour" VARCHAR(10) NOT NULL,
    "vFlagbarreDifferente" BIT NOT NULL,
    "vNumCarrBarre" VARCHAR(10) NOT NULL,
    "vNumCarrBarrePos" SMALLINT NOT NULL,
    "VTypeDessin" SMALLINT NOT NULL,
    "VNoForme" VARCHAR(3) NOT NULL,
    "vPeinture" BIT NOT NULL);
CREATE INDEX "WDIDX_TigerCarrelage_clecommandeligne" ON "TigerCarrelage" ("vnoprep","vtraitementspecial","vpbase","vespace","vcommande","vlignecommande");
CREATE INDEX "WDIDX_TigerCarrelage_clecommandelignefdetail" ON "TigerCarrelage" ("vnoprep","vcommande","vnoligne","vNumCarrBarrePos");

-- Création de la table TQtePrep
CREATE TABLE "TQtePrep" (
    "TNoProd" VARCHAR(10) NOT NULL,
    "TtypeCalcul" VARCHAR(20) NOT NULL,
    "TDimension" FLOAT NOT NULL,
    "tType" SMALLINT NOT NULL,
    "tdesc" VARCHAR(50) NOT NULL,
    "tqte" INTEGER NOT NULL,
    "TNoLot" NUMERIC(10,0) NOT NULL);
CREATE INDEX "WDIDX_TQtePrep_TNoProdTtypeCalcul" ON "TQtePrep" ("TNoProd","TtypeCalcul");
CREATE INDEX "WDIDX_TQtePrep_tdescTtypeCalcul" ON "TQtePrep" ("tdesc","TtypeCalcul");

-- Création de la table Tracking
CREATE TABLE "Tracking" (
    "IDTracking" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "InvoiceID" NUMERIC(10,0),
    "InvoiceNumber" NUMERIC(10,0) UNIQUE,
    "IsEDI" BIT,
    "Computername" VARCHAR(50),
    "NumberOfGrill" INTEGER,
    "NumberOfThermos" INTEGER,
    "DocumentType" VARCHAR(1),
    "NumberOfLines" INTEGER,
    "Amount" NUMERIC(24,6),
    "InvoiceDate" DATE,
    "Username" VARCHAR(20));
CREATE INDEX "WDIDX_Tracking_IsEDI" ON "Tracking" ("IsEDI");
CREATE INDEX "WDIDX_Tracking_Computername" ON "Tracking" ("Computername");
CREATE INDEX "WDIDX_Tracking_DocumentType" ON "Tracking" ("DocumentType");
CREATE INDEX "WDIDX_Tracking_InvoiceDate" ON "Tracking" ("InvoiceDate");

-- Création de la table Traduction
CREATE TABLE "Traduction" (
    "IDTraduction" INTEGER PRIMARY KEY NOT NULL,
    "Description" VARCHAR(50) NOT NULL,
    "dfrancais" VARCHAR(75) NOT NULL,
    "danglais" VARCHAR(75) NOT NULL,
    "dlongueurmax" SMALLINT NOT NULL,
    "trecherche" VARCHAR(20) NOT NULL UNIQUE,
    "tetat" VARCHAR(4) NOT NULL);
CREATE INDEX "WDIDX_Traduction_tetat" ON "Traduction" ("tetat");

-- Création de la table Transferttempo
CREATE TABLE "Transferttempo" (
    "IDTransferttempo" INTEGER PRIMARY KEY NOT NULL,
    "nogl" VARCHAR(10) NOT NULL UNIQUE,
    "descriptionGl" VARCHAR(50) NOT NULL,
    "Montant" FLOAT NOT NULL,
    "Debitcredit" VARCHAR(1) NOT NULL);

-- Création de la table trdetail
CREATE TABLE "trdetail" (
    "TRCLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "fdligne" NUMERIC(19,0) NOT NULL UNIQUE,
    "fdnocomm" INTEGER NOT NULL,
    "fdnumprod" VARCHAR(10) NOT NULL,
    "fddesc" VARCHAR(65) NOT NULL,
    "fdqte" REAL NOT NULL,
    "fdqteafacturer" REAL NOT NULL,
    "fdqtedejafacture" REAL NOT NULL,
    "fdcap" SMALLINT NOT NULL,
    "fdespace" VARCHAR(10) NOT NULL,
    "fdespaceinex" VARCHAR(10) NOT NULL,
    "fdforme99" SMALLINT NOT NULL,
    "fdlargeur" VARCHAR(10) NOT NULL,
    "fdlargeura" VARCHAR(10) NOT NULL,
    "fdhauteur" VARCHAR(10) NOT NULL,
    "fdhauteura" VARCHAR(10) NOT NULL,
    "fdhauteur1" VARCHAR(10) NOT NULL,
    "fdhauteur1a" VARCHAR(10) NOT NULL,
    "fdprixu" REAL NOT NULL,
    "fdlien" SMALLINT NOT NULL,
    "fdcarrelage" SMALLINT NOT NULL,
    "fdcarreauv" SMALLINT NOT NULL,
    "fdcarreauh" SMALLINT NOT NULL,
    "fdcomposant1" VARCHAR(10) NOT NULL,
    "fdcomposant2" VARCHAR(10) NOT NULL,
    "fdcomposant3" VARCHAR(10) NOT NULL,
    "fdnumcarr" VARCHAR(10) NOT NULL,
    "ftype" SMALLINT NOT NULL,
    "fdprixtotal" REAL NOT NULL,
    "fdcarrpruxuc" REAL NOT NULL,
    "frcarrprixu" REAL NOT NULL,
    "fdcarrprixtotal" REAL NOT NULL,
    "fdprixupied" REAL NOT NULL,
    "fdcodegl" VARCHAR(10) NOT NULL,
    "fdimprimecarr" SMALLINT NOT NULL,
    "ffini" VARCHAR(10) NOT NULL,
    "fcapgaztube" VARCHAR(5) NOT NULL,
    "fnumeroregroupement" VARCHAR(10) NOT NULL,
    "fregroupement" VARCHAR(10) NOT NULL,
    "fdverreunite" SMALLINT NOT NULL,
    "fdenergiverre" SMALLINT NOT NULL,
    "traye" SMALLINT NOT NULL,
    "trancienneligne" INTEGER NOT NULL,
    "trcalculescbasecarr" SMALLINT NOT NULL,
    "TRJOBLIGNE" VARCHAR(40) NOT NULL,
    "tfixeprixgroupe" SMALLINT NOT NULL,
    "surchargeenergie" REAL NOT NULL,
    "tdescoriginale" VARCHAR(40) NOT NULL,
    "fdcarrprixdebase" REAL NOT NULL,
    "fdspecdim" SMALLINT NOT NULL,
    "fdcommentaire" VARCHAR(50) NOT NULL,
    "fdlargeuru" VARCHAR(10) NOT NULL,
    "fdhauteuru" VARCHAR(10) NOT NULL,
    "fdforme" VARCHAR(3) NOT NULL,
    "fdw" VARCHAR(8) NOT NULL,
    "fdw1" VARCHAR(8) NOT NULL,
    "fdw2" VARCHAR(8) NOT NULL,
    "fdh" VARCHAR(8) NOT NULL,
    "fdh1" VARCHAR(8) NOT NULL,
    "fdh2" VARCHAR(8) NOT NULL,
    "fdd" VARCHAR(8) NOT NULL,
    "fdr" VARCHAR(8) NOT NULL,
    "fdr1" VARCHAR(8) NOT NULL,
    "fdr2" VARCHAR(8) NOT NULL,
    "fds" VARCHAR(8) NOT NULL,
    "fdf" VARCHAR(8) NOT NULL,
    "fdt1" VARCHAR(1) NOT NULL,
    "fdt2" VARCHAR(1) NOT NULL,
    "fdt3" VARCHAR(1) NOT NULL,
    "fdt4" VARCHAR(1) NOT NULL,
    "fdcapw" SMALLINT NOT NULL,
    "fdcapw1" SMALLINT NOT NULL,
    "fdcapw2" SMALLINT NOT NULL,
    "fdcaph" SMALLINT NOT NULL,
    "fdcaph1" SMALLINT NOT NULL,
    "fdcaph2" SMALLINT NOT NULL,
    "fdcapd" SMALLINT NOT NULL,
    "fdcapr" SMALLINT NOT NULL,
    "fdcapr1" SMALLINT NOT NULL,
    "fdcapr2" SMALLINT NOT NULL,
    "fdcaps" SMALLINT NOT NULL,
    "fdcapf" SMALLINT NOT NULL,
    "fnombre" SMALLINT NOT NULL,
    "fdextraforme" REAL NOT NULL,
    "fdmatch" INTEGER NOT NULL,
    "fdmatchvh" SMALLINT NOT NULL,
    "FDnbmorceau" VARCHAR(10) NOT NULL,
    "fddimension" VARCHAR(10) NOT NULL,
    "fddimensionmatch" INTEGER NOT NULL,
    "fdlargeuranglais" VARCHAR(10) NOT NULL,
    "fdhauteuranglais" VARCHAR(10) NOT NULL,
    "fdpiedcarre" FLOAT NOT NULL,
    "fdpiedcarrefacture" REAL NOT NULL,
    "ftypespacer" VARCHAR(2) NOT NULL,
    "FDespace2" VARCHAR(10) NOT NULL,
    "fdprixupiedfacture" FLOAT NOT NULL,
    "fdtypecalcul" VARCHAR(20) NOT NULL,
    "fdvariablex" REAL NOT NULL,
    "Fnotes" VARCHAR(32) NOT NULL,
    "FDExtraCap" FLOAT NOT NULL,
    "fdvariablex1" REAL NOT NULL,
    "fdDDH" REAL NOT NULL,
    "fdDDV" REAL NOT NULL,
    "fdnbcarreau" SMALLINT NOT NULL,
    "fnotes1" VARCHAR(32) NOT NULL,
    "fTypePeinture" SMALLINT NOT NULL,
    "fNoPeintureExtTout" VARCHAR(10) NOT NULL,
    "FnopeintureInterieure" VARCHAR(10) NOT NULL,
    "fdescpeintureExtTout" VARCHAR(50) NOT NULL,
    "fDescPeintureInterieure" VARCHAR(50) NOT NULL,
    "fPreparationPeinture" FLOAT NOT NULL,
    "fPrixCarreauPeinture" FLOAT NOT NULL,
    "fTotalPeinture" FLOAT NOT NULL,
    "Ftotalcarreaupeinture" INTEGER NOT NULL,
    "fpeinture" BIT NOT NULL,
    "libelleNbCarreauExtTlt" VARCHAR(30) NOT NULL,
    "libelleNbcarreauinterieur" VARCHAR(30) NOT NULL,
    "FtotalbarrePeinture" FLOAT NOT NULL,
    "fnopeinture" VARCHAR(10) NOT NULL,
    "fdescpeinture" VARCHAR(50) NOT NULL,
    "fextrapeinture" FLOAT NOT NULL,
    "ftypepeinture1" SMALLINT NOT NULL,
    "FDescpeinture1" VARCHAR(50) NOT NULL,
    "fnopeinture1" VARCHAR(10) NOT NULL,
    "FDnbcarreauPeinture1" SMALLINT NOT NULL,
    "fdprixcarreaupeinture1" REAL NOT NULL,
    "TDemiCarrelage" BIT NOT NULL,
    "FDextra10X" REAL NOT NULL,
    "FDextra5x" REAL NOT NULL,
    "FDextraCarrelagedemi" REAL NOT NULL,
    "FDfabrication" BIT NOT NULL,
    "SUrchargeafacturer" FLOAT NOT NULL,
    "SUrchargedejafacture" FLOAT NOT NULL,
    "fdintercalaire" BIT NOT NULL,
    "fdpiedcarrereel" REAL NOT NULL,
    "fdsurfacemodifie" BIT NOT NULL,
    "FDprixmodifie" BIT NOT NULL,
    "fdNoteSpeciale" BIT NOT NULL,
    "fdcommentaireVideojet" VARCHAR(100) NOT NULL,
    "FDdescriptionmorceau" VARCHAR(8) NOT NULL,
    "fdt" REAL NOT NULL,
    "FDPrixBaseModifie" BIT NOT NULL,
    "FDPrixCarreauModifie" BIT NOT NULL,
    "FDPrixExtraDemiModifie" BIT NOT NULL,
    "FDPrixExtraFormeModifie" BIT NOT NULL,
    "FDmessageAffiche" BIT NOT NULL,
    "fdbase" VARCHAR(10) NOT NULL,
    "SUrchargeTaux" FLOAT NOT NULL,
    "surchargeTauxDejaFacture" FLOAT NOT NULL,
    "surchargeTauxafacturer" FLOAT NOT NULL,
    "fdbarrotin" INTEGER NOT NULL,
    "FDdesccarr" VARCHAR(65) NOT NULL,
    "bPrixUnitaireThermos" BIT NOT NULL,
    "bPrixCarreauCarrelage" BIT NOT NULL,
    "bPrixExtraDemiCarrelage" BIT NOT NULL,
    "bPrixBasecarrelage" BIT NOT NULL,
    "bPrixCarreau1Peinture" BIT NOT NULL,
    "bPrixCarreau2Peinture" BIT NOT NULL,
    "fdhauteuranglais1" VARCHAR(10) NOT NULL,
    "CalculArgon" BIT NOT NULL,
    "PietageArgon" REAL NOT NULL,
    "ExtraArgonPrice" REAL NOT NULL);
CREATE INDEX "WDIDX_trdetail_fdnocomm" ON "trdetail" ("fdnocomm");
CREATE INDEX "WDIDX_trdetail_fdcle" ON "trdetail" ("fdnocomm","fdligne","traye");

-- Création de la table trdetailListe
CREATE TABLE "trdetail" (
    "TRCLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "fdligne" INTEGER NOT NULL,
    "fdnocomm" INTEGER NOT NULL,
    "fdnumprod" VARCHAR(10) NOT NULL,
    "fddesc" VARCHAR(65) NOT NULL,
    "fdqte" REAL NOT NULL,
    "fdqteafacturer" REAL NOT NULL,
    "fdqtedejafacture" REAL NOT NULL,
    "fdcap" SMALLINT NOT NULL,
    "fdespace" VARCHAR(10) NOT NULL,
    "fdespaceinex" VARCHAR(10) NOT NULL,
    "fdforme99" SMALLINT NOT NULL,
    "fdlargeur" VARCHAR(10) NOT NULL,
    "fdlargeura" VARCHAR(10) NOT NULL,
    "fdhauteur" VARCHAR(10) NOT NULL,
    "fdhauteura" VARCHAR(10) NOT NULL,
    "fdhauteur1" VARCHAR(10) NOT NULL,
    "fdhauteur1a" VARCHAR(10) NOT NULL,
    "fdprixu" REAL NOT NULL,
    "fdlien" SMALLINT NOT NULL,
    "fdcarrelage" SMALLINT NOT NULL,
    "fdcarreauv" SMALLINT NOT NULL,
    "fdcarreauh" SMALLINT NOT NULL,
    "fdcomposant1" VARCHAR(10) NOT NULL,
    "fdcomposant2" VARCHAR(10) NOT NULL,
    "fdcomposant3" VARCHAR(10) NOT NULL,
    "fdnumcarr" VARCHAR(10) NOT NULL,
    "ftype" SMALLINT NOT NULL,
    "fdprixtotal" REAL NOT NULL,
    "fdcarrpruxuc" REAL NOT NULL,
    "frcarrprixu" REAL NOT NULL,
    "fdcarrprixtotal" REAL NOT NULL,
    "fdprixupied" REAL NOT NULL,
    "fdcodegl" VARCHAR(10) NOT NULL,
    "fdimprimecarr" SMALLINT NOT NULL,
    "ffini" VARCHAR(10) NOT NULL,
    "fcapgaztube" VARCHAR(5) NOT NULL,
    "fnumeroregroupement" VARCHAR(10) NOT NULL,
    "fregroupement" VARCHAR(10) NOT NULL,
    "fdverreunite" SMALLINT NOT NULL,
    "fdenergiverre" SMALLINT NOT NULL,
    "traye" SMALLINT NOT NULL,
    "trancienneligne" INTEGER NOT NULL,
    "trcalculescbasecarr" SMALLINT NOT NULL,
    "TRJOBLIGNE" VARCHAR(40) NOT NULL,
    "tfixeprixgroupe" SMALLINT NOT NULL,
    "surchargeenergie" REAL NOT NULL,
    "tdescoriginale" VARCHAR(40) NOT NULL,
    "fdcarrprixdebase" REAL NOT NULL,
    "fdspecdim" SMALLINT NOT NULL,
    "fdcommentaire" VARCHAR(50) NOT NULL,
    "fdlargeuru" VARCHAR(10) NOT NULL,
    "fdhauteuru" VARCHAR(10) NOT NULL,
    "fdforme" VARCHAR(3) NOT NULL,
    "fdw" VARCHAR(8) NOT NULL,
    "fdw1" VARCHAR(8) NOT NULL,
    "fdw2" VARCHAR(8) NOT NULL,
    "fdh" VARCHAR(8) NOT NULL,
    "fdh1" VARCHAR(8) NOT NULL,
    "fdh2" VARCHAR(8) NOT NULL,
    "fdd" VARCHAR(8) NOT NULL,
    "fdr" VARCHAR(8) NOT NULL,
    "fdr1" VARCHAR(8) NOT NULL,
    "fdr2" VARCHAR(8) NOT NULL,
    "fds" VARCHAR(8) NOT NULL,
    "fdf" VARCHAR(8) NOT NULL,
    "fdt1" VARCHAR(1) NOT NULL,
    "fdt2" VARCHAR(1) NOT NULL,
    "fdt3" VARCHAR(1) NOT NULL,
    "fdt4" VARCHAR(1) NOT NULL,
    "fdcapw" SMALLINT NOT NULL,
    "fdcapw1" SMALLINT NOT NULL,
    "fdcapw2" SMALLINT NOT NULL,
    "fdcaph" SMALLINT NOT NULL,
    "fdcaph1" SMALLINT NOT NULL,
    "fdcaph2" SMALLINT NOT NULL,
    "fdcapd" SMALLINT NOT NULL,
    "fdcapr" SMALLINT NOT NULL,
    "fdcapr1" SMALLINT NOT NULL,
    "fdcapr2" SMALLINT NOT NULL,
    "fdcaps" SMALLINT NOT NULL,
    "fdcapf" SMALLINT NOT NULL,
    "fnombre" SMALLINT NOT NULL,
    "fdextraforme" REAL NOT NULL,
    "fdmatch" INTEGER NOT NULL,
    "fdmatchvh" SMALLINT NOT NULL,
    "FDnbmorceau" VARCHAR(10) NOT NULL,
    "fddimension" VARCHAR(10) NOT NULL,
    "fddimensionmatch" INTEGER NOT NULL,
    "fdlargeuranglais" VARCHAR(10) NOT NULL,
    "fdhauteuranglais" VARCHAR(10) NOT NULL,
    "fdpiedcarre" FLOAT NOT NULL,
    "fdpiedcarrefacture" REAL NOT NULL,
    "ftypespacer" VARCHAR(2) NOT NULL,
    "FDespace2" VARCHAR(10) NOT NULL,
    "fdprixupiedfacture" FLOAT NOT NULL,
    "fdtypecalcul" VARCHAR(20) NOT NULL,
    "fdvariablex" REAL NOT NULL,
    "Fnotes" VARCHAR(32) NOT NULL,
    "FDExtraCap" FLOAT NOT NULL,
    "fdvariablex1" REAL NOT NULL,
    "fdDDH" REAL NOT NULL,
    "fdDDV" REAL NOT NULL,
    "fdnbcarreau" SMALLINT NOT NULL,
    "fnotes1" VARCHAR(32) NOT NULL,
    "fTypePeinture" SMALLINT NOT NULL,
    "fNoPeintureExtTout" VARCHAR(10) NOT NULL,
    "FnopeintureInterieure" VARCHAR(10) NOT NULL,
    "fdescpeintureExtTout" VARCHAR(50) NOT NULL,
    "fDescPeintureInterieure" VARCHAR(50) NOT NULL,
    "fPreparationPeinture" FLOAT NOT NULL,
    "fPrixCarreauPeinture" FLOAT NOT NULL,
    "fTotalPeinture" FLOAT NOT NULL,
    "Ftotalcarreaupeinture" INTEGER NOT NULL,
    "fpeinture" BIT NOT NULL,
    "libelleNbCarreauExtTlt" VARCHAR(30) NOT NULL,
    "libelleNbcarreauinterieur" VARCHAR(30) NOT NULL,
    "FtotalbarrePeinture" FLOAT NOT NULL,
    "fnopeinture" VARCHAR(10) NOT NULL,
    "fdescpeinture" VARCHAR(50) NOT NULL,
    "fextrapeinture" FLOAT NOT NULL,
    "ftypepeinture1" SMALLINT NOT NULL,
    "FDescpeinture1" VARCHAR(50) NOT NULL,
    "fnopeinture1" VARCHAR(10) NOT NULL,
    "FDnbcarreauPeinture1" SMALLINT NOT NULL,
    "fdprixcarreaupeinture1" REAL NOT NULL,
    "TDemiCarrelage" BIT NOT NULL,
    "FDextra10X" REAL NOT NULL,
    "FDextra5x" REAL NOT NULL,
    "FDextraCarrelagedemi" REAL NOT NULL,
    "FDfabrication" BIT NOT NULL,
    "SUrchargeafacturer" FLOAT NOT NULL,
    "SUrchargedejafacture" FLOAT NOT NULL,
    "TNoclient" VARCHAR(10) NOT NULL,
    "Tsurcharge" REAL NOT NULL,
    "fdintercalaire" BIT NOT NULL,
    "fdt" REAL NOT NULL,
    "fAdresseLivraison" INTEGER NOT NULL,
    "cvendeur" INTEGER NOT NULL,
    "PoidsUnitaire" NUMERIC(7,3) NOT NULL,
    "IDCamions" NUMERIC(19,0) NOT NULL,
    "LoadingType" VARCHAR(1) NOT NULL,
    "ShippingSequence" INTEGER NOT NULL);
CREATE INDEX "WDIDX_trdetailListe_fdnocomm" ON "trdetail" ("fdnocomm");
CREATE INDEX "WDIDX_trdetailListe_TNoclient" ON "trdetail" ("TNoclient");
CREATE INDEX "WDIDX_trdetailListe_cvendeur" ON "trdetail" ("cvendeur");
CREATE INDEX "WDIDX_trdetailListe_IDCamions" ON "trdetail" ("IDCamions");
CREATE INDEX "WDIDX_trdetailListe_fdcle" ON "trdetail" ("fdnocomm","fdligne","traye");

-- Création de la table TruckDaysStatus
CREATE TABLE "TruckDaysStatus" (
    "IDTruckDaysStatus" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "Shippingdate" DATE UNIQUE,
    "Status" BIT);

-- Création de la table typecarr
CREATE TABLE "typecarr" (
    "TCCLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "tcdescription" VARCHAR(20) NOT NULL,
    "tctypecalcul" SMALLINT NOT NULL,
    "tcformule1v" VARCHAR(40) NOT NULL,
    "tcformule2v" VARCHAR(40) NOT NULL,
    "tcformule3v" VARCHAR(40) NOT NULL,
    "tcformule4v" VARCHAR(40) NOT NULL,
    "tcformule5v" VARCHAR(40) NOT NULL,
    "tcformule1h" VARCHAR(40) NOT NULL,
    "tcformule2h" VARCHAR(40) NOT NULL,
    "tcformule3h" VARCHAR(40) NOT NULL,
    "tcformule4h" VARCHAR(40) NOT NULL,
    "tcformule5h" VARCHAR(40) NOT NULL,
    "tcformuleh" VARCHAR(40) NOT NULL,
    "tcformulel" VARCHAR(40) NOT NULL,
    "tcformulenmv" VARCHAR(40) NOT NULL,
    "tcformulenmh" VARCHAR(40) NOT NULL,
    "tcformuledmv" VARCHAR(40) NOT NULL,
    "tcformuledmh" VARCHAR(40) NOT NULL,
    "tcformulenc" VARCHAR(40) NOT NULL,
    "nbmorceau" VARCHAR(100) NOT NULL,
    "nbdimension" VARCHAR(100) NOT NULL,
    "EpaisseurCadre" INTEGER NOT NULL,
    "EpaisseurTigeLargeur" REAL NOT NULL,
    "EpaisseurTigeHauteur" REAL NOT NULL,
    "VariableUtil" REAL NOT NULL,
    "nbmorceaumvertical" VARCHAR(100) NOT NULL,
    "nbdimensionmvertical" VARCHAR(100) NOT NULL,
    "nbmorceaumhorizontal" VARCHAR(100) NOT NULL,
    "nbdimensionmhorizontal" VARCHAR(100) NOT NULL,
    "tYpecarrelage" VARCHAR(20) NOT NULL,
    "tAbreviation" VARCHAR(5) NOT NULL,
    "ConditionSiNM" VARCHAR(100) NOT NULL,
    "ConditionAlorsNM" VARCHAR(100) NOT NULL,
    "ConditionSiDM" VARCHAR(100) NOT NULL,
    "ConditionAlorsDM" VARCHAR(100) NOT NULL,
    "COnditionSiVm" VARCHAR(100) NOT NULL,
    "COnditionAlorsVM" VARCHAR(100) NOT NULL,
    "COnditionSiVD" VARCHAR(100) NOT NULL,
    "COnditionAlorsVD" VARCHAR(100) NOT NULL,
    "ConditionSiHM" VARCHAR(100) NOT NULL,
    "ConditionAlorsHM" VARCHAR(100) NOT NULL,
    "ConditionSiHD" VARCHAR(100) NOT NULL,
    "ConditionAlorsHD" VARCHAR(100) NOT NULL,
    "ConditionSiCH" VARCHAR(100) NOT NULL,
    "ConditionAlorsCH" VARCHAR(100) NOT NULL,
    "ConditionSiCL" VARCHAR(100) NOT NULL,
    "ConditionAlorsCL" VARCHAR(100) NOT NULL,
    "ConditionSiSL" VARCHAR(100) NOT NULL,
    "ConditionAlorsSL" VARCHAR(100) NOT NULL,
    "ConditionSiSH" VARCHAR(100) NOT NULL,
    "ConditionAlorsSH" VARCHAR(100) NOT NULL,
    "TcFormuleVM" VARCHAR(100) NOT NULL,
    "TcFormuleVD" VARCHAR(100) NOT NULL,
    "TcFormuleHM" VARCHAR(100) NOT NULL,
    "TcFormuleHD" VARCHAR(100) NOT NULL,
    "TcFormuleCL" VARCHAR(100) NOT NULL,
    "TcFormuleCH" VARCHAR(100) NOT NULL,
    "TcFormuleSL" VARCHAR(100) NOT NULL,
    "TcFormuleSH" VARCHAR(100) NOT NULL,
    "TConstantes" REAL NOT NULL,
    "variableutil1" REAL NOT NULL,
    "hauteurTest" REAL NOT NULL,
    "LargeurTest" REAL NOT NULL,
    "NbCarreauLargeurTest" SMALLINT NOT NULL,
    "NbCarreauHauteurTest" SMALLINT NOT NULL,
    "Typedessin" SMALLINT NOT NULL,
    "TcInterrupteurHaut" BIT NOT NULL,
    "TcInterrupteurBas" BIT NOT NULL,
    "TcInterrupteurGauche" BIT NOT NULL,
    "TcInterrupteurDroit" BIT NOT NULL,
    "DDHtest" REAL NOT NULL,
    "DDVtest" REAL NOT NULL,
    "AjustNbCarLargeur" SMALLINT NOT NULL,
    "AjustNbCarHauteur" SMALLINT NOT NULL,
    "TcalculQteContour" VARCHAR(100) NOT NULL,
    "TformuleQteFourniture" VARCHAR(100) NOT NULL,
    "TProduitAssocie" VARCHAR(10) NOT NULL,
    "tVariableAlum" BIT NOT NULL,
    "tdescription" VARCHAR(20) NOT NULL,
    "Tdt" REAL NOT NULL,
    "TcEpaisseurMinimumSpacer" REAL NOT NULL,
    "tVariableICN" BIT NOT NULL,
    "EpaisseurCadreInex" INTEGER NOT NULL,
    "EpaisseurCadreAluminium" INTEGER NOT NULL,
    "EpaisseurCadreGlassEdge" INTEGER NOT NULL,
    "EpaisseurCadreSuperSpacer" INTEGER NOT NULL,
    "TYpeSpacer" SMALLINT NOT NULL,
    "tVariableARGON" BIT NOT NULL,
    "TYpeSpacerDimension" SMALLINT NOT NULL,
    "TDemiCarrelage" BIT NOT NULL,
    "TBarrotin" INTEGER NOT NULL);
CREATE INDEX "WDIDX_typecarr_tcdescription" ON "typecarr" ("tcdescription");
CREATE INDEX "WDIDX_typecarr_tYpecarrelage" ON "typecarr" ("tYpecarrelage");

-- Création de la table typecarrAlias
CREATE TABLE "typecarr" (
    "TCCLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "tcdescription" VARCHAR(20) NOT NULL UNIQUE,
    "tctypecalcul" SMALLINT NOT NULL,
    "tcformule1v" VARCHAR(40) NOT NULL,
    "tcformule2v" VARCHAR(40) NOT NULL,
    "tcformule3v" VARCHAR(40) NOT NULL,
    "tcformule4v" VARCHAR(40) NOT NULL,
    "tcformule5v" VARCHAR(40) NOT NULL,
    "tcformule1h" VARCHAR(40) NOT NULL,
    "tcformule2h" VARCHAR(40) NOT NULL,
    "tcformule3h" VARCHAR(40) NOT NULL,
    "tcformule4h" VARCHAR(40) NOT NULL,
    "tcformule5h" VARCHAR(40) NOT NULL,
    "tcformuleh" VARCHAR(40) NOT NULL,
    "tcformulel" VARCHAR(40) NOT NULL,
    "tcformulenmv" VARCHAR(40) NOT NULL,
    "tcformulenmh" VARCHAR(40) NOT NULL,
    "tcformuledmv" VARCHAR(40) NOT NULL,
    "tcformuledmh" VARCHAR(40) NOT NULL,
    "tcformulenc" VARCHAR(40) NOT NULL,
    "nbmorceau" VARCHAR(100) NOT NULL,
    "nbdimension" VARCHAR(100) NOT NULL,
    "EpaisseurCadre" INTEGER NOT NULL,
    "EpaisseurTigeLargeur" REAL NOT NULL,
    "EpaisseurTigeHauteur" REAL NOT NULL,
    "VariableUtil" REAL NOT NULL,
    "nbmorceaumvertical" VARCHAR(100) NOT NULL,
    "nbdimensionmvertical" VARCHAR(100) NOT NULL,
    "nbmorceaumhorizontal" VARCHAR(100) NOT NULL,
    "nbdimensionmhorizontal" VARCHAR(100) NOT NULL,
    "tYpecarrelage" VARCHAR(20) NOT NULL,
    "tAbreviation" VARCHAR(5) NOT NULL,
    "ConditionSiNM" VARCHAR(100) NOT NULL,
    "ConditionAlorsNM" VARCHAR(100) NOT NULL,
    "ConditionSiDM" VARCHAR(100) NOT NULL,
    "ConditionAlorsDM" VARCHAR(100) NOT NULL,
    "COnditionSiVm" VARCHAR(100) NOT NULL,
    "COnditionAlorsVM" VARCHAR(100) NOT NULL,
    "COnditionSiVD" VARCHAR(100) NOT NULL,
    "COnditionAlorsVD" VARCHAR(100) NOT NULL,
    "ConditionSiHM" VARCHAR(100) NOT NULL,
    "ConditionAlorsHM" VARCHAR(100) NOT NULL,
    "ConditionSiHD" VARCHAR(100) NOT NULL,
    "ConditionAlorsHD" VARCHAR(100) NOT NULL,
    "ConditionSiCH" VARCHAR(100) NOT NULL,
    "ConditionAlorsCH" VARCHAR(100) NOT NULL,
    "ConditionSiCL" VARCHAR(100) NOT NULL,
    "ConditionAlorsCL" VARCHAR(100) NOT NULL,
    "ConditionSiSL" VARCHAR(100) NOT NULL,
    "ConditionAlorsSL" VARCHAR(100) NOT NULL,
    "ConditionSiSH" VARCHAR(100) NOT NULL,
    "ConditionAlorsSH" VARCHAR(100) NOT NULL,
    "TcFormuleVM" VARCHAR(100) NOT NULL,
    "TcFormuleVD" VARCHAR(100) NOT NULL,
    "TcFormuleHM" VARCHAR(100) NOT NULL,
    "TcFormuleHD" VARCHAR(100) NOT NULL,
    "TcFormuleCL" VARCHAR(100) NOT NULL,
    "TcFormuleCH" VARCHAR(100) NOT NULL,
    "TcFormuleSL" VARCHAR(100) NOT NULL,
    "TcFormuleSH" VARCHAR(100) NOT NULL,
    "TConstantes" REAL NOT NULL,
    "variableutil1" REAL NOT NULL,
    "hauteurTest" INTEGER NOT NULL,
    "LargeurTest" INTEGER NOT NULL,
    "NbCarreauLargeurTest" SMALLINT NOT NULL,
    "NbCarreauHauteurTest" SMALLINT NOT NULL,
    "Typedessin" SMALLINT NOT NULL,
    "TcInterrupteurHaut" BIT NOT NULL,
    "TcInterrupteurBas" BIT NOT NULL,
    "TcInterrupteurGauche" BIT NOT NULL,
    "TcInterrupteurDroit" BIT NOT NULL,
    "DDHtest" REAL NOT NULL,
    "DDVtest" REAL NOT NULL,
    "AjustNbCarLargeur" SMALLINT NOT NULL,
    "AjustNbCarHauteur" SMALLINT NOT NULL,
    "TcalculQteContour" VARCHAR(100) NOT NULL,
    "TformuleQteFourniture" VARCHAR(100) NOT NULL,
    "TProduitAssocie" VARCHAR(10) NOT NULL,
    "tVariableAlum" BIT NOT NULL);
CREATE INDEX "WDIDX_typecarrAlias_tYpecarrelage" ON "typecarr" ("tYpecarrelage");

-- Création de la table Typecarrelage
CREATE TABLE "Typecarrelage" (
    "IDTypecarrelage" INTEGER PRIMARY KEY NOT NULL,
    "TypeCarrDesc" VARCHAR(20) NOT NULL UNIQUE);

-- Création de la table TypeCredit
CREATE TABLE "TypeCredit" (
    "IDTypeCredit" INTEGER PRIMARY KEY NOT NULL,
    "Description" VARCHAR(20) NOT NULL,
    "codeGl" VARCHAR(10) NOT NULL);

-- Création de la table typespac
CREATE TABLE "typespac" (
    "TYCLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "tnumero" VARCHAR(2) NOT NULL UNIQUE,
    "tdescription" VARCHAR(20) NOT NULL,
    "tdesccourte" VARCHAR(6) NOT NULL,
    "ttype" SMALLINT NOT NULL,
    "tcformuleSpacer" VARCHAR(100) NOT NULL,
    "tproduit" VARCHAR(20) NOT NULL,
    "TLargeurtest" INTEGER NOT NULL,
    "thauteurtest" INTEGER NOT NULL,
    "Tcoin" VARCHAR(20) NOT NULL,
    "tformuleCoin" VARCHAR(100) NOT NULL,
    "Tfornulecoinargon" VARCHAR(100) NOT NULL,
    "tformulemoleculaire" VARCHAR(100) NOT NULL,
    "tFormulecolle" VARCHAR(100) NOT NULL,
    "tprixvente" FLOAT NOT NULL,
    "Tprixventem" FLOAT NOT NULL,
    "icOuleur" INTEGER NOT NULL,
    "icOuleurtexte" INTEGER NOT NULL,
    "Itextegras" BIT NOT NULL,
    "Itexteitalique" VARCHAR(1) NOT NULL,
    "tcouleur" SMALLINT NOT NULL,
    "tdescriptiona" VARCHAR(20) NOT NULL,
    "tdesccourtea" VARCHAR(6) NOT NULL);

-- Création de la table TypeSpacDim
CREATE TABLE "TypeSpacDim" (
    "TSDimension" VARCHAR(10) NOT NULL,
    "TSProduit" VARCHAR(10) NOT NULL,
    "TYCLEUNIK" INTEGER NOT NULL,
    "TScoin" VARCHAR(10) NOT NULL,
    "TscoinArgon" VARCHAR(10) NOT NULL,
    "TsMoleculaire" VARCHAR(10) NOT NULL,
    "tscolle" VARCHAR(10) NOT NULL);
CREATE INDEX "WDIDX_TypeSpacDim_TYCLEUNIK" ON "TypeSpacDim" ("TYCLEUNIK");
CREATE INDEX "WDIDX_TypeSpacDim_CleDimension" ON "TypeSpacDim" ("TYCLEUNIK","TSDimension");

-- Création de la table UNITE
CREATE TABLE "UNITE" (
    "U0CLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "NOMCLIENT" VARCHAR(45) NOT NULL,
    "NUMEROCARRELAGE" VARCHAR(20) NOT NULL,
    "QUANTITE" SMALLINT NOT NULL,
    "LARGEUR" VARCHAR(20) NOT NULL,
    "HAUTEUR" VARCHAR(20) NOT NULL,
    "CARREAUV" SMALLINT NOT NULL,
    "CARREAUH" SMALLINT NOT NULL,
    "NOCOMMANDE" VARCHAR(20) NOT NULL,
    "test" VARCHAR(20) NOT NULL);

-- Création de la table Usager
CREATE TABLE "Usager" (
    "IDUsager" INTEGER PRIMARY KEY NOT NULL,
    "nom" VARCHAR(50) NOT NULL,
    "MotDePasse" VARCHAR(40) NOT NULL,
    "Administrateur" BIT NOT NULL,
    "Prenom" VARCHAR(50) NOT NULL,
    "NomUsager" VARCHAR(50) NOT NULL UNIQUE,
    "IDGroupe" INTEGER NOT NULL,
    "IsDeleted" BIT NOT NULL,
    "IsNew" BIT NOT NULL,
    "IsActive" BIT NOT NULL);

-- Création de la table UserGroup
CREATE TABLE "UserGroup" (
    "IDUserGroup" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "Description" VARCHAR(20) UNIQUE,
    "IsAdmin" BIT,
    "ModifPrix" BIT NOT NULL);

-- Création de la table VariableXclient
CREATE TABLE "VariableXclient" (
    "noClient" VARCHAR(10) NOT NULL,
    "TypeCalcul" VARCHAR(20) NOT NULL,
    "VariableX" INTEGER NOT NULL,
    "variableX1" INTEGER NOT NULL);
CREATE INDEX "WDIDX_VariableXclient_noClientTypeCalcul" ON "VariableXclient" ("noClient","TypeCalcul");

-- Création de la table Vendeur
CREATE TABLE "Vendeur" (
    "IDVendeur" INTEGER PRIMARY KEY NOT NULL,
    "numero" VARCHAR(10) UNIQUE,
    "nom" VARCHAR(50) UNIQUE,
    "pourcentage" REAL,
    "NOmAbrege" VARCHAR(10),
    "CellPhone" VARCHAR(15),
    "Email" VARCHAR(40));

-- Création de la table videojet
CREATE TABLE "videojet" (
    "VICLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "videonumero" VARCHAR(2) NOT NULL UNIQUE,
    "videodescription" VARCHAR(80) NOT NULL);

-- Création de la table videoman
CREATE TABLE "videoman" (
    "V0CLEUNIK" INTEGER PRIMARY KEY NOT NULL,
    "Description" VARCHAR(80) NOT NULL);

-- Création de la table WebConfig
CREATE TABLE "WebConfig" (
    "IDWebConfig" NUMERIC(19,0) PRIMARY KEY NOT NULL,
    "CustomerID" NUMERIC(19,0) UNIQUE,
    "NextOrderNumber" INTEGER,
    "Orderprefix" VARCHAR(3),
    "CotationPrefix" VARCHAR(3),
    "NextCotationNumber" INTEGER,
    "FifteenYearsWarrantyActive" BIT,
    "ExtraArgonGaActive" BIT,
    "OrderEmail" LONGVARCHAR,
    "ThermosCotationRate" REAL,
    "GridCotationRate" REAL,
    "ShapeCotationrate" REAL,
    "PaintCotationrate" REAL,
    "InstallationHourlyrate" NUMERIC(24,6),
    "LogoFilename" VARCHAR(20),
    "CotationNote" LONGVARCHAR,
    "SeeGridDescription" BIT,
    "SeeSpacerDescription" BIT,
    "SeeShapeDescription" BIT,
    "SeePaintdescription" BIT,
    "TemperedThermosCotationrate" REAL,
    "SeeThermosDimensions" BIT,
    "SeeFinishdescription" BIT,
    "SequentialOrderNumber" SMALLINT);
-- Contraintes d'intégrité
ALTER TABLE "hfacture" ADD FOREIGN KEY ("Bnumero") REFERENCES "BonLivraison" ("Bnumero");
ALTER TABLE "hfdetail" ADD FOREIGN KEY ("HFCLEUNIK") REFERENCES "hfacture" ("HFCLEUNIK");
ALTER TABLE "intkilo" ADD FOREIGN KEY ("ikcategorie") REFERENCES "categclt" ("categorie");
ALTER TABLE "ListeHistoDetail" ADD FOREIGN KEY ("IDListeHisto") REFERENCES "ListeHisto" ("IDListeHisto");
ALTER TABLE "TypeSpacDim" ADD FOREIGN KEY ("TYCLEUNIK") REFERENCES "typespac" ("TYCLEUNIK");
ALTER TABLE "CommandeAchatDetail" ADD FOREIGN KEY ("IDCommandeAchat") REFERENCES "CommandeAchat" ("IDCommandeAchat");
ALTER TABLE "CommandeAchat" ADD FOREIGN KEY ("CaFournisseur") REFERENCES "Fournisseur" ("Fnumero");
ALTER TABLE "ProduitClient" ADD FOREIGN KEY ("Numero") REFERENCES "client" ("numero");
ALTER TABLE "FClientProduitCouleur" ADD FOREIGN KEY ("IDProduitClient") REFERENCES "ProduitClient" ("IDProduitClient");
ALTER TABLE "ClientLivraison" ADD FOREIGN KEY ("idclient") REFERENCES "client" ("numero");
ALTER TABLE "ProduitClient" ADD FOREIGN KEY ("Idproruit") REFERENCES "invent" ("INUM");
ALTER TABLE "FclientExtra" ADD FOREIGN KEY ("IdClient") REFERENCES "client" ("IDClient");
ALTER TABLE "ClientGarantie" ADD FOREIGN KEY ("Idgarantie") REFERENCES "Garantie" ("IDGarantie");
ALTER TABLE "persoens" ADD FOREIGN KEY ("IdClientIdhermos") REFERENCES "ThermosClient" ("IdClient","IdThermos");
ALTER TABLE "TaxeGroupeDate" ADD FOREIGN KEY ("IDTaxeGroupe") REFERENCES "TaxeGroupe" ("IDTaxeGroupe");
ALTER TABLE "TaxeGroupeDateTaux" ADD FOREIGN KEY ("IDTaxeGroupeDate") REFERENCES "TaxeGroupeDate" ("IDTaxeGroupeDate");
ALTER TABLE "IntercalaireCouleurs" ADD FOREIGN KEY ("idIntercalaires") REFERENCES "Intercalaires" ("IDIntercalaires");
ALTER TABLE "IntercalaireCouleurDimensions" ADD FOREIGN KEY ("IDIntercalaireCouleurs") REFERENCES "IntercalaireCouleurs" ("IDIntercalaireCouleurs");
ALTER TABLE "InterClientDetail" ADD FOREIGN KEY ("IdInterClient") REFERENCES "InterClient" ("IDInterClient");
ALTER TABLE "client" ADD FOREIGN KEY ("cvendeur") REFERENCES "Vendeur" ("IDVendeur");
ALTER TABLE "FdetailInternet" ADD FOREIGN KEY ("FACLEUNIK") REFERENCES "FactureInternet" ("FACLEUNIK");
ALTER TABLE "CommandeAchatDessin" ADD FOREIGN KEY ("IDCommandeAchat") REFERENCES "CommandeAchat" ("IDCommandeAchat");
ALTER TABLE "CotationDetails" ADD FOREIGN KEY ("IDCotation") REFERENCES "Cotation" ("IDCotation");
ALTER TABLE "ExternalOrderDetails" ADD FOREIGN KEY ("IDCotation") REFERENCES "ExternalOrder" ("IDCotation");
ALTER TABLE "CotationdetailSketches" ADD FOREIGN KEY ("IDCotationDetails") REFERENCES "CotationDetails" ("IDCotationDetails");
ALTER TABLE "ExternalOrderDetailSketches" ADD FOREIGN KEY ("IDCotationDetails") REFERENCES "ExternalOrderDetails" ("IDCotationDetails");
ALTER TABLE "Facture" ADD FOREIGN KEY ("IDClient") REFERENCES "client" ("IDClient");
ALTER TABLE "Facture" ADD FOREIGN KEY ("cvendeur") REFERENCES "Vendeur" ("IDVendeur");
ALTER TABLE "fdetail" ADD FOREIGN KEY ("fdnocomm") REFERENCES "Facture" ("fanumero");
