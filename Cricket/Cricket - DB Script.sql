START TRANSACTION;
CREATE DATABASE IF NOT EXISTS `cricketn_nscricket`;
USE `cricketn_nscricket`;

CREATE TABLE `nsca_alerts` (
  `Alert_ID` int(11) NOT NULL,
  `Alert_Title` varchar(100) DEFAULT NULL,
  `Alert_Content` text DEFAULT NULL,
  `Alert_Status` varchar(10) DEFAULT NULL
);

CREATE TABLE `nsca_clubs` (
  `ClubID` int(11) NOT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `Website` varchar(128) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  `Email` varchar(128) DEFAULT NULL,
  `Phone` varchar(12) DEFAULT NULL,
  `Facebook` varchar(256) DEFAULT NULL,
  `TeamImage` varchar(64) DEFAULT NULL
);

INSERT INTO `nsca_clubs` (`ClubID`, `Name`, `Website`, `Description`, `Email`, `Phone`, `Facebook`, `TeamImage`) VALUES
(1, 'Halifax Cricket Club', NULL, NULL, 'halifaxcricketclub@gmail.com', '403-702-1916', 'https://www.facebook.com/halifaxcricketclub/', 'HalifaxCricketClub.jpg'),
(2, 'East Coast Cricket Club', 'https://eastcoastcricketclub.ca/', NULL, 'eastcoastcricketclub@gmail.com', '902-789-6335', 'https://www.facebook.com/cricketclubofeastcoast/', 'EastCoastCricketClub.jpg'),
(3, 'Nova Scotia Avengers Cricket Club', NULL, NULL, 'novascotiaavengers@gmail.com', '709-699-8717', 'https://www.facebook.com/Nova-Scotia-Avengers-Cricket-Club-2214442235461792/', 'NovaScotiaAvengersCricketClub.jpg'),
(4, 'Hfx-Titans Cricket Club', ' https://halifaxtitanscricketclub.com/', NULL, 'halifaxtitanscricketclub@gmail.com', '902-414-5502', 'https://www.facebook.com/hfxtitanscc/', 'HfxTitansCricketClub.jpg');

CREATE TABLE `nsca_competition` (
  `CompetitionID` int(11) NOT NULL,
  `CompetitionName` varchar(64) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  `CompTypeID` int(11) DEFAULT NULL,
  `YearRunning` int(11) DEFAULT NULL
);

INSERT INTO `nsca_competition` (`CompetitionID`, `CompetitionName`, `Description`, `CompTypeID`, `YearRunning`) VALUES
(1, 'HCL 2019', 'Halifax Cricket League 2019', 1, 2019),
(2, 'HCL 2020', 'Halifax Cricket League 2020', 1, 2020),
(3, 'HCL 2021', 'Halifax Cricket League 2021', 1, 2021),
(4, 'HCL 2022', 'Halifax Cricket League 2022', 1, 2022);

