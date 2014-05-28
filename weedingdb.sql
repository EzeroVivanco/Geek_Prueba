SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `status` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cat_ciudades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cat_ciudades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`eventos` (
  `id` INT NOT NULL,
  `fecha` DATE NULL,
  `hora` TIME NULL,
  `locacion` VARCHAR(45) NULL,
  `numero_invitados` INT NULL,
  `cat_ciudades_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_eventos_cat_ciudades1` (`cat_ciudades_id` ASC),
  CONSTRAINT `fk_eventos_cat_ciudades1`
    FOREIGN KEY (`cat_ciudades_id`)
    REFERENCES `mydb`.`cat_ciudades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cat_tipos_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cat_tipos_usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`xref_eventos_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`xref_eventos_usuarios` (
  `id` INT NOT NULL,
  `usuarios_id` INT NOT NULL,
  `eventos_id` INT NOT NULL,
  `cat_tipos_usuarios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_xref_eventos_usuarios_usuarios` (`usuarios_id` ASC),
  INDEX `fk_xref_eventos_usuarios_eventos1` (`eventos_id` ASC),
  INDEX `fk_xref_eventos_usuarios_cat_tipos_usuarios1` (`cat_tipos_usuarios_id` ASC),
  CONSTRAINT `fk_xref_eventos_usuarios_usuarios`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `mydb`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_xref_eventos_usuarios_eventos1`
    FOREIGN KEY (`eventos_id`)
    REFERENCES `mydb`.`eventos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_xref_eventos_usuarios_cat_tipos_usuarios1`
    FOREIGN KEY (`cat_tipos_usuarios_id`)
    REFERENCES `mydb`.`cat_tipos_usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
