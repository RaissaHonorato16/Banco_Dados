-- MySQL Script generated by MySQL Workbench
-- Fri Sep 13 08:09:40 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema capacitacao
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema capacitacao
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `capacitacao` DEFAULT CHARACTER SET utf8 ;
USE `capacitacao` ;

-- -----------------------------------------------------
-- Table `capacitacao`.`instrutor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`instrutor` (
  `Id_Instrutor`      INT NOT NULL,
  `Nome`              VARCHAR(100) NOT NULL,
  `Email`             VARCHAR(100) NOT NULL,
  `valor_hora`        DOUBLE NOT NULL,
  `Certficados`       VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Id_Instrutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capacitacao`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`Curso` (
  `Id_Curso`         INT NOT NULL,
  `Nome`             VARCHAR(100) NOT NULL,
  `Requisito`        VARCHAR(100) NOT NULL,
  `Carga_Horaria`    DOUBLE NOT NULL,
  `Preco`            DOUBLE NOT NULL,
  PRIMARY KEY (`Id_Curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capacitacao`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`turma` (
  `Id_turma`                  INT NOT NULL,
  `Carga_horaria`             DOUBLE NOT NULL,
  `Data_Inical`               DATE NOT NULL,
  `Data_Final`                DATE NOT NULL,
  `Curso_Id_Curso`            INT NOT NULL, -- chave estrangeira
  `instrutor_Id_Instrutor`    INT NOT NULL, -- chave estrangeira
  PRIMARY KEY (`Id_turma`, `Curso_Id_Curso`, `instrutor_Id_Instrutor`),
  -- INDEX `fk_turma_Curso1_idx` (`Curso_Id_Curso` ASC) VISIBLE,
  -- INDEX `fk_turma_instrutor1_idx` (`instrutor_Id_Instrutor` ASC) VISIBLE,
  CONSTRAINT `fk_turma_Curso1`
    FOREIGN KEY (`Curso_Id_Curso`)
    REFERENCES `capacitacao`.`Curso` (`Id_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_instrutor1`
    FOREIGN KEY (`instrutor_Id_Instrutor`)
    REFERENCES `capacitacao`.`instrutor` (`Id_Instrutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capacitacao`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`aluno` (
  `Id_Aluno`            INT NOT NULL,
  `Nome`                VARCHAR(100) NOT NULL,
  `Cpf`                 VARCHAR(15) NOT NULL,
  `DataNasc`            DATE NOT NULL,
  `Fone`                CHAR(14) NOT NULL,
  `Email`               VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Id_Aluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capacitacao`.`matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`matricula` (
  `Id_Matricula`        INT NOT NULL,
  `Data_Matricula`      DATE NOT NULL,
  `matriculacol`        VARCHAR(45) NULL,
  `aluno_Id_Aluno1`     INT NOT NULL, -- chave estrangeira
  `turma_Id_turma`      INT NOT NULL, -- chave estrangeira
  PRIMARY KEY (`Id_Matricula`, `aluno_Id_Aluno1`, `turma_Id_turma`),
 -- INDEX `fk_matricula_aluno2_idx` (`aluno_Id_Aluno1` ASC) VISIBLE,
 -- INDEX `fk_matricula_turma1_idx` (`turma_Id_turma` ASC) VISIBLE,
  CONSTRAINT `fk_matricula_aluno2`
    FOREIGN KEY (`aluno_Id_Aluno1`)
    REFERENCES `capacitacao`.`aluno` (`Id_Aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_matricula_turma1`
    FOREIGN KEY (`turma_Id_turma`)
    REFERENCES `capacitacao`.`turma` (`Id_turma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
