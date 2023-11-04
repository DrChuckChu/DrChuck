select * from board;

select * from dr_member;



select * from table;
show tables;
drop table files;

select * from images;
select * from DR_MEMBER;
select * from DR_LIVE_RESULT;
select * from DR_S_POSE;

ALTER TABLE images CONVERT TO CHARSET utf8;

CREATE TABLE DR_MEMBER(
    Dm_Id VARCHAR(30),
    Dm_Pw VARCHAR(30),
    Dm_Name VARCHAR(10),
    Dm_Key VARCHAR(5),  
    Dm_Muge VARCHAR(5),
    Dm_Sex VARCHAR(3),
    Dm_Job VARCHAR(20),
    Dm_Email VARCHAR(30),
    Dm_Img VARCHAR(100)
);

CREATE TABLE DR_LIVE_RESULT (
    DLR_ID VARCHAR(20),
    DLR_DATE VARCHAR(20),
    DLR_TRUE_CNT VARCHAR(20),
    DLR_FALS_CNT VARCHAR(20)
);


CREATE TABLE images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_name VARCHAR(3000),
    image LONGBLOB NOT NULL
);

CREATE TABLE DR_S_POSE (
    DSP_IDX INT AUTO_INCREMENT PRIMARY KEY,
    DSP_ID VARCHAR(30),
    DSP_S_IMG VARCHAR(700),
    DSP_DATE VARCHAR(30),
    DSP_L_ARM VARCHAR(30),
    DSP_R_ARM VARCHAR(30)
);