-- create database
DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

-- Table 1: Department
DROP TABLE IF EXISTS Department; 
CREATE TABLE Department(
	DepartmentID 			INT,
    DepartmentName 			VARCHAR(150)
);

-- Table 2: Position
DROP TABLE IF EXISTS `Position`; 
CREATE TABLE `Position`(
	PositionID 				INT,
    PositionName 			VARCHAR(150)
);

-- Table 3: Account
DROP TABLE IF EXISTS `Account`; 
CREATE TABLE `Account`(
	AccountID 				INT,
    Email 					VARCHAR(50),
    Username 				VARCHAR(50),
    FullName 				VARCHAR(250),
    DepartmentID 			INT,
    PositionID 				INT,
    CreateDate 				DATE
);

-- Table 4: Group
DROP TABLE IF EXISTS `Group`; 
CREATE TABLE `Group`(
	GroupID 				INT,
    GroupName 				VARCHAR(150),
    CreatorID 				INT,
    CreateDate 				DATE
);

-- Table 5: Group Account
DROP TABLE IF EXISTS GroupAccount; 
CREATE TABLE GroupAccount(
	GroupID 				INT,
    AccountID 				INT,
    JoinDate 				DATE
);

-- Table 6: Type Question
DROP TABLE IF EXISTS TypeQuestion; 
CREATE TABLE TypeQuestion(
	TypeID 					INT,
    TypeName 				VARCHAR(150)
);

-- Table 7: Category Question
DROP TABLE IF EXISTS CategoryQuestion; 
CREATE TABLE CategoryQuestion(
	CategoryID 				INT,
    CategoryName 			VARCHAR(150)
);

-- Table 8: Question
DROP TABLE IF EXISTS Question; 
CREATE TABLE Question(
	QuestionID 				INT,
    Content 				VARCHAR(250),
    CategoryID 				INT,
    TypeID 					INT,
    CreatorID 				INT,
    CreateDate 				DATE
);

-- Table 9: Answer
DROP TABLE IF EXISTS Answer; 
CREATE TABLE Answer(
	AnswerID 				INT,
    Content 				VARCHAR(250),
    QuestionID 				INT,
    isCorrect 				VARCHAR(50)
);

-- Table 10: Exam
DROP TABLE IF EXISTS Exam; 
CREATE TABLE Exam(
	ExamID 					INT,
    `Code` 					VARCHAR(50),
    Title 					VARCHAR(250),
    CategoryID 				INT,
    Duration 				INT,
    CreatorID 				INT,
    CreateDate 				DATE
);

-- Table 11: Exam Question
DROP TABLE IF EXISTS ExamQuestion; 
CREATE TABLE ExamQuestion(
	ExamID 					INT,
    QuestionID 				INT
);