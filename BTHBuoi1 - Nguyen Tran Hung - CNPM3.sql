USE master
CREATE DATABASE Sales_2
-- ON
-- PRIMARY
-- (
-- NAME = tuan1_data,
-- FILENAME =&#39;D:\ThucHanhSQL\tuan1_data.mdf&#39;,
-- SIZE = 10MB,
-- MAXSIZE = 20MB,
-- FILEGROWTH = 20%
-- )
-- LOG ON
-- (
-- NAME = tuan1_log,
-- FILENAME = &#39;D:\ThucHanhSQL\tuan1_log.ldf&#39;,
-- SIZE = 10MB,
-- MAXSIZE = 20MB,
-- FILEGROWTH = 20%
-- )
USE Sales_2
-- 1. Kiểu dữ liệu tự định nghĩa
EXEC sp_addtype 'Mota', 'NVARCHAR(40)'
EXEC sp_addtype 'IDKH','CHAR(10)','NOT NULL'
EXEC sp_addtype 'DT', 'CHAR(12)'
-- 2. Tạo table
CREATE TABLE SanPham (
MaSP CHAR(6) NOT NULL,
TenSP VARCHAR(20),
NgayNhap Date,
DVT CHAR(10),
SoLuongTon INT,
DonGiaNhap money,
)
CREATE TABLE HoaDon (
MaHD CHAR(10) NOT NULL,
NgayLap Date,
NgayGiao Date,
MaKH IDKH,
DienGiai Mota,
)
CREATE TABLE KhachHang (
MaKH IDKH,
TenKH NVARCHAR(30),
DiaCHi NVARCHAR(40),
DienThoai DT,
)
CREATE TABLE ChiTietHD (
MaHD CHAR(10) NOT NULL,
MaSP CHAR(6) NOT NULL,
SoLuong INT
)
-- 3. Trong Table HoaDon, sửa cột DienGiai thành nvarchar(100).
ALTER TABLE HoaDon
ALTER COLUMN DienGiai NVARCHAR(100)
-- 4. Thêm vào bảng SanPham cột TyLeHoaHong float
ALTER TABLE SanPham
ADD TyLeHoaHong float
-- 5. Xóa cột NgayNhap trong bảng SanPham
ALTER TABLE SanPham
DROP COLUMN NgayNhap
