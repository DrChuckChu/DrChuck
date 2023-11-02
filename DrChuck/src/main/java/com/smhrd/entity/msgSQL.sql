select * from Memeber

select * from Board

CREATE TABLE tbl_book (
    num INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    author VARCHAR(30) NOT NULL,
    company VARCHAR(50) NOT NULL,
    isbn VARCHAR(30) NOT NULL,
    count INT NOT NULL
);

select * from tbl_book

insert into tbl_book (title, author, company, isbn, count) 
values
    ('해리포터와 아즈카반의 죄수', 'J.K 롤링', '문학수첩', '8983920726', 12),
    ('난중일기', '이순신', '서해문집', '8974832232', 8),
    ('수학 귀신', '한스 마그누스', '비룡소', '8949187310', 9),
    ('윌리를 찾아라!', '마틴 핸드포드', '예꿈', '8992882734', 20),
    ('오세암', '정채봉', '창비', '8936440195', 4);