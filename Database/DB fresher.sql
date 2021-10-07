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
			(N'Nguyễn Minh Anh'		,	'1997-02-24'	,	'FEMALE'	, 5		, 7		, 30	, N'VTI002', N'Đại học Khoa học Tự nhiên'),
            (N'Ngô Minh Sơn'		,	'1985-04-25'	,	'MALE'		, 10	, 14	, 18	, N'VTI002', N'Đại học Khoa học Tự nhiên'),
            (N'Lê Minh Trúc'		,	'1992-09-30'	,	'FEMALE'	, 5		, 20	, 30	, N'VTI003', N'Đại học Hà Nội'),
            (N'Lâm Việt Nam'		,	'1993-07-13'	,	'MALE'		, 7		, 17	, 27	, N'VTI002', N'Đại học Bách Khoa'),
            (N'Phùng Thu Oanh'		,	'1996-05-30'	,	'FEMALE'	, 9		, 19	, 29	, N'VTI001', N'Đại học FPT'),
            (N'Nguyễn Minh Anh'		,	'1991-03-17'	,	'MALE'		, 5		, 14	, 30	, N'VTI002', N'University of Liverpool'),
            (N'Trần Hoàng Giang'	,	'1999-12-01'	,	'UNKNOWN'	, 18	, 9		, 37	, N'VTI003', N'Đại học Y Hà Nội'),
            (N'Lê Mạnh Dũng'		,	'1988-2-29'		,	'MALE'		, 15	, 13	, 28	, N'VTI002', N'Đại học FPT'),
            (N'Bùi Đức Hiếu'		,	'1998-08-04'	,	'MALE'		, 13	, 17	, 39	, N'VTI001', N'Đại học Khoa học Tự nhiên'),
            (N'Nguyễn Việt Đức'		,	'1997-09-11'	,	'MALE'		, 17	, 14	, 23	, N'VTI003', N'Đại học Bách Khoa');

-- Q4: Viết lệnh để lấy ra các thực tập sinh đã vượt qua bài test đầu vào, sắp xếp theo ngày sinh
SELECT *
FROM Trainee
WHERE ET_IQ >= 12 AND ET_Gmath >= 12 AND ET_English >= 20
ORDER BY Birth_Date ASC;

-- Q5: Viết lệnh để lấy ra thông tin thực tập sinh có tên bắt đầu bằng chữ N và kết thúc bằng chữ C
SELECT *
FROM Trainee
WHERE Full_Name LIKE 'N%C';

-- Q6: Lấy ra thông tin thực tập sinh mà tên có ký tự thứ 2 là chữ G
SELECT *
FROM Trainee
WHERE Full_Name LIKE '_g%';

-- Q7: Lấy ra thông tin thực tập sinh mà tên có 10 ký tự và ký tự cuối cùng là C
SELECT *
FROM Trainee
WHERE Full_Name LIKE '%C' AND LENGTH(Full_Name) = 10;

-- Q8: Lấy ra Fullname của các thực tập sinh trong lớp học, bỏ các tên trùng nhau
SELECT DISTINCT Full_Name
FROM Trainee;

-- Q9: Lấy ra Fullname của các thực tập sinh, sắp xếp theo thứ tự từ A-Z
SELECT Full_Name
FROM Trainee
ORDER BY Full_Name ASC;

-- Q10: Lấy ra thông tin thực tập sinh có tên dài nhất
SELECT *
FROM Trainee
WHERE LENGTH(Full_Name) = (SELECT MAX(LENGTH(Full_Name)) FROM Trainee);

-- Q11: Lấy ra ID, Fullname và Ngày sinh thực tập sinh có tên dài nhất
SELECT TraineeID, Full_name, Birth_Date AS 'Ngày sinh'
FROM Trainee
WHERE LENGTH(Full_Name) = (SELECT MAX(LENGTH(Full_Name)) FROM Trainee);

