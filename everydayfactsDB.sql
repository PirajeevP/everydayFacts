DROP DATABASE IF EXISTS `everydayfactsDB`;
CREATE DATABASE IF NOT EXISTS `everydayfactsDB`;

#
# Table structure for table `Users`
#

CREATE TABLE `Users`(
    `UserID` INTEGER NOT NULL AUTO_INCREMENT,
    `UserName` VARCHAR(50) UNIQUE,
    `Password` VARCHAR(50),
    `UserDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
     INDEX (`UserID`),
    PRIMARY KEY(`UserID`)
) ENGINE = innodb DEFAULT CHARSET=utf8;

SET autocommit = 1;

#
# Dumping data for table `Users`
#

INSERT INTO `Users`(`UserName`,`Password`) VALUES ('guest1','1234');
INSERT INTO `Users`(`UserName`,`Password`) VALUES ('guest2','1234');
INSERT INTO `Users`(`UserName`,`Password`) VALUES ('guest3','1234');
INSERT INTO `Users`(`UserName`,`Password`) VALUES ('guest4','1234');



CREATE TABLE `Category`(
    `CategoryID` INTEGER NOT NULL AUTO_INCREMENT,
    `Type` VARCHAR(50),
    PRIMARY KEY(`CategoryID`)
) ENGINE = innodb DEFAULT CHARSET=utf8;

#
# Dumping data for table 'Category'
#

INSERT INTO `Category`(`Type`) VALUES ('Science');
INSERT INTO `Category`(`Type`) VALUES ('Literature');
INSERT INTO `Category`(`Type`) VALUES ('Art');



CREATE TABLE `Post`(
    `PostID` INTEGER NOT NULL AUTO_INCREMENT,
    `UserID` INTEGER,
    `Title` VARCHAR(100),
    `PostDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `CategoryID`INTEGER,
    PRIMARY KEY(`PostID`),
    FOREIGN KEY (`UserID`) REFERENCES Users(`UserID`),
    FOREIGN KEY (`CategoryID`) REFERENCES Category(`CategoryID`)
) ENGINE = innodb DEFAULT CHARSET=utf8;
SET autocommit = 1;

#
# Dumping data for table 'Post'
#

INSERT INTO `Post`(`UserID`,`Title`,`CategoryID`) VALUES (1,"TIL I LEARNED NOTHING",1);
INSERT INTO `Post`(`UserID`,`Title`,`CategoryID`) VALUES (3,"TIL I AM OKAY",2);
INSERT INTO `Post`(`UserID`,`Title`,`CategoryID`) VALUES (1,"TIL I AM FINE",1);
INSERT INTO `Post`(`UserID`,`Title`,`CategoryID`) VALUES (3,"TIL I BREATHE",3);
INSERT INTO `Post`(`UserID`,`Title`,`CategoryID`) VALUES (5,"TIL I AWESOME",2);
INSERT INTO `Post`(`UserID`,`Title`,`CategoryID`) VALUES (1,"TIL I MEOW",1);


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

INSERT INTO `Rank`(`UserID`,`PostID`,`Number`) VALUES (1,1,1);
INSERT INTO `Rank`(`UserID`,`PostID`,`Number`) VALUES (3,2,1);
INSERT INTO `Rank`(`UserID`,`PostID`,`Number`) VALUES (3,2,1);
INSERT INTO `Rank`(`UserID`,`PostID`,`Number`) VALUES (4,1,1);
INSERT INTO `Rank`(`UserID`,`PostID`,`Number`) VALUES (3,2,1);
INSERT INTO `Rank`(`UserID`,`PostID`,`Number`) VALUES (3,4,1);
INSERT INTO `Rank`(`UserID`,`PostID`,`Number`) VALUES (3,5,1);
INSERT INTO `Rank`(`UserID`,`PostID`,`Number`) VALUES (4,1,1);

CREATE TABLE `Comments`(
    `CommentID` INTEGER NOT NULL AUTO_INCREMENT,
    `PostID` INTEGER,
    `UserID` INTEGER,
    `Comment` LONGTEXT,
    `CommentDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`CommentID`),
    FOREIGN KEY (`UserID`) REFERENCES Users(`UserID`),
    FOREIGN KEY (`PostID`) REFERENCES Post(`PostID`)
) ENGINE = innodb DEFAULT CHARSET=utf8;

SET autocommit = 1;

