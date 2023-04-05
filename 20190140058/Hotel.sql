create database Hotel
on primary(
name = Hotel_Data,
filename = 'D:\Microsoft SQL Server\MSSQL15.AL_ABIYU\MSSQL\DATA\Hotel_Data.mdf',
size = 20MB,
filegrowth = 10MB),
Filegroup Secondary(
name = Hotel_Secondary,
filename = 'D:\Microsoft SQL Server\MSSQL15.AL_ABIYU\MSSQL\DATA\Hotel_Secondary.ndf',
size = 34MB,
filegrowth = 5MB)
log on(
name = Hotel_log,
filename = 'D:\Microsoft SQL Server\MSSQL15.AL_ABIYU\MSSQL\DATA\Hotel_log.ldf',
size = 8MB,
filegrowth = 15MB)

create table jk(
id int primary key,
jenis_kelamin char(1) not null unique)

insert into jk (id, jenis_kelamin)
values
	(1, 'L'),
	(2, 'P')

create table customer(
id_customer char(10) primary key not null,
nama_customer varchar(50) not null,
tlp_customer char(12) not null,
no_kamar char(4) foreign key references kamar (no_kamar) not null,
jenis_kelamin int not null default 1,
constraint fp_jk foreign key (jenis_kelamin) references jk (id))

create table karyawan(
id_karyawan char(10) primary key not null,
nama_karyawan varchar(30) not null,
tlp_karyawan char(12) not null,
nama_jalan varchar(255) not null,
kota varchar(255) not null,
provinsi varchar(255) not null,
jenis_kelamin int not null default 1,
constraint fkr_jk foreign key (jenis_kelamin) references jk (id))

create table reservasi(
no_reservasi char(10) primary key not null,
id_customer char(10) foreign key references customer (id_customer) not null,
id_karyawan char(10) foreign key references karyawan (id_karyawan) not null,
jmlh_kamar int not null,
jenis_kamar varchar(100) foreign key references kamar (jenis_kamar) not null,
tgl_msk datetime not null,
tgl_keluar datetime not null,
total_harga bigint not null)

create table detail_reservasi(
id_detail char(10) primary key not null,
no_reservasi char(10) foreign key references reservasi (no_reservasi) not null,
no_kamar char(3) foreign key references kamar (no_kamar) not null)

create table kamar(
no_kamar char(3) primary key not null,
tipe_kamar varchar(100) unique not null,
harga_kamar bigint)
