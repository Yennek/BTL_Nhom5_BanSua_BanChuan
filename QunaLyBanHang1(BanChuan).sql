drop database QuanLyBanHang7
use master
go
create database QuanLyBanHang7
go
use QuanLyBanHang7
go
---1.Bảng Danh mục-----
create table DanhMuc(
	MaDanhMuc nchar(10)  not null primary key,
	TenDanhMuc nvarchar(100) not null,
)	
---2. Bảng Nhà cung cấp----
create table NhaCC(
	MaNCC nchar(10) not null primary key,
	TenNCC nvarchar(100) not null,
	DiaChi nvarchar(100),
	SoDienThoai nchar(11),
	Email varchar(30)
)

---3.Bảng sản phẩm-----
create table SanPham(
	MaSP nchar(10) not null primary key,
	TenSP nvarchar(255) not null,
	TrangThai nvarchar(100) not null,
	KhoiLuong nvarchar(50) not null,
	GiaBan money not null,
	MoTa nvarchar(300),
	HinhAnh text not null,
	--Quản trị---
	GiaNhap money not null,
	SoLuongNhap int not null,
	SoLuongCo int not null,
	MaDanhMuc nchar(10) not null,
	MaNCC nchar(10) not null, 
	constraint fk_DanhMuc_SanPham foreign key (MaDanhMuc) references DanhMuc(MaDanhMuc),
	constraint fk_NCC_SanPham foreign key (MaNCC) references NhaCC(MaNCC)
)
----4. Bảng khách hàng----
create table KhachHang(
	MaKH nchar(10) not null primary key,
	TenKH nvarchar(100) not null,
	GioiTinh nvarchar(20) not null,
	SoDienThoai char(10) not null,
	NgaySinh datetime not null,
	Email char(25) not null,
	DiaChi nvarchar(200) not null
)


----6.Bảng Nhân viên------
Create table NhanVien(
	MaNV nchar(10) not null primary key,
	TenNV nvarchar(100) not null,
	GioiTinh nvarchar(20) not null,
	SoDienThoai char(10) not null,
	NgaySinh datetime not null,
	Email char(25) not null,
	DiaChi nvarchar(200) not null
)
----7. Bảng Hóa Đơn----
Create table HoaDon(
	MaHD nchar(10) not null primary key,
	MaKH nchar(10) not null,
	NgayLap datetime,
	SoLuongMua int,
	ThanhTien money,
	GhiChu nvarchar(200),
	TongTien money,
	MaNV nchar(10) not null,
	constraint fk_HoaDon_KhachHang foreign key(MaKH) references KhachHang(MaKH),
	constraint fk_HoaDon_NhanVien foreign key(MaNV) references NhanVien(MaNV)
)
----8. Bảng Tài Khoản----
Create table TaiKhoan(
	MaTK nchar(10) not null primary key,
	TenDangNhap nchar(50) not null,
	MatKhau nchar(50) not null,
	HoTen nvarchar(100),
	GioiTinh nvarchar(20),
	SoDienThoai char(10),
	NgaySinh datetime,
	Email nchar(50),
	DiaChi nvarchar(200),
	MaKH nchar(10),
	MaNV nchar(10),
	constraint fk_TaiKhoan_KhachHang foreign key(MaKH) references KhachHang(MaKH),
	constraint fk_TaiKhoan_NhanVien foreign key(MaNV) references NhanVien(MaNV)
)
----9. Bảng chi tiết hóa đơn----
Create table ChiTietHoaDon(
	MaHD nchar(10) not null,
	MaSP nchar(10) not null,
	TrangThai nvarchar(50) not null,
	Primary key (MaHD,MaSP),
	constraint fk_ChiTietHoaDon_HoaDon foreign key(MaHD) references HoaDon(MaHD),
	constraint fk_ChiTietHoaDon_SanPham foreign key(MaSP) references SanPham(MaSP)
)
 -------CHÈN DỮ LIỆU-----------------
 --- 1. Bảng Danh Mục----
