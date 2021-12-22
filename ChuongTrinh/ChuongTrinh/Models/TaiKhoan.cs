namespace ChuongTrinh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.ComponentModel;

    [Table("TaiKhoan")]
    public partial class TaiKhoan
    {
        [Key]
        [StringLength(10)]
        public string MaTK { get; set; }

        [Required(ErrorMessage ="Tên đăng nhập không được để trống")]
        [StringLength(50)]
        [DisplayName("Tên đăng nhập")]
        public string TenDangNhap { get; set; }

        [Required(ErrorMessage = "Mật khẩu không được để trống")]
        [StringLength(50)]
        public string MatKhau { get; set; }

        [Required(ErrorMessage = "Họ tên không được để trống")]
        [StringLength(100)]
        public string HoTen { get; set; }

        [StringLength(20)]
        public string GioiTinh { get; set; }

        [Required(ErrorMessage = "Số điện thoại không được để trống")]
        [StringLength(10)]
        public string SoDienThoai { get; set; }

        public DateTime? NgaySinh { get; set; }

        [Required(ErrorMessage = "Email không được để trống")]
        [StringLength(50)]
        public string Email { get; set; }

        [Required(ErrorMessage = "Địa chỉ không được để trống")]
        [StringLength(200)]
        public string DiaChi { get; set; }

        [StringLength(10)]
        public string MaKH { get; set; }

        [StringLength(10)]
        public string MaNV { get; set; }

        public virtual KhachHang KhachHang { get; set; }

        public virtual NhanVien NhanVien { get; set; }
    }
}
