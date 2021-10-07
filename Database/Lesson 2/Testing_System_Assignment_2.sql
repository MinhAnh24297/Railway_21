/*========================= CREATE TABLE =========================*/

-- create database
DROP DATABASE IF EXISTS Testing_System_Assignment_2;
CREATE DATABASE Testing_System_Assignment_2;
USE Testing_System_Assignment_2;

-- Table 1: Department
DROP TABLE IF EXISTS Department; 
CREATE TABLE Department(
	DepartmentID 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName 				NVARCHAR(150) UNIQUE KEY NOT NULL
);

-- Table 2: Position
DROP TABLE IF EXISTS `Position`; 
CREATE TABLE `Position`(
	PositionID 					SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName 				ENUM ('Dev', 'Test', 'Scrum Master', 'PM')
);

-- Table 3: Account
DROP TABLE IF EXISTS `Account`; 
CREATE TABLE `Account`(
	AccountID 					INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email 						NVARCHAR(50) UNIQUE KEY NOT NULL,
    User_name 					NVARCHAR(50) UNIQUE KEY NOT NULL,
    Full_Name 					NVARCHAR(250) NOT NULL CHECK (LENGTH(Full_Name) >1),
    DepartmentID 				TINYINT UNSIGNED REFERENCES Department(DepartmentID),
    PositionID 					SMALLINT UNSIGNED REFERENCES `Position`(PositionID),
    CreateDate 					DATETIME DEFAULT NOW()
);

-- Table 4: Group
DROP TABLE IF EXISTS `Group`; 
CREATE TABLE `Group`(
	GroupID 					MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName 					NVARCHAR(150) UNIQUE KEY NOT NULL,
    Creator_Group_ID 			INT UNSIGNED REFERENCES `Account`(AccountID), 
    CreateDate 					DATETIME DEFAULT NOW()
);

-- Table 5: Group Account
DROP TABLE IF EXISTS GroupAccount; 
CREATE TABLE GroupAccount(
	GroupID 					MEDIUMINT UNSIGNED REFERENCES `Group`(GroupID),
    AccountID 					INT UNSIGNED REFERENCES `Account`(AccountID),
    JoinDate 					DATETIME DEFAULT NOW()
);

-- Table 6: Type Question
DROP TABLE IF EXISTS TypeQuestion; 
CREATE TABLE TypeQuestion(
	TypeID 						SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName 					ENUM ('Essay', 'Multiple-Choice')
);

-- Table 7: Category Question
DROP TABLE IF EXISTS CategoryQuestion; 
CREATE TABLE CategoryQuestion(
	CategoryID 					SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName 				NVARCHAR(150) UNIQUE KEY NOT NULL
);

-- Table 8: Question
DROP TABLE IF EXISTS Question; 
CREATE TABLE Question(
	QuestionID 					SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content 					NVARCHAR(250) UNIQUE KEY NOT NULL,
    CategoryID 					SMALLINT UNSIGNED REFERENCES CategoryQuestion(CategoryID),
    TypeID 						SMALLINT UNSIGNED REFERENCES TypeQuestion(TypeID),
    Creator_Question_ID 		INT UNSIGNED REFERENCES `Account`(AccountID),
    CreateDate 					DATETIME DEFAULT NOW()
);

-- Table 9: Answer
DROP TABLE IF EXISTS Answer; 
CREATE TABLE Answer(
	AnswerID 					MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content 					NVARCHAR(250),
    QuestionID 					SMALLINT UNSIGNED REFERENCES Question(QuestionID),
    isCorrect 					BIT
);

