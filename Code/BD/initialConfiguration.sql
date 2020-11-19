USE `instit43_jpo_test`;
-- ! Insert des utilisateurs
INSERT INTO `user`(`username`,`email`,`password`,`rol`)
VALUES("Admin","admin@gmail.com","12345!","Administrateur");

INSERT INTO `user`(`username`,`email`,`password`,`rol`)
VALUES("Catherine Duhaime","jpoinstitutgrasset@gmail.com","Adminroot","Administrateur");

-- ! Insert de la configuration 
INSERT INTO `configuration`(`linkVirtualVisit`,`linkFAQ`,`endMessage`,`welcomeTitle`,`welcomeSubTitle`,`welcomeText`,`noEvent`,`video1`,`video2`,`date`)
VALUES("https://www.institut-grasset.qc.ca/contactez-nous/",
"https://www.institut-grasset.qc.ca/contactez-nous/ ",
"Fin de l'événement des portes ouverts de l'institut Grasset",
"PORTES OUVERTES VIRTUELLES ",
"Bienvenue à nos portes ouvertes virtuelles! ",
"<p><span style='color: rgb(5, 5, 5); font-family: \"Segoe UI Historic\", \"Segoe UI\", Helvetica, Arial, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;'>Plusieurs programmes disponibles dans les domaines de l&apos;animation 3D, cin&eacute;ma, r&eacute;alit&eacute; virtuelle, informatique et b&acirc;timent.</span></p>
<p><span style='color: rgb(5, 5, 5); font-family: \"Segoe UI Historic\", \"Segoe UI\", Helvetica, Arial, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;'>Nous vous r&eacute;servons de belles surprises!</span> </p>
<p>1 &ndash; choisis le ou les programmes qui t&rsquo;interpellent parmi les options ci-dessous;&nbsp;</p>
<p>2 &ndash; regarde leurs vid&eacute;os de pr&eacute;sentation et parcours virtuellement les installations qui leur sont propres;&nbsp;</p>
<p>3 &ndash; prom&egrave;ne-toi dans la section Informations g&eacute;n&eacute;rales pour d&eacute;couvrir notre processus d&rsquo;admission, nos services d&rsquo;aide, nos &eacute;quipes sportives et les nombreuses activit&eacute;s propos&eacute;es par l&rsquo;&eacute;quipe du socioculturel!&nbsp;</p>
<p>Gr&acirc;ce &agrave; nos visites virtuelles, tu auras &eacute;galement la chance de circuler dans ta future biblioth&egrave;que, de faire une pause &agrave; la caf&eacute;t&eacute;ria et de parcourir l&rsquo;aile des organismes &eacute;tudiants ains</p>", 
"Aujourdh'ui il n'y a pas événement.",
"https://www.youtube.com/embed/8XOujCXo4_c",
"https://www.youtube.com/embed/Iya0Fusxr0U",
now());

INSERT INTO `nodemailer`(`service`,`user`,`pass`,`from`,`subject`,`text`,`date`)
VALUES
("gmail","jpoagent1institutgrasset@gmail.com",
"Adminroot",
"jpoagent1institutgrasset@gmail.com",
"Récupération de mot de pass",
"Votre mot de pass est ",now());


-- ! Insert des programmes
INSERT INTO `program`(`programDescription`,`date`)
VALUES("AEC - Composition et effets spéciaux pour vidéo numérique NWY.16",now());
INSERT INTO `program`(`programDescription`,`date`)
VALUES("AEC - Production télévisuelle et cinématographique NWY.15",now());
INSERT INTO `program`(`programDescription`,`date`)
VALUES("AEC - Techniques de montage et d’habillage informatique NWY.00",now());
INSERT INTO `program`(`programDescription`,`date`)
VALUES("AEC - Production multimédia, profil web et médias sociaux NWE.1A",now());
INSERT INTO `program`(`programDescription`,`date`)
VALUES("AEC - Production 3D pour jeux vidéo NTL.12",now());
INSERT INTO `program`(`programDescription`,`date`)
VALUES("AEC - Techniques d’animation 3D et effets spéciaux NTL.06",now());
INSERT INTO `program`(`programDescription`,`date`)
VALUES("AEC – Spécialiste en réalité virtuelle et augmentée NTL.1K",now());
INSERT INTO `program`(`programDescription`,`date`)
VALUES("AEC - Techniques d’inspection en bâtiment EEC.13",now());
INSERT INTO `program`(`programDescription`,`date`)
VALUES("DEC - Techniques de l’informatique, profil programmation nouveaux médias 420.B0",now());
INSERT INTO `program`(`programDescription`,`date`)
VALUES("DEC - Techniques de production et de postproduction télévisuelles 589.AB",now());
INSERT INTO `program`(`programDescription`,`date`)
VALUES("DEC - Techniques d’animation 3D et de synthèse d’images 574.B0",now());
INSERT INTO `program`(`programDescription`,`date`)
VALUES("DEC - Technologie de l’estimation et de l’évaluation en bâtiment spécialisation en évaluation immobilière 221.DB",now());
INSERT INTO `program`(`programDescription`,`date`)
VALUES("DEC - Technologie de l’estimation et de l’évaluation en bâtiment",now());
INSERT INTO `program`(`programDescription`,`date`)
VALUES("BIM - Technologie de l’estimation en construction BIM 5D",now());
INSERT INTO `program`(`programDescription`,`date`)
VALUES("Je ne sais pas",now());



-- ! Insert d'un événement de portes ouverts 
INSERT INTO `event`(`startDate`,`nomEvent`,`date`)
VALUES(now(),"Portes ouverts automme",now());





