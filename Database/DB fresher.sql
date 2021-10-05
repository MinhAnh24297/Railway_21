DROP DATABASE IF EXISTS fresher;
CREATE DATABASE fresher;
USE fresher;

-- Question 1: create table
DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee(
	TraineeID 			SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Full_Name 			NVARCHAR(150) NOT NULL,
    Birth_Date 			DATE NOT NULL,
    Gender 				ENUM('MALE', 'FEMALE', 'UNKNOWN'),
    ET_IQ 				TINYINT UNSIGNED CHECK(ET_IQ >= 0 AND ET_IQ <= 20),
	ET_Gmath 			TINYINT UNSIGNED CHECK(ET_Gmath >= 0 AND ET_Gmath <= 20),
	ET_English 			TINYINT UNSIGNED CHECK(ET_English >= 0 AND ET_English <= 50),
    Training_Class 		NVARCHAR(50) NOT NULL,
    Evaluation_Notes 	NVARCHAR(250) NOT NULL
);

-- Question 2: insert 10 records into table
INSERT INTO Trainee
			(Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes)
VALUES
			(N'Nguyễn Minh Anh', '1997-02-24', 'FEMALE', 5, 7, 30, N'VTI001', N'Đại học Khoa học Tự nhiên'),
            (N'Ngô Minh Sơn', '1985-04-25', 'MALE', 10, 14, 18, N'VTI002', N'Đại học Khoa học Tự nhiên'),
            (N'Lê Minh Trúc', '1992-09-30', 'FEMALE', 5, 20, 30, N'VTI003', N'Đại học Hà Nội'),
            (N'Lâm Việt Nam', '1993-07-13', 'MALE', 7, 17, 27, N'VTI002', N'Đại học Bách Khoa'),
            (N'Phùng Thu Oanh', '1996-05-30', 'FEMALE', 9, 19, 29, N'VTI001', N'Đại học FPT'),
            (N'Nguyễn Minh Anh', '1991-03-17', 'MALE', 5, 14, 30, N'VTI003', N'University of Liverpool'),
            (N'Trần Hoàng Giang', '1999-12-01', 'UNKNOWN', 18, 9, 37, N'VTI002', N'Đại học Y Hà Nội'),
            (N'Lê Mạnh Dũng', '1988-2-29', 'MALE', 15, 13, 28, N'VTI002', N'Đại học FPT'),
            (N'Bùi Đức Hiếu', '1998-08-04', 'MALE', 13, 17, 39, N'VTI001', N'Đại học Khoa học Tự nhiên'),
            (N'Nguyễn Việt Đức', '1997-09-11', 'MALE', 17, 14, 23, N'VTI003', N'Đại học Bách Khoa');