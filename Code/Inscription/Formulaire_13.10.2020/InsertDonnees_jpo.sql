USE `instit43_jpo_test`;
-- ! Insert des utilisateurs
INSERT INTO `user`(`username`,`email`,`password`,`rol`)
VALUES("Admin","admin@gmail.com","12345!","Administrateur");

-- ! Insert de la configuration 
INSERT INTO `configuration`(`linkVirtualVisit`,`linkFAQ`,`endMessage`,`welcomeTitle`,`welcomeSubTitle`,`welcomeText`,`noEvent`,`video1`,`video2`,`date`)
VALUES("https://www.institut-grasset.qc.ca/contactez-nous/",
"https://www.institut-grasset.qc.ca/contactez-nous/ ",
"Fin de l'événement des portes ouverts de l'institut Grasset",
"PORTES OUVERTES VIRTUELLES ",
"Bienvenue à nos portes ouvertes virtuelles! ",
"Tu pourras assister à des conférences thématiques, obtenir des réponses à toutes tes questions, visionner notre populaire atelier cote R et connaître le grand gagnant du concours Affiche tes couleurs! D’ici là :1 – choisis le ou les programmes qui t’interpellent parmi les options ci-dessous; 2 – regarde leurs vidéos de présentation et parcours virtuellement les installations qui leur sont propres; 3 – promène-toi dans la section Informations générales pour découvrir notre processus d’admission, nos services d’aide, nos équipes sportives et les nombreuses activités proposées par l’équipe du socioculturel! Grâce à nos visites virtuelles, tu auras également la chance de circuler dans ta future bibliothèque, de faire une pause à la cafétéria et de parcourir l’aile des organismes étudiants ainsi que tous les autres lieux communs du Collège. ", 
"Aujourdh'ui il n'y a pas événement.",
"<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/8XOujCXo4_c\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>",
"<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4xfuNWoZbW8\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>",
now());


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


-- ! Insert de brochures
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/DECtechniquedeproductiontv589.AB.pdf",
"/documents/filesImages/tele1_1.56.1.jpg",
"DEC technique de production tv",
now());
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/FicheDECtechniqueinformatique420.AA.pdf",
"/documents/filesImages/imfo2_1.63.1.jpg",
"Fiche DEC technique informatique",
now());
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/DECtechnologieestimationconstruction221.DA.pdf",
"/documents/filesImages/bat5_1.15.1.jpg",
"DEC technologie estimation construction ",
now());
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/DECtechnologieestimationimmoblier221.DB.pdf",
"/documents/filesImages/em1.18.1.jpg",
"DEC technologie estimation immoblier",
now());
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/productiontvetcinemaNWY.15.pdf",
"/documents/filesImages/tele7_1.62.1.jpg",
"Production tv et cinéma",
now());
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/RealitevirtuelleaugmenteeNTL.1Kv3.pdf",
"/documents/filesImages/3D8_1.9.1.jpg",
"Realite virtuelle augmentée",
now());
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/Technique3DjeuxvideoNTL.12.pdf",
"/documents/filesImages/3D9_1.10.1.jpg",
"Technique 3D jeux vidéo",
now());
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/techniqueAnimation3DeffetsspeciauxAECNTL.06.pdf",
"/documents/filesImages/3D1_1.2.2.jpg",
"Technique Animation 3D effets spéciaux",
now());
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/techniqueAnimation3DetsyntheDEC574.B0.pdf",
"/documents/filesImages/3D2_1.4.1.jpg",
"Technique Animation 3D et synthe",
now());
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/techniquecompositioneeffetsspeciauxpourvideonumeriqueNWY.16.pdf",
"/documents/filesImages/ins 1.1_1.27.1.jpg",
"Technique composition eeffets spéciaux pour vidéo numerique",
now());
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/techniquedemontageNWY.00.pdf",
"/documents/filesImages/tele4_1.59.1.jpg",
"Technique de montage NWY.00",
now());
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/techniquedeproductiontv589.AB.pdf",
"/documents/filesImages/tele3_1.58.1.jpg",
"Technique de production tv",
now());
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/techniqueAnimation3DetsyntheDEC574.B0.pdf",
"/documents/filesImages/3D6_1.7.1.jpg",
"Technique animation 3D et synthe DEC",
now());
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/techniqueinformatique420.AA.pdf",
"/documents/filesImages/em4_1.19.3.jpg",
"Technique informatique",
now());
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/technologieestimationconstruction221.DA.pdf",
"/documents/filesImages/em5_1.20.1.jpg",
"Technologie estimation construction",
now());
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/technologieestimationimmoblier221.DB.pdf",
"/documents/filesImages/em6_1.21.1.jpg",
"Technologie estimation immoblier",
now());
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/INSTITUTGRASSET-feuilletBIM-inter.pdf",
"/documents/filesImages/3D6_1.7.1.jpg",
"Institut Grasset",
now());
INSERT INTO `downloadable`(`fileLink`,`fileImage`,`description`,`date`)
VALUES("/documents/files/ProductionmultimediaprofilwebetmediassociauxAECNWE.1Av3.pdf",
"/documents/filesImages/3D11_1.11.1.jpg",
"Production multimedia profil web et médias sociaux",
now());


-- ! Insert d'un événement de portes ouverts 
INSERT INTO `event`(`startDate`,`nomEvent`,`date`)
VALUES(now(),"Portes ouverts automme",now());

-- ! Insert de speakers d'exemple 
INSERT INTO `speaker`(`name`,`description`,`chat`,`linkchat`,`photoLink`,`date`)
VALUES("Nicolas Garou","Cordinateur du programa d'Informatique",true,"'https://embed.tawk.to/5f7f6a7d4704467e89f5db3b/default'","/images/speaker/inconnu.png",now());
INSERT INTO `speaker`(`name`,`description`,`chat`,`linkchat`,`photoLink`,`date`)
VALUES("Personne2","Direction",true,"'https://embed.tawk.to/5f8326c24704467e89f67d20/default'","/images/speaker/prog_info.jpg",now());
INSERT INTO `speaker`(`name`,`description`,`chat`,`linkchat`,`photoLink`,`date`)
VALUES("Personne3","direction2",true,"'https://embed.tawk.to/5f8a4b87fd4ff5477ea69d0a/default'","/images/speaker/prog_info.jpg",now());


-- ! Insert de conferences d'exemple
INSERT INTO `conference`(`nameConference`,`idEvent`,`start`,`end`,`idSpeaker`,`linkConference`,`date`)
VALUES("Intro DEC Informatique",1,"10:00", "11:00",1,"https://us04web.zoom.us/j/75020716883?pwd=QW14emdnZXlzUzZoOG1PYW50VDhIZz09",now());
INSERT INTO `conference`(`nameConference`,`idEvent`,`start`,`end`,`idSpeaker`,`linkConference`,`date`)
VALUES("Information général",1,"11:00", "12:00",2,"https://us04web.zoom.us/j/75020716883?pwd=QW14emdnZXlzUzZoOG1PYW50VDhIZz09",now());

INSERT INTO `inscription`(`mail`,`firstName`,`lastName`,`country`,`state`,`phone`,`moyenCommunication`,`consentMessage`,`date`)
VALUES("user2@gmail.com","Conrado","Bhering","Canada","Quebec","438 525-8453","web",1,now());

INSERT INTO `interestingprogrammes`(`mail`,`idProgram`)
VALUES("user2@gmail.com",1);
INSERT INTO `interestingprogrammes`(`mail`,`idProgram`)
VALUES("user2@gmail.com",4);







