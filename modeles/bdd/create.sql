-- MySQL Script generated by MySQL Workbench
-- lun. 05 nov. 2018 09:00:26 CET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering


-- -----------------------------------------------------
-- Schema MemoCards
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MemoCards
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `MemoCards` DEFAULT CHARACTER SET utf8 ;
USE `MemoCards` ;

-- -----------------------------------------------------
-- Table `MemoCards`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MemoCards`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(25) NOT NULL,
  `password` VARCHAR(25) NOT NULL,
  `profil_picture` VARCHAR(255) NULL,
  `statut` VARCHAR(45) NOT NULL,
  `age` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MemoCards`.`hashtag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MemoCards`.`hashtag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MemoCards`.`categorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MemoCards`.`categorie` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` MEDIUMTEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MemoCards`.`deck`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MemoCards`.`deck` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` MEDIUMTEXT NULL,
  `mark` DECIMAL(1,1) NULL DEFAULT NULL,
  `autor` INT NOT NULL,
  `date_create` DATETIME NOT NULL,
  `statut` VARCHAR(45) NULL,
  `comment_user` MEDIUMTEXT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MemoCards`.`recto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MemoCards`.`recto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `question_cards` VARCHAR(255) NOT NULL,
  `deck_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_recto_deck1_idx` (`deck_id` ASC),
  CONSTRAINT `fk_recto_deck1`
    FOREIGN KEY (`deck_id`)
    REFERENCES `MemoCards`.`deck` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MemoCards`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MemoCards`.`message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NULL,
  `content_message` LONGTEXT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MemoCards`.`passed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MemoCards`.`passed` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date_passed` DATE NOT NULL,
  `number_game` INT NOT NULL,
  `score_user` INT NOT NULL,
  `user_id` INT NOT NULL,
  `deck_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_passed_user1_idx` (`user_id` ASC),
  INDEX `fk_passed_deck1_idx` (`deck_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_passed_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `MemoCards`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_passed_deck1`
    FOREIGN KEY (`deck_id`)
    REFERENCES `MemoCards`.`deck` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MemoCards`.`comments_deck`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MemoCards`.`comments_deck` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` LONGTEXT NOT NULL,
  `autor` INT NOT NULL,
  `deck_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_comments_deck_deck1_idx` (`deck_id` ASC),
  CONSTRAINT `fk_comments_deck_deck1`
    FOREIGN KEY (`deck_id`)
    REFERENCES `MemoCards`.`deck` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MemoCards`.`hashtag_has_deck`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MemoCards`.`hashtag_has_deck` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hashtag_id` INT NOT NULL,
  `deck_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_hashtag_has_deck_deck1_idx` (`deck_id` ASC),
  INDEX `fk_hashtag_has_deck_hashtag1_idx` (`hashtag_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_hashtag_has_deck_hashtag1`
    FOREIGN KEY (`hashtag_id`)
    REFERENCES `MemoCards`.`hashtag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_hashtag_has_deck_deck1`
    FOREIGN KEY (`deck_id`)
    REFERENCES `MemoCards`.`deck` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MemoCards`.`categorie_has_deck`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MemoCards`.`categorie_has_deck` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categorie_id` INT NOT NULL,
  `deck_id` INT NOT NULL,
  INDEX `fk_categorie_has_deck_deck1_idx` (`deck_id` ASC),
  INDEX `fk_categorie_has_deck_categorie1_idx` (`categorie_id` ASC),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  CONSTRAINT `fk_categorie_has_deck_categorie1`
    FOREIGN KEY (`categorie_id`)
    REFERENCES `MemoCards`.`categorie` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categorie_has_deck_deck1`
    FOREIGN KEY (`deck_id`)
    REFERENCES `MemoCards`.`deck` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MemoCards`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MemoCards`.`subject` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `date_posted` DATE NOT NULL,
  `statut` VARCHAR(45) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_subject_user1_idx` (`user_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  CONSTRAINT `fk_subject_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `MemoCards`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MemoCards`.`verso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MemoCards`.`verso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `answer_cards` VARCHAR(255) NOT NULL,
  `recto_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_verso_recto1_idx` (`recto_id` ASC),
  CONSTRAINT `fk_verso_recto1`
    FOREIGN KEY (`recto_id`)
    REFERENCES `MemoCards`.`recto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MemoCards`.`succes_rate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MemoCards`.`succes_rate` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `level_cards` INT NOT NULL,
  `played_cards` INT NOT NULL,
  `verso_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_succes_rate_verso1_idx` (`verso_id` ASC),
  CONSTRAINT `fk_succes_rate_verso1`
    FOREIGN KEY (`verso_id`)
    REFERENCES `MemoCards`.`verso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MemoCards`.`message_has_subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MemoCards`.`message_has_subject` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `message_id` INT NOT NULL,
  `subject_id` INT NOT NULL,
  INDEX `fk_message_has_subject_subject1_idx` (`subject_id` ASC),
  INDEX `fk_message_has_subject_message1_idx` (`message_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_message_has_subject_message1`
    FOREIGN KEY (`message_id`)
    REFERENCES `MemoCards`.`message` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_has_subject_subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `MemoCards`.`subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;