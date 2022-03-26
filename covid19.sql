-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2022 at 04:12 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `covid19`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`classRoomUser`@`localhost` PROCEDURE `calculate_live_cases` (IN `CityCode` VARCHAR(5))  BEGIN
DECLARE cases TYPE OF city_cases.num_of_cases;
DECLARE deaths TYPE OF city_cases.num_of_death;
DECLARE recovered TYPE OF city_cases.num_of_cases;

SELECT num_of_cases INTO cases 
FROM city_cases C WHERE C.CityCode=CityCode;
SELECT num_of_death INTO deaths 
FROM city_cases C WHERE C.CityCode=CityCode;
SELECT COUNT(*) INTO recovered 
FROM treatment T WHERE T.CityCode=CityCode AND T.recovered=1;

UPDATE city_cases C SET C.live_cases=cases-deaths-recovered where C.CityCode=CityCode;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `city_cases`
--

CREATE TABLE `city_cases` (
  `CityCode` varchar(5) NOT NULL,
  `num_of_cases` int(20) NOT NULL,
  `live_cases` int(20) NOT NULL,
  `num_of_death` int(20) NOT NULL,
  `vaccinated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city_cases`
--

INSERT INTO `city_cases` (`CityCode`, `num_of_cases`, `live_cases`, `num_of_death`, `vaccinated`) VALUES
('city1', 1, 1, 0, 0),
('city2', 1, 0, 0, 0),
('city3', 0, 0, 1, 0),
('city4', 0, 0, 1, -1),
('city5', 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `death_logs`
--

CREATE TABLE `death_logs` (
  `Pid` int(11) NOT NULL,
  `CityCode` varchar(5) NOT NULL,
  `Date_of_Decease` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `death_logs`
--

INSERT INTO `death_logs` (`Pid`, `CityCode`, `Date_of_Decease`) VALUES
(56, 'city5', '2021-09-09'),
(99, 'city3', '2021-09-09'),
(100, 'city4', '2022-10-09');

--
-- Triggers `death_logs`
--
DELIMITER $$
CREATE TRIGGER `Death_cases` AFTER INSERT ON `death_logs` FOR EACH ROW UPDATE city_cases SET num_of_death= num_of_death +1,num_of_cases= num_of_cases -1, live_cases= live_cases -1,vaccinated= vaccinated -1 WHERE CityCode=NEW.CityCode
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `Pid` int(11) NOT NULL,
  `CityCode` varchar(5) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Age` int(11) NOT NULL,
  `PSWD` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`Pid`, `CityCode`, `Name`, `Age`, `PSWD`) VALUES
(11, 'city2', 'Agastya', 30, 'aga'),
(20, 'city2', 'Mohan', 45, 'moh'),
(21, 'city3', 'Happy', 33, 'hap'),
(30, 'city1', 'Sneha', 21, 'sk'),
(45, 'city4', 'Aman Kapoor', 56, 'kil'),
(56, 'city5', 'test1', 88, 'hap'),
(77, 'city3', 'sad', 66, 'sad'),
(99, 'city3', 'Fancy', 27, 'Shsa'),
(100, 'city4', 'hep', 55, 'hep'),
(777356, 'city3', 'mickey mouse', 22, 'mypassword');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `Pid` int(11) NOT NULL,
  `TreatmentType` varchar(20) NOT NULL,
  `Recovered` tinyint(1) NOT NULL,
  `CityCode` varchar(5) NOT NULL,
  `Infected` tinyint(1) NOT NULL,
  `Post_effects` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `treatment`
--

INSERT INTO `treatment` (`Pid`, `TreatmentType`, `Recovered`, `CityCode`, `Infected`, `Post_effects`) VALUES
(20, 'HOSPITAL', 1, 'city2', 1, 'none'),
(30, 'HOME', 0, 'city1', 1, 'FEVER'),
(56, 'HOME', 0, 'city5', 1, 'none'),
(99, 'HOME', 0, 'city3', 1, 'FEVER'),
(100, 'HOME', 0, 'city4', 1, 'none');

--
-- Triggers `treatment`
--
DELIMITER $$
CREATE TRIGGER `Update_cases_on_insert` AFTER INSERT ON `treatment` FOR EACH ROW IF (New.Infected=1)
THEN UPDATE city_cases SET num_of_cases=num_of_cases+1 WHERE CityCode=NEW.CityCode;
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update_cases_on_update` AFTER UPDATE ON `treatment` FOR EACH ROW IF (OLD.Infected=0 AND New.Infected=1)
THEN UPDATE city_cases SET num_of_cases=num_of_cases+1 WHERE CityCode=NEW.CityCode;
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `live_case_2` AFTER INSERT ON `treatment` FOR EACH ROW BEGIN
DECLARE cc TYPE OF city_cases.CityCode;
SELECT CityCode INTO cc FROM treatment WHERE NEW.CityCode=CityCode;
CALL calculate_live_cases(cc);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `live_case_3` AFTER UPDATE ON `treatment` FOR EACH ROW BEGIN
DECLARE cc TYPE OF city_cases.CityCode;
SELECT CityCode INTO cc FROM treatment WHERE NEW.CityCode=CityCode;
CALL calculate_live_cases(cc);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `vaccination`
--

CREATE TABLE `vaccination` (
  `Pid` int(11) NOT NULL,
  `Dose1` tinyint(1) NOT NULL,
  `Dose2` tinyint(1) NOT NULL,
  `Dose1_Date` date NOT NULL,
  `Dose2_Date` date NOT NULL,
  `CityCode` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vaccination`
--

INSERT INTO `vaccination` (`Pid`, `Dose1`, `Dose2`, `Dose1_Date`, `Dose2_Date`, `CityCode`) VALUES
(56, 1, 1, '2000-10-09', '2021-08-05', 'city5'),
(99, 1, 1, '2021-05-09', '2021-08-05', 'city3');

--
-- Triggers `vaccination`
--
DELIMITER $$
CREATE TRIGGER `Update_vac_insert` AFTER INSERT ON `vaccination` FOR EACH ROW IF (NEW.Dose1_Date IS NOT NULL AND NEW.Dose2_Date IS NOT NULL)
THEN UPDATE city_cases SET vaccinated=vaccinated+1 WHERE CityCode=NEW.CityCode;
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Update_vac_update` AFTER UPDATE ON `vaccination` FOR EACH ROW IF (NEW.Dose1_Date IS NOT NULL AND NEW.Dose2_Date IS NOT NULL)
THEN UPDATE city_cases SET vaccinated=vaccinated+1 where CityCode=NEW.CityCode;
END IF
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city_cases`
--
ALTER TABLE `city_cases`
  ADD PRIMARY KEY (`CityCode`);

--
-- Indexes for table `death_logs`
--
ALTER TABLE `death_logs`
  ADD PRIMARY KEY (`Pid`),
  ADD KEY `Pid` (`Pid`),
  ADD KEY `CityCode` (`CityCode`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`Pid`),
  ADD KEY `patient_ibfk_1` (`CityCode`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`Pid`),
  ADD UNIQUE KEY `Pid` (`Pid`,`CityCode`),
  ADD KEY `treatment_ibfk_2` (`CityCode`);

--
-- Indexes for table `vaccination`
--
ALTER TABLE `vaccination`
  ADD PRIMARY KEY (`Pid`),
  ADD UNIQUE KEY `pid` (`Pid`,`CityCode`),
  ADD KEY `vaccination_ibfk_2` (`CityCode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `death_logs`
--
ALTER TABLE `death_logs`
  ADD CONSTRAINT `death_logs_ibfk_1` FOREIGN KEY (`Pid`) REFERENCES `patient` (`Pid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `death_logs_ibfk_2` FOREIGN KEY (`CityCode`) REFERENCES `city_cases` (`CityCode`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`CityCode`) REFERENCES `city_cases` (`CityCode`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`CityCode`) REFERENCES `city_cases` (`CityCode`);

--
-- Constraints for table `treatment`
--
ALTER TABLE `treatment`
  ADD CONSTRAINT `treatment_ibfk_1` FOREIGN KEY (`Pid`) REFERENCES `patient` (`Pid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `treatment_ibfk_2` FOREIGN KEY (`CityCode`) REFERENCES `city_cases` (`CityCode`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `vaccination`
--
ALTER TABLE `vaccination`
  ADD CONSTRAINT `vaccination_ibfk_2` FOREIGN KEY (`CityCode`) REFERENCES `city_cases` (`CityCode`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