-- Q12: Lấy ra Tên, điểm IQ, Gmath, English của thực tập sinh có tên dài nhất
SELECT Full_Name, ET_IQ, ET_Gmath, ET_English
FROM Trainee
WHERE LENGTH(Full_Name) = (SELECT MAX(LENGTH(Full_Name)) FROM Trainee);

-- Q13: Lấy ra 5 thực tập sinh có tuổi nhỏ nhất
SELECT *
FROM Trainee
ORDER BY Birth_Date DESC LIMIT 5;

-- Q14: Lấy ra tất cả các thực tập sinh là ET
SELECT *
FROM Trainee
WHERE	ET_IQ >= 8 AND ET_Gmath >= 8 AND
		ET_English >= 18 AND (ET_IQ + ET_Gmath) >= 20;
        
-- Q15: Xóa thực tập sinh có TraineeID = 5
SET SQL_SAFE_UPDATES = 0;
DELETE
FROM Trainee
WHERE TraineeID = 5;
SET SQL_SAFE_UPDATES = 1;

-- Q16: Xóa thực tập sinh có tổng điểm ET_IQ, ET_Gmath <= 15
SET SQL_SAFE_UPDATES = 0;
DELETE
FROM Trainee
WHERE (ET_IQ + ET_Gmath) <= 15;
SET SQL_SAFE_UPDATES = 1;

-- Q17: Xóa thực tập sinh quá 30 tuổi
SET SQL_SAFE_UPDATES = 0;
DELETE
FROM Trainee
WHERE (year(NOW()) - year(Birth_Date)) > 30;
SET SQL_SAFE_UPDATES = 1;

-- Q18: Thực tập sinh có TraineeID = 3 được chuyển sang lớp "VTI003". Hãy cập nhật thông tin vào database
SET SQL_SAFE_UPDATES = 0;
UPDATE Trainee
SET Training_Class = 'VTI003'
WHERE TraineeID = 3;
SET SQL_SAFE_UPDATES = 1;

-- Q19: Cập nhật thông tin học sinh số 10
SET SQL_SAFE_UPDATES = 0;
UPDATE Trainee
SET 	Full_Name = 'LeVanA',
		ET_IQ = 10,
		ET_Gmath = 15,
        ET_English = 30
WHERE 	TraineeID = 10;
SET SQL_SAFE_UPDATES = 1;

-- Q20-21: Đếm xem trong lớp VTI001 có bao nhiêu thực tập sinh
SELECT 	COUNT(*)
FROM 	Trainee
WHERE 	Training_Class = 'VTI001';

-- Q22: Đếm tổng số thực tập sinh trong lớp VTI001 và VTI003 có bao nhiêu thực tập sinh
SELECT 		COUNT(Training_Class)
FROM 		Trainee
WHERE 		Training_Class = 'VTI001' OR Training_Class = 'VTI003';

-- Q23: Lấy ra số lượng các thực tập sinh theo giới tính: Male, Female, Unknown
SELECT 		Gender, COUNT(*)
FROM 		Trainee
GROUP BY 	Gender;

-- Q24-25: Lấy ra lớp có lớn hơn 5 thực tập viên
SELECT 		Training_Class, COUNT(Training_Class)
FROM 		Trainee
GROUP BY 	Training_Class
HAVING 		COUNT(Training_Class) > 5;

-- Q26: Lấy ra trường có ít hơn 4 thực tập viên tham gia khóa học
SELECT 		Evaluation_Notes, COUNT(Evaluation_Notes)
FROM 		Trainee
GROUP BY 	Evaluation_Notes
HAVING 		COUNT(Evaluation_Notes) <4;

-- Q27: 
SELECT TraineeID, Full_Name, Training_Class
FROM Trainee
WHERE Training_Class = 'VTI001'

UNION 

SELECT TraineeID, Full_Name, Training_Class
FROM Trainee
WHERE Training_Class = 'VTI002';
