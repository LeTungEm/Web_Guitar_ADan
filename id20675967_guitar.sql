-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 31, 2024 at 02:22 PM
-- Server version: 10.5.20-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id20675967_guitar`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `pass` text NOT NULL,
  `salt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `user_name`, `pass`, `salt`) VALUES
(2, '0898026487', 'MTIzNDU=', 0);

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `blog_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `is_show` tinyint(4) NOT NULL DEFAULT 1,
  `slug` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`blog_id`, `name`, `short_description`, `description`, `create_date`, `type`, `image`, `is_show`, `slug`) VALUES
(2, '[TẬP 2 ]-THIỆN NGUYỆN CÙNG BỜM - | BỜM guitar 0898026487', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/f07zhO2ywXM?si=XnesEFP4uOkT9h19\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>', '<p style=\"text-align: center;\"><strong><u><span style=\"font-size: 48px;\">H&igrave;nh ảnh thiện nguyện năm mới</span></u></strong></p><p><span contenteditable=\"false\" class=\"fr-img-caption fr-fic fr-dib fr-draggable\" style=\"width: 534px;\" draggable=\"false\"><span class=\"fr-img-wrap\"><a href=\"https://www.pace.edu.vn/tin-kho-tri-thuc/ban-hang-la-gi\" target=\"_blank\" rel=\"noopener noreferrer\"><img src=\"https://webbooksstore.000webhostapp.com/back_end/api/Controllers/GetFileController.php?imgURL=word/81679407image_news.jpg&width=1200\" style=\"width: 50%;\" class=\"fr-fic fr-dib\"><span class=\"fr-inner\" contenteditable=\"true\">Ảnh n&agrave;y c&oacute; link đến trang kh&aacute;c</span></a></span></span></p><blockquote><blockquote><blockquote><ol style=\"list-style-type: lower-alpha;\"><li style=\"text-align: justify;\">Logo ph&iacute;a tr&ecirc;n</li><li style=\"text-align: justify;\">Log ph&iacute;a dưới</li><li style=\"text-align: justify;\">Logo ẩn.</li></ol></blockquote></blockquote></blockquote>', '2024-01-14 09:41:07', 'tn', '794763171.jpg', 1, '[tap-2-]-thien-nguyen-cung-bom---|-bom-guitar-0898026487'),
(6, 'Đập hộp đàn mới', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/lu6iMW6wQOQ?si=bMD6PzZDWgrdQJWF\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>', '', '2024-01-20 05:35:47', 'bc', 'default.jpg', 1, 'đap-hop-đan-moi'),
(7, 'Đập hộp đàn ngày mới', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Xbb6sNzLZqE?si=EFi7mbITZ66cYbPM\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>', '', '2024-01-20 05:36:40', 'bc', 'default.jpg', 1, 'đap-hop-đan-ngay-moi'),
(8, '    0:02 / 11:03  [TẬP 1]-THIỆN NGUYỆN CÙNG BỜM- | BỜM guitar 0898026487', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/32XAfl1HAvM?si=oZzQaPuaY-rSDT0B\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>', '', '2024-01-20 05:56:44', 'tn', 'undefined', 1, '----0:02-/-11:03--[tap-1]-thien-nguyen-cung-bom--|-bom-guitar-0898026487'),
(9, '[LIVE 49] -TRỰC TIẾP ĐẬP HỘP & BÁO GIÁ NÓNG GUITAR ĐẤU GIÁ CẬP CẢNG - | BỜM guitar 0898026487', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CgnjvmSLYBk?si=Rv_zKG19L8HKsnSS\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>', '', '2024-01-31 13:55:31', 'tn', 'gggdefault.jpg', 1, '[live-49]--truc-tiep-đap-hop-&-bao-gia-nong-guitar-đau-gia-cap-cang---|-bom-guitar-0898026487');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `name`) VALUES
(1, 'YAMAHA'),
(2, 'MORRIS'),
(5, 'ANTONIO SANCHEZ'),
(6, 'JAMES'),
(7, 'SUZUKI'),
(8, 'MATSUOKA'),
(9, 'ARIA'),
(10, 'NGHỆ NHÂN'),
(11, 'TAYLOR');

-- --------------------------------------------------------

--
-- Table structure for table `cat`
--

CREATE TABLE `cat` (
  `cat_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `price` int(11) NOT NULL,
  `new_price` int(11) NOT NULL DEFAULT 0,
  `brand` varchar(70) DEFAULT NULL,
  `origin` varchar(70) DEFAULT NULL,
  `outstanding` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `isProfes` int(11) NOT NULL DEFAULT 1,
  `type` varchar(10) NOT NULL DEFAULT 'product',
  `isShow` tinyint(1) NOT NULL DEFAULT 1,
  `image` text DEFAULT NULL,
  `video` text DEFAULT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `category_id` tinyint(1) DEFAULT NULL,
  `isBestSeller` tinyint(1) NOT NULL DEFAULT 0,
  `isNew` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cat`
--

INSERT INTO `cat` (`cat_id`, `name`, `slug`, `price`, `new_price`, `brand`, `origin`, `outstanding`, `description`, `status`, `isProfes`, `type`, `isShow`, `image`, `video`, `is_delete`, `category_id`, `isBestSeller`, `isNew`) VALUES
(2, 'dan loai 2', 'dan-loai-2', 2000000, 0, '2', '1', NULL, NULL, 0, 1, 'product', 1, '[]', '[]', 0, 3, 1, 0),
(3, 'dan loai 3', 'dan-loai-3', 40000000, 3500000, '1', '2', NULL, NULL, 0, 1, 'product', 1, '[]', '[]', 0, 4, 1, 0),
(4, 'dan loai 4', 'dan-loai-4', 3000000, 0, '1', '2', NULL, NULL, 0, 1, 'product', 1, '[]', '[]', 0, 3, 1, 1),
(5, 'dan loai 5', 'dan-loai-5', 7000000, 0, '2', '1', NULL, NULL, 1, 1, 'product', 1, '[]', '[]', 0, 3, 1, 1),
(6, 'Yukinobuchai No.10', 'yukinobuchai-no.10', 15000000, 12500000, '2', '2', '<p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" id=\"isPasted\"><strong>Specification:</strong></p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Body length: 425 mm</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Body depth: 98-102 mm</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Upper bout width: 240 mm</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Lower bout width: 320 mm</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Waist width: 210 mm</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Top: Solid Spruce</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Back &amp; Sides: Indian Rosewood Doubleplate</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">&ldquo;Laminated&rdquo; l&agrave; thuật ngữ đối với đ&agrave;n guitar sản xuất tại Nhật Bản. Những tấm &quot;laminate&quot; n&agrave;y được l&agrave;m từ 2 lớp gỗ nguy&ecirc;n khối d&aacute;n lại với nhau bằng nhựa tự nhi&ecirc;n. Ch&uacute;ng được chế tạo tốt đến mức ch&uacute;ng hoạt động tốt như gỗ nguy&ecirc;n khối trong khi sản xuất đ&agrave;n ghi-ta rẻ hơn nhiều v&agrave; c&oacute; khả năng chống nứt tốt hơn nhiều khi sử dụng thường xuy&ecirc;n.</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Neck: Mahogany</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Fingerboard: Ebony</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Scale: 530 mm</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Nut width: 51 mm</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">String spacing at the nut: 41 mm</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">String spacing at the bridge: 57 mm</p><p data-f-id=\"pbf\" style=\"text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;\">Powered by <a href=\"https://www.froala.com/wysiwyg-editor?pb=1\" title=\"Froala Editor\">Froala Editor</a></p>', '<p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" id=\"isPasted\"><strong>Specification:</strong></p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Body length: 425 mm</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Body depth: 98-102 mm</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Upper bout width: 240 mm</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Lower bout width: 320 mm</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Waist width: 210 mm</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Top: Solid Spruce</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Back &amp; Sides: Indian Rosewood Doubleplate</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">&ldquo;Laminated&rdquo; l&agrave; thuật ngữ đối với đ&agrave;n guitar sản xuất tại Nhật Bản. Những tấm &quot;laminate&quot; n&agrave;y được l&agrave;m từ 2 lớp gỗ nguy&ecirc;n khối d&aacute;n lại với nhau bằng nhựa tự nhi&ecirc;n. Ch&uacute;ng được chế tạo tốt đến mức ch&uacute;ng hoạt động tốt như gỗ nguy&ecirc;n khối trong khi sản xuất đ&agrave;n ghi-ta rẻ hơn nhiều v&agrave; c&oacute; khả năng chống nứt tốt hơn nhiều khi sử dụng thường xuy&ecirc;n.</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Neck: Mahogany</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Fingerboard: Ebony</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Scale: 530 mm</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">Nut width: 51 mm</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">String spacing at the nut: 41 mm</p><p style=\"margin: 0px 0px 1.5em; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-variant-numeric: ; font-variant-east-asian: ; font-variant-alternates: ; font-variant-position: ; font-weight: 400; font-stretch: ; font-size: 16px; line-height: ; font-family: ; font-optical-sizing: ; font-kerning: ; font-feature-settings: ; font-variation-settings: ; color: rgb(33, 33, 33); letter-spacing: -0.16px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\">String spacing at the bridge: 57 mm</p><p data-f-id=\"pbf\" style=\"text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;\">Powered by <a href=\"https://www.froala.com/wysiwyg-editor?pb=1\" title=\"Froala Editor\">Froala Editor</a></p>', 1, 1, 'product', 1, '[\"391464204.jpg\",\"30672815.jpg\",\"701236143.jpg\",\"164282178.jpg\",\"744678261.jpg\",\"718834816.jpg\",\"363333092.jpg\"]', '[]', 0, 4, 1, 1),
(7, 'phụ kiện 1', 'phu-kien-1', 2000000, 0, '1', '1', 'null', 'null', 1, 1, 'accessory', 1, '[]', '[]', 0, 8, 0, 0),
(10, 'phu kiện đàn mới', 'phu-kien-đan-moi', 200000, 180000, '2', '2', '', '', 1, 1, 'accessory', 1, '[\"342490395b4eee34c051e602a568ce17.jpg\"]', '[]', 0, 8, 0, 0),
(11, 'Classic Aranjuez No.706 (kèm hộp)', 'classic-aranjuez-no.706-(kem-hop)', 10500000, 9500000, '2', '2', '<p style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; font-family: roboto, sans-serif; line-height: 24px; font-weight: normal; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" id=\"isPasted\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-size: 20px; vertical-align: baseline;\">ARANJUEZ 706</span></p><p style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; font-family: roboto, sans-serif; line-height: 24px; font-weight: normal; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-size: 20px; vertical-align: baseline;\">C&acirc;y đ&agrave;n Aranjuez 706 n&agrave;y l&agrave; của xưởng Ryoji Matsuoka v&agrave;o cuối những năm 2000. Mặc d&ugrave; n&oacute; l&agrave; một trong những m&ocirc; h&igrave;nh cấp thấp hơn, n&oacute; l&agrave; một nhạc cụ c&oacute; &acirc;m thanh tuyệt vời, vượt xa nhiều c&acirc;y đ&agrave;n hiện đang được b&aacute;n ở Mỹ với gi&aacute; $ 2000 +.</span></p><p style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; font-family: roboto, sans-serif; line-height: 24px; font-weight: normal; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-size: 20px; vertical-align: baseline;\">Takamine C132S (hiện được b&aacute;n ở Mỹ với gi&aacute; $ 1,099) kh&ocirc;ng c&oacute; cơ hội chống lại c&acirc;y đ&agrave;n Aranjuez 706 n&agrave;y.</span></p><p style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; font-family: roboto, sans-serif; line-height: 24px; font-weight: normal; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-size: 20px; vertical-align: baseline;\">D&ograve;ng guitar Aranjuez được th&agrave;nh lập bởi Masaru Kohno v&agrave;o đầu những năm 1970 với t&ecirc;n gọi chủ yếu d&agrave;nh cho thị trường Nhật Bản. Ban đầu ch&uacute;ng được l&agrave;m bởi xưởng Takamine dưới sự gi&aacute;m s&aacute;t của Kohno. Từ đầu những năm 1980 đến giữa những năm 2010, ch&uacute;ng được chế tạo bởi xưởng Ryoji Matsuoka. B&acirc;y giờ ch&uacute;ng được l&agrave;m lại bởi Takamine.</span></p><p style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; font-family: roboto, sans-serif; line-height: 24px; font-weight: normal; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-size: 20px; vertical-align: baseline;\">Kể từ nguồn gốc của thương hiệu n&agrave;y, c&aacute;c m&ocirc; h&igrave;nh h&agrave;ng đầu đ&atilde; được lắp r&aacute;p v&agrave; ho&agrave;n thiện tại xưởng của Kohno. Phần th&acirc;n của những m&ocirc; h&igrave;nh h&agrave;ng đầu n&agrave;y được sản xuất bởi c&aacute;c xưởng Takamine hoặc Matsuoka, trong khi soundboards do ch&iacute;nh Masaru Kohno chế tạo v&agrave; những năm sau đ&oacute; bởi Masaki Sakurai.</span></p><p style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; font-family: roboto, sans-serif; line-height: 24px; font-weight: normal; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-size: 20px; vertical-align: baseline;\">B&iacute; mật của những c&acirc;y đ&agrave;n Aranjuez l&agrave; ch&uacute;ng lu&ocirc;n mang lại gi&aacute; trị đặc biệt cho người chơi với mức ng&acirc;n s&aacute;ch vừa phải. Những mẫu đ&agrave;n Aranjuez h&agrave;ng đầu cho &acirc;m thanh hay hơn nhiều c&acirc;y đ&agrave;n kh&aacute;c do c&aacute;c nh&agrave; sản xuất h&agrave;ng đầu Nhật Bản b&aacute;n với gi&aacute; cao gấp 2 lần. Năm 1974, mẫu xe h&agrave;ng đầu l&agrave; No7 c&oacute; gi&aacute; 70 000 y&ecirc;n. N&oacute; nghe hay hơn nhiều so với mẫu 10 của Koho c&oacute; gi&aacute; 100 000 y&ecirc;n. Chỉ c&oacute; Kohno 15 l&agrave; c&oacute; chất lượng tương đương. Hiện tại, mẫu Aranjuez 725 (vẫn đang được lắp r&aacute;p v&agrave; ho&agrave;n thiện bởi Masaki Sakurai) c&oacute; gi&aacute; 250 000 y&ecirc;n. N&oacute; &acirc;m thanh tốt hơn nhiều so với nhiều c&acirc;y đ&agrave;n guitar kh&aacute;c được b&aacute;n ở Nhật Bản với gi&aacute; 500 000 y&ecirc;n.</span></p><p style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; font-family: roboto, sans-serif; line-height: 24px; font-weight: normal; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-size: 20px; vertical-align: baseline;\">C&acirc;y đ&agrave;n n&agrave;y vẫn trong t&igrave;nh trạng tổng thể tuyệt vời với những dấu hiệu sử dụng rất nhỏ. B&ecirc;n cạnh một vết m&agrave;i m&ograve;n / vết l&otilde;m kh&aacute; nhỏ nằm ở ph&iacute;a sau cổ, phần th&acirc;n của c&acirc;y đ&agrave;n n&agrave;y kh&ocirc;ng c&oacute; bất kỳ sai s&oacute;t dễ thấy n&agrave;o.</span></p><p style=\"box-sizing: border-box; margin: 0px 0px 5px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; font-family: roboto, sans-serif; line-height: 24px; font-weight: normal; color: rgb(51, 51, 51); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-size: 20px; vertical-align: baseline;\">Mặc d&ugrave; c&oacute; lẽ kh&ocirc;ng phải l&agrave; loại d&agrave;nh cho buổi h&ograve;a nhạc, nhưng c&acirc;y đ&agrave;n n&agrave;y c&oacute; &acirc;m thanh đẹp, đủ để được gọi l&agrave; tuyệt vời. N&oacute; cung cấp &acirc;m lượng v&agrave; phản hồi tuyệt vời, &acirc;m sắc ngọt ng&agrave;o v&agrave; ấm &aacute;p, với độ r&otilde; r&agrave;ng v&agrave; t&aacute;ch bạch của nốt rất cao. N&oacute; chỉ đơn giản l&agrave; cung cấp nhiều hơn những g&igrave; người ta c&oacute; thể mong đợi chỉ bằng c&aacute;ch nh&igrave;n v&agrave;o gi&aacute; của n&oacute;.</span></p><p data-f-id=\"pbf\" style=\"text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;\">Powered by <a href=\"https://www.froala.com/wysiwyg-editor?pb=1\" title=\"Froala Editor\">Froala Editor</a></p>', '<p><br></p><p>nhin xuongs</p><p data-f-id=\"pbf\" style=\"text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;\">Powered by <a href=\"https://www.froala.com/wysiwyg-editor?pb=1\" title=\"Froala Editor\">Froala Editor</a></p>', 1, 1, 'product', 1, '[\"40292362.jpg\",\"973594114.jpg\"]', '[]', 0, 3, 1, 0),
(13, 'Dan loai mới', 'dan-loai-moi', 2500000, 2200000, '1', '2', '<p>Đ&agrave;n <strong><u><em>mới</em></u></strong></p><p data-f-id=\"pbf\" style=\"text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;\">Powered by <a href=\"https://www.froala.com/wysiwyg-editor?pb=1\" title=\"Froala Editor\">Froala Editor</a></p>', '<p><br><img src=\"https://webbooksstore.000webhostapp.com/back_end/api/Controllers/GetFileController.php?imgURL=word/90397573image_news.jpg&width=1200\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p data-f-id=\"pbf\" style=\"text-align: center; font-size: 14px; margin-top: 30px; opacity: 0.65; font-family: sans-serif;\">Powered by <a href=\"https://www.froala.com/wysiwyg-editor?pb=1\" title=\"Froala Editor\">Froala Editor</a></p>', 1, 1, 'product', 1, '[\"160580138b096860-c21c-4ff6-a6c0-4a32ac409689.jpg\",\"66761705png-clipart-electric-guitar-music-coloring-book-acoustic-guitar-electric-guitar-adult-guitar-accessory.jpg\"]', '[\"<iframe width=\\\"560\\\" height=\\\"315\\\" src=\\\"https://www.youtube.com/embed/A60nONwNi9o?si=9ibnW4ysxfHf-33A\\\" title=\\\"YouTube video player\\\" frameborder=\\\"0\\\" allow=\\\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\\\" allowfullscreen></iframe>\",\"<iframe width=\\\"560\\\" height=\\\"315\\\" src=\\\"https://www.youtube.com/embed/_ShpHLF9Ou8?si=yzKUEvbiZigl0bqP\\\" title=\\\"YouTube video player\\\" frameborder=\\\"0\\\" allow=\\\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\\\" allowfullscreen></iframe>\"]', 0, 3, 1, 1),
(16, 'phuj kienj 2', 'phuj-kienj-2', 230000, 0, '2', '2', '', '', 1, 1, 'accessory', 1, '[\"31366885screenshot-2023-12-01-193826.jpg\"]', '[]', 0, 8, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_category` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `slug`, `description`, `parent_category`) VALUES
(3, 'guitar Classic', 'guitar-classic', NULL, 0),
(4, 'guitar Acoustic', 'guitar-acoustic', NULL, 0),
(5, 'classic loai 1', 'classic-loai-1', NULL, 3),
(6, 'classic loai 2', 'classic-loai-2', '', 3),
(7, 'cổ loại 1', 'co-loai-1', NULL, 4),
(8, 'Phụ kiện', 'phu-kien', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `origin`
--

CREATE TABLE `origin` (
  `origin_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `origin`
--

INSERT INTO `origin` (`origin_id`, `name`) VALUES
(1, 'NHẬT BẢN'),
(2, 'TÂY BAN NHA'),
(3, 'MỸ'),
(4, 'NƯỚC KHÁC');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `footer_content` text DEFAULT NULL,
  `facebook` varchar(200) DEFAULT NULL,
  `tiktok` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `youtube` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `zalo` varchar(200) NOT NULL,
  `messenger` varchar(200) NOT NULL,
  `client_respons` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`footer_content`, `facebook`, `tiktok`, `instagram`, `youtube`, `phone`, `zalo`, `messenger`, `client_respons`) VALUES
('Tùng đã sửa trên laptop', 'https://www.facebook.com/bomguitar', 'https://www.tiktok.com/@bom.guitar', 'https://www.instagram.com/bom.guitar', 'https://www.youtube.com/@bom.guitar', '0898026487', 'https://zalo.me/84898026487', 'link message', '[\"client_responses/78855872z4845226081930_51c912fa76abf13b852d42eacee4d070.jpg\",\"client_responses/25992654z4845241578369_13bd266c8e731bc58880d332325598ee.jpg\",\"client_responses/90636486z4845242906633_f50dfe569d2d7c6eab8fd21619fbff29.jpg\",\"client_responses/4789921887120701_1490292901145139_633151485932208128_n.jpg\",\"client_responses/3552874987187246_1348066518706172_7978677633867055104_n.jpg\",\"client_responses/46067998128550231_1699511770220926_6650380842401954467_o.jpg\",\"client_responses/71369425Au1.jpg\"]');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cat`
--
ALTER TABLE `cat`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `origin`
--
ALTER TABLE `origin`
  ADD PRIMARY KEY (`origin_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cat`
--
ALTER TABLE `cat`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `origin`
--
ALTER TABLE `origin`
  MODIFY `origin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
