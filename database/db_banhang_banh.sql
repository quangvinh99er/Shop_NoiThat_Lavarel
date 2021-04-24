-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 24, 2021 lúc 03:44 AM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_banhang_banh`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(4, 4, '2021-03-11', 12000, 'COD', 'còn nóng', '2021-03-11 06:39:18', '2021-03-11 06:39:18'),
(5, 5, '2021-03-11', 73000, 'ATM', 'nhanh xíu', '2021-03-11 09:49:30', '2021-03-11 09:49:30'),
(6, 6, '2021-03-19', 18000, 'COD', 'nhớ ướp lạnh', '2021-03-19 03:07:41', '2021-03-19 03:07:41'),
(7, 7, '2021-03-23', 7000000, 'COD', 'aaaaaa', '2021-03-23 11:46:26', '2021-03-23 11:46:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(10, 4, 1, 1, 12000, '2021-03-11 06:39:18', '2021-03-11 06:39:18'),
(11, 5, 23, 1, 38000, '2021-03-11 09:49:30', '2021-03-11 09:49:30'),
(12, 5, 25, 1, 25000, '2021-03-11 09:49:30', '2021-03-11 09:49:30'),
(13, 5, 49, 1, 10000, '2021-03-11 09:49:30', '2021-03-11 09:49:30'),
(14, 6, 6, 1, 18000, '2021-03-19 03:07:41', '2021-03-19 03:07:41'),
(15, 7, 19, 1, 7000000, '2021-03-23 11:46:26', '2021-03-23 11:46:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone`, `note`, `created_at`, `updated_at`) VALUES
(5, 'nguyễn văn a', 'nam', 'ABC123@GMAIL.COM', '123 trần phú', '0786514678', 'nhanh xíu', '2021-03-11 09:49:30', '2021-03-11 09:49:30'),
(6, 'nguyễn văn a', 'nam', 'vucongthanh92@gmail.com', '123 trần phú', '0786514678', 'nhớ ướp lạnh abc', '2021-03-19 03:12:31', '2021-03-19 03:12:31'),
(4, 'nguyễn văn a', 'nam', 'ABC123@GMAIL.COM', '123 trần phú', '0786514678', 'còn nóng', '2021-03-11 06:39:17', '2021-03-11 06:39:17'),
(7, 'nguyễn văn a', 'nam', 'vucongthanh92@gmail.com', '123 trần phú', '0786514678', 'aaaaaa', '2021-03-23 11:46:26', '2021-03-23 11:46:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `description` text DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `thanh_vien` varchar(100) NOT NULL COMMENT 'thành viên thanh toán',
  `money` float NOT NULL COMMENT 'số tiền thanh toán',
  `note` varchar(255) DEFAULT NULL COMMENT 'ghi chú thanh toán',
  `vnp_response_code` varchar(255) NOT NULL COMMENT 'mã phản hồi',
  `code_vnpay` varchar(255) NOT NULL COMMENT 'mã giao dịch vnpay',
  `code_bank` varchar(255) NOT NULL COMMENT 'mã ngân hàng',
  `time` datetime NOT NULL COMMENT 'thời gian chuyển khoản'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `thanh_vien`, `money`, `note`, `vnp_response_code`, `code_vnpay`, `code_bank`, `time`) VALUES
