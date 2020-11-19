
-- ! Insert des utilisateurs
INSERT INTO `portesouvertsgrasset`.`user`(`username`,`email`,`password`,`rol`)
VALUES("Admin","admin@gmail.com","12345!","Administrateur");
INSERT INTO `portesouvertsgrasset`.`user`(`username`,`email`,`password`,`rol`)
VALUES("Nicole Boyer","nicole@grasset.qc.ca","12345!","Clavardeur");
INSERT INTO `portesouvertsgrasset`.`user`(`username`,`email`,`password`,`rol`)
VALUES("Admissions","catherine@grasset.qc.ca","12345!","Clavardeur");

-- ! Insert de la configuration 
INSERT INTO `portesouvertsgrasset`.`configuration`(`linkVirtualVisit`,`linkFAQ`,`endMessage`,`date`,`idUser`)
VALUES("https://www.institut-grasset.qc.ca/contactez-nous/","https://www.institut-grasset.qc.ca/contactez-nous/ ","Fin de l'événement des portes ouverts de l'institut Grasset",now(),"admin@gmail.com");


-- ! Insert des programmes
INSERT INTO `portesouvertsgrasset`.`program`(`programDescription`,`imageLink`,`date`,`idUser`)
VALUES("AEC - Composition et effets spéciaux pour vidéo numérique NWY.16","\\images\image1.jpg",now(),"admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`program`(`programDescription`,`imageLink`,`date`,`idUser`)
VALUES("AEC - Production télévisuelle et cinématographique NWY.15","\\images\image1.jpg",now(),"admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`program`(`programDescription`,`imageLink`,`date`,`idUser`)
VALUES("AEC - Techniques de montage et d’habillage informatique NWY.00","\\images\image1.jpg",now(),"admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`program`(`programDescription`,`imageLink`,`date`,`idUser`)
VALUES("AEC - Production multimédia, profil web et médias sociaux NWE.1A","\\images\image1.jpg",now(),"admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`program`(`programDescription`,`imageLink`,`date`,`idUser`)
VALUES("AEC - Production 3D pour jeux vidéo NTL.12","\\images\image1.jpg",now(),"admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`program`(`programDescription`,`imageLink`,`date`,`idUser`)
VALUES("AEC - Techniques d’animation 3D et effets spéciaux NTL.06","\\images\image1.jpg",now(),"admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`program`(`programDescription`,`imageLink`,`date`,`idUser`)
VALUES("AEC – Spécialiste en réalité virtuelle et augmentée NTL.1K","\\images\image1.jpg",now(),"admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`program`(`programDescription`,`imageLink`,`date`,`idUser`)
VALUES("AEC - Techniques d’inspection en bâtiment EEC.13","\\images\image1.jpg",now(),"admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`program`(`programDescription`,`imageLink`,`date`,`idUser`)
VALUES("DEC - Techniques de l’informatique, profil programmation nouveaux médias 420.B0","\\images\image1.jpg",now(),"admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`program`(`programDescription`,`imageLink`,`date`,`idUser`)
VALUES("DEC - Techniques de production et de postproduction télévisuelles 589.AB","\\images\image1.jpg",now(),"admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`program`(`programDescription`,`imageLink`,`date`,`idUser`)
VALUES("DEC - Techniques d’animation 3D et de synthèse d’images 574.B0","\\images\image1.jpg",now(),"admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`program`(`programDescription`,`imageLink`,`date`,`idUser`)
VALUES("DEC - Technologie de l’estimation et de l’évaluation en bâtiment spécialisation en évaluation immobilière 221.DB","\\images\image1.jpg",now(),"admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`program`(`programDescription`,`imageLink`,`date`,`idUser`)
VALUES("DEC - Technologie de l’estimation et de l’évaluation en bâtiment","\\images\image1.jpg",now(),"admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`program`(`programDescription`,`imageLink`,`date`,`idUser`)
VALUES("BIM - Technologie de l’estimation en construction BIM 5D","\\images\image1.jpg",now(),"admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`program`(`programDescription`,`imageLink`,`date`,`idUser`)
VALUES("Je ne sais pas","\\images\image1.jpg",now(),"admin@gmail.com");

-- ! Insert d'un événement de portes ouverts 
INSERT INTO `portesouvertsgrasset`.`event`(`startDate`,`endDate`,`idUser`)
VALUES(now(),now(),"admin@gmail.com");


-- ! Insert de brochures
INSERT INTO `portesouvertsgrasset`.`downloadable`(`idProgram`,`fileImage`,`fileLink`,`description`,`date`,`idUser`)
VALUES(1,"\\images\images\dec1.jpg","\images\documents\fiche DECtechnique de production tv 589.AB.pdf","Brochure DEC en informatique",now(),"admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`downloadable`(`idProgram`,`fileImage`,`fileLink`,`description`,`date`,`idUser`)
VALUES(1,"\\images\images\dec1.jpg","\images\documents\Fiche DECtechnique informatique 420.AA","Brochure DEC en informatique",now(),"admin@gmail.com");


-- ! Insert de speakers d'exemple 
INSERT INTO `portesouvertsgrasset`.`speaker`(`name`,`description`,`photoLink`,`idUser`)
VALUES("Nicolas Garou","Cordinateur du programa d'Informatique","\\images\speaker\image1.jpg","admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`speaker`(`name`,`description`,`photoLink`,`idUser`)
VALUES("Laurence Goudin-Desphelippon","Enseignent du francais","\\images\speaker\image2.jpg","admin@gmail.com");


-- ! Insert de conferences d'exemple
INSERT INTO `portesouvertsgrasset`.`conference`(`nameConference`,`idEvent`,`start`,`fin`,`idSpeaker`,`linkConference`,`date`,`idUser`)
VALUES("Intro DEC Informatique",1,"10:00", "11:00",1,"https://us04web.zoom.us/j/75020716883?pwd=QW14emdnZXlzUzZoOG1PYW50VDhIZz09",now(),"admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`conference`(`nameConference`,`idEvent`,`start`,`fin`,`idSpeaker`,`linkConference`,`date`,`idUser`)
VALUES("Information général",1,"11:00", "12:00",2,"https://us04web.zoom.us/j/75020716883?pwd=QW14emdnZXlzUzZoOG1PYW50VDhIZz09",now(),"admin@gmail.com");

-- ! Insert de videos d'exemple
INSERT INTO `portesouvertsgrasset`.`video`(`videoLink`,`description`,`date`,`idUser`)
VALUES("<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/4xfuNWoZbW8\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>","Court-métrage | DEC2015 Télé et Cinéma | Pingouin",now(),"admin@gmail.com");
INSERT INTO `portesouvertsgrasset`.`video`(`videoLink`,`description`,`date`,`idUser`)
VALUES("<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/fEeFzsHEm8k\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>","Court-métrage | DEC2015 Télé et Cinéma | Pingouin",now(),"admin@gmail.com");





