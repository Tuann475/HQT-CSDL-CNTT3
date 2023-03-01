---1. Liệt kê danh sách tất cả các nhân viên
SELECT * FROM NHANVIEN
---2Tìm các nhân viên làm việc ở phòng số 5
SELECT * FROM NHANVIEN WHERE Phong = 5
---3. Liệt kê họ tên và phòng làm việc các nhân viên có mức lương trên 6.000.000 đồng
SELECT HoNV, TenLot, TenNV FROM NHANVIEN WHERE Luong > 6000000 
---4. Tìm các nhân viên có mức lương trên 6.500.000 ở phòng 1 hoặc các nhân viên có mức
---lương trên 5.000.000 ở phòng 4
SELECT * FROM NHANVIEN WHERE (Luong > 6500000 AND Phong = 1) OR (Luong > 5000000 AND Phong = 4)
---5. Cho biết họ tên đầy đủ của các nhân viên ở TP Quảng Ngãi
SELECT HoNV, TenLot, TenNV FROM NHANVIEN WHERE DiaChi LIKE N'Quảng Ngãi'
---6. Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự bằng ký tự N
SELECT HoNV, TenLot, TenNV FROM NHANVIEN WHERE HoNV like N'N%'
---7. Cho biết ngày sinh và địa chỉ của nhân viên Cao Thanh Huyền
SELECT NgSinh, DiaChi FROM NHANVIEN WHERE HoNV like N'Cao Thanh Huyền'
---8. Cho biết các nhân viên có năm sinh trong khoảng 1955 đến 1975
SELECT * FROM NHANVIEN WHERE YEAR(NgSinh) >1975 and YEAR(NgSinh) < 1975
---9. Cho biết các nhân viên và năm sinh của nhân viên
SELECT HoNV, TenLot, TenNV ,YEAR(NgSinh) FROM NHANVIEN 
---10. Cho biết họ tên và tuổi của tất cả các nhân viên
SELECT HoNV, TenLot, TenNV as 'Họ và tên', YEAR(GETDATE())-YEAR(NgaySinh) as 'Tuổi' from NHANVIEN
---11. Tìm tên những người trưởng phòng của từng phòng ban
SELECT TenNV FROM NHANVIEN WHERE Phong like N'1'

---12. Tìm tên và địa chỉ của tất cả các nhân viên của phòng Điều hành
SELECT TenNV, DiaChi FROM NHANVIEN WHERE Phong like N'4'
---13. Với mỗi đề án ở Tp Quảng Ngãi, cho biết tên đề án, tên phòng ban, họ tên và ngày
---nhận chức của trưởng phòng của phòng ban chủ trì đề án đó.
SELECT TenDA, TenPhg,HoNV,TenNV, FROM DEAN
---14. Tìm tên những nữ nhân viên và tên người thân của họ
SELECT ,HoNV,TenNV FROM NHANVIEN N, THANNHAN T WHERE N.MaNV = T.MA_NVIEN GROUP BY N.HoNV 
---15. Với mỗi nhân viên, cho biết họ tên của nhân viên, họ tên trưởng phòng của phòng ban
---mà nhân viên đó đang làm việc.
select nv.HoNV+' '+nv.TenLot+' '+nv.TenNV as 'Họ Và Tên NV',ql.HoNV+' '+ql.TenLot+' '+ql.TenNV as 'Họ Và Tên QL', 
tp.HONV+' '+tp.TENLOT+' '+tp.TENNV as 'Họ Và Tên TP'
from NHANVIEN nv,NHANVIEN ql,NHANVIEN tp , PHONGBAN pb
where nv.MA_NQL=ql.MaNV and tp.MaNV= pb.TRPHG and pb.phong=nv.Phong
---16. Tên những nhân viên phòng Nghiên cứu có tham gia vào đề án &quot;Xây dựng nhà máy
---chế biến thủy sản&quot;

select * from NHANVIEN
select * from DEAN
select * from PHONGBAN
---17. Cho biết tên các đề án mà nhân viên Trần Thanh Tâm đã tham gia.
SELECT TenDA FROM NHANVIEN , PHANCONG , DEAN  WHERE MaNV = P.MA_NVIEN AND MaDA = D.MADA AND (HoNV + ' ' + TenLot + ' ' + TenNV) = N'rần Thanh Tâm'
