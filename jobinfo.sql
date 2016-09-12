-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema jobs
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `jobs` ;

-- -----------------------------------------------------
-- Schema jobs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `jobs` DEFAULT CHARACTER SET utf8 ;
USE `jobs` ;

-- -----------------------------------------------------
-- Table `employer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employer` ;

CREATE TABLE IF NOT EXISTS `employer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `website` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `job` ;

CREATE TABLE IF NOT EXISTS `job` (
  `id` INT NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `date_posted` DATE NULL,
  `deadline` DATE NULL,
  `employer_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `job_idx` (`employer_id` ASC),
  CONSTRAINT `job`
    FOREIGN KEY (`employer_id`)
    REFERENCES `employer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `specialty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `specialty` ;

CREATE TABLE IF NOT EXISTS `specialty` (
  `id` INT NOT NULL,
  `specialty` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `job_specialty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `job_specialty` ;

CREATE TABLE IF NOT EXISTS `job_specialty` (
  `job_id` INT NOT NULL,
  `specialty_id` INT NOT NULL,
  PRIMARY KEY (`job_id`, `specialty_id`),
  INDEX `fk_job_specialty_specialty_idx` (`specialty_id` ASC),
  CONSTRAINT `fk_job_specialty_job`
    FOREIGN KEY (`job_id`)
    REFERENCES `job` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_job_specialty_specialty`
    FOREIGN KEY (`specialty_id`)
    REFERENCES `specialty` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO patrick;
 DROP USER patrick;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'patrick' IDENTIFIED BY 'patrick';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'patrick';

-- -----------------------------------------------------
-- Data for table `employer`
-- -----------------------------------------------------
START TRANSACTION;
USE `jobs`;
INSERT INTO `employer` (`id`, `name`, `city`, `state`, `website`) VALUES (1, ' Lionbridge ', ' Cupertino', 'California', ' http://www.aplitrak.com/?adid=YmJnZW5lcmljLjE4NDQ2LjQ0MDFAbGlvbmJyaWRnZS5hcGxpdHJhay5jb20');
INSERT INTO `employer` (`id`, `name`, `city`, `state`, `website`) VALUES (2, ' Amazon ', ' Cambridge', 'Massachusetts', ' https://us-amazon.icims.com/jobs/416176/language-engineer/job?mobile=false&width=1245&height=1200&bga=true&needsRedirect=false&jan1offset=-420&jun1offset=-360');
INSERT INTO `employer` (`id`, `name`, `city`, `state`, `website`) VALUES (3, ' Indeed ', ' Austin', 'Texas', ' http://www.indeed.jobs/career/JobDetail/Senior-Software-Engineer-Search/727?source=Indeed');
INSERT INTO `employer` (`id`, `name`, `city`, `state`, `website`) VALUES (4, ' Amazon ', ' Pittsburgh', 'Pittsburgh', '  https://us-amazon.icims.com/jobs/376957/machine-translation-system-engineer/job?iis=Job+Posting&iisn=Indeed+%28Paid+Sponsored+Posting%29');
INSERT INTO `employer` (`id`, `name`, `city`, `state`, `website`) VALUES (5, ' Neurable ', ' Cambridge', 'Massachusetts', ' https://www.glassdoor.com/job-listing/machine-learning-engineer-neurable-JV_IC1154545_KO0;25_KE26;34.htm?jl=1937525473');
INSERT INTO `employer` (`id`, `name`, `city`, `state`, `website`) VALUES (6, ' Apple ', ' Santa Clara Valley', 'California', ' https://jobs.apple.com/search?job=45099617&openJobId=45099617&cid=ap');
INSERT INTO `employer` (`id`, `name`, `city`, `state`, `website`) VALUES (7, ' University of Texas at Austin ', ' Austin', 'Texas', ' https://www.ivyexec.com/job-opening/assistantassociate-professor-computational-linguistics/austin/texas/usa?job_id=4021650&ref=Glassdoor&promo=Glassdoor');
INSERT INTO `employer` (`id`, `name`, `city`, `state`, `website`) VALUES (8, ' Verisk Analytics ', ' Jersey City', 'New Jersey', ' https://careers.verisk.com/viewjob.html?optlink-view=view-43708&ERFormID=newjoblist&ERFormCode=any&eresc=Glassdoor');
INSERT INTO `employer` (`id`, `name`, `city`, `state`, `website`) VALUES (9, ' Ntrepid ', ' Herndon', 'Virginia', ' Jun-14-2016 ');
INSERT INTO `employer` (`id`, `name`, `city`, `state`, `website`) VALUES (10, ' Monitor 360 ', ' San Francisco', 'California', ' https://www.glassdoor.com/job-listing/computational-linguist-ntrepid-JV_IC1130374_KO0;22_KE23;30.htm?jl=1914705684');
INSERT INTO `employer` (`id`, `name`, `city`, `state`, `website`) VALUES (11, ' Pygmalion ', 'Tampa', 'Florida', ' http://linguistlist.org/jobs/get-jobs.cfm?id=36199157');
INSERT INTO `employer` (`id`, `name`, `city`, `state`, `website`) VALUES (12, ' Centre for General Linguistics ', ' Las Vegas', 'Nevada', ' http://linguistlist.org/jobs/get-jobs.cfm?id=36199157');
INSERT INTO `employer` (`id`, `name`, `city`, `state`, `website`) VALUES (13, ' University of California; Irvine ', ' Irvine', 'California', ' http://linguistlist.org/jobs/get-jobs.cfm?id=36195997');
INSERT INTO `employer` (`id`, `name`, `city`, `state`, `website`) VALUES (14, ' New York University of Arts and Sciences ', ' New York', 'New York', ' http://linguistlist.org/jobs/get-jobs.cfm?id=36194917');
INSERT INTO `employer` (`id`, `name`, `city`, `state`, `website`) VALUES (15, ' MIT Lincoln Library ', ' Lexington', 'Massachusetts', ' https://career4.successfactors.com/career?company=C0012546317P&career_job_req_id=1061&career_ns=job_listing&navBarLevel=JOB_SEARCH&jobPipeline=Glassdoor');
INSERT INTO `employer` (`id`, `name`, `city`, `state`, `website`) VALUES (16, ' Stony Brook University ', ' Stony Brook', 'New York', ' http://linguistlist.org/issues/27/27-1662.html');

COMMIT;


-- -----------------------------------------------------
-- Data for table `job`
-- -----------------------------------------------------
START TRANSACTION;
USE `jobs`;
INSERT INTO `job` (`id`, `title`, `date_posted`, `deadline`, `employer_id`) VALUES (1, ' Language Engineer/Computational Linguist ', ' 2016-08-31 ', ' 2016-12-31 ', 1);
INSERT INTO `job` (`id`, `title`, `date_posted`, `deadline`, `employer_id`) VALUES (2, ' Language Engineer ', ' 2016-08-10', ' 2017-01-04', 2);
INSERT INTO `job` (`id`, `title`, `date_posted`, `deadline`, `employer_id`) VALUES (3, ' Sen. Software Engineer ', ' 2016-07-14', ' 2016-12-01', 3);
INSERT INTO `job` (`id`, `title`, `date_posted`, `deadline`, `employer_id`) VALUES (4, ' Machine Translation System Engineer ', ' 2016-07-01 ', ' 2016-12-31 ', 4);
INSERT INTO `job` (`id`, `title`, `date_posted`, `deadline`, `employer_id`) VALUES (5, ' Machine Learning Engineer ', ' 2016-07-22', ' 2016-12-01', 5);
INSERT INTO `job` (`id`, `title`, `date_posted`, `deadline`, `employer_id`) VALUES (6, ' Software Engineer/Core Algorithms ', ' 2016-07-07', ' 2016-12-31 ', 6);
INSERT INTO `job` (`id`, `title`, `date_posted`, `deadline`, `employer_id`) VALUES (7, ' Assoc Professor; Computational Linguistics ', ' 2016-08-31 ', ' 2016-12-01', 7);
INSERT INTO `job` (`id`, `title`, `date_posted`, `deadline`, `employer_id`) VALUES (8, ' Temporary Specialist ', ' 2016-07-08', ' 2016-12-31 ', 8);
INSERT INTO `job` (`id`, `title`, `date_posted`, `deadline`, `employer_id`) VALUES (9, ' Computational Linguist ', ' 2016-07-14', ' 2017-01-15', 9);
INSERT INTO `job` (`id`, `title`, `date_posted`, `deadline`, `employer_id`) VALUES (10, ' Computational Linguist/NLP Engineer ', ' 2016-07-22', ' 2017-01-04', 10);
INSERT INTO `job` (`id`, `title`, `date_posted`, `deadline`, `employer_id`) VALUES (11, ' Manager ', ' 2016-07-14', ' 2016-12-01', 11);
INSERT INTO `job` (`id`, `title`, `date_posted`, `deadline`, `employer_id`) VALUES (12, ' Post Doc ', ' 2016-07-08', ' 2016-12-31 ', 12);
INSERT INTO `job` (`id`, `title`, `date_posted`, `deadline`, `employer_id`) VALUES (13, ' Assoc Professor ', ' 2016-08-10', ' 2016-12-31 ', 13);
INSERT INTO `job` (`id`, `title`, `date_posted`, `deadline`, `employer_id`) VALUES (14, ' Assoc Professor ', ' 2016-07-07', ' 2016-12-01', 14);
INSERT INTO `job` (`id`, `title`, `date_posted`, `deadline`, `employer_id`) VALUES (15, ' Computational Linguistic/Machine Translation researcher ', ' 2016-08-31 ', ' 2017-01-04', 15);
INSERT INTO `job` (`id`, `title`, `date_posted`, `deadline`, `employer_id`) VALUES (16, ' Assoc/Full Professor ', ' 2016-07-22', ' 2016-12-01', 16);

COMMIT;


-- -----------------------------------------------------
-- Data for table `specialty`
-- -----------------------------------------------------
START TRANSACTION;
USE `jobs`;
INSERT INTO `specialty` (`id`, `specialty`) VALUES (1, ' NLP; Finnish; Arabic; Malay; Dutch; German ');
INSERT INTO `specialty` (`id`, `specialty`) VALUES (2, ' NLP; Foreign Language ');
INSERT INTO `specialty` (`id`, `specialty`) VALUES (3, ' Information Retrieval/Computational Linguistics ');
INSERT INTO `specialty` (`id`, `specialty`) VALUES (4, ' Machine Learning ');
INSERT INTO `specialty` (`id`, `specialty`) VALUES (5, ' Machine Learning ');
INSERT INTO `specialty` (`id`, `specialty`) VALUES (6, ' NLP ');
INSERT INTO `specialty` (`id`, `specialty`) VALUES (7, ' Aug-24-2016 ');
INSERT INTO `specialty` (`id`, `specialty`) VALUES (8, ' NLP/Computational Linguistics ');
INSERT INTO `specialty` (`id`, `specialty`) VALUES (9, ' NLP/Data Analysis ');
INSERT INTO `specialty` (`id`, `specialty`) VALUES (10, ' NLP ');
INSERT INTO `specialty` (`id`, `specialty`) VALUES (11, ' Computational Linguistics; English; Danish; Finnish; Norwegian ');
INSERT INTO `specialty` (`id`, `specialty`) VALUES (12, ' Computational Linguistics; Pragmatics ');
INSERT INTO `specialty` (`id`, `specialty`) VALUES (13, ' Computational Linguistics; Phonology ');
INSERT INTO `specialty` (`id`, `specialty`) VALUES (14, ' Computational Linguistics; Phonology ');
INSERT INTO `specialty` (`id`, `specialty`) VALUES (15, ' NLP ');
INSERT INTO `specialty` (`id`, `specialty`) VALUES (16, ' NLP ');

COMMIT;


-- -----------------------------------------------------
-- Data for table `job_specialty`
-- -----------------------------------------------------
START TRANSACTION;
USE `jobs`;
INSERT INTO `job_specialty` (`job_id`, `specialty_id`) VALUES (1, 1);
INSERT INTO `job_specialty` (`job_id`, `specialty_id`) VALUES (2, 2);
INSERT INTO `job_specialty` (`job_id`, `specialty_id`) VALUES (3, 4);
INSERT INTO `job_specialty` (`job_id`, `specialty_id`) VALUES (5, 5);
INSERT INTO `job_specialty` (`job_id`, `specialty_id`) VALUES (6, 6);
INSERT INTO `job_specialty` (`job_id`, `specialty_id`) VALUES (7, 7);
INSERT INTO `job_specialty` (`job_id`, `specialty_id`) VALUES (8, 8);
INSERT INTO `job_specialty` (`job_id`, `specialty_id`) VALUES (9, 9);
INSERT INTO `job_specialty` (`job_id`, `specialty_id`) VALUES (10, 10);
INSERT INTO `job_specialty` (`job_id`, `specialty_id`) VALUES (11, 11);
INSERT INTO `job_specialty` (`job_id`, `specialty_id`) VALUES (12, 12);
INSERT INTO `job_specialty` (`job_id`, `specialty_id`) VALUES (13, 13);
INSERT INTO `job_specialty` (`job_id`, `specialty_id`) VALUES (14, 14);
INSERT INTO `job_specialty` (`job_id`, `specialty_id`) VALUES (15, 15);
INSERT INTO `job_specialty` (`job_id`, `specialty_id`) VALUES (16, 16);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
