CREATE TABLE `rdl_doctor_profile` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `name` VARCHAR(50) NOT NULL ,
 `qualification` VARCHAR(50) NOT NULL ,
 `associated_hospital` VARCHAR(50) NULL ,
 `years_of_exp` INT NULL ,
 `photo_id` VARCHAR(50) NULL ,
 PRIMARY KEY (`id`));

CREATE TABLE `rdl_patient_personal_profile` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `name` VARCHAR(50) NULL ,
 `photo_ids` VARCHAR(100) NULL ,
 `date_of_birth` DATE NULL ,
 `gender` ENUM('M','F','TG') NOT NULL ,
 `home_location` VARCHAR(45) NULL ,
 `mother_tongue` VARCHAR(25) NULL ,
 `current_location` VARCHAR(45) NULL ,
 `type_of_surgery` VARCHAR(45) NULL ,
 `annual_family_income` INT unsigned NULL ,
 `patient_profile_story` VARCHAR(250) NULL ,
 `last_updated`TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
 PRIMARY KEY (`id`));

CREATE TABLE `rdl_partner_hospitals` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `name` VARCHAR(65) NULL ,
 `location` VARCHAR(200) NULL ,
 PRIMARY KEY (`id`));

CREATE TABLE `rdl_suggested_volunteer` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `name` VARCHAR(55) NULL ,
 `location` VARCHAR(55) NULL ,
 `email_address` VARCHAR(45) NULL ,
 `phone_number` VARCHAR(65) NULL ,
`suggested_by_id` INT(4) UNSIGNED NOT NULL,
 PRIMARY KEY (`id`) ,
 CONSTRAINT `suggestedby_fk1`
 FOREIGN KEY (`suggested_by_id` )
 REFERENCES `test`.`users` (`id` )
, INDEX `suggestedby_fk1` (`suggested_by_id` ASC) ,
 UNIQUE INDEX ` email_address _UNIQUE` (`email_address` ASC) );

CREATE TABLE `rdl_patient_case_profile` (
 `id` INT NOT NULL AUTO_INCREMENT,
 `patient_id` INT NOT NULL ,
 `partner_hospital_id` INT NULL ,
 `doctor_id` INT NULL ,
 `case_study_video_link` VARCHAR(100) NULL ,
 `case_files_location` VARCHAR(100) NULL ,
 `threat_to_life` INT NULL DEFAULT 10 ,
 `risk_to_livelihood` INT NULL ,
`case_referred_on` DATE NULL ,
 `estimated_fundraising_date` DATE NULL ,
`estimated_admission_date` DATE NULL , 
 `estimated_surgery_date` DATE NULL , 
 `estimated_discharge_date` DATE NULL ,
 `profile_submission_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
 `volunteer_id` INT(4) unsigned NOT NULL ,
 `total_amount_needed` INT NOT NULL DEFAULT 0 ,
 `total_amount_raised` INT NOT NULL DEFAULT 0 ,
 `total_pledged_amount` INT NOT NULL DEFAULT 0 ,
 PRIMARY KEY (`id`) ,
 INDEX `patientid_fk` (`patient_id` ASC) ,
 INDEX `hospitalid_fk` (`partner_hospital_id` ASC) ,
 INDEX `doctorid_fk` (`doctor_id` ASC) ,
 INDEX `volunteer_fk` (`volunteer_id` ASC) ,
 CONSTRAINT `patientid_fk`
 FOREIGN KEY (`patient_id` )
 REFERENCES `rdl_patient_personal_profile` (`id` )
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `hospitalid_fk`
 FOREIGN KEY (`partner_hospital_id` )
 REFERENCES `rdl_partner_hospitals` (`id` ),
 CONSTRAINT `doctorid_fk`
 FOREIGN KEY (`doctor_id` )
 REFERENCES `rdl_doctor_profile` (`id` ),
 CONSTRAINT `volunteer_fk`
 FOREIGN KEY (`volunteer_id` )
 REFERENCES `investors` (`id` ));

CREATE TABLE `rdl_payments` (
 `id` INT NOT NULL AUTO_INCREMENT ,
 `case_id` INT NULL ,
 `investor_id` int(4) unsigned NOT NULL ,
 `donation_amount` INT NULL ,
 `payment_mode` ENUM('NEFT','CHEQUE','BILL_DESK') NULL ,
 `transaction_id` VARCHAR(100) NULL ,
 `bank_id` INT NULL ,
 `response_code` VARCHAR(200) NULL ,
 `payment_status` ENUM('SUCCESSFUL','WAITING_FOR_CONFIRMATION','REJECTED') NULL ,
 `transaction_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
 `last_updated` TIMESTAMP NULL ,
 `is_transaction_anonymous` ENUM('Y','N') NOT NULL DEFAULT 'N' ,
 `is_80G_sent` ENUM('Y','N') NULL ,
 PRIMARY KEY (`id`) ,
 CONSTRAINT `investorid_fk_1` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`id`) ,
INDEX `case_fk_2` (`case_id` ASC) , CONSTRAINT `case_fk` FOREIGN KEY (`case_id` )
 REFERENCES `rdl_patient_case_profile` (`id` )
 );

CREATE TABLE `users` (
 `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
 `version` int(4) DEFAULT NULL,
 `first_name` varchar(100) DEFAULT NULL,
 `last_name` varchar(100) DEFAULT NULL,
 `email_address` varchar(50) NOT NULL DEFAULT '',
 `password` varchar(100) DEFAULT NULL,
 `user_type` enum('A','P','I','AC','CA','CI','AP') NOT NULL DEFAULT 'I',
 `nationality_id` int(4) unsigned NOT NULL DEFAULT '0',
 `gender` enum('M','F','TG') DEFAULT NULL,
 `date_of_birth` date DEFAULT NULL,
 `city` varchar(50) DEFAULT NULL,
 `country` varchar(50) DEFAULT NULL,
 `phone_residence` varchar(20) DEFAULT NULL,
 `phone_mobile` varchar(20) DEFAULT NULL,
 `registration_date` datetime DEFAULT NULL,
 `last_login_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE 
CURRENT_TIMESTAMP,
 PRIMARY KEY (`id`),
 UNIQUE KEY `email_address` (`email_address`),
 KEY `cityIndex` (`city`)
) 

CREATE TABLE `investors` (
 `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
 `image_id` int(4) DEFAULT NULL,
 `organization` varchar(100) DEFAULT NULL,
 `occupation` varchar(200) DEFAULT NULL,
 `nick_name` varchar(50) DEFAULT NULL,
 `has_invested` tinyint(1) NOT NULL DEFAULT '0',
 PRIMARY KEY (`id`),
 UNIQUE KEY `nick_name` (`nick_name`),
 CONSTRAINT `investors_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`)
)