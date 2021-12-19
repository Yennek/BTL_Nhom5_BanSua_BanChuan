namespace ChuongTrinh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            ChiTietHoaDons = new HashSet<ChiTietHoaDon>();
        }

        [Key]
        [StringLength(10)]
        public string MaSP { get; set; }

        [Required]
        [StringLength(255)]
        public string TenSP { get; set; }

        [Required]
        [StringLength(100)]
        public string TrangThai { get; set; }

        [Required]
        [StringLength(50)]
        public string KhoiLuong { get; set; }

        [Column(TypeName = "money")]
        public decimal GiaBan { get; set; }

        [StringLength(300)]
        public string MoTa { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string HinhAnh { get; set; }

        [Column(TypeName = "money")]
        public decimal GiaNhap { get; set; }

        public int SoLuongNhap { get; set; }

        public int SoLuongCo { get; set; }

        [Required]
        [StringLength(10)]
        public string MaDanhMuc { get; set; }

        [Required]
        [StringLength(10)]
        public string MaNCC { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; }

        public virtual DanhMuc DanhMuc { get; set; }

        public virtual NhaCC NhaCC { get; set; }
    }
}