-- Table 10: Exam
DROP TABLE IF EXISTS Exam; 
CREATE TABLE Exam(
	ExamID 						SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code` 						NVARCHAR(50) UNIQUE KEY NOT NULL,
    Title 						NVARCHAR(250) UNIQUE KEY NOT NULL,
    CategoryID 					INT UNSIGNED REFERENCES `Account`(AccountID),
    Duration 					TINYINT UNSIGNED NOT NULL,
    Creator_Exam_ID 			INT UNSIGNED REFERENCES `Account`(AccountID),
    CreateDate 					DATETIME DEFAULT NOW()
);

-- Table 11: Exam Question
DROP TABLE IF EXISTS ExamQuestion; 
CREATE TABLE ExamQuestion(
	ExamID 						SMALLINT UNSIGNED REFERENCES Exam(ExamID),
    QuestionID 					SMALLINT UNSIGNED REFERENCES Question(QuestionID)
);

/*========================= INSERT DATA =========================*/
-- Insert data into table 1: Department
INSERT INTO Department
			(DepartmentName)
VALUES
			(N'Sale'),
            (N'Marketing'), 
            (N'HR'),
            (N'Kỹ thuật'),
            (N'Thư ký'),
            (N'Phó giám đốc');
            
-- Insert data into table 2: Position
INSERT INTO `Position`
			(PositionName)
VALUES
			('Dev'),
            ('Test'), 
            ('Scrum Master'),
            ('PM');


-- Insert data into table 3: Account 
INSERT INTO `Account`
			(Email, User_name, Full_Name, DepartmentID, PositionID, CreateDate) -- Nếu không có CreateDate ở đây thì auto là now()
VALUES
			('abc@gmail.com'		,		'm.a123'		,		N'Nguyễn Minh Anh'		,		1		,		4		,		'2019-09-15'),
            ('def@gmail.com'		,		'm.a456'		,		N'Nguyễn Mai Anh'		,		2		,		3		,		'2020-03-11'),
            ('ghi@gmail.com'		,		'p.a123'		,		N'Nguyễn Phương Anh'	,		3		,		2		,		DEFAULT),
            ('jkl@gmail.com'		,		't.a123'		,		N'Nguyễn Thảo Anh'		,		4		,		1		,		DEFAULT),
            ('lxt@gmail.com'		,		'lxt123'		,		N'Lương Xuân Trường'	,		5		,		1		,		DEFAULT),
            ('mna@gmail.com'		,		'nma123'		,		N'Nguyễn Minh Anh'		,		3		,		2		,		DEFAULT),
            ('vvt@gmail.com'		,		'vvt123'		,		N'Vũ Văn Thanh'			,		1		,		3		,		DEFAULT),
            ('nvt@gmail.com'		,		'nvt123'		,		N'Nguyễn Việt Thanh'	,		2		,		4		,		DEFAULT),
            ('mno@gmail.com'		,		'nan123'		,		N'Nguyễn Ánh Ngọc'		,		3		,		3		,		DEFAULT);
            
-- Insert data into table 4: Group
INSERT INTO `Group`
			(GroupName, Creator_Group_ID, CreateDate)
VALUES
			('Liverpool University'		,		1		,		'2019-10-15'),
            ('Brighton University'		,		3		,		'2020-03-17'),
            ('Latrobe University'		,		2		,		DEFAULT),
            ('VTI Education'			,		4		,		NULL),
            ('CMC Global'				,		5		,		DEFAULT);

-- Insert data into table 5: Group Account
INSERT INTO GroupAccount
			(GroupID, AccountID)
VALUES
			(1, 1),
            (2, 2),
            (3, 4),
            (5, 3),
            (4, 7);
            
-- Insert data into table 6: Type Question
INSERT INTO TypeQuestion
			(TypeName)
VALUES
			('Essay'), 
            ('Multiple-Choice');

-- Insert data into table 7: Category Question
INSERT INTO CategoryQuestion
			(CategoryName)
VALUES
			('Java'), 
            ('.NET'),
            ('SQL'),
            ('Python'),
            ('C#');

-- Insert data into table 8: Question
INSERT INTO Question
			(Content, CategoryID, TypeID, Creator_Question_ID)
VALUES
			(N'Câu_hỏi_Java?'		,		1		,		1		,		1), 
            (N'Câu_hỏi_.NET?'		,		2		,		2		,		3),
            (N'Câu_hỏi_SQL?'		,		3		,		1		,		5),
            (N'Câu_hỏi_Python?'		,		4		,		2		,		7),
            (N'Câu_hỏi_C#?'			,		5		,		2		,		9);

-- Insert data into table 9: Answer
INSERT INTO Answer
			(Content, QuestionID, isCorrect)
VALUES
			(N'Câu_trả_lời_Java'			,		1		,		1),
            (N'Câu_trả_lời_Java_sai'		,		1		,		0), 
            (N'Câu_trả_lời_.NET'			,		2		,		1), 
            (N'Câu_trả_lời_.NET_sai'		,		2		,		0),
            (N'Câu_trả_lời_SQL'				,		3		,		1), 
            (N'Câu_trả_lời_SQL_sai'			,		3		,		0), 
            (N'Câu_trả_lời_Python'			,		4		,		1), 
            (N'Câu_trả_lời_Python_sai'		,		4		,		0), 
            (N'Câu_trả_lời_C#'				,		5		,		1), 
            (N'Câu_trả_lời_C#_sai'			,		5		,		0);

-- Insert data into table 10: Exam
INSERT INTO Exam
			(`Code`, Title, CategoryID, Duration, Creator_Exam_ID)
VALUES
			('VTI123'		,		'mySQL Query'		,		1		,		60		,		6), 
            ('VTI456'		,		'demo Ruby'			,		2		,		90		,		8),
            ('VTI789'		,		'demo Python'		,		3		,		120		,		2),
            ('VTI242'		,		'demo Java'			,		4		,		45		,		1),
            ('VTI137'		,		'demo HTML'			,		5		,		15		,		5);

-- Insert data into table 11: Exam Question
INSERT INTO ExamQuestion
			(ExamID, QuestionID)
VALUES
			(1, 1), 
            (2, 4),
            (3, 5),
            (3, 2),
            (4, 4);

            
