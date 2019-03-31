DROP DATABASE IF EXISTS `everydayfactsDB`;
CREATE DATABASE IF NOT EXISTS `everydayfactsDB`;

#
# Table structure for table `Users`
#

CREATE TABLE `Users`(
    `UserID` INTEGER NOT NULL AUTO_INCREMENT,
    `UserName` VARCHAR(50) UNIQUE,
    `Password` VARCHAR(50),
    INDEX (`UserID`),
    PRIMARY KEY(`UserID`)
) ENGINE = innodb DEFAULT CHARSET=utf8;

SET autocommit = 1;

#
# Dumping data for table `Users`


CREATE TABLE `Post`(
    `PostID` INTEGER NOT NULL AUTO_INCREMENT,
    `UserID` INTEGER,
    `Title` VARCHAR(100),
    `PostDate` DATETIME,
    `CategoryID`INTEGER,
    INDEX (`PostID, UserID`),
    PRIMARY KEY(`PostID`),
    FOREIGN KEY (`UserID`) REFERENCES Users(`UserID`),
    FOREIGN KEY (`CategoryID`) REFERENCES Category(`CategoryID`)
) ENGINE = innodb DEFAULT CHARSET=utf8;

CREATE TABLE `Post`(
    `PostID` INTEGER NOT NULL AUTO_INCREMENT,
    `UserID` INTEGER,
    `Title` VARCHAR(100),
    `PostDate` DATETIME,
    `CategoryID`INTEGER,
    INDEX (`PostID, UserID`),
    PRIMARY KEY(`PostID`),
    `UserID` INTEGER FOREIGN KEY REFERENCES Users(`UserID`),
    FOREIGN KEY (`CategoryID`) REFERENCES Category(`CategoryID`)
) ENGINE = innodb DEFAULT CHARSET=utf8;

SET autocommit = 1;

CREATE TABLE `Rank`(
    `RankID` INTEGER NOT NULL AUTO_INCREMENT,
    `UserID` INTEGER,
    `PostID` INTEGER,
    `Number` INTEGER,
    PRIMARY KEY(`RankID`),
    FOREIGN KEY (`UserID`) REFERENCES Users(`UserID`),
    FOREIGN KEY (`PostID`) REFERENCES Post(`PostID`)
) ENGINE = innodb DEFAULT CHARSET=utf8;

SET autocommit = 1;

CREATE TABLE `Category`(
    `CategoryID` INTEGER NOT NULL AUTO_INCREMENT,
    `Type` VARCHAR(50),
    PRIMARY KEY(`CategoryID`)
) ENGINE = innodb DEFAULT CHARSET=utf8;

SET autocommit = 1;

CREATE TABLE `Comments`(
    `CommentID` INTEGER NOT NULL AUTO_INCREMENT,
    `PostID` INTEGER,
    `UserID` INTEGER,
    `Comment` LONGTEXT,
    `CommentDate` DATETIME,
    PRIMARY KEY(`CommentID`),
    FOREIGN KEY (`UserID`) REFERENCES Users(`UserID`),
    FOREIGN KEY (`PostID`) REFERENCES Post(`PostID`)
) ENGINE = innodb DEFAULT CHARSET=utf8;

SET autocommit = 1;