Insert into DanhMuc values('DM1',N'Sữa nước')
Insert into DanhMuc values('DM2',N'Sữa chua')
Insert into DanhMuc values('DM3',N'Sữa túi')
Insert into DanhMuc values('DM4',N'Sữa chai')
Insert into DanhMuc values('DM5',N'Sữa bắp non')
--- 2. Bảng Nhà cung cấp----
Insert into NhaCC values('NCC1',N'Trang trại sữa Milk Farm',N'Hà Nội','0292837871','milkfarm@gmail.com')
Insert into NhaCC values('NCC2',N'Công ty nhựa PK',N'Hà Nam','0327812901','pkcompany@gmail.com')
Insert into NhaCC values('NCC3',N'Công ty CP HNP',N'Hà Nội','0378192661','hnp123@gmail.com')
Insert into NhaCC values('NCC4',N'Công ty sữa Ba Vì',N'Hà Nội','0309209122','bavi@gmail.com')
--- 3. Bảng Sản phẩm----
Insert into SanPham values('SP1',N'Thùng 12 Hộp Sữa Tươi KUN Úc Ít Đường 1L',N'Còn hàng','14 gram',300000,N'Quy cách: 12 hộp x 1L.Sản phẩm được nhập khẩu nguyên hộp từ Úc. Đảm bảo 5 không (không kháng sinh, không hoóc môn tăng trưởng, không chất bảo quản, Không thức ăn công nghiệp, không chuồng trại). Giàu đạm...','h0.png',200000,1000,500,'DM1','NCC1')
Insert into SanPham values('SP2',N'Thùng 48 Hộp Sữa Dinh Dưỡng KUN Có Đường 110ml',N'Còn hàng','110 ml',218000,N'Quy cách: 48 hộp x 110ml.Sản phẩm với đầy đủ những dưỡng chất từ nguồn sữa dinh dưỡng hoàn hảo của KUN. Bổ sung vitamin K2 hỗ trợ bé cao lớn hơn mỗi ngày.','h1.png',195000,150,100,'DM1','NCC1')
Insert into SanPham values('SP3',N'Thùng 48 Hộp Sữa Chua Ăn BA VÌ Có Đường 100gr',N'Còn hàng','100 gr',254000,N'Quy cách: 48 hộp x 100gr. Sản phẩm nổi tiếng lâu năm từ vùng đất Ba Vì. Công nghệ lên men hoàn toàn tự nhiên từ sữa tươi Ba Vì giúp hỗ trợ tiêu hóa cho cả gia đình.','h2.png',198000,100,80,'DM2','NCC4')
Insert into SanPham values('SP4',N'Thùng 24 Túi Sữa Chua Uống KUN Hương Cam 110ml',N'Còn hàng','110 ml',116000,N'Quy cách: 24 túi x 110ml Sản phẩm là sự kết hơp hoàn hảo của sữa chua được lên men hoàn toàn tự nhiên và hương vị Cam thơm ngon.  Sản phẩm giúp cho hệ tiêu hóa giúp bé dễ hấp thụ','h3.png',190000,200,180,'DM2','NCC1')
Insert into SanPham values('SP5',N'Thùng 24 Túi Sữa KUN Sôcôla Lúa Mạch 110ml',N'Còn hàng','110 ml',116000,N'Quy cách: 24 túi x 110ml.Thức uống dinh dưỡng từ sữa và socola lúa mạch thơm ngon giúp bé tăng cường năng lượng mỗi ngày.  Với công thức bổ sung K2, sữa Socola lúa mạch giúp hỗ trợ tăng trưởng...','h5.png',80000,300,200,'DM3','NCC2')
Insert into SanPham values('SP6',N'Thùng 24 Túi Nước Ép Trái Cây hương Nho KUN 110ml',N'Còn hàng','110 ml',105000,N'Thùng 24 Túi Nước Ép Trái Cây hương Nho KUN 110m- Thành phần:Nước, nước ép trái cây nguyên chất (24%) (Nước ép táo 18%, nước ép nho 6%), đường tinh luyện, chất ổn định (466), chất điều chỉnh axit (330)','h6.png',90000,200,150,'DM3','NCC2')
Insert into SanPham values('SP7',N'Thùng 36 Chai Sữa Chua Uống Hương Cam 90ml',N'Còn hàng','90 ml',145000,N'Quy cách: 48 chai x 90ml. Sản phẩm là sự kết hơp hoàn hảo của sữa chua được lên men hoàn toàn tự nhiên và hương vị Cam thơm ngon.  Sản phẩm giúp cho hệ tiêu hóa giúp bé dễ...','h7.png',95000,180,120,'DM4','NCC3')
Insert into SanPham values('SP8',N'Thùng 48 Chai Sữa Chua Uống KUN Hương Kem Dâu 90ml',N'Còn hàng','90 ml',194000,N'Quy cách: 48 chai x 90ml Sản phẩm là sự kết hơp hoàn hảo của sữa chua được lên men hoàn toàn tự nhiên và hương vị Dâu thơm ngon.Sản phẩm giúp cho hệ tiêu hóa giúp bé dễ hấp thụ','h8.png',160000,154,135,'DM4','NCC3')
Insert into SanPham values('SP9',N'Thùng 24 Hộp Sữa Bắp Non 180ml',N'Còn hàng','180 ml',162000,N'Quy cách: 24 hộp x 180mlSản phẩm làm từ bắp non tươi ngon, mát lành. Giàu Vitamin A,B tốt cho mắt và trí não.','h9.png',140000,320,250,'DM5','NCC2')
--- 4. Bảng Khách Hàng----
insert into KhachHang values ('KH1',N'Phan Thế Vinh',N'Nam','0338712312','09/27/2000','phanthevinh@gmail.com',N'Ba Vì - Hà Nội')
insert into KhachHang values ('KH2',N'Bùi Thị Yến',N'Nữ','0917261421','01/10/2000','buithiyen@gmail.com',N'Chí Linh - Hải Dương')
insert into KhachHang values ('KH3',N'Nguyễn Thị Hương',N'Nữ','0384144288','11/11/2000','nguyenthihuong@gmail.com',N'Đồ Sơn - Hải Phòng')

