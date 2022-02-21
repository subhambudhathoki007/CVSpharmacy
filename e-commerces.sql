-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Sep 30, 2021 at 02:27 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-commerces`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_contacts`
--

CREATE TABLE `accounts_contacts` (
  `id` bigint(20) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `message` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_contacts`
--

INSERT INTO `accounts_contacts` (`id`, `firstname`, `lastname`, `email`, `phone`, `message`) VALUES
(1, 'Sanju', 'Maharjan', 'sanjumaharjan683@gmail.com', '9818696705', 'Do you have mantra latest version guitar?');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_profiles`
--

CREATE TABLE `accounts_profiles` (
  `id` bigint(20) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts_profiles`
--

INSERT INTO `accounts_profiles` (`id`, `firstname`, `lastname`, `username`, `email`, `phone`, `profile_pic`, `created_date`, `user_id`) VALUES
(1, 'Sanju', 'Maharjan', 'SanjuMaharjann', 'sanju12@gmail.com', '9818696705', 'static/profiles/profile1_pQyqkGY.jpg', '2021-09-28 07:03:11.170484', 5);

-- --------------------------------------------------------

--
-- Table structure for table `admins_fileuploads`
--

CREATE TABLE `admins_fileuploads` (
  `id` bigint(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `detail` longtext NOT NULL,
  `file` varchar(100) NOT NULL,
  `digital` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins_fileuploads`
--

INSERT INTO `admins_fileuploads` (`id`, `title`, `brand`, `price`, `detail`, `file`, `digital`) VALUES
(1, 'dreammaker dm-10c', 'DREAM MAKER', 210, 'Acoustic Guitar with Pick Up, Made In Korea, 1 year warranty, Includes a bag, set of strings, pick.', 'static/uploads/2_mzk0XtX.jpg', 0),
(2, 'dreammaker pro 8', 'DREAM MAKER', 380, 'This Acoustic guitar from Guitar Shop is specifically engineered for the serious player. Carefully selected tone woods to create a sound that is well balanced and articulate, especially for finger pickers.', 'static/uploads/1_P5tdnKW.jpg', 0),
(3, 'dreammaker dm200ce', 'DREAM MAKER', 165, 'It is a great-looking guitar  with a big, bold sound and excellent features that represent exceptional value.The slim neck provide comfortable feel and excellent play ability, and the smooth satin finish maximizes resonance for optimal sound quality.', 'static/uploads/5_NGEaPRs.jpg', 0),
(4, 'loop core', 'NUX', 184, 'Loop Core Deluxe allows you to record loop phrases up to 8 hours with unlimited layers in 24-bit high-resolution audio quality into 99 saved memories. Nothing feels better than playing your guitar along with realistic drum rhythms. Loop Core Deluxe’s all-new drum machine comes with 40 different drum rhythms (30 in 4/4, 10 in 3/4) covering different styles of genres including rock, pop, blues, jazz and much more.', 'static/uploads/4_ZklNUhu.png', 0),
(5, 'ic-1/mbk', 'SAMMICK', 294, 'Ic-1 Mbk Guitarra Eléctrica Serie The Vault Cuerpo de Alder, double cutaway Mango atornillado de Maple Ancho de cejilla 1 5/8” Diapasón de palo de rosa (12” radius) 24 trastes, escala 25 1/2” Accesorios cromados Clavijas Grover™ A102C 2 micrófonos humbucker 2 volumenes, 1 tono Llave selectora de 3 posiciones Colo negro metalizado', 'static/uploads/9_l481AuK.png', 0),
(6, 'ic-30/tbl', 'SAMMICK', 363, 'Double cutaway sculpted body 24 fret maple bolt-on neck; high tech quilt top Rosewood fingerboard Locking tremolo Hh duncan design pickups; grover tuners', 'static/uploads/8_LpOMsLx.jpg', 0),
(7, 'stingray', 'STERLING', 450, 'StingRay in Trans Blue Satin.Bringing the iconic, timeless instrument designs of Ernie Ball Music Man in a high quality, yet affordable build for musicians of all levels, from the first time buyer, to the seasoned player.', 'static/uploads/product12_5Bngq4H.png', 0),
(8, 'stingray', 'STERLING', 450, 'StingRay in Black.Bringing the iconic, timeless instrument designs of Ernie Ball Music Man in a high quality, yet affordable build for musicians of all levels, from the first time buyer, to the seasoned player.', 'static/uploads/product11_eNaYhKG.png', 1),
(9, 'av-1/bk', 'SAMMICK', 277, 'Specifications: Single cutaway Bound flat top Solid Nato body Maple bolt-on neck Nut width 1⅝″ Rosewood fingerboard (12″ radius) Dot inlay 22 fret, 24″ scale Chrome hardware Die cast tuners Stop tailpiece with adjustable bridge Dual humbucker pickups 1 volume and 1 tone control 3-way selector switch', 'static/uploads/product14_yZl95KI.jpg', 0),
(10, 'cng-1/ns', 'SAMMICK', 160, 'CNG-1/NS Greg Bennett Classic Guitar is an affordable, fine and high quality classical guitar. It had assembled spruce, mahogany and rosewood to form an instrument with excellent tone and play-ability that will inspire and encourage a player to pick this guitar up again and again!', 'static/uploads/3_28dOArd.jpg', 0),
(11, 'd1ce', 'MANTRA', 253, 'Mahogany top, back and sides Rosewood fret board and bridge Die-cast tuners', 'static/uploads/7_x7SlUvw.jpg', 0),
(12, 'guitar (pdi-1g)', 'NUX', 460, 'PDI-1G is a D.I. box to help to get very pure instrument signal to the mixer. With the speaker cabinet simulation function, you can plug your guitar or bass directly to the mixer thru PDI-1G.', 'static/uploads/product10_6D7lxdQ.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add file uploads', 7, 'add_fileuploads'),
(26, 'Can change file uploads', 7, 'change_fileuploads'),
(27, 'Can delete file uploads', 7, 'delete_fileuploads'),
(28, 'Can view file uploads', 7, 'view_fileuploads'),
(29, 'Can add contacts', 8, 'add_contacts'),
(30, 'Can change contacts', 8, 'change_contacts'),
(31, 'Can delete contacts', 8, 'delete_contacts'),
(32, 'Can view contacts', 8, 'view_contacts'),
(33, 'Can add profiles', 9, 'add_profiles'),
(34, 'Can change profiles', 9, 'change_profiles'),
(35, 'Can delete profiles', 9, 'delete_profiles'),
(36, 'Can view profiles', 9, 'view_profiles'),
(37, 'Can add order', 10, 'add_order'),
(38, 'Can change order', 10, 'change_order'),
(39, 'Can delete order', 10, 'delete_order'),
(40, 'Can view order', 10, 'view_order'),
(41, 'Can add shipping address', 11, 'add_shippingaddress'),
(42, 'Can change shipping address', 11, 'change_shippingaddress'),
(43, 'Can delete shipping address', 11, 'delete_shippingaddress'),
(44, 'Can view shipping address', 11, 'view_shippingaddress'),
(45, 'Can add order item', 12, 'add_orderitem'),
(46, 'Can change order item', 12, 'change_orderitem'),
(47, 'Can delete order item', 12, 'delete_orderitem'),
(48, 'Can view order item', 12, 'view_orderitem'),
(49, 'Can add events', 13, 'add_events'),
(50, 'Can change events', 13, 'change_events'),
(51, 'Can delete events', 13, 'delete_events'),
(52, 'Can view events', 13, 'view_events'),
(53, 'Can add event register', 14, 'add_eventregister'),
(54, 'Can change event register', 14, 'change_eventregister'),
(55, 'Can delete event register', 14, 'delete_eventregister'),
(56, 'Can view event register', 14, 'view_eventregister');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(3, 'pbkdf2_sha256$260000$GgkbEL3T4hR4zuBO76yvus$xr+DCsTqSPQg2Xa0htbr4BgqYD9tRRerEjjK9c0OYm8=', '2021-09-30 07:28:21.863300', 1, 'sanju', '', '', 'sanjumaharjan683@gmail.com', 1, 1, '2021-09-28 05:28:57.528675'),
(5, 'pbkdf2_sha256$260000$t3E1tRkC0h2eUWyK3XoPbE$SlcA1epi03Gr81gaTKSgMcbtI1D6uiEcSn/HWAaMzYE=', '2021-09-30 07:20:43.390860', 0, 'SanjuMaharjann', '', '', 'sanju12@gmail.com', 0, 1, '2021-09-28 07:03:08.011630'),
(10, '!hnH0GUmTKn1zW5myKHE2OPLGR6b9Z2VmEVi77n1U', NULL, 1, 'Sanju88', '', '', 'sandisprajapati52@gmail.com', 1, 1, '2021-09-30 07:26:13.352383');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(8, 'accounts', 'contacts'),
(9, 'accounts', 'profiles'),
(1, 'admin', 'logentry'),
(7, 'admins', 'fileuploads'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(14, 'guitars', 'eventregister'),
(13, 'guitars', 'events'),
(10, 'guitars', 'order'),
(12, 'guitars', 'orderitem'),
(11, 'guitars', 'shippingaddress'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-09-27 16:54:18.276182'),
(2, 'auth', '0001_initial', '2021-09-27 16:54:24.330980'),
(3, 'accounts', '0001_initial', '2021-09-27 16:54:25.426181'),
(4, 'accounts', '0002_contact', '2021-09-27 16:54:25.660471'),
(5, 'accounts', '0003_auto_20210910_1118', '2021-09-27 16:54:26.051012'),
(6, 'accounts', '0004_rename_profile_profiles', '2021-09-27 16:54:26.254520'),
(7, 'accounts', '0005_userotp', '2021-09-27 16:54:27.098588'),
(8, 'accounts', '0006_delete_userotp', '2021-09-27 16:54:27.165038'),
(9, 'accounts', '0007_userotp', '2021-09-27 16:54:28.201447'),
(10, 'accounts', '0008_delete_userotp', '2021-09-27 16:54:28.301356'),
(11, 'admin', '0001_initial', '2021-09-27 16:54:29.485362'),
(12, 'admin', '0002_logentry_remove_auto_add', '2021-09-27 16:54:29.504103'),
(13, 'admin', '0003_logentry_add_action_flag_choices', '2021-09-27 16:54:29.526395'),
(14, 'admins', '0001_initial', '2021-09-27 16:54:29.762495'),
(15, 'admins', '0002_auto_20210906_1223', '2021-09-27 16:54:30.378606'),
(16, 'admins', '0003_auto_20210906_1528', '2021-09-27 16:54:30.590195'),
(17, 'admins', '0004_delete_description', '2021-09-27 16:54:30.680160'),
(18, 'admins', '0005_fileuploads_digital', '2021-09-27 16:54:30.820442'),
(19, 'admins', '0006_adminprofile', '2021-09-27 16:54:31.675143'),
(20, 'admins', '0007_delete_adminprofile', '2021-09-27 16:54:31.828353'),
(21, 'contenttypes', '0002_remove_content_type_name', '2021-09-27 16:54:32.334285'),
(22, 'auth', '0002_alter_permission_name_max_length', '2021-09-27 16:54:33.214942'),
(23, 'auth', '0003_alter_user_email_max_length', '2021-09-27 16:54:33.423249'),
(24, 'auth', '0004_alter_user_username_opts', '2021-09-27 16:54:33.467423'),
(25, 'auth', '0005_alter_user_last_login_null', '2021-09-27 16:54:34.353412'),
(26, 'auth', '0006_require_contenttypes_0002', '2021-09-27 16:54:34.378952'),
(27, 'auth', '0007_alter_validators_add_error_messages', '2021-09-27 16:54:34.408538'),
(28, 'auth', '0008_alter_user_username_max_length', '2021-09-27 16:54:34.495224'),
(29, 'auth', '0009_alter_user_last_name_max_length', '2021-09-27 16:54:34.571584'),
(30, 'auth', '0010_alter_group_name_max_length', '2021-09-27 16:54:34.616383'),
(31, 'auth', '0011_update_proxy_permissions', '2021-09-27 16:54:34.638172'),
(32, 'auth', '0012_alter_user_first_name_max_length', '2021-09-27 16:54:34.683768'),
(33, 'guitars', '0001_initial', '2021-09-27 16:54:38.206335'),
(34, 'guitars', '0002_order_delerivered_status', '2021-09-27 16:54:38.697321'),
(35, 'guitars', '0003_events', '2021-09-27 16:54:39.831641'),
(36, 'sessions', '0001_initial', '2021-09-27 16:54:41.479878'),
(37, 'guitars', '0004_eventregister', '2021-09-28 06:01:01.856085');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('33xaizp5clzob9iiit77jsovndd8clpa', '.eJxVjEEOwiAQRe_C2hCm0IG6dN8zEBgYqRqalHZlvLtt0oVu_3vvv4UP21r81vLipySuoheX3y0GeuZ6gPQI9T5Lmuu6TFEeijxpk-Oc8ut2un8HJbSy14BOs0KinocI2oClnFknbVUAEzu0CkJkQOwGVAkNswPiCJzT3jnx-QLc2DgA:1mVJlh:e7IDZTUmZNfRI_uWLbydoEi6fr6dHqGdzpMzKi8IeEg', '2021-10-12 20:32:01.037244'),
('4yn0q5yrbsxorj3cl6f3jedkr030xzx7', '.eJxVjMsOwiAQRf-FtSEFWh4u3fsNZIYZpGogKe3K-O_apAvd3nPOfYkI21ri1nmJM4mzMOL0uyGkB9cd0B3qrcnU6rrMKHdFHrTLayN-Xg7376BAL9_aDZDRMisMyeeQEJ0zCShbw6gVWT0OrJN2LmtDYfLgccwTcVYcLAXx_gAWLjkI:1mVqUP:goGlIoa5YkkGnxqzHooylyZ1p7Lk0Z-KWmmFSDR7boY', '2021-10-14 07:28:21.964842'),
('bzdkylllt9eo0y2d48sgn13u3hkhvo3e', '.eJxVjEEOwiAQRe_C2pCBMqS4dO8ZyDCAVA0kpV013t2QdKHb_977h_C0b8XvPa1-ieIqlLj8boH4leoA8Un10SS3uq1LkEORJ-3y3mJ6307376BQL6OeLGRIBrPLZAGzsslqABNIQ8qKZ5yYeTaTDpE1OOUQURtSwIYiiM8X3Bo3fA:1mUuKn:4hdzIQBy0Lab4-xtD9OLQdRzhDCjyXv99xT7j47wzc4', '2021-10-11 17:22:33.190436'),
('miuipp6g6xs50a6tkksuqesqey6nytg5', '.eJxVjMsOwiAQRf-FtSGF8hhcuvcbCMxMpWogKe3K-O_apAvd3nPOfYmYtrXErfMSZxJnMYrT75YTPrjugO6p3prEVtdlznJX5EG7vDbi5-Vw_w5K6uVbayY25KeRVA4KMxjtAhsLlImtH7R3EBzT5APqFEi7PDAobZ0lQEDx_gD3uDgn:1mVVKS:BNL44hTjIUkYUUG4399KLbCodbSGHPZ-xDKO_YDh_oY', '2021-10-13 08:52:40.771507'),
('unj9fmj0yfi1lrxhkdlfsofwkoy6zi2u', '.eJxVjEEOwiAQRe_C2hCm0IG6dN8zEBgYqRqalHZlvLtt0oVu_3vvv4UP21r81vLipySuoheX3y0GeuZ6gPQI9T5Lmuu6TFEeijxpk-Oc8ut2un8HJbSy14BOs0KinocI2oClnFknbVUAEzu0CkJkQOwGVAkNswPiCJzT3jnx-QLc2DgA:1mVoqk:qmGZaBdCC2gp6CDLqvYVBqPZ7k6CD1DAaydNwOovba4', '2021-10-14 05:43:18.531759'),
('z8mas3j0vhl62yozi4cxoqepada0fc90', '.eJxVjEEOwiAQRe_C2hCm0IG6dN8zEBgYqRqalHZlvLtt0oVu_3vvv4UP21r81vLipySuoheX3y0GeuZ6gPQI9T5Lmuu6TFEeijxpk-Oc8ut2un8HJbSy14BOs0KinocI2oClnFknbVUAEzu0CkJkQOwGVAkNswPiCJzT3jnx-QLc2DgA:1mVH2T:YQtY8uYNs0OWUUotG52w9yNHK-m6CuND807HKOfl2TA', '2021-10-12 17:37:09.585426');

-- --------------------------------------------------------

--
-- Table structure for table `guitars_events`
--

CREATE TABLE `guitars_events` (
  `id` bigint(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `Events` varchar(50) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `detail` longtext NOT NULL,
  `file` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guitars_events`
--

INSERT INTO `guitars_events` (`id`, `title`, `Events`, `date`, `detail`, `file`) VALUES
(4, 'EVENT TWO2', 'Enhanced Vocational Education and Training (EVENT)', '2021-10-11 00:00:00.000000', 'Enhanced Vocational Education and Training (EVENT) project second has been established as per the agreement signed between the Government of Nepal and World Bank on 21 January, 2018. The main objective of this project is to expand the supply of skilled and employable labor by increasing access to quality training programs, and by strengthening the technical and vocational education and training system in Nepal. The project emphasizes in increasing access to technical education and vocational training (TEVT) programs for disadvantaged youth especially poor, living in lagging regions, female, Dalit, marginalized Janajatis and people with disability through targeting and other inclusive processes.', 'static/uploads/beatles.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `guitars_order`
--

CREATE TABLE `guitars_order` (
  `id` bigint(20) NOT NULL,
  `date_ordered` datetime(6) NOT NULL,
  `complete` tinyint(1) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `delerivered_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guitars_order`
--

INSERT INTO `guitars_order` (`id`, `date_ordered`, `complete`, `transaction_id`, `customer_id`, `delerivered_status`) VALUES
(2, '2021-09-28 07:03:37.230615', 1, '1632893352.902424', 5, 1),
(3, '2021-09-29 05:29:13.132572', 1, '1632979149.453504', 5, 1),
(4, '2021-09-30 05:19:09.882563', 1, '1632981345.742543', 5, 1),
(5, '2021-09-30 05:55:45.880945', 1, '1632982789.672201', 5, 1),
(6, '2021-09-30 06:19:49.871192', 1, '1632985867.907532', 5, 1),
(7, '2021-09-30 07:11:08.115935', 1, '1632986547.306186', 5, 0),
(8, '2021-09-30 07:22:27.628624', 0, NULL, 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `guitars_orderitem`
--

CREATE TABLE `guitars_orderitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `data_added` datetime(6) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guitars_orderitem`
--

INSERT INTO `guitars_orderitem` (`id`, `quantity`, `data_added`, `order_id`, `product_id`) VALUES
(3, 1, '2021-09-29 05:13:50.231627', 2, 5),
(11, 1, '2021-09-30 04:54:01.730595', 3, 12),
(15, 2, '2021-09-30 05:19:16.386996', 4, 11),
(17, 2, '2021-09-30 05:55:56.964324', 5, 12),
(19, 2, '2021-09-30 06:20:01.023660', 6, 10),
(21, 1, '2021-09-30 07:11:16.897092', 7, 12),
(22, 1, '2021-09-30 07:22:41.518638', 8, 12);

-- --------------------------------------------------------

--
-- Table structure for table `guitars_shippingaddress`
--

CREATE TABLE `guitars_shippingaddress` (
  `id` bigint(20) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `zipcode` varchar(200) DEFAULT NULL,
  `date_added` datetime(6) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `guitars_shippingaddress`
--

INSERT INTO `guitars_shippingaddress` (`id`, `address`, `city`, `state`, `zipcode`, `date_added`, `customer_id`, `order_id`) VALUES
(1, 'Sunakothi', 'Kathmandu', 'Nepal', '111', '2021-09-29 05:29:13.011035', 5, 2),
(2, 'sunakothi', 'lalitpur', 'nepal', '111', '2021-09-30 05:19:09.636246', 5, 3),
(3, 'Sunakothi', 'lalitpur', 'Nepal', '111', '2021-09-30 05:55:45.791375', 5, 4),
(4, 'Sunakothi', 'lalitpur', 'Nepal', '222', '2021-09-30 06:19:49.726878', 5, 5),
(5, 'Sunakothi', 'lalitpur', 'Nepal', '333', '2021-09-30 07:11:07.999738', 5, 6),
(6, 'Sunakothi', 'lalitpur', 'Nepal', '444', '2021-09-30 07:22:27.368995', 5, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_contacts`
--
ALTER TABLE `accounts_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounts_profiles`
--
ALTER TABLE `accounts_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `admins_fileuploads`
--
ALTER TABLE `admins_fileuploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `guitars_events`
--
ALTER TABLE `guitars_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guitars_order`
--
ALTER TABLE `guitars_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guitars_order_customer_id_5b827828_fk_auth_user_id` (`customer_id`);

--
-- Indexes for table `guitars_orderitem`
--
ALTER TABLE `guitars_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guitars_orderitem_order_id_e15ba3c6_fk_guitars_order_id` (`order_id`),
  ADD KEY `guitars_orderitem_product_id_e22505e5_fk_admins_fileuploads_id` (`product_id`);

--
-- Indexes for table `guitars_shippingaddress`
--
ALTER TABLE `guitars_shippingaddress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guitars_shippingaddress_customer_id_00f3a5b8_fk_auth_user_id` (`customer_id`),
  ADD KEY `guitars_shippingaddress_order_id_df7f3fbc_fk_guitars_order_id` (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_contacts`
--
ALTER TABLE `accounts_contacts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `accounts_profiles`
--
ALTER TABLE `accounts_profiles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins_fileuploads`
--
ALTER TABLE `admins_fileuploads`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `guitars_events`
--
ALTER TABLE `guitars_events`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `guitars_order`
--
ALTER TABLE `guitars_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `guitars_orderitem`
--
ALTER TABLE `guitars_orderitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `guitars_shippingaddress`
--
ALTER TABLE `guitars_shippingaddress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_profiles`
--
ALTER TABLE `accounts_profiles`
  ADD CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `guitars_order`
--
ALTER TABLE `guitars_order`
  ADD CONSTRAINT `guitars_order_customer_id_5b827828_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `guitars_orderitem`
--
ALTER TABLE `guitars_orderitem`
  ADD CONSTRAINT `guitars_orderitem_order_id_e15ba3c6_fk_guitars_order_id` FOREIGN KEY (`order_id`) REFERENCES `guitars_order` (`id`),
  ADD CONSTRAINT `guitars_orderitem_product_id_e22505e5_fk_admins_fileuploads_id` FOREIGN KEY (`product_id`) REFERENCES `admins_fileuploads` (`id`);

--
-- Constraints for table `guitars_shippingaddress`
--
ALTER TABLE `guitars_shippingaddress`
  ADD CONSTRAINT `guitars_shippingaddress_customer_id_00f3a5b8_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `guitars_shippingaddress_order_id_df7f3fbc_fk_guitars_order_id` FOREIGN KEY (`order_id`) REFERENCES `guitars_order` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
