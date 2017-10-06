SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `blog` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `blog` ;

-- -----------------------------------------------------
-- Table `blog`.`categories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `blog`.`categories` (
  `id_categories` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `description` TEXT NULL ,
  `status` TINYINT NULL ,
  PRIMARY KEY (`id_categories`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`posts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `blog`.`posts` (
  `id_posts` INT NOT NULL AUTO_INCREMENT ,
  `users` INT NULL ,
  `title` VARCHAR(45) NULL ,
  `body` LONGTEXT NULL ,
  `pub_date` TIMESTAMP NULL ,
  `update_date` TIMESTAMP NULL ,
  `status` TINYINT NULL ,
  `categories_id_categories` INT NOT NULL ,
  PRIMARY KEY (`id_posts`, `categories_id_categories`) ,
  INDEX `fk_posts_categories` (`categories_id_categories` ASC) ,
  CONSTRAINT `fk_posts_categories`
    FOREIGN KEY (`categories_id_categories` )
    REFERENCES `blog`.`categories` (`id_categories` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`comments`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `blog`.`comments` (
  `id_comments` INT NOT NULL AUTO_INCREMENT ,
  `users` INT NULL ,
  `comments` LONGTEXT NULL ,
  `comments_date` TIMESTAMP NULL ,
  `status` TINYINT NULL ,
  `posts_id_posts` INT NOT NULL ,
  PRIMARY KEY (`id_comments`, `posts_id_posts`) ,
  INDEX `fk_comments_posts1` (`posts_id_posts` ASC) ,
  CONSTRAINT `fk_comments_posts1`
    FOREIGN KEY (`posts_id_posts` )
    REFERENCES `blog`.`posts` (`id_posts` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `blog`.`files`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `blog`.`files` (
  `id_files` INT NOT NULL AUTO_INCREMENT ,
  `files` VARCHAR(45) NULL ,
  `status` TINYINT NULL ,
  `comments_id_comments` INT NOT NULL ,
  PRIMARY KEY (`id_files`, `comments_id_comments`) ,
  INDEX `fk_files_comments1` (`comments_id_comments` ASC) ,
  CONSTRAINT `fk_files_comments1`
    FOREIGN KEY (`comments_id_comments` )
    REFERENCES `blog`.`comments` (`id_comments` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