CREATE TABLE `nsca_competitiontype` (
  `CompTypeID` int(11) NOT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `nsca_competitiontype` (`CompTypeID`, `Name`, `Description`) VALUES
(1, 'Outdoor', 'Outdoor Cricket'),
(2, 'Indoor', 'Indoor tennis ball cricket'),
(3, 'Provincial', 'Provincial Competitions'),
(4, '40-Over', '40 over games');

CREATE TABLE `nsca_devprograms` (
  `DevID` int(11) NOT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `Duration` varchar(64) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  `Time` varchar(64) DEFAULT NULL,
  `Charges` varchar(64) DEFAULT NULL,
  `Type` varchar(64) DEFAULT NULL,
  `DaysRun` varchar(64) DEFAULT NULL
);

CREATE TABLE `nsca_devroleuser` (
  `DevRoleUserID` int(11) NOT NULL,
  `DevID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `IsLead` int(11) DEFAULT 0
);

CREATE TABLE `nsca_location` (
  `LocationID` int(11) NOT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `Address` varchar(64) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL
);

INSERT INTO `nsca_location` (`LocationID`, `Name`, `Address`, `Description`) VALUES
(1, 'Commons', 'Halifax City Commons', 'Halifax Commons');

CREATE TABLE `nsca_locationuser` (
  `LocUserID` int(11) NOT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
);

CREATE TABLE `nsca_login` (
  `LoginID` int(11) NOT NULL,
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
);

CREATE TABLE `nsca_news` (
  `NewsID` int(11) NOT NULL,
  `Title` varchar(128) DEFAULT NULL,
  `FirstName` varchar(64) DEFAULT NULL,
  `LastName` varchar(64) DEFAULT NULL,
  `Email` varchar(64) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Content` text DEFAULT NULL,
  `Pictures` text DEFAULT NULL,
  `Videos` text DEFAULT NULL
);

CREATE TABLE `nsca_roletype` (
  `RoleID` int(11) NOT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `Description` varchar(256) DEFAULT NULL
);

INSERT INTO `nsca_roletype` (`RoleID`, `Name`, `Description`) VALUES
(1, 'Admin', 'Admin'),
(2, 'Player', 'Player'),
(3, 'Guest', 'Guest'),
(4, 'Umpire', 'Umpire'),
(5, 'Coach', 'Coach');

CREATE TABLE `nsca_subcommittees` (
  `SubID` int(11) NOT NULL,
  `Name` varchar(64) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  `Years` varchar(32) DEFAULT NULL
);

CREATE TABLE `nsca_subuser` (
  `SubUserID` int(11) NOT NULL,
  `SubID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `IsLead` int(11) DEFAULT 0
);

CREATE TABLE `nsca_team` (
  `TeamID` int(11) NOT NULL,
  `TeamName` varchar(64) NOT NULL,
  `Description` varchar(64) NOT NULL,
  `TeamProfilePicture` varchar(128) NOT NULL
);

CREATE TABLE `nsca_teamjoinlist` (
  `JoinListID` int(11) NOT NULL,
  `UserID` int(64) NOT NULL,
  `TeamID` int(64) NOT NULL
);

CREATE TABLE `nsca_teams` (
  `TeamID` int(11) NOT NULL,
  `ClubID` int(11) DEFAULT NULL,
  `CompID` int(11) DEFAULT NULL
);

CREATE TABLE `nsca_teamuser` (
  `TeamUserID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `TeamID` int(11) DEFAULT NULL,
  `isClubManager` int(11) DEFAULT 0,
  `isTeamCaptain` int(11) DEFAULT 0,
  `isViceCaptain` int(11) DEFAULT 0,
  `waitingToJoin` int(11) DEFAULT 1
);

CREATE TABLE `nsca_user` (
  `UserID` int(11) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `UserRole` varchar(64) DEFAULT NULL,
  `FirstName` varchar(32) DEFAULT NULL,
  `MiddleName` varchar(64) DEFAULT NULL,
  `LastName` varchar(32) DEFAULT NULL,
  `StreetAddress` varchar(64) DEFAULT NULL,
  `City` varchar(64) DEFAULT NULL,
  `Province` varchar(64) DEFAULT NULL,
  `Country` varchar(64) DEFAULT NULL,
  `PostalCode` varchar(6) DEFAULT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `UserDate` varchar(64) DEFAULT NULL,
  `imgFolder` varchar(128) DEFAULT NULL,
  `UserDescription` varchar(512) DEFAULT NULL
);

CREATE TABLE `nsca_userroles` (
  `UserRoleID` int(11) NOT NULL,
  `RoleID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
);

ALTER TABLE `nsca_alerts`
  ADD PRIMARY KEY (`Alert_ID`);

ALTER TABLE `nsca_clubs`
  ADD PRIMARY KEY (`ClubID`);

ALTER TABLE `nsca_competition`
  ADD PRIMARY KEY (`CompetitionID`),
  ADD KEY `nsca_competition_nsca_competitiontype_CompTypeID_fk` (`CompTypeID`);

ALTER TABLE `nsca_competitiontype`
  ADD PRIMARY KEY (`CompTypeID`);

ALTER TABLE `nsca_devprograms`
  ADD PRIMARY KEY (`DevID`);

ALTER TABLE `nsca_devroleuser`
  ADD PRIMARY KEY (`DevRoleUserID`),
  ADD KEY `DevRoleUser_nsca_devprograms_DevID_fk` (`DevID`),
  ADD KEY `nsca_devroleuser_nsca_userroles_UserID_fk` (`UserID`);

ALTER TABLE `nsca_location`
  ADD PRIMARY KEY (`LocationID`);

ALTER TABLE `nsca_locationuser`
  ADD PRIMARY KEY (`LocUserID`),
  ADD KEY `nsca_LocationUser_nsca_location_LocationID_fk` (`LocationID`),
  ADD KEY `nsca_LocationUser_nsca_user_UserID_fk` (`UserID`);

ALTER TABLE `nsca_login`
  ADD PRIMARY KEY (`LoginID`),
  ADD KEY `nsca_login_nsca_user_UserID_fk` (`UserID`);

ALTER TABLE `nsca_news`
  ADD PRIMARY KEY (`NewsID`);

ALTER TABLE `nsca_roletype`
  ADD PRIMARY KEY (`RoleID`);

ALTER TABLE `nsca_subcommittees`
  ADD PRIMARY KEY (`SubID`);

ALTER TABLE `nsca_subuser`
  ADD PRIMARY KEY (`SubUserID`),
  ADD KEY `nsca_subuser_nsca_subcommittees_SubID_fk` (`SubID`),
  ADD KEY `nsca_subuser_nsca_user_UserID_fk` (`UserID`);

ALTER TABLE `nsca_team`
  ADD PRIMARY KEY (`TeamID`);

ALTER TABLE `nsca_teamjoinlist`
  ADD PRIMARY KEY (`JoinListID`);

ALTER TABLE `nsca_teams`
  ADD PRIMARY KEY (`TeamID`),
  ADD KEY `ncsa_teams_nsca_clubs_ClubID_fk` (`ClubID`),
  ADD KEY `ncsa_teams_nsca_competition_CompetitionID_fk` (`CompID`);

ALTER TABLE `nsca_teamuser`
  ADD PRIMARY KEY (`TeamUserID`),
  ADD KEY `nsca_teamUser_ncsa_teams_TeamID_fk` (`TeamID`),
  ADD KEY `nsca_teamUser_nsca_user_UserID_fk` (`UserID`);

ALTER TABLE `nsca_user`
  ADD PRIMARY KEY (`UserID`);

ALTER TABLE `nsca_userroles`
  ADD PRIMARY KEY (`UserRoleID`),
  ADD KEY `nsca_userroles_nsca_roletype_RoleID_fk` (`RoleID`),
  ADD KEY `nsca_userroles_nsca_user_UserID_fk` (`UserID`);


ALTER TABLE `nsca_alerts`
  MODIFY `Alert_ID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `nsca_clubs`
  MODIFY `ClubID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `nsca_competition`
  MODIFY `CompetitionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `nsca_competitiontype`
  MODIFY `CompTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `nsca_devprograms`
  MODIFY `DevID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `nsca_devroleuser`
  MODIFY `DevRoleUserID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `nsca_location`
  MODIFY `LocationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `nsca_locationuser`
  MODIFY `LocUserID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `nsca_login`
  MODIFY `LoginID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

ALTER TABLE `nsca_news`
  MODIFY `NewsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

ALTER TABLE `nsca_roletype`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `nsca_subcommittees`
  MODIFY `SubID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `nsca_subuser`
  MODIFY `SubUserID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `nsca_team`
  MODIFY `TeamID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `nsca_teamjoinlist`
  MODIFY `JoinListID` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `nsca_teams`
  MODIFY `TeamID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `nsca_teamuser`
  MODIFY `TeamUserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `nsca_user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `nsca_userroles`
  MODIFY `UserRoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;


ALTER TABLE `nsca_competition`
  ADD CONSTRAINT `nsca_competition_nsca_competitiontype_CompTypeID_fk` FOREIGN KEY (`CompTypeID`) REFERENCES `nsca_competitiontype` (`CompTypeID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `nsca_devroleuser`
  ADD CONSTRAINT `DevRoleUser_nsca_devprograms_DevID_fk` FOREIGN KEY (`DevID`) REFERENCES `nsca_devprograms` (`DevID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nsca_devroleuser_nsca_userroles_UserID_fk` FOREIGN KEY (`UserID`) REFERENCES `nsca_userroles` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `nsca_locationuser`
  ADD CONSTRAINT `nsca_LocationUser_nsca_location_LocationID_fk` FOREIGN KEY (`LocationID`) REFERENCES `nsca_location` (`LocationID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nsca_LocationUser_nsca_user_UserID_fk` FOREIGN KEY (`UserID`) REFERENCES `nsca_user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `nsca_login`
  ADD CONSTRAINT `nsca_login_nsca_user_UserID_fk` FOREIGN KEY (`UserID`) REFERENCES `nsca_user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `nsca_subuser`
  ADD CONSTRAINT `nsca_subuser_nsca_subcommittees_SubID_fk` FOREIGN KEY (`SubID`) REFERENCES `nsca_subcommittees` (`SubID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nsca_subuser_nsca_user_UserID_fk` FOREIGN KEY (`UserID`) REFERENCES `nsca_user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `nsca_teams`
  ADD CONSTRAINT `ncsa_teams_nsca_clubs_ClubID_fk` FOREIGN KEY (`ClubID`) REFERENCES `nsca_clubs` (`ClubID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ncsa_teams_nsca_competition_CompetitionID_fk` FOREIGN KEY (`CompID`) REFERENCES `nsca_competition` (`CompetitionID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `nsca_teamuser`
  ADD CONSTRAINT `nsca_teamUser_ncsa_teams_TeamID_fk` FOREIGN KEY (`TeamID`) REFERENCES `nsca_teams` (`TeamID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nsca_teamUser_nsca_user_UserID_fk` FOREIGN KEY (`UserID`) REFERENCES `nsca_user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `nsca_userroles`
  ADD CONSTRAINT `nsca_userroles_nsca_roletype_RoleID_fk` FOREIGN KEY (`RoleID`) REFERENCES `nsca_roletype` (`RoleID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nsca_userroles_nsca_user_UserID_fk` FOREIGN KEY (`UserID`) REFERENCES `nsca_user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
