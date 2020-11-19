
CREATE DATABASE IF NOT EXISTS `instit43_jpo_test` DEFAULT CHARACTER SET utf8 ;

Use  instit43_jpo_test;
-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user` (
  `username` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `event` (
  `idevent` INT(11) NOT NULL AUTO_INCREMENT,
  `startdate` DATETIME NOT NULL,
  `nomevent` VARCHAR(255) NULL DEFAULT NULL,
   `date` DATETIME NOT NULL,
  PRIMARY KEY (`idevent`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`speaker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `speaker` (
  `idspeaker` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `photolink` VARCHAR(255) NOT NULL,
  `chat` TINYINT(1) NOT NULL,
  `linkchat` VARCHAR(255) NOT NULL,
	`date` DATETIME NOT NULL,
  PRIMARY KEY (`idspeaker`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`conference`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `conference` (
  `idconference` INT(11) NOT NULL AUTO_INCREMENT,
  `nameconference` VARCHAR(255) NOT NULL,
  `idevent` INT(11) NOT NULL,
  `idspeaker` INT(11) NOT NULL,
  `start` VARCHAR(5) NOT NULL,
  `end` VARCHAR(5) NOT NULL,
  `linkconference` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`idconference`),
  CONSTRAINT `event_conference`
    FOREIGN KEY (`idevent`)
    REFERENCES `event` (`idevent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `speaker_conference`
    FOREIGN KEY (`idspeaker`)
    REFERENCES `speaker` (`idspeaker`)
    ON DELETE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`configuration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `configuration` (
  `linkvirtualvisit` VARCHAR(255) NOT NULL,
  `linkfaq` VARCHAR(255) NOT NULL,
  `endmessage` VARCHAR(255) NOT NULL,
  `welcometitle` VARCHAR(100) NOT NULL,
  `welcomesubtitle` VARCHAR(100) NOT NULL,
  `welcometext` VARCHAR(3000) NOT NULL,
  `noevent` VARCHAR(255) NOT NULL,
  `video1` VARCHAR(255) NOT NULL,
  `video2` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`configuration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nodemailer` (
  `service` VARCHAR(255) NOT NULL,
  `user` VARCHAR(255) NOT NULL,
  `pass` VARCHAR(255) NOT NULL,
  `from` VARCHAR(255) NOT NULL,
  `subject` VARCHAR(500) NOT NULL,
  `text` VARCHAR(500) NOT NULL,
   `date` DATETIME NOT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`downloadable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `downloadable` (
  `iddownloadable` INT(11) NOT NULL AUTO_INCREMENT,
  `fileimage` VARCHAR(255) NULL DEFAULT NULL,
  `filelink` VARCHAR(255) NULL DEFAULT NULL,
  `description` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`iddownloadable`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`inscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inscription` (
  `mail` VARCHAR(255) NOT NULL,
  `firstname` VARCHAR(255) NOT NULL,
  `lastname` VARCHAR(255) NOT NULL,
  `country` VARCHAR(100) NOT NULL,
  `state` VARCHAR(100) NULL DEFAULT NULL,
  `phone` VARCHAR(100) NOT NULL,
  `moyencommunication` VARCHAR(255) NOT NULL,
  `consentmessage` TINYINT(4) NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`mail`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `program` (
  `idprogram` INT(11) NOT NULL AUTO_INCREMENT,
  `programdescription` VARCHAR(255) NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`idprogram`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`interestingprogrammes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `interestingprogrammes` (
  `mail` VARCHAR(255) NOT NULL,
  `idprogram` INT(11) NOT NULL,
  PRIMARY KEY (`mail`, `idprogram`),
  CONSTRAINT `inscription_interesting`
    FOREIGN KEY (`mail`)
    REFERENCES `inscription` (`mail`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `inscription_programmes`
    FOREIGN KEY (`idprogram`)
    REFERENCES `program` (`idprogram`)
    ON DELETE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `instit43_jpo_test_1.0`.`guests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `guests` (
 `idguests` INT(11) NOT NULL AUTO_INCREMENT,
  `dateadmission` DATETIME NOT NULL,
  PRIMARY KEY (`idguests`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;