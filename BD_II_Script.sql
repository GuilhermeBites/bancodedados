-- MySQL Script generated by MySQL Workbench
-- sáb 23 mar 2019 15:56:54 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `mydb`.`cidade`
-- -----------------------------------------------------
CREATE TABLE cidade (
  id_cidade NUMBER NOT NULL,
  nome_cidade VARCHAR2(255) NOT NULL,
  populacao_cidade NUMBER,
  PRIMARY KEY (id_cidade))

-- -----------------------------------------------------
-- Table `mydb`.`estado`
-- -----------------------------------------------------
CREATE TABLE estado (
  id_estado NUMBER NOT NULL,
  sigla_estado VARCHAR2(45) NOT NULL,
  nome_estado VARCHAR2(45) NOT NULL,
  FK_cidade NUMBER NOT NULL,
  PRIMARY KEY (id_estado),
  FOREIGN KEY (FK_cidade)
    REFERENCES cidade (id_cidade))

-- -----------------------------------------------------
-- Table `unidade`
-- -----------------------------------------------------
CREATE TABLE unidade (
  id_unidade NUMBER NOT NULL,
  cnpj_unidade VARCHAR2(45) NOT NULL,
  telefone_unidade VARCHAR2(45) NOT NULL,
  PRIMARY KEY (id_unidade))

-- -----------------------------------------------------
-- Table `endereco`
-- -----------------------------------------------------
CREATE TABLE endereco (
  id_endereco NUMBER NOT NULL,
  numero_endereco VARCHAR2(45) NOT NULL,
  logradouro VARCHAR2(45) NOT NULL,
  cep VARCHAR2(10) NOT NULL,
  FK_unidade NUMBER NOT NULL,
  PRIMARY KEY (id_endereco),
  FOREIGN KEY (FK_unidade)
    REFERENCES unidade (id_unidade))

-- -----------------------------------------------------
-- Table `mydb`.`bairro`
-- -----------------------------------------------------
CREATE TABLE bairro (
  id_bairro NUMBER NOT NULL,
  nome_bairro VARCHAR2(45) NOT NULL,
  FK_endereco NUMBER NOT NULL,
  PRIMARY KEY (id_bairro),
  FOREIGN KEY (FK_endereco)
   REFERENCES endereco (id_endereco))

-- -----------------------------------------------------
-- Table `mydb`.`instituicao`
-- -----------------------------------------------------
CREATE TABLE instituicao (
  id_instituicao NUMBER NOT NULL,
  sigla_instituicao VARCHAR2(45) NOT NULL,
  nome_instituicao VARCHAR2(45) NOT NULL,
  email_instituicao VARCHAR2(45) NOT NULL,
  FK_unidade NUMBER NOT NULL,
  PRIMARY KEY (id_instituicao),
  FOREIGN KEY (FK_unidade)
    REFERENCES unidade (id_unidade))

-- -----------------------------------------------------
-- Table `mydb`.`cidade_has_bairro`
-- -----------------------------------------------------
CREATE TABLE cidade_has_bairro (
  FK_cidade NUMBER NOT NULL,
  FK_bairro NUMBER NOT NULL,
  PRIMARY KEY (FK_cidade, FK_bairro),
  FOREIGN KEY (FK_cidade)
    REFERENCES cidade (id_cidade),
  FOREIGN KEY (FK_bairro)
    REFERENCES bairro (id_bairro))