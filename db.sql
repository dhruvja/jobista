CREATE DATABASE jobify;

CREATE TABLE `jobify`.`accounts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `email` VARCHAR(255) NULL,
  `phone` VARCHAR(45) NULL,
  `passwords` VARCHAR(255) NULL,
  `type` VARCHAR(45) NULL,
  `email_verification` VARCHAR(45) NULL,
  `phone_verification` VARCHAR(45) NULL,
  `created_date` VARCHAR(45) NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `jobify`.`work_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `username` VARCHAR(45) NULL,
  `exptime` INT NULL,
  `experience` VARCHAR(500) NULL,
  `edulevel` INT NULL,
  `eduname` VARCHAR(45) NULL,
  `profile_pic` VARCHAR(255) NULL,
  `address_code` VARCHAR(45) NULL,
  `account_verification` VARCHAR(45) NULL,
  `created_date` VARCHAR(45) NULL,
  `area` VARCHAR(45) NULL,
  `pincode` VARCHAR(45) NULL,
  `work_status` INT NULL,
  `indexing` VARCHAR(2000) NULL,

  PRIMARY KEY (`id`),
  INDEX `user id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user id`
    FOREIGN KEY (`user_id`)
    REFERENCES `jobify`.`accounts` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);

CREATE TABLE `jobify`.`documents` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `work_id` INT NULL,
  `document_name` VARCHAR(45) NULL,
  `document` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `work id_idx` (`work_id` ASC) VISIBLE,
  CONSTRAINT `work id`
    FOREIGN KEY (`work_id`)
    REFERENCES `jobify`.`work_details` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);

CREATE TABLE `jobify`.`designation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `work_id` INT NULL,
  `designation` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `work id_idx` (`work_id` ASC) VISIBLE,
  CONSTRAINT `role id`
    FOREIGN KEY (`work_id`)
    REFERENCES `jobify`.`work_details` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `jobify`.`ads` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `username` VARCHAR(45) NULL,
  `job_title` VARCHAR(45) NULL,
  `designation` VARCHAR(45) NULL,
  `jobtype` VARCHAR(45) NULL,
  `fromtime` VARCHAR(45) NULL,
  `totime` VARCHAR(45) NULL,
  `minsalary` INT NULL,
  `maxsalary` INT NULL,
  `exptime` INT NULL,
  `edulevel` INT NULL,
  `ad_status` INT DEFAULT 0,
  `indexing` VARCHAR(2000) NULL,
  `address_code` VARCHAR(45) NULL,
  `created_date` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `ad id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `ad id`
    FOREIGN KEY (`user_id`)
    REFERENCES `jobify`.`accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `jobify`.`ads_address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `address_code` VARCHAR(45) NULL,
  `housename` VARCHAR(45) NULL,
  `streetname` VARCHAR(45) NULL,
  `area` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `pincode` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `ads address_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `ads address`
    FOREIGN KEY (`user_id`)
    REFERENCES `jobify`.`accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `jobify`.`pinged_workers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `client_id` INT NULL,
  `worker_id` INT NULL,
  `ad_id` INT NULL,
  `status` VARCHAR(45) NULL,
  `worker_message` VARCHAR(500) NULL,
  `client_message` VARCHAR(500) NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `jobify`.`applied_ads` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `client_id` VARCHAR(45) NULL,
  `worker_id` VARCHAR(45) NULL,
  `ad_id` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `client_message` VARCHAR(500) NULL,
  `worker_message` VARCHAR(500) NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `jobify`.`client_details` (
  `id` INT NOT NULL,
  `user_id` INT NULL,
  `username` VARCHAR(45) NULL,
  `dob` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `profile_pic` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `client_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `client_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `jobify`.`accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