----6. Bảng Nhân viên------
insert into NhanVien values('NV1',N'Nguyễn Thị Hiền',N'Nữ','0123458731','02/23/2000','nguyenthihien@gmail.com',N'Yên Phong - Bắc Ninh')
insert into NhanVien values('NV2',N'Trần Thị Khánh Hường',N'Nữ','0123458912','07/16/2000','huongtran@gmail.com',N'Hưng Hà - Thái Bình')
--- 7. Bảng Hóa Đơn----
Insert into HoaDon values ('HD1','KH1','12/13/2021',10,3000000,N'Đã bao gồm VAT',2700000,'NV1')
Insert into HoaDon values ('HD2','KH2','12/15/2021',15,2430000,N'Đã bao gồm VAT',2177000,'NV1')
Insert into HoaDon values ('HD3','KH3','12/17/2021',5,1500000,N'Đã bao gồm VAT',1350000,'NV1')
Insert into HoaDon values ('HD4','KH1','12/20/2021',20,3240000,N'Chưa bao gồm VAT',2592000,'NV2')
Insert into HoaDon values ('HD5','KH2','12/21/2021',4,648000,N'Chưa bao gồm VAT',520000,'NV2')
Insert into HoaDon values ('HD6','KH3','1/4/2021',6,1146000,N'Đã bao gồm VAT',854000,'NV2')
--- 8. Bảng Tài Khoản----
Insert into TaiKhoan values('TK2','yenbt','123456',N'Bùi Thị Yến',N'Nữ','0917261421','01/10/2000','buithiyen@gmail.com',N'Chí Linh - Hải Dương','KH2',null)
Insert into TaiKhoan values('TK3','huongnt','123456',N'Nguyễn Thị Hương',N'Nữ','0384144288','11/11/2000','nguyenthihuong@gmail.com',N'Đồ Sơn - Hải Phòng','KH3',null)
Insert into TaiKhoan values('TK4','hiennt','123456',N'Nguyễn Thị Hiền',N'Nữ','0123458912','02/23/2000','nguyenthihien@gmail.com',N'Yên Phong - Bắc Ninh',null,'NV1')
Insert into TaiKhoan values('TK5','huongttk','123456',N'Trần Thị Khánh Hường',N'Nữ','0123458912','07/16/2000','huongtran@gmail.com',N'Hưng Hà - Thái Bình',null,'NV2')
Insert into TaiKhoan values('TK1','vinhpt','123456',N'Phan Thế Vinh',N'Nam','0338712312','09/27/2000','phanthevinh@gmail.com',N'Ba Vì - Hà Nội','KH1',null)
--- 9. Bảng Chi Tiết Hóa Đơn----
Insert into ChiTietHoaDon values('HD1','SP1',N'Đang xử lý')
Insert into ChiTietHoaDon values('HD2','SP2',N'Đang giao')
Insert into ChiTietHoaDon values('HD3','SP3',N'Đang chuẩn bị hàng')
Insert into ChiTietHoaDon values('HD4','SP4',N'Giao thành công')
Insert into ChiTietHoaDon values('HD5','SP5',N'Giao thành công')
Insert into ChiTietHoaDon values('HD6','SP6',N'Đang xử lý')
-----select----------
select *from DanhMuc
select *from SanPham
select *from NhaCC
select *from KhachHang

select *from NhanVien
select *from HoaDon
select *from TaiKhoan
select *from ChiTietHoaDon