(1, '742874161', 'abc', 100000, 'chinh chuyển khoản', '00', '13401455', 'NCB', '2020-10-10 01:00:00'),
(2, '608324672', 'abc', 1000000, 'test chuyển khoản', '00', '13401811', 'NCB', '2020-10-11 21:00:00'),
(3, '1134065293', 'CT2', 150000, 'học phí', '00', '13407163', 'NCB', '2020-10-22 23:00:00'),
(4, '596509313', 'CT2', 5000000, 'học phí', '00', '13407176', 'NCB', '2020-10-23 00:00:00'),
(5, '70267166', 'CT2', 5000000, 'học phí', '00', '13407178', 'NCB', '2020-10-23 00:00:00'),
(6, '1672349048', 'CT1', 150000, 'học phí', '00', '13407729', 'NCB', '2020-10-23 21:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `content`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(1, 'Bếp Sunny', 5, 'Tủ Bếp Sunny\r\nGiảm giá 50% áp dụng cho hàng trưng bày tại cửa hàng.\r\n\r\nGiao hàng: 60 ngày\r\nBảo hành 3 năm\r\nMiễn phí thiết kế khi đặt hàng\r\n\r\nKích thước: Tủ bếp Sunny có nhiều kích thước tùy theo không gian thực tế nhà bếp\r\nVật liệu:\r\nThùng MFC chống ẩm, cửa, mặt hộc MDF sơn bóng 30% và MDF walnut, bản lề, đế bản lề, nêm giảm chấn Blum, tay nắm ray thường Hafele\r\nMàu sắc:\r\nKhông có sẵn\r\nLiên hệ hotline: 1800 7200 để được hướng dẫn', '<p>Mô tả<br />\r\nTủ bếp Sunny với vật liệu gỗ công nghiệp chống ẩm sơn bóng, bên cạnh nét thiết kế hiện đại hiển hiện trong từng món đồ được trang bị đầy đủ công năng nhưng vẫn rất gọn gàng.</p>\r\n\r\n<p>Hướng dẫn sử dụng</p>\r\n\r\n<hr />\r\n<p>Gợi ý kết hợp</p>\r\n\r\n<ul>\r\n	<li><a href=\"http://nhaxinh.com/Dao-bep-Sunny_m101_p279.html\" style=\"box-sizing: border-box; color: rgb(34, 34, 34); text-decoration-line: none; background-color: transparent; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline;\"><img alt=\"Đảo bếp Sunny\" src=\"http://nhaxinh.com/photo/dao-bep-sunny-01.jpg\" style=\"border:0px; box-sizing:border-box; color:rgb(51, 51, 51); display:block; height:177px; margin:0px; outline:0px; padding:0px; vertical-align:baseline; width:280px\" title=\"Đảo bếp Sunny\" /></a>\r\n\r\n	<h3>Đảo bếp Sunny</h3>\r\n	</li>\r\n	<li><a href=\"http://nhaxinh.com/Tu-Bep-Sunny_m99_p6411.html\" style=\"box-sizing: border-box; color: rgb(34, 34, 34); text-decoration-line: none; background-color: transparent; margin: 0px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline;\"><img alt=\"Tủ Bếp Sunny\" src=\"http://nhaxinh.com/photo/tu-bep_-_copy.jpg\" style=\"border:0px; box-sizing:border-box; color:rgb(51, 51, 51); display:block; height:177px; margin:0px; outline:0px; padding:0px; vertical-align:baseline; width:280px\" title=\"Tủ Bếp Sunny\" /></a>\r\n	<h3>Tủ Bếp Sunny</h3>\r\n	</li>\r\n</ul>', 9000000, 8000000, 'A273d-tubep1.jpg', 'Cái', 1, '2016-10-26 03:00:16', '2021-03-23 10:22:41'),
(11, 'Ghế làm việc', 3, 'Ghế làm việc High Bossy\r\n17.760.000\r\n22.200.000\r\nMã sản phẩm: 3*91810\r\nKích thước: D570 - R570 - C1130-1230\r\nVật liệu:\r\nChân kim loại, bọc da công nghiệp\r\nMàu sắc:\r\nCó sẵn', '<div style=\"margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: \">\r\n<p>Mô tả</p>\r\n\r\n<p>Hướng dẫn sử dụng</p>\r\n</div>', 2000000, 1800000, 'veJAc-ghelv.jpg', 'cái', 0, '2016-10-12 02:00:00', '2021-03-23 10:20:19'),
(19, 'Bàn làm việc Maxine', 2, 'Bàn làm việc Maxine\r\n52.900.000\r\nMã sản phẩm: 3*86828\r\nKích thước: D1800-R750/1180-C750\r\nVật liệu:\r\nGỗ + MDF veneer Haydua + Chân inox màu gold\r\nMàu sắc:\r\nCó sẵn', '<p>Mô tả<br />\r\nMột thiết kế bàn làm việc đẳng cấp cho không gian làm việc của bạn, Maxine sử dụng chất liệu da trên bề mặt, khung gỗ hoàn thiện mdf veneer nâu trầm sang trọng tạo cảm giác thư thái, nhẹ nhàng. Công năng của chiếc bàn được sắp tối ưu với các hộc kéo rộng.<br />\r\nMaxine – Nét nâu trầm sang trọng<br />\r\nMaxine, mang thiết kế vượt thời gian, gửi gắm và gói gọn lại những nét đẹp của thiên nhiên và con người nhưng vẫn đầy tính ứng dụng cao trong suốt hành trình phiêu lưu của nhà thiết kế người Pháp Dominique Moal. Bộ sưu tập nổi bật với màu sắc nâu trầm sang trọng, là sự kết hợp giữa gỗ, da bò và kim loại vàng bóng. Đặc biệt trên mỗi sản phẩm, những nét bo viên, chi tiết kết nối được sử dụng kéo léo tạo ra điểm nhất rất riêng cho bộ sưu tập. Maxine thể hiện nét trầm tư, thư giãn để tận hưởng không gian sống trong nhịp sống hiện đại. Sản phẩm thuộc BST Maxine được sản xuất tại Việt Nam.</p>\r\n\r\n<p>Hướng dẫn sử dụng</p>', 7000000, 0, 'wP0G3-blv.jpg', 'cái', 1, '2016-10-13 02:20:00', '2021-03-23 10:26:30'),
(26, 'Tủ áo hiện đại', 1, 'Tủ áo hiện đại\r\n21.165.000\r\n24.900.000\r\nMã sản phẩm: 3*99496\r\nKích thước: D1600-R600-C2000mm\r\nVật liệu:\r\nMFC chống ẩm -phụ kiện Hafele\r\nMàu sắc:\r\nCó sẵn', '<h1>&nbsp;</h1>\r\n\r\n<p>Mô tả<br />\r\nMẫu tủ áo hiện đại của Nhà Xinh với thiết kế giản đơn, tối đa tiện ích bằng nhiều ngăn kéo và khoảng trống để cất trữ quần áo và đồ đạc.</p>\r\n\r\n<p>Hướng dẫn sử dụng</p>', 5000000, 450000, 'STAtK-3-99496-1_-_copy.jpg', 'cái', 1, '2016-10-13 02:20:00', '2021-03-23 10:33:02'),
(27, 'Tủ trưng bày So Chic', 2, 'Tủ trưng bày So Chic\r\n27.540.000\r\n45.900.000\r\nMã sản phẩm: 3*70503\r\nKích thước: D1580 - R420 - C1450\r\nVật liệu:\r\nGỗ - MDF veneer walnut', '<p>Tủ trưng bày So Chic với thiết kế hiện đại tinh tế, màu gỗ Walnut điểm sắc cam cá tính mạnh mẽ sẽ thổi một làn gió mới lạ vào phòng khách nhà bạn.</p>\r\n\r\n<p>Hướng dẫn sử dụng</p>', 10000000, 7500000, '84cAj-tu-trung-bay-500.jpg', 'cái', 1, '2016-10-13 02:20:00', '2021-03-23 10:52:27'),
(45, 'Ghế ăn HC', 3, 'Ghế ăn HC\r\n2.805.000\r\n3.300.000\r\nMã sản phẩm: 3*96771\r\nKích thước: D500 - R600 - C920\r\nVật liệu:\r\nChân kim loại - da công nghiệp\r\nMàu sắc:\r\nKhông có sẵn', '<p>Mô tả</p>\r\n\r\n<p>Hướng dẫn sử dụng</p>', 1200000, 800000, 'pTfkX-ghe_an_hc-1_-_copy.jpg', 'cái', 1, '2016-10-13 02:20:00', '2021-03-23 10:48:04'),
(47, 'Giường ngủ màu AP7A1', 4, 'Giường ngủ bọc vải Miami 1m8 hiện đại màu AP7A1\r\n18.500.000\r\nMã sản phẩm: 3*97981\r\nKích thước: D2000- R1800- C1210 mm\r\nVật liệu:\r\nGỗ sồi tự nhiên - MDF chống ẩm -vải cao cấp\r\nMàu sắc:\r\nKhông có sẵn\r\n*Giảm giá 15% khi mua 3 sản phẩm bất kì trong Bộ Sưu Tập Miami\r\n(12/03 -28/03/2021)', '<p><span style=\"font-family:arial\">Mô tả</span><br />\r\n<span style=\"font-family:arial\">Giường ngủ bọc vải Miami 1m8 màu AP7A1 sử dụng gỗ Sồi trắng nhập khẩu từ Mỹ kết hợp MDF chống ẩm cao cấp tạo nên sự chắc chắn cho sản phẩm. Nhờ vào tone ấm của gỗ, giường Miami mang đến một sự hài hòa, đặc trưng của phong cách nội thất Bắc Âu.</span></p>', 1400000, 9000000, 'dbzwt-re9Mk-giuong_iris_1m6_stone.jpg', 'cái', 1, '2016-10-13 02:20:00', '2021-03-23 11:04:10'),
(63, 'Sofa Poppy góc trái vải màu cam', 6, 'Sofa Poppy góc trái vải màu cam\r\n25.415.000\r\n29.900.000\r\nMã sản phẩm: 3*101806\r\nKích thước: D2400/1350 - R830 - C700 mm\r\nVật liệu:\r\nChân gỗ - Vải cao cấp\r\nMàu sắc:\r\nKhông có sẵn', '<p>Mô tả</p>\r\n\r\n<p>Hướng dẫn sử dụng</p>', 3000000, 2600000, '9ERmZ-sofa-vai-3-101806_(1).jpg', 'cái', 1, '2021-03-23 10:37:30', '2021-03-23 10:37:30'),
(64, 'Giường hộc kéo Iris 1m8 Stone', 4, 'Giường hộc kéo Iris 1m8 Stone\r\n13.515.000\r\n15.900.000\r\nMã sản phẩm: 3*100034\r\nKích thước: D2000- R1800- C1112 mm\r\nVật liệu:\r\nKhung gỗ bọc vải\r\nMàu sắc:\r\nCó sẵn\r\nKhông bao gồm nệm, drap', '<p><span style=\"font-family:arial\">Mô tả</span><br />\r\n<span style=\"font-family:arial\">Giường hộc kéo Iris 1m6 với thiết kế đóng nút đầu giường, điểm đặc biệt là bốn ngăn chứa đồ rộng thuận tiện cất những vật dụng trong phòng ngủ như gối, mền, drap hết sức gọn gàng. Chắc chắn sẽ là sự lựa chọn tối ưu cho không gian phòng ngủ hiện đại. Giường hộc kéo Iris có 2 kích thước 1m6 và 1m8, đa dạng màu sắc.</span></p>', 5500000, 4800000, 're9Mk-giuong_iris_1m6_stone.jpg', 'cái', 0, '2021-03-23 10:42:04', '2021-03-23 10:42:04'),
(65, 'Bàn trang điểm Venice', 7, 'Bàn trang điểm Venice\r\n8.950.000\r\n17.900.000\r\nMã sản phẩm: 3*64890\r\nKích thước: D1200 - R500 - C1350\r\nVật liệu:\r\nGỗ xà cừ - MDF veneer xà cừ\r\nMàu sắc:\r\nCó sẵn', '<p>Mô tả<br />\r\nBàn trang điểm Venice là sự lựa chọn cho các gia chủ yêu thích phong cách cổ điển, duyên dáng yêu kiều. Bàn được làm bằng chất liệu gỗ xà cừ, kiểu dáng tao nhã, thanh mảnh nhưng vẫn chắc chắn. Bàn trang điểm Venice sẽ là điểm nhấn nhẹ nhàng cho không gian phòng ngủ.</p>\r\n\r\n<p>Hướng dẫn sử dụng</p>', 7232000, 6800000, '48Z13-280-ban_phan_venice_a_l.jpg', 'cái', 1, '2021-03-23 10:58:24', '2021-03-23 10:58:24'),
(66, 'Tủ bếp Paris', 5, 'Tủ bếp Paris\r\nGiao hàng: 60 ngày\r\nBảo hành 3 năm\r\nMiễn phí thiết kế khi đặt hàng\r\n\r\nKích thước: Tùy theo không gian nhà bếp thực tế\r\nVật liệu:\r\nGỗ - MDF sơn bóng\r\nMàu sắc:\r\nKhông có sẵn', '<p>Mô tả</p>\r\n\r\n<p>Hướng dẫn sử dụng</p>', 5000000, 4000000, 'lk7Dc-nha-xinh-tu-bep-paris.jpg', 'cái', 0, '2021-03-23 11:02:00', '2021-03-23 11:02:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`, `created_at`, `updated_at`) VALUES
(2, 'khuongpro9x.com', 'uCukh-Phong-khach-Biet-thu-nha-anh-Luong-Bac-Giang-03-5-1.jpg', '2017-07-15 09:42:35', '2021-03-23 11:08:40'),
(4, 'pro9x.com', 'ryb91-slide-shomesg-6.jpg', '2017-07-15 09:42:35', '2021-03-23 11:10:15'),
(8, 'pro9x.com', 'RXiSP-a2zdecor-phongkhach-slide.jpg', '2021-03-23 11:17:51', '2021-03-23 11:17:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `alias`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Tủ', 'Tủ', 'tu', 'zUJXZ-tu.jpg', '2017-07-03 17:00:00', '2021-03-23 09:54:45'),
(2, 'Bàn', 'Bàn', 'ban', 'WpPET-ban.jpg', '2016-10-12 02:16:15', '2021-03-23 09:55:59'),
(3, 'Ghế', 'Ghế', 'ghe', 'NO8k1-ghe.jpg', '2016-10-18 00:33:33', '2021-03-23 09:57:18'),
(4, 'Giường', 'Giường', 'giuong', '6yxaX-giuong.jpg', '2016-10-26 03:29:19', '2021-03-23 09:59:27'),
(5, 'Tủ bếp', 'Tủ bếp', 'tu-bep', 'UPLui-tubep.jpg', '2016-10-28 04:00:00', '2021-03-23 10:01:20'),
(6, 'Sofa', 'Sofa', 'sofa', '5crmo-sofa.jpg', '2016-10-25 17:19:00', '2021-03-23 10:03:09'),
(7, 'Bàn trang điểm', 'Bàn trang điểm', 'ban-trang-diem', 'cEVh2-btd.jpg', '2016-10-25 17:19:00', '2021-03-23 10:05:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quyen` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `quyen`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'nguyenhoangkhuong', 'admin@gmail.com', '$2y$10$E5jArL/b8M4aOZCRAKqXduZvkHyCP7IWz.NXrUeUUZhAbiTkNmEQu', '0367543124', 1, 'TP.HCM', 'z6FpZJalL02bJnx2LOXZ6FxGA4wAAygRCbP3L3Q9nGwQCJWyjCTwTxhnqrFU', '2021-03-08 06:03:33', '2021-03-08 06:03:33'),
(9, 'nguyen quang vinh', 'quangvinh99er@gmail.com', '$2y$10$40cSaRARmAIdqcAK.gjUAuhNv7ezs672xFf2dC4TGqgsPBrcUbyrq', '0786514678', NULL, '123 trần phú', 'uHmQHwx07hU7Hy6X25a1mC6RhRoSd881YvV8nlaqVNAmj3u5Av87ExUF0wd0', '2021-03-14 15:14:10', '2021-03-14 15:14:10');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
