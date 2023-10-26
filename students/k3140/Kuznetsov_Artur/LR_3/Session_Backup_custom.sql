PGDMP                  	    {            postgres    16.0    16.0 n               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     |   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4994                        2615    16403    Session    SCHEMA        CREATE SCHEMA "Session";
    DROP SCHEMA "Session";
                pg_database_owner    false            �           0    0    SCHEMA "Session"    ACL     +   GRANT USAGE ON SCHEMA "Session" TO PUBLIC;
                   pg_database_owner    false    6                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                   postgres    false    7                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16664    attestation    TABLE     �  CREATE TABLE "Session".attestation (
    mark date NOT NULL,
    attempt smallint NOT NULL,
    attestation_date date NOT NULL,
    discipline_in_syllabus_id integer NOT NULL,
    discipline_id integer NOT NULL,
    grade_book_id integer NOT NULL,
    professor_id integer NOT NULL,
    syllabus_id integer NOT NULL,
    educational_program_id integer NOT NULL,
    department_id integer NOT NULL,
    group_id integer NOT NULL
);
 "   DROP TABLE "Session".attestation;
       Session         heap    postgres    false    6            �            1259    16439 
   auditorium    TABLE     �   CREATE TABLE "Session".auditorium (
    auditorium_id integer NOT NULL,
    platform_id integer NOT NULL,
    capacity integer NOT NULL,
    type integer NOT NULL
);
 !   DROP TABLE "Session".auditorium;
       Session         heap    postgres    false    6            �            1259    16429 
   department    TABLE     �   CREATE TABLE "Session".department (
    department_id integer NOT NULL,
    department_name character varying(20) NOT NULL,
    platform_id integer NOT NULL
);
 !   DROP TABLE "Session".department;
       Session         heap    postgres    false    6            �            1259    16409 	   direction    TABLE     {   CREATE TABLE "Session".direction (
    direction_id integer NOT NULL,
    direction_name character varying(20) NOT NULL
);
     DROP TABLE "Session".direction;
       Session         heap    postgres    false    6            �            1259    16511 
   discipline    TABLE     �  CREATE TABLE "Session".discipline (
    discipline_id integer NOT NULL,
    discipline_name character varying(20) NOT NULL,
    form_of_attestation integer NOT NULL,
    form_of_work integer NOT NULL,
    total_number_of_hours integer NOT NULL,
    number_of_laboratory_hours integer NOT NULL,
    number_of_lecture_hours integer NOT NULL,
    number_of_practical_hours integer NOT NULL
);
 !   DROP TABLE "Session".discipline;
       Session         heap    postgres    false    6            �            1259    16530    discipline in syllabus    TABLE     �   CREATE TABLE "Session"."discipline in syllabus" (
    discipline_in_syllabus_id integer NOT NULL,
    discipline_id integer NOT NULL,
    syllabus_id integer NOT NULL,
    educational_program_id integer NOT NULL,
    semester smallint NOT NULL
);
 /   DROP TABLE "Session"."discipline in syllabus";
       Session         heap    postgres    false    6            �            1259    16469    educational program    TABLE     �   CREATE TABLE "Session"."educational program" (
    educational_program_id integer NOT NULL,
    department_id integer NOT NULL,
    direction_id integer NOT NULL,
    start_of_preparation date NOT NULL,
    end_of_preparation date
);
 ,   DROP TABLE "Session"."educational program";
       Session         heap    postgres    false    6            �            1259    16479    group    TABLE     �   CREATE TABLE "Session"."group" (
    group_id integer NOT NULL,
    educational_program_id integer NOT NULL,
    syllabus_id integer NOT NULL,
    group_number character varying(20) NOT NULL,
    year_of_study date NOT NULL
);
    DROP TABLE "Session"."group";
       Session         heap    postgres    false    6            �            1259    16414    platform    TABLE     s   CREATE TABLE "Session".platform (
    platform_id integer NOT NULL,
    address character varying(100) NOT NULL
);
    DROP TABLE "Session".platform;
       Session         heap    postgres    false    6            �            1259    16499 	   professor    TABLE       CREATE TABLE "Session".professor (
    professor_id integer NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    patronymic character varying,
    "position" character varying NOT NULL,
    department_id integer NOT NULL
);
     DROP TABLE "Session".professor;
       Session         heap    postgres    false    6            �            1259    16577    scholarship    TABLE     ?  CREATE TABLE "Session".scholarship (
    scholarship_id integer NOT NULL,
    grade_book_id integer NOT NULL,
    scholarship_type_id integer NOT NULL,
    group_id integer NOT NULL,
    syllabus_id integer NOT NULL,
    educational_program_id integer NOT NULL,
    payment_start date NOT NULL,
    payment_end date
);
 "   DROP TABLE "Session".scholarship;
       Session         heap    postgres    false    6            �            1259    16603    scholarship type    TABLE     �   CREATE TABLE "Session"."scholarship type" (
    scholarship_type_id integer NOT NULL,
    form_of_scholarship character varying(20) NOT NULL,
    conditions_of_scholarship character varying(20) NOT NULL,
    sum_of_scholarship integer NOT NULL
);
 )   DROP TABLE "Session"."scholarship type";
       Session         heap    postgres    false    6            �            1259    16614    session schedule    TABLE     �  CREATE TABLE "Session"."session schedule" (
    session_schedule_id integer NOT NULL,
    professor_id integer NOT NULL,
    discipline_in_syllabus_id integer NOT NULL,
    discipline_id integer NOT NULL,
    educational_program_id integer NOT NULL,
    syllabus_id integer NOT NULL,
    group_id integer NOT NULL,
    department_id integer NOT NULL,
    auditorium_id integer NOT NULL,
    platform_id integer NOT NULL,
    date date NOT NULL
);
 )   DROP TABLE "Session"."session schedule";
       Session         heap    postgres    false    6            �            1259    16404    student    TABLE     �   CREATE TABLE "Session".student (
    grade_book_id integer NOT NULL,
    course integer NOT NULL,
    surname character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    patronymic character varying(20)
);
    DROP TABLE "Session".student;
       Session         heap    postgres    false    6            �            1259    16419    studying student    TABLE       CREATE TABLE "Session"."studying student" (
    group_stay daterange NOT NULL,
    status character varying(20) NOT NULL,
    grade_book_id integer NOT NULL,
    educational_program_id integer NOT NULL,
    group_id integer NOT NULL,
    syllabus_id integer NOT NULL
);
 )   DROP TABLE "Session"."studying student";
       Session         heap    postgres    false    6            �            1259    16464    syllabus    TABLE     �   CREATE TABLE "Session".syllabus (
    syllabus_id integer NOT NULL,
    educational_program_id integer NOT NULL,
    year_of_enrollment integer NOT NULL
);
    DROP TABLE "Session".syllabus;
       Session         heap    postgres    false    6            |          0    16664    attestation 
   TABLE DATA           �   COPY "Session".attestation (mark, attempt, attestation_date, discipline_in_syllabus_id, discipline_id, grade_book_id, professor_id, syllabus_id, educational_program_id, department_id, group_id) FROM stdin;
    Session          postgres    false    232   �       r          0    16439 
   auditorium 
   TABLE DATA           S   COPY "Session".auditorium (auditorium_id, platform_id, capacity, type) FROM stdin;
    Session          postgres    false    222   �       q          0    16429 
   department 
   TABLE DATA           T   COPY "Session".department (department_id, department_name, platform_id) FROM stdin;
    Session          postgres    false    221   ��       n          0    16409 	   direction 
   TABLE DATA           D   COPY "Session".direction (direction_id, direction_name) FROM stdin;
    Session          postgres    false    218   C�       w          0    16511 
   discipline 
   TABLE DATA           �   COPY "Session".discipline (discipline_id, discipline_name, form_of_attestation, form_of_work, total_number_of_hours, number_of_laboratory_hours, number_of_lecture_hours, number_of_practical_hours) FROM stdin;
    Session          postgres    false    227   Ҡ       x          0    16530    discipline in syllabus 
   TABLE DATA           �   COPY "Session"."discipline in syllabus" (discipline_in_syllabus_id, discipline_id, syllabus_id, educational_program_id, semester) FROM stdin;
    Session          postgres    false    228   "�       t          0    16469    educational program 
   TABLE DATA           �   COPY "Session"."educational program" (educational_program_id, department_id, direction_id, start_of_preparation, end_of_preparation) FROM stdin;
    Session          postgres    false    224   ��       u          0    16479    group 
   TABLE DATA           p   COPY "Session"."group" (group_id, educational_program_id, syllabus_id, group_number, year_of_study) FROM stdin;
    Session          postgres    false    225   Q�       o          0    16414    platform 
   TABLE DATA           ;   COPY "Session".platform (platform_id, address) FROM stdin;
    Session          postgres    false    219   ��       v          0    16499 	   professor 
   TABLE DATA           j   COPY "Session".professor (professor_id, name, surname, patronymic, "position", department_id) FROM stdin;
    Session          postgres    false    226   ��       y          0    16577    scholarship 
   TABLE DATA           �   COPY "Session".scholarship (scholarship_id, grade_book_id, scholarship_type_id, group_id, syllabus_id, educational_program_id, payment_start, payment_end) FROM stdin;
    Session          postgres    false    229   ҧ       z          0    16603    scholarship type 
   TABLE DATA           �   COPY "Session"."scholarship type" (scholarship_type_id, form_of_scholarship, conditions_of_scholarship, sum_of_scholarship) FROM stdin;
    Session          postgres    false    230   ��       {          0    16614    session schedule 
   TABLE DATA           �   COPY "Session"."session schedule" (session_schedule_id, professor_id, discipline_in_syllabus_id, discipline_id, educational_program_id, syllabus_id, group_id, department_id, auditorium_id, platform_id, date) FROM stdin;
    Session          postgres    false    231   ��       m          0    16404    student 
   TABLE DATA           V   COPY "Session".student (grade_book_id, course, surname, name, patronymic) FROM stdin;
    Session          postgres    false    217   Ϊ       p          0    16419    studying student 
   TABLE DATA           �   COPY "Session"."studying student" (group_stay, status, grade_book_id, educational_program_id, group_id, syllabus_id) FROM stdin;
    Session          postgres    false    220   ��       s          0    16464    syllabus 
   TABLE DATA           ^   COPY "Session".syllabus (syllabus_id, educational_program_id, year_of_enrollment) FROM stdin;
    Session          postgres    false    223   ݫ       �           2606    16443    auditorium auditorium_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY "Session".auditorium
    ADD CONSTRAINT auditorium_pkey PRIMARY KEY (auditorium_id);
 G   ALTER TABLE ONLY "Session".auditorium DROP CONSTRAINT auditorium_pkey;
       Session            postgres    false    222            �           2606    16494    auditorium capacity_chk    CHECK CONSTRAINT     c   ALTER TABLE "Session".auditorium
    ADD CONSTRAINT capacity_chk CHECK ((capacity > 0)) NOT VALID;
 ?   ALTER TABLE "Session".auditorium DROP CONSTRAINT capacity_chk;
       Session          postgres    false    222    222            �           2606    16495    student course_chk1    CHECK CONSTRAINT     ]   ALTER TABLE "Session".student
    ADD CONSTRAINT course_chk1 CHECK ((course > 0)) NOT VALID;
 ;   ALTER TABLE "Session".student DROP CONSTRAINT course_chk1;
       Session          postgres    false    217    217            �           2606    16898    student course_chk2    CHECK CONSTRAINT     ^   ALTER TABLE "Session".student
    ADD CONSTRAINT course_chk2 CHECK ((course <= 5)) NOT VALID;
 ;   ALTER TABLE "Session".student DROP CONSTRAINT course_chk2;
       Session          postgres    false    217    217            �           2606    16496 +   educational program date_of_preparation_chk    CHECK CONSTRAINT     �   ALTER TABLE "Session"."educational program"
    ADD CONSTRAINT date_of_preparation_chk CHECK ((start_of_preparation < end_of_preparation)) NOT VALID;
 U   ALTER TABLE "Session"."educational program" DROP CONSTRAINT date_of_preparation_chk;
       Session          postgres    false    224    224    224    224            �           2606    16433    department department_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY "Session".department
    ADD CONSTRAINT department_pkey PRIMARY KEY (department_id);
 G   ALTER TABLE ONLY "Session".department DROP CONSTRAINT department_pkey;
       Session            postgres    false    221            �           2606    16413    direction direction_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "Session".direction
    ADD CONSTRAINT direction_pkey PRIMARY KEY (direction_id);
 E   ALTER TABLE ONLY "Session".direction DROP CONSTRAINT direction_pkey;
       Session            postgres    false    218            �           2606    16534 2   discipline in syllabus discipline in syllabus_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Session"."discipline in syllabus"
    ADD CONSTRAINT "discipline in syllabus_pkey" PRIMARY KEY (discipline_in_syllabus_id);
 c   ALTER TABLE ONLY "Session"."discipline in syllabus" DROP CONSTRAINT "discipline in syllabus_pkey";
       Session            postgres    false    228            �           2606    16521    discipline discipline_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY "Session".discipline
    ADD CONSTRAINT discipline_pkey PRIMARY KEY (discipline_id);
 G   ALTER TABLE ONLY "Session".discipline DROP CONSTRAINT discipline_pkey;
       Session            postgres    false    227            �           2606    16473 ,   educational program educational program_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Session"."educational program"
    ADD CONSTRAINT "educational program_pkey" PRIMARY KEY (educational_program_id);
 ]   ALTER TABLE ONLY "Session"."educational program" DROP CONSTRAINT "educational program_pkey";
       Session            postgres    false    224            �           2606    16524 "   discipline form_of_attestation_chk    CHECK CONSTRAINT     y   ALTER TABLE "Session".discipline
    ADD CONSTRAINT form_of_attestation_chk CHECK ((form_of_attestation > 0)) NOT VALID;
 J   ALTER TABLE "Session".discipline DROP CONSTRAINT form_of_attestation_chk;
       Session          postgres    false    227    227            �           2606    16525    discipline form_of_work_chk    CHECK CONSTRAINT     k   ALTER TABLE "Session".discipline
    ADD CONSTRAINT form_of_work_chk CHECK ((form_of_work > 0)) NOT VALID;
 C   ALTER TABLE "Session".discipline DROP CONSTRAINT form_of_work_chk;
       Session          postgres    false    227    227            �           2606    16483    group group_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY "Session"."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (group_id);
 ?   ALTER TABLE ONLY "Session"."group" DROP CONSTRAINT group_pkey;
       Session            postgres    false    225            �           2606    16527 )   discipline number_of_laboratory_hours_chk    CHECK CONSTRAINT     �   ALTER TABLE "Session".discipline
    ADD CONSTRAINT number_of_laboratory_hours_chk CHECK ((number_of_laboratory_hours >= 0)) NOT VALID;
 Q   ALTER TABLE "Session".discipline DROP CONSTRAINT number_of_laboratory_hours_chk;
       Session          postgres    false    227    227            �           2606    16528 &   discipline number_of_lecture_hours_chk    CHECK CONSTRAINT     �   ALTER TABLE "Session".discipline
    ADD CONSTRAINT number_of_lecture_hours_chk CHECK ((number_of_lecture_hours >= 0)) NOT VALID;
 N   ALTER TABLE "Session".discipline DROP CONSTRAINT number_of_lecture_hours_chk;
       Session          postgres    false    227    227            �           2606    16529 (   discipline number_of_practical_hours_chk    CHECK CONSTRAINT     �   ALTER TABLE "Session".discipline
    ADD CONSTRAINT number_of_practical_hours_chk CHECK ((number_of_practical_hours >= 0)) NOT VALID;
 P   ALTER TABLE "Session".discipline DROP CONSTRAINT number_of_practical_hours_chk;
       Session          postgres    false    227    227            �           2606    16418    platform platform_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY "Session".platform
    ADD CONSTRAINT platform_pkey PRIMARY KEY (platform_id);
 C   ALTER TABLE ONLY "Session".platform DROP CONSTRAINT platform_pkey;
       Session            postgres    false    219            �           2606    16505    professor professor_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY "Session".professor
    ADD CONSTRAINT professor_pkey PRIMARY KEY (professor_id);
 E   ALTER TABLE ONLY "Session".professor DROP CONSTRAINT professor_pkey;
       Session            postgres    false    226            �           2606    16607 &   scholarship type scholarship type_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY "Session"."scholarship type"
    ADD CONSTRAINT "scholarship type_pkey" PRIMARY KEY (scholarship_type_id);
 W   ALTER TABLE ONLY "Session"."scholarship type" DROP CONSTRAINT "scholarship type_pkey";
       Session            postgres    false    230            �           2606    16581    scholarship scholarship_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY "Session".scholarship
    ADD CONSTRAINT scholarship_pkey PRIMARY KEY (scholarship_id);
 I   ALTER TABLE ONLY "Session".scholarship DROP CONSTRAINT scholarship_pkey;
       Session            postgres    false    229            �           2606    16535 $   discipline in syllabus semester_chk1    CHECK CONSTRAINT     r   ALTER TABLE "Session"."discipline in syllabus"
    ADD CONSTRAINT semester_chk1 CHECK ((semester > 0)) NOT VALID;
 N   ALTER TABLE "Session"."discipline in syllabus" DROP CONSTRAINT semester_chk1;
       Session          postgres    false    228    228            �           2606    16576 $   discipline in syllabus semester_chk2    CHECK CONSTRAINT     t   ALTER TABLE "Session"."discipline in syllabus"
    ADD CONSTRAINT semester_chk2 CHECK ((semester <= 10)) NOT VALID;
 N   ALTER TABLE "Session"."discipline in syllabus" DROP CONSTRAINT semester_chk2;
       Session          postgres    false    228    228            �           2606    16618 &   session schedule session schedule_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY "Session"."session schedule"
    ADD CONSTRAINT "session schedule_pkey" PRIMARY KEY (session_schedule_id);
 W   ALTER TABLE ONLY "Session"."session schedule" DROP CONSTRAINT "session schedule_pkey";
       Session            postgres    false    231            �           2606    16408    student student_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY "Session".student
    ADD CONSTRAINT student_pkey PRIMARY KEY (grade_book_id);
 A   ALTER TABLE ONLY "Session".student DROP CONSTRAINT student_pkey;
       Session            postgres    false    217            �           2606    16613 '   scholarship type sum_of_scholarship_chk    CHECK CONSTRAINT        ALTER TABLE "Session"."scholarship type"
    ADD CONSTRAINT sum_of_scholarship_chk CHECK ((sum_of_scholarship > 0)) NOT VALID;
 Q   ALTER TABLE "Session"."scholarship type" DROP CONSTRAINT sum_of_scholarship_chk;
       Session          postgres    false    230    230            �           2606    16468    syllabus syllabus_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY "Session".syllabus
    ADD CONSTRAINT syllabus_pkey PRIMARY KEY (syllabus_id);
 C   ALTER TABLE ONLY "Session".syllabus DROP CONSTRAINT syllabus_pkey;
       Session            postgres    false    223            �           2606    16526 $   discipline total_number_of_hours_chk    CHECK CONSTRAINT     }   ALTER TABLE "Session".discipline
    ADD CONSTRAINT total_number_of_hours_chk CHECK ((total_number_of_hours > 0)) NOT VALID;
 L   ALTER TABLE "Session".discipline DROP CONSTRAINT total_number_of_hours_chk;
       Session          postgres    false    227    227            �           2606    16776    auditorium type_chk    CHECK CONSTRAINT     [   ALTER TABLE "Session".auditorium
    ADD CONSTRAINT type_chk CHECK ((type > 0)) NOT VALID;
 ;   ALTER TABLE "Session".auditorium DROP CONSTRAINT type_chk;
       Session          postgres    false    222    222            �           2606    16497     syllabus year_of_enrollment_chk1    CHECK CONSTRAINT     y   ALTER TABLE "Session".syllabus
    ADD CONSTRAINT year_of_enrollment_chk1 CHECK ((year_of_enrollment > 1980)) NOT VALID;
 H   ALTER TABLE "Session".syllabus DROP CONSTRAINT year_of_enrollment_chk1;
       Session          postgres    false    223    223            �           2606    16498     syllabus year_of_enrollment_chk2    CHECK CONSTRAINT     y   ALTER TABLE "Session".syllabus
    ADD CONSTRAINT year_of_enrollment_chk2 CHECK ((year_of_enrollment < 2050)) NOT VALID;
 H   ALTER TABLE "Session".syllabus DROP CONSTRAINT year_of_enrollment_chk2;
       Session          postgres    false    223    223            �           2606    16654 #   session schedule auditorium_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."session schedule"
    ADD CONSTRAINT auditorium_id_fkey FOREIGN KEY (auditorium_id) REFERENCES "Session".auditorium(auditorium_id) NOT VALID;
 R   ALTER TABLE ONLY "Session"."session schedule" DROP CONSTRAINT auditorium_id_fkey;
       Session          postgres    false    4774    231    222            �           2606    16506    professor department_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".professor
    ADD CONSTRAINT department_id_fkey FOREIGN KEY (department_id) REFERENCES "Session".department(department_id) NOT VALID;
 I   ALTER TABLE ONLY "Session".professor DROP CONSTRAINT department_id_fkey;
       Session          postgres    false    4772    226    221            �           2606    16551 &   educational program department_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."educational program"
    ADD CONSTRAINT department_id_fkey FOREIGN KEY (department_id) REFERENCES "Session".department(department_id) NOT VALID;
 U   ALTER TABLE ONLY "Session"."educational program" DROP CONSTRAINT department_id_fkey;
       Session          postgres    false    221    4772    224            �           2606    16649 #   session schedule department_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."session schedule"
    ADD CONSTRAINT department_id_fkey FOREIGN KEY (department_id) REFERENCES "Session".department(department_id) NOT VALID;
 R   ALTER TABLE ONLY "Session"."session schedule" DROP CONSTRAINT department_id_fkey;
       Session          postgres    false    4772    231    221            �           2606    16697    attestation department_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".attestation
    ADD CONSTRAINT department_id_fkey FOREIGN KEY (department_id) REFERENCES "Session".department(department_id) NOT VALID;
 K   ALTER TABLE ONLY "Session".attestation DROP CONSTRAINT department_id_fkey;
       Session          postgres    false    232    4772    221            �           2606    16556 %   educational program direction_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."educational program"
    ADD CONSTRAINT direction_id_fkey FOREIGN KEY (direction_id) REFERENCES "Session".direction(direction_id) NOT VALID;
 T   ALTER TABLE ONLY "Session"."educational program" DROP CONSTRAINT direction_id_fkey;
       Session          postgres    false    218    4768    224            �           2606    16536 )   discipline in syllabus discipline_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."discipline in syllabus"
    ADD CONSTRAINT discipline_id_fkey FOREIGN KEY (discipline_id) REFERENCES "Session".discipline(discipline_id) NOT VALID;
 X   ALTER TABLE ONLY "Session"."discipline in syllabus" DROP CONSTRAINT discipline_id_fkey;
       Session          postgres    false    228    227    4784            �           2606    16629 #   session schedule discipline_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."session schedule"
    ADD CONSTRAINT discipline_id_fkey FOREIGN KEY (discipline_id) REFERENCES "Session".discipline(discipline_id) NOT VALID;
 R   ALTER TABLE ONLY "Session"."session schedule" DROP CONSTRAINT discipline_id_fkey;
       Session          postgres    false    4784    231    227            �           2606    16672    attestation discipline_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".attestation
    ADD CONSTRAINT discipline_id_fkey FOREIGN KEY (discipline_id) REFERENCES "Session".discipline(discipline_id) NOT VALID;
 K   ALTER TABLE ONLY "Session".attestation DROP CONSTRAINT discipline_id_fkey;
       Session          postgres    false    232    227    4784            �           2606    16624 /   session schedule discipline_in_syllabus_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."session schedule"
    ADD CONSTRAINT discipline_in_syllabus_id_fkey FOREIGN KEY (discipline_in_syllabus_id) REFERENCES "Session"."discipline in syllabus"(discipline_in_syllabus_id) NOT VALID;
 ^   ALTER TABLE ONLY "Session"."session schedule" DROP CONSTRAINT discipline_in_syllabus_id_fkey;
       Session          postgres    false    231    228    4786            �           2606    16667 *   attestation discipline_in_syllabus_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".attestation
    ADD CONSTRAINT discipline_in_syllabus_id_fkey FOREIGN KEY (discipline_in_syllabus_id) REFERENCES "Session"."discipline in syllabus"(discipline_in_syllabus_id) NOT VALID;
 W   ALTER TABLE ONLY "Session".attestation DROP CONSTRAINT discipline_in_syllabus_id_fkey;
       Session          postgres    false    4786    228    232            �           2606    16474    syllabus educational_program_id    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".syllabus
    ADD CONSTRAINT educational_program_id FOREIGN KEY (educational_program_id) REFERENCES "Session"."educational program"(educational_program_id) NOT VALID;
 L   ALTER TABLE ONLY "Session".syllabus DROP CONSTRAINT educational_program_id;
       Session          postgres    false    224    223    4778            �           2606    16484 !   group educational_program_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."group"
    ADD CONSTRAINT educational_program_id_fkey FOREIGN KEY (educational_program_id) REFERENCES "Session"."educational program"(educational_program_id) NOT VALID;
 P   ALTER TABLE ONLY "Session"."group" DROP CONSTRAINT educational_program_id_fkey;
       Session          postgres    false    4778    225    224            �           2606    16541 2   discipline in syllabus educational_program_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."discipline in syllabus"
    ADD CONSTRAINT educational_program_id_fkey FOREIGN KEY (educational_program_id) REFERENCES "Session"."educational program"(educational_program_id) NOT VALID;
 a   ALTER TABLE ONLY "Session"."discipline in syllabus" DROP CONSTRAINT educational_program_id_fkey;
       Session          postgres    false    228    224    4778            �           2606    16561 ,   studying student educational_program_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."studying student"
    ADD CONSTRAINT educational_program_id_fkey FOREIGN KEY (educational_program_id) REFERENCES "Session"."educational program"(educational_program_id) NOT VALID;
 [   ALTER TABLE ONLY "Session"."studying student" DROP CONSTRAINT educational_program_id_fkey;
       Session          postgres    false    4778    224    220            �           2606    16598 '   scholarship educational_program_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".scholarship
    ADD CONSTRAINT educational_program_id_fkey FOREIGN KEY (educational_program_id) REFERENCES "Session"."educational program"(educational_program_id) NOT VALID;
 T   ALTER TABLE ONLY "Session".scholarship DROP CONSTRAINT educational_program_id_fkey;
       Session          postgres    false    229    224    4778            �           2606    16634 ,   session schedule educational_program_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."session schedule"
    ADD CONSTRAINT educational_program_id_fkey FOREIGN KEY (educational_program_id) REFERENCES "Session"."educational program"(educational_program_id) NOT VALID;
 [   ALTER TABLE ONLY "Session"."session schedule" DROP CONSTRAINT educational_program_id_fkey;
       Session          postgres    false    224    231    4778            �           2606    16692 '   attestation educational_program_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".attestation
    ADD CONSTRAINT educational_program_id_fkey FOREIGN KEY (educational_program_id) REFERENCES "Session"."educational program"(educational_program_id) NOT VALID;
 T   ALTER TABLE ONLY "Session".attestation DROP CONSTRAINT educational_program_id_fkey;
       Session          postgres    false    232    4778    224            �           2606    16424 #   studying student grade_book_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."studying student"
    ADD CONSTRAINT grade_book_id_fkey FOREIGN KEY (grade_book_id) REFERENCES "Session".student(grade_book_id) NOT VALID;
 R   ALTER TABLE ONLY "Session"."studying student" DROP CONSTRAINT grade_book_id_fkey;
       Session          postgres    false    4766    220    217            �           2606    16583    scholarship grade_book_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".scholarship
    ADD CONSTRAINT grade_book_id_fkey FOREIGN KEY (grade_book_id) REFERENCES "Session".student(grade_book_id) NOT VALID;
 K   ALTER TABLE ONLY "Session".scholarship DROP CONSTRAINT grade_book_id_fkey;
       Session          postgres    false    217    4766    229            �           2606    16677    attestation grade_book_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".attestation
    ADD CONSTRAINT grade_book_id_fkey FOREIGN KEY (grade_book_id) REFERENCES "Session".student(grade_book_id) NOT VALID;
 K   ALTER TABLE ONLY "Session".attestation DROP CONSTRAINT grade_book_id_fkey;
       Session          postgres    false    4766    232    217            �           2606    16566    studying student group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."studying student"
    ADD CONSTRAINT group_id_fkey FOREIGN KEY (group_id) REFERENCES "Session"."group"(group_id) NOT VALID;
 M   ALTER TABLE ONLY "Session"."studying student" DROP CONSTRAINT group_id_fkey;
       Session          postgres    false    220    225    4780            �           2606    16588    scholarship group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".scholarship
    ADD CONSTRAINT group_id_fkey FOREIGN KEY (group_id) REFERENCES "Session"."group"(group_id) NOT VALID;
 F   ALTER TABLE ONLY "Session".scholarship DROP CONSTRAINT group_id_fkey;
       Session          postgres    false    4780    229    225            �           2606    16644    session schedule group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."session schedule"
    ADD CONSTRAINT group_id_fkey FOREIGN KEY (group_id) REFERENCES "Session"."group"(group_id) NOT VALID;
 M   ALTER TABLE ONLY "Session"."session schedule" DROP CONSTRAINT group_id_fkey;
       Session          postgres    false    225    231    4780            �           2606    16702    attestation group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".attestation
    ADD CONSTRAINT group_id_fkey FOREIGN KEY (group_id) REFERENCES "Session"."group"(group_id) NOT VALID;
 F   ALTER TABLE ONLY "Session".attestation DROP CONSTRAINT group_id_fkey;
       Session          postgres    false    225    232    4780            �           2606    16434    department platform_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".department
    ADD CONSTRAINT platform_id_fkey FOREIGN KEY (platform_id) REFERENCES "Session".platform(platform_id) NOT VALID;
 H   ALTER TABLE ONLY "Session".department DROP CONSTRAINT platform_id_fkey;
       Session          postgres    false    221    219    4770            �           2606    16444    auditorium platform_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".auditorium
    ADD CONSTRAINT platform_id_fkey FOREIGN KEY (platform_id) REFERENCES "Session".platform(platform_id) NOT VALID;
 H   ALTER TABLE ONLY "Session".auditorium DROP CONSTRAINT platform_id_fkey;
       Session          postgres    false    222    219    4770            �           2606    16659 !   session schedule platform_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."session schedule"
    ADD CONSTRAINT platform_id_fkey FOREIGN KEY (platform_id) REFERENCES "Session".platform(platform_id) NOT VALID;
 P   ALTER TABLE ONLY "Session"."session schedule" DROP CONSTRAINT platform_id_fkey;
       Session          postgres    false    219    4770    231            �           2606    16619 "   session schedule professor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."session schedule"
    ADD CONSTRAINT professor_id_fkey FOREIGN KEY (professor_id) REFERENCES "Session".professor(professor_id) NOT VALID;
 Q   ALTER TABLE ONLY "Session"."session schedule" DROP CONSTRAINT professor_id_fkey;
       Session          postgres    false    231    4782    226            �           2606    16682    attestation professor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".attestation
    ADD CONSTRAINT professor_id_fkey FOREIGN KEY (professor_id) REFERENCES "Session".professor(professor_id) NOT VALID;
 J   ALTER TABLE ONLY "Session".attestation DROP CONSTRAINT professor_id_fkey;
       Session          postgres    false    226    232    4782            �           2606    16608 $   scholarship scholarship_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".scholarship
    ADD CONSTRAINT scholarship_type_id_fkey FOREIGN KEY (scholarship_type_id) REFERENCES "Session"."scholarship type"(scholarship_type_id) NOT VALID;
 Q   ALTER TABLE ONLY "Session".scholarship DROP CONSTRAINT scholarship_type_id_fkey;
       Session          postgres    false    4790    230    229            �           2606    16489    group syllabus_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."group"
    ADD CONSTRAINT syllabus_id_fkey FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id) NOT VALID;
 E   ALTER TABLE ONLY "Session"."group" DROP CONSTRAINT syllabus_id_fkey;
       Session          postgres    false    225    223    4776            �           2606    16546 '   discipline in syllabus syllabus_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."discipline in syllabus"
    ADD CONSTRAINT syllabus_id_fkey FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id) NOT VALID;
 V   ALTER TABLE ONLY "Session"."discipline in syllabus" DROP CONSTRAINT syllabus_id_fkey;
       Session          postgres    false    228    4776    223            �           2606    16571 !   studying student syllabus_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."studying student"
    ADD CONSTRAINT syllabus_id_fkey FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id) NOT VALID;
 P   ALTER TABLE ONLY "Session"."studying student" DROP CONSTRAINT syllabus_id_fkey;
       Session          postgres    false    220    223    4776            �           2606    16593    scholarship syllabus_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".scholarship
    ADD CONSTRAINT syllabus_id_fkey FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id) NOT VALID;
 I   ALTER TABLE ONLY "Session".scholarship DROP CONSTRAINT syllabus_id_fkey;
       Session          postgres    false    4776    223    229            �           2606    16639 !   session schedule syllabus_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session"."session schedule"
    ADD CONSTRAINT syllabus_id_fkey FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id) NOT VALID;
 P   ALTER TABLE ONLY "Session"."session schedule" DROP CONSTRAINT syllabus_id_fkey;
       Session          postgres    false    4776    231    223            �           2606    16687    attestation syllabus_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "Session".attestation
    ADD CONSTRAINT syllabus_id_fkey FOREIGN KEY (syllabus_id) REFERENCES "Session".syllabus(syllabus_id) NOT VALID;
 I   ALTER TABLE ONLY "Session".attestation DROP CONSTRAINT syllabus_id_fkey;
       Session          postgres    false    4776    232    223            |      x������ � �      r   �   x���� B�X̎����_ǚ\�A�µ��*Cp�b��md�dר�h���X��C�2�{�ͭCuh	u�Ӌ:L��U�U�P=n�]OX��X3�NDb�.o� �n�����T������]<��w*X���`��)�OD�)p'�      q   �   x�%ͻ
�@����Ä���Mm!e�4"�`T�y�(i?~��Q"�ih[���d�������,G������ ��$N�CW�jYk٠�D���9�Ϭ�˴�/�w�T�1����(y5x�y,�aO>��뮬�$sL�]Ï6.SGQ�׍�~ig-�      n      x�ͻ
�0@�Y��b+Rυ�c�Щ�j���k���ܑ&xyn{u�H$p�V��f(q`�V?�o�$3�tˆ4H���U��w���Ր#���c�!�H������2���(�"S����}B��o&      w   @  x�Q��1�Kc�n�+�{�:�v`�=f��q�%BH���1b>��〘��zX�r�C�lB�ЎH��Fx�^���z�/��Y�R�Y�3Sgv��&�i�X�}�n$<��"i���х�:rtxN��b�x߮����,-`&Ps�Tz�sB��l%��z��7�aZ��J�)+��\�������Z@�SVL�q����H��is�5��˲31�pz�9 �'���g�c�g��P\��c=nP��B��0YQ�q��ռ�H�ܗǿ��,rj���µ���p�ݽ���0~���u<�nLm��eIg?>IMz.�1
�5G�����e�      x   �   x���@B�XLf��K��#�� ��G%s0�̆l9B��A��M�֛���f<lh����Z�p!W�����Ӄr"��V��,��� ��J`HD��ȼW�컜9��"f�����?�҅�{�nw����3��w&�      t   �   x�u��CACk�.� �p���ȥIG��'˼ e�,�lKO��_1�3�)o�D�E��́Ead
p����(���Y��2{�$�ck˺�'`�̭M�2@��͕̂@�J+E��Ш�``����ԫ���y�/��C�      u   �   x�U���0D��^�2��%J������c�r�y�|.�^bЩv�<TG1˭���Ua��.XJ����m�EAH,[xBڴ��\���Ц�Lm�M�E⦯|ss���n�%L�\��Zա����Ǜ��g�����o~I�{@���g�t�����8�      o   �  x�=S�R�0]K_q?����X�P
BS2��F$j��Ȍ���{����#�s�yH2ˉ�Z�C�9��ܦ�la�9\�����]��ǡ=��?�(���[⭀�6�{�KM�!�SU^��P�[�m�B�9(���	N43�Ҿ�n��KyW�o�ǟ�?�������� �ԆJoњ[x���W�/����c�9�ȶ;��UZS��'�i��f�6����a�@�@�:NC7�0p�����(��Vp@�!ê	��OGq�06�a[�����R/�$�y���b���G��7g�3��kN�@⽗i��7#�B�Q�C�:u���WP\��g�(�cj�ܷ^�=���g���Y>��HO���,C� ;��!�1-y�x���zI�sF��1��������Cl
(�`�R�
)<'̡Q0�c76r���!�_)X��6�1*c���4\����*�V�0[���h*����(K��ľʷ�Sn�qT9��.�`�8�?V�b���Z+�t�N��LY��Ds�����|�HΨ��3tEX��#��m�*�ݐ�����a�Ao���q`�rD�襥�X8����p�o����wا����-�7X��IXaq�0#��P�>�9.���.8l�$%~�8oĺ�6H2Z]QJ�K��      v   (  x�E�OS� ��ˇq����N=��x�BӍa$����~z���X��{�]���������O<�D���#(-4ӵ��C��y|�	^B��8�4���c��Z�ڷg�!!�f�`*?��3TZ��	'���)��ַ��P����p�Ap�9S�(����O!��'�_�/!��f��6ES�1��z��C�i�'	��$3�X�[ks�3]�0�s��`y��v��q��_�E�d5�K��uH�R�ɚY��
�c�S�1-��)���7Є�J���\i���#�rq)K/$;
�<Լ��z���by5      y   �   x�u��C1Ck�]�>v��s�nRō z�DOUa������	Ǆ,<&�/��zFg8nX�6Lu��e��B��c�zk^B�nB�.PF{*�nqԔ��"5���`����	�(5��Pay�ں�r��m��T]n��"TOZf�̭��,��ʂ1�zpJ�h�#a]�Fi���j��n�4)�+QP���ٕ�r^���y�/y�]�      z   �   x�-��R�0���9���)CC�a��Q��hpdF��ۣ�f��U#��Ω%�-�+TY���8���#ׯ�^'Î����^�}kP���D���:�{�e�Ȋ�O�+��uJ�)�5�Ҝڠ�IY���9�Z.�᭯����(�a���Tq�ι툑#Ef/8nC�8�;"��S��NcS����6r�E���@D`fC�      {   5  x�U�K��PC�~{�`�{������M�� �`��m��]8:��`��I������!,�����Ɔ�㸅���%SSb���RS��̿���I�|$��z�������7���PՅ����*���h	����s� ����Q��d`��E�(���虫=�[�tj�0�7��mY)�!�b�5�=6���j��Š�a����J+��O2Hkcˏx�����!�urr��,�V�i�ռ7��B�q�;5�d��ipz��Do���>O6Z��'�~��x=,-Xr�}RI�S�<]׷��4��/���>��/�Yo?      m   �   x�5�;o�0�g���,�1�NI�.]����4����K]8�w�;[� �$߸���$�_�L|s�gf!����D1cm�=�p��xd�}���12.�[�[�p[Eّ�	a'y^����B���)e8�H��Di��tU���p�qF����RL׸��a-�w���D�,�w�피�32��n(SB�g�"�
�oi,�7M݂��V�&8��t�P�d>_�1��TR      p      x������ � �      s   V   x�5͹�0Cњ&�E��d�9b@N��L���r����uI��(���s�,�:=���4���AT��>B��n3��Z���U     