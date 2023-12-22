



-- ************************************** `teachers`

CREATE TABLE `teachers`
(
 `teacher_id`   int NOT NULL AUTO_INCREMENT ,
 `fname`        varchar(45) NOT NULL ,
 `lname`        varchar(45) NOT NULL ,
 `d_birth`      date NOT NULL ,
 `phone_number` varchar(45) NOT NULL ,
 `email`        varchar(45) NOT NULL ,

PRIMARY KEY (`teacher_id`)
);






-- ************************************** `subject`

CREATE TABLE `subject`
(
 `subject_id`   int NOT NULL AUTO_INCREMENT ,
 `subject_name` varchar(45) NOT NULL ,
 `subject_type` varchar(45) NOT NULL ,

PRIMARY KEY (`subject_id`)
);






-- ************************************** `groups`

CREATE TABLE `groups`
(
 `group_id`     int NOT NULL AUTO_INCREMENT ,
 `group_number` int NOT NULL ,

PRIMARY KEY (`group_id`)
);






-- ************************************** `teacher_subject`

CREATE TABLE `teacher_subject`
(
 `teacher_subject_id` int NOT NULL AUTO_INCREMENT ,
 `teacher_id`         int NOT NULL ,
 `subject_id`         int NOT NULL ,
 `start_date`         date NOT NULL ,

PRIMARY KEY (`teacher_subject_id`),
KEY `FK_1` (`teacher_id`),
CONSTRAINT `FK_3` FOREIGN KEY `FK_1` (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
KEY `FK_2` (`subject_id`),
CONSTRAINT `FK_4` FOREIGN KEY `FK_2` (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE
);






-- ************************************** `students`

CREATE TABLE `students`
(
 `student_id`   int NOT NULL AUTO_INCREMENT ,
 `fname`        varchar(45) NOT NULL ,
 `lname`        varchar(45) NOT NULL ,
 `d_birth`      date NOT NULL ,
 `phone_number` varchar(45) NOT NULL ,
 `study_year`   int NOT NULL ,
 `group_id`     int NOT NULL ,

PRIMARY KEY (`student_id`),
KEY `FK_1` (`group_id`),
CONSTRAINT `FK_7` FOREIGN KEY `FK_1` (`group_id`) REFERENCES `groups` (`group_id`)
);






-- ************************************** `student_subject`

CREATE TABLE `student_subject`
(
 `subject_id` int NOT NULL ,
 `student_id` int NOT NULL ,

KEY `FK_1` (`subject_id`),
CONSTRAINT `FK_8` FOREIGN KEY `FK_1` (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE,
KEY `FK_2` (`student_id`),
CONSTRAINT `FK_9` FOREIGN KEY `FK_2` (`student_id`) REFERENCES `students` (`student_id`)
);






-- ************************************** `marks`

CREATE TABLE `marks`
(
 `mark_id`            int NOT NULL AUTO_INCREMENT ,
 `student_id`         int NOT NULL ,
 `teacher_subject_id` int NOT NULL ,
 `mark`               int NOT NULL ,
 `date_mark`          date NOT NULL ,

PRIMARY KEY (`mark_id`),
KEY `FK_1` (`student_id`),
CONSTRAINT `FK_1` FOREIGN KEY `FK_1` (`student_id`) REFERENCES `students` (`student_id`),
KEY `FK_2` (`teacher_subject_id`),
CONSTRAINT `FK_5` FOREIGN KEY `FK_2` (`teacher_subject_id`) REFERENCES `teacher_subject` (`teacher_subject_id`) ,
 CONSTRAINT `check_exam_mark_range` CHECK ( 1>=mark<=5 )
);






-- ************************************** `exam_marks`

CREATE TABLE `exam_marks`
(
 `exam_mark_id`       int NOT NULL AUTO_INCREMENT ,
 `student_id`         int NOT NULL ,
 `teacher_subject_id` int NOT NULL ,
 `mark`               int NOT NULL ,
 `date_mark`          date NOT NULL ,

PRIMARY KEY (`exam_mark_id`),
KEY `FK_1` (`student_id`),
CONSTRAINT `FK_4_1` FOREIGN KEY `FK_1` (`student_id`) REFERENCES `students` (`student_id`),
KEY `FK_2` (`teacher_subject_id`),
CONSTRAINT `FK_6` FOREIGN KEY `FK_2` (`teacher_subject_id`) REFERENCES `teacher_subject` (`teacher_subject_id`),
 CONSTRAINT `check_mark_range` CHECK ( 1>=mark<=5 )
);











