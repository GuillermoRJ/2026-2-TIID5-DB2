-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema mi_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mi_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mi_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mi_db` ;

-- -----------------------------------------------------
-- Table `mi_db`.`departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_db`.`departamentos` (
  `id_dep` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_dep`),
  UNIQUE INDEX `nombre` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mi_db`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_db`.`empleados` (
  `id_emp` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `id_dep` INT NOT NULL,
  PRIMARY KEY (`id_emp`),
  INDEX `id_dep` (`id_dep` ASC) VISIBLE,
  CONSTRAINT `empleados_ibfk_1`
    FOREIGN KEY (`id_dep`)
    REFERENCES `mi_db`.`departamentos` (`id_dep`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mi_db`.`pcs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mi_db`.`pcs` (
  `id_pc` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(50) NULL DEFAULT NULL,
  `numero_serie` VARCHAR(20) NOT NULL,
  `fecha_compra` DATE NULL DEFAULT NULL,
  `id_emp` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_pc`),
  UNIQUE INDEX `unique_serie` (`numero_serie` ASC) VISIBLE,
  UNIQUE INDEX `unique_emp` (`id_emp` ASC) VISIBLE,
  CONSTRAINT `fk_pcs_emp`
    FOREIGN KEY (`id_emp`)
    REFERENCES `mi_db`.`empleados` (`id_emp`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
