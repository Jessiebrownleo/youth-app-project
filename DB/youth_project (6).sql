-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2024 at 02:55 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `youth_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'lymannphy9@gmail.com', NULL, '$2y$10$K232hOcqIJ41Nu9f0oFHgegO22IHTXXbHFhhdF9YstwF77lQKjfwC', '1726667621.jpg', NULL, '2024-05-01 05:25:06', '2024-09-18 06:53:41');

-- --------------------------------------------------------

--
-- Table structure for table `causes`
--

CREATE TABLE `causes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `objective` varchar(255) DEFAULT NULL,
  `expectations` text DEFAULT NULL,
  `legal_considerations` text DEFAULT NULL,
  `challenges_and_solution` text DEFAULT NULL,
  `featured_photo` varchar(255) NOT NULL,
  `goal` int(11) NOT NULL,
  `raised` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_featured` varchar(255) DEFAULT NULL,
  `supporting_documents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`supporting_documents`)),
  `status` enum('pending','approve','reject') DEFAULT 'pending',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `previous_status` enum('pending','approve','reject') DEFAULT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `causes`
--

INSERT INTO `causes` (`id`, `name`, `slug`, `short_description`, `objective`, `expectations`, `legal_considerations`, `challenges_and_solution`, `featured_photo`, `goal`, `raised`, `start_date`, `end_date`, `is_featured`, `supporting_documents`, `status`, `user_id`, `approved_by`, `created_at`, `updated_at`, `previous_status`, `likes`, `views`) VALUES
(4, 'Plastic Reduction Campaign', 'plastic-reduction-campaign', 'A youth-led project to reduce plastic use, encouraging eco-friendly alternatives and raising awareness about plastic pollution.', 'The objective of this youth-led project is to reduce plastic use by promoting eco-friendly alternatives and raising awareness about the harmful impacts of plastic pollution on the environment.', 'The project aims to inspire a shift toward eco-friendly alternatives by raising awareness about plastic pollution. Through workshops and campaigns, youth will educate communities on the environmental impact of plastic waste and promote sustainable practices. The initiative seeks to foster collaboration, reduce plastic use, and encourage lasting environmental responsibility, measured by reduced plastic waste and increased community engagement.', NULL, NULL, 'cause_featured_photo_1726629810.jpg', 250, 250, '2024-09-15', '2024-09-20', 'Yes', NULL, 'approve', 4, 1, '2024-05-03 21:40:20', '2024-10-04 12:14:13', NULL, 0, 26),
(5, 'Forest Conservation Project', 'forest-conservation-project', 'A youth-led project to protect forest resources, focusing on conservation and raising environmental awareness.', 'The objective of this youth-led project is to protect forest resources by promoting conservation efforts and raising environmental awareness within communities.', 'The project is expected to create a deeper understanding of the importance of forest conservation through educational campaigns and community involvement. By organizing activities like tree planting, clean-ups, and awareness events, the youth will highlight the critical role forests play in sustaining biodiversity and combating climate change.', NULL, NULL, 'cause_featured_photo_1726629964.jpg', 460, 190, '2024-09-29', '2024-09-30', 'Yes', NULL, 'approve', 1, 1, '2024-05-03 22:34:08', '2024-10-04 00:06:09', NULL, 0, 44),
(12, 'Community Garden Initiative', 'community-garden-initiative', 'A youth-led project to create a community garden, providing fresh produce and promoting sustainable living.', 'The objective of the Community Garden Initiative is to create a shared space where community members can grow fresh produce, foster environmental stewardship, and promote healthy living.', 'The initiative is expected to cultivate a sense of community by involving residents in the planning, planting, and maintenance of the garden. It will serve as a space for learning about sustainable agriculture, nutrition, and the benefits of growing food locally. By providing access to fresh produce, the project will encourage healthier lifestyles and reduce the environmental footprint of food consumption. The garden will also be a platform for educational workshops on gardening and sustainability.', NULL, NULL, 'cause_featured_photo_1726630363.jpg', 100, 70, '2024-09-28', '2024-09-30', 'Yes', NULL, 'approve', 1, 1, '2024-08-12 09:02:21', '2024-10-04 00:06:09', NULL, 0, 44),
(14, 'Community Library Project', 'community-library-project', 'A youth-led project to build a library, offering free books and resources to promote community learning.', 'To establish a community library led by youth, providing free access to books and educational resources, fostering a culture of learning, and empowering individuals through knowledge.', 'The library will serve as a hub for community growth, encouraging lifelong learning, enhancing literacy, and creating opportunities for personal and collective development through educational programs and resources available to all.', NULL, NULL, 'cause_featured_photo_1726288662.jpg', 500, 0, '2024-09-29', '2024-09-30', 'Yes', NULL, 'approve', 1, 1, '2024-08-22 00:24:03', '2024-10-04 00:06:09', NULL, 0, 44),
(15, 'Youth Innovation Lab', 'youth-innovation-lab', 'A youth-led project that creates an innovation lab, providing resources and mentorship to develop and test creative solutions.', 'The objective of this youth-led project is to establish an innovation lab that provides resources, mentorship, and a collaborative space for young people to develop and test creative solutions to real-world problems.', 'The project is expected to create a dynamic environment where young innovators can access the tools, guidance, and support needed to bring their ideas to life. Through mentorship programs, workshops, and hands-on experimentation, participants will be encouraged to explore new technologies and approaches to problem-solving.', NULL, NULL, 'cause_featured_photo_1726630162.jpg', 1200, 0, '2024-09-22', '2024-10-25', 'Yes', NULL, 'approve', 1, 1, '2024-08-22 00:41:47', '2024-10-04 00:06:09', NULL, 0, 44),
(24, 'Village Child Support Initiative', 'village-child-support-initiative', 'This project aims to collect and distribute clothes, study materials, and other essentials to underprivileged children in the village.', 'To provide basic necessities such as clothing and educational materials to 100 children in the village by the end of the year.', 'We expect to see an increase in school attendance among children due to the provision of study materials, and overall improvement in the well-being of the children as their basic needs are met.', 'All materials will be distributed with the consent of local authorities, ensuring compliance with child protection laws. Ethical practices such as non-discrimination and respect for the dignity of all recipients will be strictly followed.', 'A possible challenge is the lack of transportation for distributing materials. We plan to partner with local organizations that can assist with logistics. Additionally, if donations are insufficient, we will run a community fundraising campaign.', 'cause_featured_photo_1726630475.jpg', 2000, 0, '2024-09-05', '2024-09-14', 'Yes', '[]', 'approve', 2, NULL, '2024-09-01 23:15:32', '2024-10-04 00:06:09', NULL, 0, 34);

-- --------------------------------------------------------

--
-- Table structure for table `cause_comments`
--

CREATE TABLE `cause_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cause_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cause_comments`
--

INSERT INTO `cause_comments` (`id`, `cause_id`, `user_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 15, 3, 'I really love this project!', '2024-08-24 02:45:53', '2024-08-24 02:45:53'),
(2, 24, 3, 'This project is very good. I want to support and give a supporting. Please convert it from prototype to real life.', '2024-09-01 23:39:54', '2024-09-01 23:39:54');

-- --------------------------------------------------------

--
-- Table structure for table `cause_donations`
--

CREATE TABLE `cause_donations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cause_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price` varchar(255) NOT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cause_donations`
--

INSERT INTO `cause_donations` (`id`, `cause_id`, `user_id`, `price`, `currency`, `payment_id`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '180', 'usd', 'pi_3PDPZ8DLgvVLxMxm2ylg4XCt', 'Stripe', 'COMPLETED', '2024-05-06 04:18:44', '2024-05-06 04:18:44'),
(2, 4, 2, '10', 'usd', 'pi_3Pp2SHDLgvVLxMxm2vcISB7j', 'Stripe', 'COMPLETED', '2024-08-17 23:19:13', '2024-08-17 23:19:13'),
(3, 4, 2, '10', 'usd', 'pi_3Pp35KDLgvVLxMxm0Zy1w1Vv', 'Stripe', 'COMPLETED', '2024-08-17 23:59:34', '2024-08-17 23:59:34'),
(4, 4, 2, '10', 'usd', 'pi_3Pp3BfDLgvVLxMxm2TdhnnRK', 'Stripe', 'COMPLETED', '2024-08-18 00:06:07', '2024-08-18 00:06:07'),
(5, 4, 2, '10', 'usd', 'pi_3Pp3J7DLgvVLxMxm1dwxLdPV', 'Stripe', 'COMPLETED', '2024-08-18 00:13:48', '2024-08-18 00:13:48'),
(6, 4, 2, '10', 'usd', 'pi_3Pp3LjDLgvVLxMxm27XSfR9O', 'Stripe', 'COMPLETED', '2024-08-18 00:16:31', '2024-08-18 00:16:31'),
(7, 4, 2, '10', 'usd', 'pi_3Pp4UrDLgvVLxMxm0A5MUGmK', 'Stripe', 'COMPLETED', '2024-08-18 01:30:00', '2024-08-18 01:30:00'),
(8, 4, 2, '10', 'usd', 'pi_3Pp9gnDLgvVLxMxm0zwQCmAj', 'Stripe', 'COMPLETED', '2024-08-18 07:02:41', '2024-08-18 07:02:41'),
(9, 5, 2, '50', 'usd', 'pi_3Pp9leDLgvVLxMxm2lrU3ZfC', 'Stripe', 'COMPLETED', '2024-08-18 07:07:42', '2024-08-18 07:07:42'),
(10, 5, 2, '10', 'usd', 'pi_3Pp9npDLgvVLxMxm1LIBjZcf', 'Stripe', 'COMPLETED', '2024-08-18 07:09:57', '2024-08-18 07:09:57'),
(11, 5, 2, '10', 'usd', 'pi_3Pp9qhDLgvVLxMxm2t2gXZfi', 'Stripe', 'COMPLETED', '2024-08-18 07:12:54', '2024-08-18 07:12:54'),
(12, 5, 2, '10', 'usd', 'pi_3Pp9tjDLgvVLxMxm1rnQbrlb', 'Stripe', 'COMPLETED', '2024-08-18 07:16:02', '2024-08-18 07:16:02'),
(13, 5, 2, '10', 'usd', 'pi_3Pp9zMDLgvVLxMxm1RP1MHDG', 'Stripe', 'COMPLETED', '2024-08-18 07:21:52', '2024-08-18 07:21:52'),
(14, 5, 2, '10', 'usd', 'pi_3PpA85DLgvVLxMxm0aG8rBYh', 'Stripe', 'COMPLETED', '2024-08-18 07:30:52', '2024-08-18 07:30:52'),
(15, 5, 2, '10', 'usd', 'pi_3PpA9CDLgvVLxMxm1vlcEuex', 'Stripe', 'COMPLETED', '2024-08-18 07:32:02', '2024-08-18 07:32:02'),
(16, 5, 2, '10', 'usd', 'pi_3PpAF5DLgvVLxMxm18rgAFMM', 'Stripe', 'COMPLETED', '2024-08-18 07:38:07', '2024-08-18 07:38:07'),
(17, 5, 2, '10', 'usd', 'pi_3PpAYmDLgvVLxMxm25CPWYB0', 'Stripe', 'COMPLETED', '2024-08-18 07:58:29', '2024-08-18 07:58:29'),
(18, 5, 2, '10', 'usd', 'pi_3PpAcIDLgvVLxMxm2IVQklQF', 'Stripe', 'COMPLETED', '2024-08-18 08:02:05', '2024-08-18 08:02:05'),
(19, 12, 2, '10', 'usd', 'pi_3PpNVSDLgvVLxMxm0suwLY5j', 'Stripe', 'COMPLETED', '2024-08-18 21:47:54', '2024-08-18 21:47:54'),
(20, 12, 2, '10', 'usd', 'pi_3PpNXADLgvVLxMxm2SVHnile', 'Stripe', 'COMPLETED', '2024-08-18 21:49:39', '2024-08-18 21:49:39'),
(21, 12, 2, '10', 'usd', 'pi_3PpNY2DLgvVLxMxm29fcjYun', 'Stripe', 'COMPLETED', '2024-08-18 21:50:33', '2024-08-18 21:50:33'),
(22, 12, 2, '10', 'usd', 'pi_3PpNZEDLgvVLxMxm1zYr3v0L', 'Stripe', 'COMPLETED', '2024-08-18 21:51:48', '2024-08-18 21:51:48'),
(23, 12, 2, '10', 'usd', 'pi_3PpNcUDLgvVLxMxm1qoJhri8', 'Stripe', 'COMPLETED', '2024-08-18 21:55:09', '2024-08-18 21:55:09'),
(24, 12, 2, '10', 'usd', 'pi_3PpNeADLgvVLxMxm09E9FyCB', 'Stripe', 'COMPLETED', '2024-08-18 21:56:54', '2024-08-18 21:56:54'),
(25, 12, 2, '10', 'usd', 'pi_3PpNf7DLgvVLxMxm1BDMtVnI', 'Stripe', 'COMPLETED', '2024-08-18 21:57:53', '2024-08-18 21:57:53'),
(26, 5, 2, '50', 'usd', 'pi_3PqGQJDLgvVLxMxm2rIVxJK6', 'Stripe', 'COMPLETED', '2024-08-21 08:26:14', '2024-08-21 08:26:14'),
(27, 13, 3, '50', 'usd', 'pi_3PsQn1DLgvVLxMxm0iu1Mhn7', 'Stripe', 'COMPLETED', '2024-08-27 07:54:38', '2024-08-27 07:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `cause_faqs`
--

CREATE TABLE `cause_faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cause_id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cause_faqs`
--

INSERT INTO `cause_faqs` (`id`, `cause_id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 1, 'abc?', 'sddsw', '2024-05-02 19:14:17', '2024-05-02 19:14:17'),
(2, 24, 'What is the Village Child Support Initiative?', 'The Village Child Support Initiative is a community-driven program aimed at improving the well-being and education of children in rural villages. We focus on providing essential resources such as school supplies, meals, healthcare, and other forms of support to ensure every child has an opportunity to thrive.', '2024-09-01 23:30:53', '2024-10-04 12:17:32'),
(3, 24, 'How can I get involved in supporting the children?', 'There are several ways to get involved! You can volunteer your time, make a financial donation, or provide in-kind donations like books, school supplies, or clothing. We also welcome sponsors who are willing to support a child\'s education or well-being on a long-term basis.', '2024-09-01 23:31:17', '2024-10-04 12:17:53'),
(4, 24, 'How are donations used in the initiative?', 'All donations go directly toward improving the lives of children in need. Funds are allocated to provide essential supplies like food, clothing, and educational materials, as well as to fund healthcare services and infrastructure development in the villages. Transparency is important to us, and we provide regular updates on how donations are being used.', '2024-09-01 23:31:47', '2024-10-04 12:18:17');

-- --------------------------------------------------------

--
-- Table structure for table `cause_partnerships_and_collaborations`
--

CREATE TABLE `cause_partnerships_and_collaborations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cause_id` bigint(20) UNSIGNED NOT NULL,
  `partnership_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cause_partnerships_and_collaborations`
--

INSERT INTO `cause_partnerships_and_collaborations` (`id`, `cause_id`, `partnership_id`, `created_at`, `updated_at`) VALUES
(26, 24, 1, '2024-09-17 20:34:35', '2024-09-17 20:34:35'),
(27, 24, 2, '2024-09-17 20:34:35', '2024-09-17 20:34:35');

-- --------------------------------------------------------

--
-- Table structure for table `cause_photos`
--

CREATE TABLE `cause_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cause_id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cause_replies`
--

CREATE TABLE `cause_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reply` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cause_replies`
--

INSERT INTO `cause_replies` (`id`, `comment_id`, `user_id`, `parent_id`, `reply`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 'Thank you so much sir', '2024-08-24 03:10:59', '2024-08-24 03:10:59'),
(3, 2, 2, NULL, 'I\'m so glad to hear that opportunity from you. Thank you for your kindly support.', '2024-09-02 00:14:57', '2024-09-02 00:15:44');

-- --------------------------------------------------------

--
-- Table structure for table `cause_reports`
--

CREATE TABLE `cause_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cause_id` bigint(20) UNSIGNED NOT NULL,
  `report_type` enum('initial','progress','final') NOT NULL,
  `report_date` date NOT NULL,
  `report` text NOT NULL,
  `challenges` text DEFAULT NULL,
  `solutions` text DEFAULT NULL,
  `submitted` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cause_reports`
--

INSERT INTO `cause_reports` (`id`, `cause_id`, `report_type`, `report_date`, `report`, `challenges`, `solutions`, `submitted`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 24, 'initial', '2024-09-20', 'Hello', 'Hello', 'Hello', 0, 2, '2024-09-20 02:24:17', '2024-09-20 02:24:17');

-- --------------------------------------------------------

--
-- Table structure for table `cause_target_audiences`
--

CREATE TABLE `cause_target_audiences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cause_id` bigint(20) UNSIGNED NOT NULL,
  `target_audience_category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cause_target_audiences`
--

INSERT INTO `cause_target_audiences` (`id`, `cause_id`, `target_audience_category_id`, `created_at`, `updated_at`) VALUES
(24, 24, 1, '2024-09-17 20:34:35', '2024-09-17 20:34:35'),
(25, 24, 2, '2024-09-17 20:34:35', '2024-09-17 20:34:35');

-- --------------------------------------------------------

--
-- Table structure for table `cause_target_regions`
--

CREATE TABLE `cause_target_regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cause_id` bigint(20) UNSIGNED NOT NULL,
  `target_region_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cause_target_regions`
--

INSERT INTO `cause_target_regions` (`id`, `cause_id`, `target_region_id`, `created_at`, `updated_at`) VALUES
(4, 24, 2, '2024-09-17 20:34:35', '2024-09-17 20:34:35'),
(5, 24, 3, '2024-09-17 20:34:35', '2024-09-17 20:34:35'),
(6, 24, 4, '2024-09-17 20:34:35', '2024-09-17 20:34:35');

-- --------------------------------------------------------

--
-- Table structure for table `cause_user_bookmarks`
--

CREATE TABLE `cause_user_bookmarks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cause_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cause_user_bookmarks`
--

INSERT INTO `cause_user_bookmarks` (`id`, `cause_id`, `user_id`, `created_at`, `updated_at`) VALUES
(3, 15, 2, '2024-09-14 22:47:40', '2024-09-14 22:47:40');

-- --------------------------------------------------------

--
-- Table structure for table `cause_user_likes`
--

CREATE TABLE `cause_user_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cause_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cause_videos`
--

CREATE TABLE `cause_videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cause_id` int(11) NOT NULL,
  `youtube_video_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cause_videos`
--

INSERT INTO `cause_videos` (`id`, `cause_id`, `youtube_video_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'https://www.youtube.com/watch?v=9UnvgpVU65k&list=RDyEto5ZdZ-aA&index=13', '2024-05-02 19:13:16', '2024-05-02 19:13:16'),
(2, 24, 'https://www.youtube.com/watch?v=CiFoHm7HD94', '2024-09-01 23:27:58', '2024-09-01 23:27:58'),
(3, 24, 'https://www.youtube.com/watch?v=B7H1noB47xs', '2024-09-01 23:28:17', '2024-09-01 23:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `post_id`, `name`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hello Admin', 7, 'Samrang Seila', 'seila123@gmail.com', 'Pending', '2024-08-22 21:04:14', '2024-08-22 21:04:14');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conversations`
--

INSERT INTO `conversations` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 2, '2024-10-03 00:09:02', '2024-10-03 00:09:02');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `counter1_number` varchar(255) NOT NULL,
  `counter1_name` varchar(255) NOT NULL,
  `counter2_number` varchar(255) NOT NULL,
  `counter2_name` varchar(255) NOT NULL,
  `counter3_number` varchar(255) NOT NULL,
  `counter3_name` varchar(255) NOT NULL,
  `counter4_number` varchar(255) NOT NULL,
  `counter4_name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `counter1_number`, `counter1_name`, `counter2_number`, `counter2_name`, `counter3_number`, `counter3_name`, `counter4_number`, `counter4_name`, `status`, `created_at`, `updated_at`) VALUES
(1, '1120', 'Donations', '300', 'Volunteers', '130', 'Projects', '160', 'Events Organized', 'Show', NULL, '2023-12-18 12:12:52');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `featured_photo` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `map` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `total_seat` int(11) DEFAULT NULL,
  `booked_seat` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `name`, `slug`, `short_description`, `description`, `featured_photo`, `date`, `time`, `location`, `map`, `price`, `total_seat`, `booked_seat`, `created_at`, `updated_at`) VALUES
(1, 'Youth Green Action Day', 'abled-child-cancer', 'A youth-led event focused on environmental action and sustainability.', '<p>Youth Green Action Day is a dynamic event aimed at empowering young people to take concrete steps toward a more sustainable future. Through workshops, clean-up drives, and interactive sessions, participants will learn about environmental challenges, sustainable practices, and how to reduce their carbon footprint. The event fosters collaboration among youth, encouraging them to become active environmental stewards and advocates for positive change within their communities.</p>', 'event_featured_photo_1726631407.jpg', '2024-10-29', '14:45', '937 Jamajo Blvd, Orlando FL 32803, USA', NULL, 9, 19, 10, '2024-12-20 20:04:49', '2024-09-17 20:50:07'),
(2, 'Contribute for Recovery', 'Contribute-for-Recovery', 'To help the mothers who are homeless & helpless, we provide them food, shelter & medical assistance.', '<p>Lorem ipsum dolor sit amet, no unum senserit constituam has, has an enim recusabo, dolorum consequuntur ad quo. Nisl nonumes ea eam, at pro eleifend partiendo, alii summo ex nam. Eam impetus efficiantur ullamcorper no, ad est meliore patrioque sententiae, no eam atqui possit. An iriure meliore maiorum sed, quo an altera numquam. Nam eu commodo persecuti. Eu eos tibique delectus disputando, ei purto wisi euripidis mei, vis augue electram iudicabit ea.</p>\r\n<p>Eum id legimus rationibus, aeque eligendi ullamcorper mel et. Habeo officiis id usu, eu intellegat voluptatum definiebas nec, cu his error solet voluptua. Nec in wisi labore expetendis. His hinc verear ne, pri dignissim sententiae percipitur no, mel mollis ceteros gubergren in.</p>\r\n<p>Cu cum tota summo vulputate, ullum recusabo neglegentur per ex. Velit deleniti facilisi an usu, vim ludus prompta probatus ne. Ad eum ferri liber, sea no virtute facilisi. Id ius dico consectetuer. Te animal facilisis his, est ipsum putent te.</p>\r\n<p>&nbsp;</p>', 'event_featured_photo_1714793972.jpg', '2024-8-18', '09:00', '937 Jamajo Blvd, Orlando FL 32803, USA', NULL, 19, NULL, 3, '2023-12-22 19:32:44', '2024-05-03 20:39:32'),
(4, 'Playing For World', 'Playing-For-World', 'To provide food, shelter, clothing, education and medical assistance to homeless children and their families.', '<p>Lorem ipsum dolor sit amet, no unum senserit constituam has, has an enim recusabo, dolorum consequuntur ad quo. Nisl nonumes ea eam, at pro eleifend partiendo, alii summo ex nam. Eam impetus efficiantur ullamcorper no, ad est meliore patrioque sententiae, no eam atqui possit. An iriure meliore maiorum sed, quo an altera numquam. Nam eu commodo persecuti. Eu eos tibique delectus disputando, ei purto wisi euripidis mei, vis augue electram iudicabit ea.</p>\r\n<p>Eum id legimus rationibus, aeque eligendi ullamcorper mel et. Habeo officiis id usu, eu intellegat voluptatum definiebas nec, cu his error solet voluptua. Nec in wisi labore expetendis. His hinc verear ne, pri dignissim sententiae percipitur no, mel mollis ceteros gubergren in.</p>\r\n<p>Cu cum tota summo vulputate, ullum recusabo neglegentur per ex. Velit deleniti facilisi an usu, vim ludus prompta probatus ne. Ad eum ferri liber, sea no virtute facilisi. Id ius dico consectetuer. Te animal facilisis his, est ipsum putent te.</p>\r\n<p>&nbsp;</p>', 'event_featured_photo_1714797196.jpg', '2024-07-28', '07:00', '937 Jamajo Blvd, Orlando FL 32803, USA', NULL, 0, NULL, 7, '2023-12-22 19:39:24', '2024-05-03 21:33:16'),
(6, 'Innovation Expo', 'innovation-expo', 'A youth-led event showcasing innovative projects and ideas, providing a platform for creativity and collaboration to address community issues.', '<p>The Innovation Expo is a youth-led event designed to showcase and celebrate groundbreaking projects and ideas developed by young innovators. This event serves as a platform for participants to present their creative solutions to various community challenges, ranging from environmental sustainability to social issues.</p>\r\n<p>The expo features interactive exhibits, live demonstrations, and presentations, allowing attendees to explore innovative concepts and technologies firsthand. It also includes workshops and panel discussions with industry experts and mentors, providing valuable insights and guidance to aspiring innovators.</p>\r\n<p>By bringing together young minds, community leaders, and stakeholders, the Innovation Expo fosters a collaborative environment that encourages networking, learning, and the exchange of ideas. The event aims to inspire and empower the next generation of problem-solvers and entrepreneurs, while also highlighting the impact of youth-driven innovation on community development and progress.</p>', 'event_featured_photo_1724312897.jpg', '2024-09-13', '01:45', 'St. Keo Chenda, Sangkat Chhroy Congva,  Phnom Penh, Cambodiare.', NULL, 5, 70, NULL, '2024-08-22 00:48:17', '2024-08-22 00:48:17'),
(7, 'Youth Talent Showcase', 'youth-talent-showcase', 'A youth-led event where talented young performers and artists present their skills, offering a platform for creativity while raising funds through ticket sales.', '<p>The Youth Talent Showcase is an exciting event designed to highlight and celebrate the diverse talents of young performers and artists. This event provides a stage for youth to display their skills in music, dance, theater, visual arts, and more, creating a vibrant and engaging experience for attendees.</p>\r\n<p>Participants have the opportunity to perform before a live audience, receive feedback from industry professionals, and gain exposure for their talents. The showcase includes various acts, from solo performances to group presentations, ensuring a dynamic and entertaining lineup.</p>\r\n<p>Ticket sales for the event help support local youth programs and initiatives, making the showcase not only a celebration of creativity but also a fundraiser for future projects. By attending, guests enjoy an evening of remarkable performances while contributing to the growth and development of youth talent in the community.</p>', 'event_featured_photo_1724313135.jpg', '2024-09-13', '07:00', 'St. Keo Chenda, Sangkat Chhroy Congva,  Phnom Penh, Cambodiare.', NULL, 5, 70, NULL, '2024-08-22 00:52:15', '2024-08-22 00:52:15'),
(8, 'Youth Innovation Conference', 'youth-innovation-conference', 'A youth-led conference featuring workshops and keynote speakers on emerging technologies and creative solutions, with tickets supporting future educational programs.', '<p>The Youth Innovation Conference is a dynamic event organized by and for young people, focusing on the latest advancements in technology, creativity, and problem-solving. This conference brings together youth, industry experts, and thought leaders to explore emerging trends and innovative ideas.</p>\r\n<p>Attendees participate in engaging workshops, panel discussions, and interactive sessions that cover topics such as tech innovations, sustainable practices, and entrepreneurial strategies. Keynote speakers share their insights and experiences, offering inspiration and practical advice for aspiring innovators.</p>\r\n<p>Ticket sales for the conference support educational programs and resources for young participants, fostering continued learning and development. The event aims to empower youth by providing them with the tools and knowledge to drive positive change and shape the future of their communities.</p>', 'event_featured_photo_1724313273.jpg', '2024-09-13', '07:00', 'St. Keo Chenda, Sangkat Chhroy Congva,  Phnom Penh, Cambodiare.', NULL, 10, 120, NULL, '2024-08-22 00:54:33', '2024-08-22 00:54:33');

-- --------------------------------------------------------

--
-- Table structure for table `event_photos`
--

CREATE TABLE `event_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_photos`
--

INSERT INTO `event_photos` (`id`, `event_id`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, 'event_photo_1703297335.jpg', '2023-12-22 20:08:55', '2023-12-22 20:08:55'),
(2, 1, 'event_photo_1703297349.jpg', '2023-12-22 20:09:09', '2023-12-22 20:09:09'),
(3, 1, 'event_photo_1703297370.jpg', '2023-12-22 20:09:30', '2023-12-22 20:09:30'),
(4, 2, 'event_photo_1703297387.jpg', '2023-12-22 20:09:47', '2023-12-22 20:09:47'),
(5, 2, 'event_photo_1703297391.jpg', '2023-12-22 20:09:51', '2023-12-22 20:09:51'),
(6, 2, 'event_photo_1703297399.jpg', '2023-12-22 20:09:59', '2023-12-22 20:09:59'),
(7, 4, 'event_photo_1703297406.jpg', '2023-12-22 20:10:06', '2023-12-22 20:10:06'),
(8, 4, 'event_photo_1703297409.jpg', '2023-12-22 20:10:09', '2023-12-22 20:10:09'),
(9, 4, 'event_photo_1703297414.jpg', '2023-12-22 20:10:14', '2023-12-22 20:10:14'),
(10, 5, 'event_photo_1703297423.jpg', '2023-12-22 20:10:23', '2023-12-22 20:10:23'),
(11, 5, 'event_photo_1703297427.jpg', '2023-12-22 20:10:27', '2023-12-22 20:10:27'),
(12, 5, 'event_photo_1703297429.jpg', '2023-12-22 20:10:29', '2023-12-22 20:10:29');

-- --------------------------------------------------------

--
-- Table structure for table `event_tickets`
--

CREATE TABLE `event_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `unit_price` varchar(255) NOT NULL,
  `number_of_tickets` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_videos`
--

CREATE TABLE `event_videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` int(11) NOT NULL,
  `youtube_video_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'What is your charity\'s mission and focus?', 'Our charity\'s mission is to make a positive impact in the lives of those in need. We focus on providing support in areas such as education, healthcare, disaster relief, and addressing hunger and homelessness. We also raise awareness about critical social and environmental issues.', '2023-12-18 19:28:50', '2023-12-18 19:28:50'),
(2, 'How can I make a donation to support your charity?', 'Making a donation to support our charity is easy and greatly appreciated. You can donate online through our secure website by clicking on the \"Donate Now\" button. We also accept donations through various other methods, such as bank transfers, checks, or in-kind contributions. Visit our \"Donate\" page for more details on the various donation options.', '2023-12-18 19:29:17', '2023-12-18 19:29:17'),
(3, 'Is my donation tax-deductible, and will I receive a receipt for tax purposes?', 'Yes, your donation is tax-deductible to the extent allowed by law. After making a donation, you will receive a receipt via email or mail, depending on your preference. This receipt will contain all the necessary information you need for tax purposes, including our charity\'s tax ID number.', '2023-12-18 19:29:31', '2023-12-18 19:29:31'),
(4, 'How can I get involved as a volunteer or participate in your charity\'s programs?', 'We welcome volunteers and individuals interested in participating in our programs. To get involved, please visit our \"Volunteer Opportunities\" page for information on upcoming events, projects, and how to apply. You can also sign up for our newsletter to stay informed about volunteer opportunities and programs.', '2023-12-18 19:29:44', '2023-12-18 19:29:44'),
(5, 'Can I designate my donation to a specific program or project within your charity?', 'Yes, you can often designate your donation to a specific program, project, or cause that aligns with your passion and interests. During the donation process, you will have the option to specify where you\'d like your contribution to be directed. If you have questions about specific designations, please contact our support team for further assistance.', '2023-12-18 19:29:59', '2023-12-18 19:29:59');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) NOT NULL,
  `heading` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `icon`, `heading`, `text`, `created_at`, `updated_at`) VALUES
(1, 'fas fa-briefcase', 'Become a Volunteer', 'To become a volunteer, upload your CV and wait for approval. We’ll review your application and get back to you.', '2023-12-17 19:36:20', '2024-09-17 21:20:38'),
(2, 'fas fa-search', 'Foundation & Events', 'Join our organized events to support various causes and raise awareness on important topics.', '2023-12-17 19:37:35', '2024-09-17 21:21:34'),
(3, 'fas fa-share-alt', 'Make a Donation', 'Support youth projects by donating through our platform. Your contributions help fund impactful initiatives and connect with project creators.', '2023-12-17 19:37:59', '2024-09-17 21:21:48');

-- --------------------------------------------------------

--
-- Table structure for table `home_page_items`
--

CREATE TABLE `home_page_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cause_heading` varchar(255) DEFAULT NULL,
  `cause_subheading` varchar(255) DEFAULT NULL,
  `cause_status` varchar(255) NOT NULL,
  `feature_background` varchar(255) NOT NULL,
  `feature_status` varchar(255) NOT NULL,
  `event_heading` varchar(255) DEFAULT NULL,
  `event_subheading` varchar(255) DEFAULT NULL,
  `event_status` varchar(255) NOT NULL,
  `testimonial_heading` varchar(255) DEFAULT NULL,
  `testimonial_background` varchar(255) NOT NULL,
  `testimonial_status` varchar(255) NOT NULL,
  `blog_heading` varchar(255) DEFAULT NULL,
  `blog_subheading` varchar(255) DEFAULT NULL,
  `blog_status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_page_items`
--

INSERT INTO `home_page_items` (`id`, `cause_heading`, `cause_subheading`, `cause_status`, `feature_background`, `feature_status`, `event_heading`, `event_subheading`, `event_status`, `testimonial_heading`, `testimonial_background`, `testimonial_status`, `blog_heading`, `blog_subheading`, `blog_status`, `created_at`, `updated_at`) VALUES
(1, 'Featured Proposal', 'Discover the innovative ideas submitted by Cambodia\'s bright young minds!', 'Show', 'feature_background_1726851198.jpg', 'Show', 'Upcoming Events', 'You can organize events and help us to raise fund for the poor people.', 'Show', 'Our Happy Clients', 'testimonial_background_1726851400.jpg', 'Show', 'Latest News', 'Check out the latest news and updates from our blog post', 'Show', NULL, '2024-09-20 09:56:40');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(6, 'App\\Models\\CauseReport', 2, 'd0f49f46-77b0-4d84-8fff-e73af73fbb64', 'images', 'blog-young-leaders-cambodia-850X567', 'blog-young-leaders-cambodia-850X567.jpg', 'image/jpeg', 'public', 'public', 104257, '[]', '[]', '{\"thumb\":true}', '[]', 1, '2024-09-20 02:24:17', '2024-09-20 02:24:18'),
(7, 'App\\Models\\CauseReport', 2, 'ca4e7653-a5e5-427a-b4c2-f56d02d6d270', 'images', 'photo_6111922304444379644_y-1-1200x900', 'photo_6111922304444379644_y-1-1200x900.jpg', 'image/jpeg', 'public', 'public', 78760, '[]', '[]', '{\"thumb\":true}', '[]', 2, '2024-09-20 02:24:18', '2024-09-20 02:24:18');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `conversation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `conversation_id`, `message`, `created_at`, `updated_at`) VALUES
(43, 2, 2, 'Your message mean a lot to me.', '2024-10-03 00:09:11', '2024-10-03 00:09:11'),
(44, 2, 2, 'What is Banana?', '2024-10-04 00:09:48', '2024-10-04 00:09:48'),
(45, 2, 2, 'Hello', '2024-10-04 00:15:43', '2024-10-04 00:15:43'),
(46, 2, 2, 'Your message mean a lot to me.', '2024-10-04 00:16:45', '2024-10-04 00:16:45'),
(47, NULL, 2, 'The given text is not a message, it is a Google API key.', '2024-10-04 00:16:47', '2024-10-04 00:16:47'),
(48, 2, 2, 'Hello AI, Can you tell me what is Angkor Wat?', '2024-10-04 00:18:04', '2024-10-04 00:18:04'),
(49, NULL, 2, '**Angkor Wat** is a majestic temple complex in Cambodia and the largest religious monument in the world. Built in the 12th century by King Suryavarman II, it is a testament to the architectural grandeur and cultural significance of the Khmer Empire.\n\n**Location:**\n\nAngkor Wat is located in the Angkor Archaeological Park, about 5 kilometers north of the modern city of Siem Reap, Cambodia.\n\n**History:**\n\nThe construction of Angkor Wat began in 1113 AD and took over 30 years to complete. It was originally built as a Hindu temple dedicated to Vishnu, but it was later converted into a Buddhist temple. The temple served as the political and religious center of the Khmer Empire until the late 15th century.\n\n**Architecture:**\n\nAngkor Wat is an architectural masterpiece known for its intricate carvings, towering spires, and vast courtyards. The complex covers an area of over 1 square kilometer (247 acres) and consists of:\n\n* **Outer Enclosure:** A moat and a 3.6 kilometer-long outer wall with five monumental gates.\n* **Inner Enclosure:** A second wall with four gates leading to the central temple.\n* **Central Temple:** A series of courtyards, galleries, libraries, and shrines culminating in the towering central sanctuary.\n* **Bayon:** A temple within the Angkor Wat complex known for its enigmatic smiling faces.\n* **Srei Temple:** A smaller temple located about 15 kilometers from Angkor Wat, renowned for its delicate carvings and low relief decorations.\n\n**Cultural Significance:**\n\nAngkor Wat is a symbol of Cambodia\'s rich cultural heritage and a source of national pride. It has been designated as a UNESCO World Heritage Site and attracts millions of visitors each year. The temple is also featured on Cambodia\'s national flag.\n\n**Tourism:**\n\nAngkor Wat is the most popular tourist attraction in Cambodia and one of the most visited historical sites in the world. It offers visitors the opportunity to explore its awe-inspiring architecture, learn about the Khmer Empire, and immerse themselves in the spiritual atmosphere of this ancient temple.', '2024-10-04 00:18:11', '2024-10-04 00:18:11'),
(50, 2, 2, 'How many provinces in Cambodia?', '2024-10-04 00:18:49', '2024-10-04 00:18:49'),
(51, NULL, 2, '25', '2024-10-04 00:18:51', '2024-10-04 00:18:51'),
(52, 2, 2, 'How can I help poor children in Cambodia?', '2024-10-04 00:20:02', '2024-10-04 00:20:02'),
(53, NULL, 2, '**Ways to Help Poor Children in Cambodia**\n\n**1. Support Local Organizations:**\n\n* Cambodian Children\'s Fund: Provides education, healthcare, and nutrition support to vulnerable children.\n* Friends International: Focuses on street children, providing shelter, education, and vocational training.\n* Cambodian Rural Development Team: Works to reduce poverty through education, healthcare, and sustainable agriculture initiatives.\n\n**2. Volunteer Time and Skills:**\n\n* Teach English or other skills to children in schools or community centers.\n* Help with food distribution or medical outreaches.\n* Advocate for children\'s rights and well-being.\n\n**3. Donate Funds:**\n\n* Donate directly to reputable organizations working with poor children.\n* Support fundraising campaigns and events.\n* Consider sponsoring a child\'s education or healthcare.\n\n**4. Raise Awareness:**\n\n* Educate others about poverty in Cambodia and the need for support.\n* Share information on social media and encourage your friends and family to donate.\n* Participate in advocacy initiatives to promote children\'s rights.\n\n**5. Support Sustainable Initiatives:**\n\n* Invest in education and vocational training programs to break the cycle of poverty.\n* Promote access to healthcare and nutrition to improve children\'s overall well-being.\n* Support small businesses and entrepreneurs to create jobs and stimulate economic growth.\n\n**6. Respect Local Culture and Customs:**\n\n* Be respectful of Cambodian culture and customs when interacting with children and their families.\n* Partner with local organizations to ensure that aid is delivered in a responsible and culturally appropriate manner.\n\n**7. Consider Long-Term Support:**\n\n* Provide ongoing support to organizations and initiatives that focus on sustainable development and poverty reduction.\n* Engage in advocacy efforts to address the root causes of poverty in Cambodia.\n\n**Additional Resources:**\n\n* Ministry of Social Affairs, Veterans and Youth Rehabilitation: https://msvy.gov.kh/en/\n* World Vision Cambodia: https://www.wvi.org/cambodia\n* UNICEF Cambodia: https://www.unicef.org/cambodia', '2024-10-04 00:20:10', '2024-10-04 00:20:10'),
(54, 2, 2, 'I\'ll be appreciated if you generate me a proposal or project to make positive impact in Cambodia community!', '2024-10-04 07:31:21', '2024-10-04 07:31:21'),
(55, NULL, 2, '**Project Title:** Empowering Cambodian Communities through Education and Skills Training\n\n**Project Overview:**\n\nCambodia faces significant challenges in education and skills development, hindering economic growth and social progress. This project aims to address these challenges by providing marginalized communities with access to quality education and vocational training, empowering them to improve their livelihoods and contribute to the nation\'s development.\n\n**Target Population:**\n\n* Underprivileged youth and adults in rural and urban areas of Cambodia\n* Women and girls disproportionately affected by educational disparities\n* Individuals from marginalized ethnic minority groups\n\n**Objectives:**\n\n* Enhance access to primary and secondary education for out-of-school children and youth\n* Improve the quality of education at the primary and secondary levels\n* Provide vocational training in high-demand industries, such as agriculture, tourism, and manufacturing\n* Facilitate job placement and entrepreneurship opportunities for trainees\n\n**Key Activities:**\n\n**Education:**\n\n* Construct and renovate schools in underserved communities\n* Provide scholarships and financial assistance to disadvantaged students\n* Train teachers and develop innovative teaching methodologies\n* Implement after-school tutoring and enrichment programs\n\n**Skills Training:**\n\n* Establish vocational training centers in strategic locations\n* Offer industry-specific training programs tailored to local labor market needs\n* Provide hands-on training, internships, and mentoring\n* Partner with businesses to ensure job placement and career advancement opportunities\n\n**Sustainability:**\n\n* Engage local communities and stakeholders in project implementation\n* Develop sustainable funding models to ensure long-term project viability\n* Build capacity within local organizations to continue education and training initiatives beyond the project\'s lifespan\n\n**Impact:**\n\n* Increased literacy and numeracy rates among youth and adults\n* Improved school attendance and completion rates\n* Increased access to skilled labor for businesses, leading to economic growth\n* Empowered communities with knowledge and skills to improve their livelihoods\n* Reduced poverty and social inequality\n\n**Budget:**\n\n* **Phase 1:** $5 million (Education)\n* **Phase 2:** $3 million (Skills Training)\n* **Total:** $8 million\n\n**Timeline:**\n\n* Phase 1: 3 years\n* Phase 2: 2 years\n\n**Partnerships:**\n\n* Cambodian Ministry of Education, Youth, and Sports\n* Local community organizations\n* International development agencies\n* Private sector businesses\n\n**Monitoring and Evaluation:**\n\n* Regular data collection and analysis to track progress and impact\n* External evaluations to assess the effectiveness and sustainability of the project\n* Participatory monitoring involving community members and stakeholders\n\n**Call to Action:**\n\nWe invite funding organizations, businesses, and individuals to support this transformative project that has the potential to create a lasting impact on the lives of Cambodian communities. Together, we can empower the Cambodian people to unlock their potential and build a brighter future for all.', '2024-10-04 07:31:30', '2024-10-04 07:31:30');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_25_025642_create_admins_table', 1),
(6, '2023_10_30_082935_create_sliders_table', 1),
(7, '2023_10_30_143652_create_specials_table', 1),
(8, '2023_12_18_012545_create_features_table', 1),
(9, '2023_12_18_092400_create_testimonials_table', 1),
(10, '2023_12_18_174537_create_counters_table', 1),
(11, '2023_12_19_011946_create_faqs_table', 1),
(12, '2023_12_19_054702_create_volunteers_table', 1),
(13, '2023_12_19_085139_create_photo_categories_table', 1),
(14, '2023_12_19_094426_create_photos_table', 1),
(15, '2023_12_19_152009_create_video_categories_table', 1),
(16, '2023_12_19_173657_create_videos_table', 1),
(17, '2023_12_20_010842_create_post_categories_table', 1),
(18, '2023_12_20_024713_create_posts_table', 1),
(19, '2023_12_20_104933_create_comments_table', 1),
(20, '2023_12_20_105413_create_replies_table', 1),
(21, '2023_12_21_012747_create_events_table', 1),
(22, '2023_12_23_020127_create_event_photos_table', 1),
(23, '2023_12_23_022142_create_event_videos_table', 1),
(24, '2023_12_24_015803_create_event_tickets_table', 1),
(25, '2023_12_28_133200_create_causes_table', 1),
(26, '2024_01_01_011427_create_cause_photos_table', 1),
(27, '2024_01_01_011434_create_cause_videos_table', 1),
(28, '2024_01_01_012821_create_cause_faqs_table', 1),
(29, '2024_01_01_022624_create_cause_donations_table', 1),
(30, '2024_01_01_063218_create_home_page_items_table', 1),
(31, '2024_01_02_011608_create_settings_table', 1),
(32, '2024_01_03_015900_create_other_page_items_table', 1),
(33, '2024_01_03_022800_create_subscribers_table', 1),
(34, '2024_05_11_075353_add_previous_status_to_causes_table', 2),
(35, '2024_08_23_043052_create_cause_comments_table', 3),
(36, '2024_08_23_043151_create_cause_replies_table', 3),
(37, '2024_08_23_154629_create_cause_replies_table', 4),
(38, '2024_08_24_072551_create_cause_replies_table', 5),
(39, '2024_08_24_094116_create_cause_comments_table', 6),
(40, '2024_08_24_094155_create_cause_replies_table', 6),
(41, '2024_08_27_143014_create_messages_table', 7),
(42, '2024_08_30_080656_create_target_audience_categories_table', 8),
(43, '2024_08_30_080925_create_cause_target_audience_table', 8),
(44, '2024_08_30_082037_create_partnerships_and_collaborations_categories_table', 8),
(45, '2024_08_30_082136_create_cause_partnerships_and_collaborations_table', 8),
(46, '2024_08_30_090126_create_partnership_and_collaboration_categories_table', 9),
(47, '2024_08_30_090347_create_cause_partnership_and_collaborations_table', 9),
(48, '2024_08_30_090736_create_target_audience_categories_table', 9),
(49, '2024_08_30_090921_create_cause_target_audiences_table', 9),
(50, '2024_09_01_010108_create_partnerships_and_collaborations_categories_table', 10),
(51, '2024_09_01_010204_create_cause_partnerships_and_collaborations_table', 11),
(52, '2024_09_07_155429_create_target_regions_table', 12),
(53, '2024_09_07_155441_create_cause_target_regions_table', 12),
(54, '2024_09_09_073852_create_media_table', 12),
(55, '2024_09_10_015955_create_cause_reports_table', 12),
(56, '2024_09_10_022836_create_cause_reports_table', 13),
(57, '2024_09_10_030944_create_report_notifications_table', 14),
(58, '2024_09_10_035902_create_report_notifications_table', 15),
(59, '2024_09_10_051725_create_jobs_table', 16),
(60, '2024_09_10_133819_add_likes_and_views_to_causes_table', 17),
(61, '2024_09_10_154925_create_cause_user_likes_table', 18),
(62, '2024_09_14_084158_create_cause_user_bookmarks_table', 19),
(63, '2024_09_16_024507_create_volunteers_table', 20),
(64, '2024_09_16_032909_create_volunteers_table', 21),
(65, '2024_09_20_085351_create_cause_reports_table', 22),
(66, '2024_09_24_155756_add_conversation_id_to_messages_table', 23),
(67, '2024_09_24_155836_create_conversations_table', 23);

-- --------------------------------------------------------

--
-- Table structure for table `other_page_items`
--

CREATE TABLE `other_page_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `terms_content` text DEFAULT NULL,
  `privacy_content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `other_page_items`
--

INSERT INTO `other_page_items` (`id`, `terms_content`, `privacy_content`, `created_at`, `updated_at`) VALUES
(1, '<p><strong>Terms and Conditions for NU Youth and Innovation IDEA</strong></p>\r\n<h3>1. <strong>Acceptance of Terms</strong></h3>\r\n<p>By accessing or using the NU Youth and Innovation IDEA platform, you agree to comply with and be bound by these Terms and Conditions. If you do not agree with any part of these terms, you should not use our platform.</p>\r\n<h3>2. <strong>Eligibility</strong></h3>\r\n<p>To use our platform, you must be at least 18 years old or have parental/guardian consent. By using the platform, you represent and warrant that you have the right, authority, and capacity to enter into this agreement and abide by all terms and conditions.</p>\r\n<h3>3. <strong>User Accounts</strong></h3>\r\n<ul>\r\n<li><strong>Registration</strong>: To submit proposals, create events, or volunteer, you must create an account. You agree to provide accurate and complete information during registration and keep your account information updated.</li>\r\n<li><strong>Responsibility</strong>: You are responsible for maintaining the confidentiality of your account and password and for all activities that occur under your account.</li>\r\n<li><strong>Termination</strong>: We reserve the right to terminate or suspend your account at any time, without notice, if you violate these terms or engage in activities that may harm the platform or its users.</li>\r\n</ul>\r\n<h3>4. <strong>Submission of Proposals</strong></h3>\r\n<ul>\r\n<li><strong>Ownership</strong>: By submitting a proposal, you confirm that you are the original creator of the idea or have the necessary rights to submit it. You retain ownership of your proposal, but you grant us a non-exclusive, worldwide, royalty-free license to use, display, and promote it on our platform.</li>\r\n<li><strong>Review</strong>: We reserve the right to review, edit, or remove proposals that do not comply with our guidelines or that may be deemed inappropriate.</li>\r\n</ul>\r\n<h3>5. <strong>Donations</strong></h3>\r\n<ul>\r\n<li><strong>Payment Processing</strong>: Donations made through the platform are processed by third-party payment providers. We do not store any payment information on our servers.</li>\r\n<li><strong>Refunds</strong>: Donations are non-refundable. If you encounter any issues with your donation, please contact our support team.</li>\r\n<li><strong>Donor-Youth Communication</strong>: Donors may contact youth project creators directly through the platform to ask questions or request more information about their proposals.</li>\r\n</ul>\r\n<h3>6. <strong>Events</strong></h3>\r\n<ul>\r\n<li><strong>Event Creation</strong>: Youth can create events that are relevant to their community. All events must comply with our community guidelines and terms.</li>\r\n<li><strong>Ticket Sales</strong>: Ticket purchases for events are handled through our platform. Event organizers are responsible for ensuring that their events are conducted safely and in accordance with local laws.</li>\r\n</ul>\r\n<h3>7. <strong>Volunteering</strong></h3>\r\n<ul>\r\n<li><strong>Opportunities</strong>: The platform provides opportunities for youth to volunteer on various projects. Volunteers must agree to the terms outlined for each specific opportunity.</li>\r\n<li><strong>Responsibilities</strong>: By signing up to volunteer, you agree to fulfill your duties responsibly and to the best of your ability.</li>\r\n</ul>\r\n<h3>8. <strong>Intellectual Property</strong></h3>\r\n<p>All content on the platform, including text, graphics, logos, and software, is the property of NU Youth and Innovation IDEA or its content suppliers and is protected by intellectual property laws. You may not reproduce, distribute, or create derivative works from this content without express permission.</p>\r\n<h3>9. <strong>User Conduct</strong></h3>\r\n<ul>\r\n<li><strong>Prohibited Activities</strong>: You agree not to engage in activities that may harm the platform, its users, or violate any laws. This includes, but is not limited to, hacking, spamming, and posting defamatory content.</li>\r\n<li><strong>Content Moderation</strong>: We reserve the right to monitor, edit, or remove any content that violates these terms or is deemed inappropriate.</li>\r\n</ul>\r\n<h3>10. <strong>Privacy</strong></h3>\r\n<p>Your use of the platform is also governed by our Privacy Policy, which details how we collect, use, and protect your information.</p>\r\n<h3>11. <strong>Limitation of Liability</strong></h3>\r\n<p>NU Youth and Innovation IDEA is not liable for any damages arising from your use of the platform, including but not limited to direct, indirect, incidental, and consequential damages.</p>\r\n<h3>12. <strong>Changes to Terms</strong></h3>\r\n<p>We may update these Terms and Conditions from time to time. You are encouraged to review these terms periodically. Your continued use of the platform constitutes acceptance of any changes.</p>\r\n<h3>13. <strong>Governing Law</strong></h3>\r\n<p>These Terms and Conditions are governed by and construed in accordance with the laws of [Your Country]. Any disputes arising from these terms shall be subject to the exclusive jurisdiction of the courts in [Your Country].</p>\r\n<h3>14. <strong>Contact Information</strong></h3>\r\n<p>If you have any questions or concerns about these Terms and Conditions, please contact us at [Your Contact Information].</p>', '<p><strong>Privacy Policy for NU Youth and Innovation IDEA</strong></p>\r\n<p>This privacy policy outlines how NU Youth and Innovation IDEA (\"we,\" \"us,\" or \"our\") collects, uses, and protects any information that you provide when you use our website.</p>\r\n<h3>Information We Collect</h3>\r\n<p>We may collect the following information:</p>\r\n<ul>\r\n<li>Your name and contact information</li>\r\n<li>Demographic information</li>\r\n<li>Payment information for donations and transactions</li>\r\n<li>Other information relevant to customer surveys and/or offers</li>\r\n</ul>\r\n<h3>How We Use the Information</h3>\r\n<p>We require this information to understand your needs and provide you with better service, particularly for the following reasons:</p>\r\n<ul>\r\n<li>Internal record keeping</li>\r\n<li>Processing payments and donations</li>\r\n<li>Improving our products and services</li>\r\n<li>Sending promotional emails about new products, special offers, or other information we think you may find interesting</li>\r\n<li>Occasionally contacting you for market research purposes by email, phone, or mail</li>\r\n<li>Customizing the website according to your interests</li>\r\n</ul>\r\n<h3>Payment and Donations</h3>\r\n<p>When you make a donation or payment through our platform, we collect payment information necessary to process the transaction. We use secure payment processing services and do not store your payment details on our servers. All transactions are encrypted and managed by reputable third-party payment processors.</p>\r\n<p>We may share your contact information with the youth project creators to facilitate communication and ensure transparency in how your donations are used. However, we will never share your payment information with third parties other than our payment processors.</p>\r\n<h3>Security</h3>\r\n<p>We are committed to ensuring that your information is secure. To prevent unauthorized access or disclosure, we have implemented suitable physical, electronic, and managerial procedures to safeguard and secure the information we collect online.</p>\r\n<h3>Cookies</h3>\r\n<p>A cookie is a small file placed on your computer\'s hard drive that helps analyze web traffic or lets you know when you visit a particular site. Cookies enable web applications to tailor their operations to your needs, likes, and dislikes by gathering and remembering information about your preferences.</p>\r\n<p>Overall, cookies help us provide you with a better website experience by allowing us to monitor which pages you find useful and which you do not. A cookie does not give us access to your computer or any information about you other than the data you choose to share with us.</p>\r\n<h3>Links to Other Websites</h3>\r\n<p>Our website may contain links to other websites of interest. However, once you have used these links to leave our site, we do not have control over those websites. Therefore, we cannot be responsible for the protection and privacy of any information you provide while visiting such sites. These sites are not governed by this privacy statement. You should exercise caution and review the privacy statement applicable to the website in question.</p>\r\n<h3>Controlling Your Personal Information</h3>\r\n<p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\r\n<ul>\r\n<li>If you have previously agreed to us using your personal information for direct marketing purposes, you may change your mind at any time by writing to or emailing us at [email protected].</li>\r\n<li>We will not sell, distribute, or lease your personal information to third parties unless we have your permission or are required by law to do so. We may use your personal information to send you promotional information about third parties that we think you may find interesting if you indicate that you wish to receive such information.</li>\r\n<li>You may request details of personal information that we hold about you. If you would like a copy of the information held on you, please write to [Your Company Name, Address, City, State, Zip Code] or email [email protected].</li>\r\n<li>If you believe that any information we are holding on you is incorrect or incomplete, please write to or email us as soon as possible at the above address. We will promptly correct any information found to be incorrect.</li>\r\n</ul>\r\n<h3>Changes to This Privacy Policy</h3>\r\n<p>This privacy policy is subject to change without notice. We encourage you to review this policy periodically to stay informed about how we are protecting your information.</p>', NULL, '2024-08-24 08:11:49');

-- --------------------------------------------------------

--
-- Table structure for table `partnership_and_collaboration_categories`
--

CREATE TABLE `partnership_and_collaboration_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partnership_and_collaboration_categories`
--

INSERT INTO `partnership_and_collaboration_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Non-Profit Organizations', NULL, NULL),
(2, 'Government Agencies', NULL, NULL),
(3, 'Corporate Sponsors', NULL, NULL),
(4, 'Educational Institutions', NULL, NULL),
(5, 'Community Groups', NULL, NULL),
(6, 'Healthcare Providers', NULL, NULL),
(7, 'Media Partners', NULL, NULL),
(8, 'Local Businesses', NULL, NULL),
(9, 'Volunteer Organizations', NULL, NULL),
(10, 'International NGOs', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo_category_id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `photo_category_id`, `photo`, `created_at`, `updated_at`) VALUES
(1, 1, 'photo_1723691364.jpg', '2024-08-14 20:09:24', '2024-08-14 20:09:24'),
(2, 1, 'photo_1723691387.jpg', '2024-08-14 20:09:47', '2024-08-14 20:09:47'),
(3, 1, 'photo_1723691407.jpg', '2024-08-14 20:10:07', '2024-08-14 20:10:07'),
(4, 2, 'photo_1723691458.jpg', '2024-08-14 20:10:58', '2024-08-14 20:10:58'),
(5, 2, 'photo_1723691478.jpg', '2024-08-14 20:11:18', '2024-08-14 20:11:18');

-- --------------------------------------------------------

--
-- Table structure for table `photo_categories`
--

CREATE TABLE `photo_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photo_categories`
--

INSERT INTO `photo_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Education', '2024-08-14 20:08:47', '2024-08-14 20:08:47'),
(2, 'Donation', '2024-08-14 20:10:35', '2024-08-14 20:10:35');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `tags` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `post_category_id`, `title`, `slug`, `short_description`, `description`, `photo`, `tags`, `created_at`, `updated_at`) VALUES
(6, 5, 'Turning your emergency donation into instant aid', 'turning-emergency-donation-into-instant-aid', 'Lorem ipsum dolor sit amet, no unum senserit constituam has, has an enim recusabo, dolorum consequuntur ad quo.', '<p>Lorem ipsum dolor sit amet, no unum senserit constituam has, has an enim recusabo, dolorum consequuntur ad quo. Nisl nonumes ea eam, at pro eleifend partiendo, alii summo ex nam. Eam impetus efficiantur ullamcorper no, ad est meliore patrioque sententiae, no eam atqui possit. An iriure meliore maiorum sed, quo an altera numquam. Nam eu commodo persecuti. Eu eos tibique delectus disputando, ei purto wisi euripidis mei, vis augue electram iudicabit ea.<br /><br />Eum id legimus rationibus, aeque eligendi ullamcorper mel et. Habeo officiis id usu, eu intellegat voluptatum definiebas nec, cu his error solet voluptua. Nec in wisi labore expetendis. His hinc verear ne, pri dignissim sententiae percipitur no, mel mollis ceteros gubergren in.<br /><br />Cu cum tota summo vulputate, ullum recusabo neglegentur per ex. Velit deleniti facilisi an usu, vim ludus prompta probatus ne. Ad eum ferri liber, sea no virtute facilisi. Id ius dico consectetuer. Te animal facilisis his, est ipsum putent te.</p>', 'post_1726630900.jpg', 'fund,education,school', '2023-12-20 02:12:48', '2024-09-17 20:41:40'),
(7, 2, 'Charity provides educational boost for children', 'charity-provides-educational-boost-for-children', 'Lorem ipsum dolor sit amet, no unum senserit constituam has, has an enim recusabo, dolorum consequuntur ad quo.', '<p>Lorem ipsum dolor sit amet, no unum senserit constituam has, has an enim recusabo, dolorum consequuntur ad quo. Nisl nonumes ea eam, at pro eleifend partiendo, alii summo ex nam. Eam impetus efficiantur ullamcorper no, ad est meliore patrioque sententiae, no eam atqui possit. An iriure meliore maiorum sed, quo an altera numquam. Nam eu commodo persecuti. Eu eos tibique delectus disputando, ei purto wisi euripidis mei, vis augue electram iudicabit ea.<br /><br />Eum id legimus rationibus, aeque eligendi ullamcorper mel et. Habeo officiis id usu, eu intellegat voluptatum definiebas nec, cu his error solet voluptua. Nec in wisi labore expetendis. His hinc verear ne, pri dignissim sententiae percipitur no, mel mollis ceteros gubergren in.<br /><br />Cu cum tota summo vulputate, ullum recusabo neglegentur per ex. Velit deleniti facilisi an usu, vim ludus prompta probatus ne. Ad eum ferri liber, sea no virtute facilisi. Id ius dico consectetuer. Te animal facilisis his, est ipsum putent te.</p>', 'post_1726631062.jpg', 'charity,school,children', '2023-12-20 02:13:42', '2024-09-17 20:44:22'),
(8, 4, 'Directly Support Individuals for the Charity', 'directly-support-individuals', 'Lorem ipsum dolor sit amet, no unum senserit constituam has, has an enim recusabo, dolorum consequuntur ad quo.', '<p>Lorem ipsum dolor sit amet, no unum senserit constituam has, has an enim recusabo, dolorum consequuntur ad quo. Nisl nonumes ea eam, at pro eleifend partiendo, alii summo ex nam. Eam impetus efficiantur ullamcorper no, ad est meliore patrioque sententiae, no eam atqui possit. An iriure meliore maiorum sed, quo an altera numquam. Nam eu commodo persecuti. Eu eos tibique delectus disputando, ei purto wisi euripidis mei, vis augue electram iudicabit ea.<br /><br />Eum id legimus rationibus, aeque eligendi ullamcorper mel et. Habeo officiis id usu, eu intellegat voluptatum definiebas nec, cu his error solet voluptua. Nec in wisi labore expetendis. His hinc verear ne, pri dignissim sententiae percipitur no, mel mollis ceteros gubergren in.<br /><br />Cu cum tota summo vulputate, ullum recusabo neglegentur per ex. Velit deleniti facilisi an usu, vim ludus prompta probatus ne. Ad eum ferri liber, sea no virtute facilisi. Id ius dico consectetuer. Te animal facilisis his, est ipsum putent te.</p>', 'post_1726631137.jpg', 'education,child', '2023-12-20 02:14:28', '2024-09-17 20:45:37'),
(9, 1, 'Poor Children Education Facility in Country-Side', 'poor-children-education-facility-in-country-side', 'Lorem ipsum dolor sit amet, no unum senserit constituam has, has an enim recusabo, dolorum consequuntur ad quo.', '<p>Lorem ipsum dolor sit amet, no unum senserit constituam has, has an enim recusabo, dolorum consequuntur ad quo. Nisl nonumes ea eam, at pro eleifend partiendo, alii summo ex nam. Eam impetus efficiantur ullamcorper no, ad est meliore patrioque sententiae, no eam atqui possit. An iriure meliore maiorum sed, quo an altera numquam. Nam eu commodo persecuti. Eu eos tibique delectus disputando, ei purto wisi euripidis mei, vis augue electram iudicabit ea.<br /><br />Eum id legimus rationibus, aeque eligendi ullamcorper mel et. Habeo officiis id usu, eu intellegat voluptatum definiebas nec, cu his error solet voluptua. Nec in wisi labore expetendis. His hinc verear ne, pri dignissim sententiae percipitur no, mel mollis ceteros gubergren in.<br /><br />Cu cum tota summo vulputate, ullum recusabo neglegentur per ex. Velit deleniti facilisi an usu, vim ludus prompta probatus ne. Ad eum ferri liber, sea no virtute facilisi. Id ius dico consectetuer. Te animal facilisis his, est ipsum putent te.</p>', 'post_1726630951.jpg', 'charity,learning,education,school,child', '2023-12-20 02:15:29', '2024-09-17 20:43:11');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Donation', 'donation', '2023-12-19 19:16:54', '2023-12-20 03:43:27'),
(2, 'Charity', 'charity', '2023-12-19 19:17:03', '2023-12-20 03:43:31'),
(3, 'Education', 'education', '2023-12-19 19:17:07', '2023-12-20 03:44:24'),
(4, 'Health', 'health', '2023-12-19 19:17:15', '2023-12-20 03:44:31'),
(5, 'Fundraising', 'fundraising', '2023-12-19 19:17:23', '2023-12-20 03:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reply` text NOT NULL,
  `comment_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `reply`, `comment_id`, `name`, `email`, `user_type`, `status`, `created_at`, `updated_at`) VALUES
(3, 'fwef', 1, 'Admin', 'lymannphy9@gmail.com', 'Admin', 'Active', '2024-08-22 21:20:33', '2024-08-22 21:20:33');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) NOT NULL,
  `favicon` varchar(255) NOT NULL,
  `banner` varchar(255) NOT NULL,
  `top_phone` varchar(255) DEFAULT NULL,
  `top_email` varchar(255) DEFAULT NULL,
  `cta_heading` varchar(255) DEFAULT NULL,
  `cta_text` text DEFAULT NULL,
  `cta_button_text` varchar(255) DEFAULT NULL,
  `cta_button_url` varchar(255) DEFAULT NULL,
  `cta_status` varchar(255) NOT NULL,
  `footer_address` varchar(255) DEFAULT NULL,
  `footer_phone` varchar(255) DEFAULT NULL,
  `footer_email` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) NOT NULL,
  `map` text DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo`, `favicon`, `banner`, `top_phone`, `top_email`, `cta_heading`, `cta_text`, `cta_button_text`, `cta_button_url`, `cta_status`, `footer_address`, `footer_phone`, `footer_email`, `copyright`, `map`, `facebook`, `twitter`, `youtube`, `linkedin`, `instagram`, `created_at`, `updated_at`) VALUES
(1, 'logo_1726811456.webp', 'favicon_1726811456.webp', 'banner_1726507391.jpg', '(+855) 31 595 8866', 'lymannphy9@gmail.com', 'Become Donate Partner', 'Connect with Cambodian youth through our platform, where they submit their projects or proposals online, seeking donors to support and fund their initiatives.', 'Contact Us', '#', 'Show', '#93Eo, Sangkat Orussey 2, Khan 7 Makara, Phnom Penh, Cambodia.', '031 59 58 866', 'yrdp@info.com', 'Copyright © 2024, YRDP. All Rights Reserved.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d387190.2799198932!2d-74.25987701513004!3d40.69767006272707!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew%20York%2C%20NY%2C%20USA!5e0!3m2!1sen!2sbd!4v1645362221879!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border: 0\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', '#', '#', '#', '#', '#', NULL, '2024-09-30 06:36:07');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  `button_text` varchar(255) DEFAULT NULL,
  `button_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `heading`, `text`, `photo`, `button_text`, `button_link`, `created_at`, `updated_at`) VALUES
(1, 'Empowering Cambodia Youth', '<p>Calling all young changemakers in Cambodia! Step into the spotlight with YRDP Youth, your gateway to turning dreams into reality. Submit your visionary proposals, groundbreaking innovations, and transformative ideas today. Let\'s spark a revolution of positive change together!</p>', '1728024292.jpg', 'Read More', 'https://childsdream.org/', '2024-05-03 03:39:28', '2024-10-03 23:44:52'),
(2, 'Support Our Youth Initiative', '<p>Our Youth Initiative aims to provide young people with the resources, guidance, and opportunities they need to succeed and make a positive impact in their communities. By supporting our cause, you\'re investing in a brighter future for everyone.</p>', '1727922144.jpg', 'Get Involved Now', 'https://childsdream.org/', '2024-08-14 02:04:31', '2024-10-02 19:22:24');

-- --------------------------------------------------------

--
-- Table structure for table `specials`
--

CREATE TABLE `specials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `heading` varchar(255) NOT NULL,
  `sub_heading` varchar(255) DEFAULT NULL,
  `text` text NOT NULL,
  `button_text` varchar(255) DEFAULT NULL,
  `button_link` varchar(255) DEFAULT NULL,
  `photo` varchar(255) NOT NULL,
  `video_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specials`
--

INSERT INTO `specials` (`id`, `heading`, `sub_heading`, `text`, `button_text`, `button_link`, `photo`, `video_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'What We Do', 'Our Mission', '<p>YRDP Youth Project Management System is dedicated to fostering a culture of creativity, entrepreneurship, and problem-solving among young people. Our mission is to empower the next generation to unleash their innovative potential and drive positive change in their communities and beyond. Through resources, mentorship, and educational opportunities, we aim to equip young innovators with the skills and support they need to turn their ideas into reality. We believe in the power of collaboration, social impact, and celebrating the achievements of young leaders who are making a difference in the world.</p>', 'Read More', '#', '1726625121.jpg', 'TklWRCSM4SA', 'Show', NULL, '2024-09-30 06:38:48');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'lymannphy7@gmail.com', 'd53022828e78e1f3345ecbf0cbee5471', 0, '2024-08-14 20:58:14', '2024-08-14 20:58:14'),
(2, 'lymannphy123@gmail.com', '', 1, '2024-08-14 20:58:39', '2024-08-14 20:59:23'),
(3, 'rinpov77@gmail.com', '', 1, '2024-08-14 21:01:37', '2024-08-14 21:01:52'),
(4, 'samrangseila@info.com', '', 1, '2024-08-14 21:02:25', '2024-08-14 21:02:37'),
(5, 'sokhorn@gmail.com', '', 1, '2024-08-14 21:03:16', '2024-08-14 21:03:30');

-- --------------------------------------------------------

--
-- Table structure for table `target_audience_categories`
--

CREATE TABLE `target_audience_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `target_audience_categories`
--

INSERT INTO `target_audience_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Children and Youth', NULL, NULL),
(2, 'Educational Institutions', NULL, NULL),
(3, 'Low-Income Communities', NULL, NULL),
(4, 'Elderly', NULL, NULL),
(5, 'Individuals with Disabilities', NULL, NULL),
(6, 'Health and Wellness', NULL, NULL),
(7, 'Environment and Sustainability', NULL, NULL),
(8, 'Arts and Culture', NULL, NULL),
(9, 'Local Businesses', NULL, NULL),
(10, 'General Public', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `target_regions`
--

CREATE TABLE `target_regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `target_regions`
--

INSERT INTO `target_regions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Phnom Penh', NULL, NULL),
(2, 'Kandal', NULL, NULL),
(3, 'Battambang', NULL, NULL),
(4, 'Siem Reap', NULL, NULL),
(5, 'Kampong Cham', NULL, NULL),
(6, 'Kampot', NULL, NULL),
(7, 'Preah Sihanouk', NULL, NULL),
(8, 'Takeo', NULL, NULL),
(9, 'Banteay Meanchey', NULL, NULL),
(10, 'Kampong Thom', NULL, NULL),
(11, 'Kampong Speu', NULL, NULL),
(12, 'Prey Veng', NULL, NULL),
(13, 'Pursat', NULL, NULL),
(14, 'Kep', NULL, NULL),
(15, 'Pailin', NULL, NULL),
(16, 'Koh Kong', NULL, NULL),
(17, 'Mondulkiri', NULL, NULL),
(18, 'Ratanakiri', NULL, NULL),
(19, 'Stung Treng', NULL, NULL),
(20, 'Oddar Meanchey', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `photo`, `name`, `designation`, `comment`, `created_at`, `updated_at`) VALUES
(1, 'testimonial_1726852459.jpg', 'Sony Noeun', 'Child\'s Dream Cambodia Network', 'Volunteering with this charity has been a transformative experience. Their unwavering dedication to helping those in need is truly inspiring. I\'m proud to be part of their mission, witnessing the remarkable impact they make. I\'m grateful for the opportunity to contribute to their efforts.', '2023-12-18 03:35:53', '2024-09-20 10:14:19'),
(2, 'testimonial_1726852566.jpg', 'Chan Mithona', 'Norton University', 'As a long-time donor, I\'m consistently impressed by this charity\'s transparency and life-changing impact. They provide real support to those in need, making a meaningful difference in various communities. I\'m proud to be a part of their mission and will continue to support their efforts.', '2023-12-18 03:36:58', '2024-09-20 10:16:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `first_name` int(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `block` tinyint(1) DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `photo`, `phone`, `block`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Phy Lymann', NULL, NULL, 'phplaravel576@gmail.com', '2024-05-01 05:34:05', '$2y$10$OQ64j6nnovCdZArC/Yi2gecIY2kn2nRy/ndnvaOi4mMFIdQ2hK.OS', '1714799263.jpg', '0315958866', 1, NULL, '2024-05-01 05:32:25', '2024-09-25 08:59:25'),
(2, 'Lymann', NULL, NULL, 'phylymann9@gmail.com', '2024-08-12 05:30:44', '$2y$10$7Xm.vPfSWek7G7NoBIsAUOvDlTUNnLQcI9VAU.5qui6RCDGG3/K1S', '1726497483.jpg', NULL, 0, 'QxM1kYu9nX7JPplk1a33ktXownSq2lEfumvMstoDKfibkdSymyfMDO4haY8T', '2024-08-12 05:29:06', '2024-09-16 07:38:03'),
(3, 'John', NULL, NULL, 'johnmadam@gmail.com', '2024-08-22 23:50:52', '$2y$10$T.uL8LKMs05jc9g4lWkh5OuFP/B6aeFhPMiIaEd9a2U8/QXIw3WIu', '1724396377.jpg', NULL, 0, NULL, '2024-08-22 23:48:12', '2024-08-22 23:59:37'),
(4, 'Rathana', NULL, NULL, 'lymannphy9@gmail.com', '2024-09-10 03:26:03', '$2y$10$vlKnM14E2gpWQWiW3rwdTuEBSmhrCv2iZUipScLllseNFkTR1JIEm', NULL, NULL, 0, NULL, '2024-09-10 03:25:43', '2024-09-10 03:26:03');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `video_category_id` int(11) NOT NULL,
  `youtube_video_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `video_category_id`, `youtube_video_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'https://www.youtube.com/watch?v=osCUTGkKVRg', '2024-08-14 20:27:45', '2024-08-14 20:27:45'),
(2, 1, 'https://www.youtube.com/watch?v=osCUTGkKVRg', '2024-08-14 20:28:13', '2024-08-14 20:28:13');

-- --------------------------------------------------------

--
-- Table structure for table `video_categories`
--

CREATE TABLE `video_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `video_categories`
--

INSERT INTO `video_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Education', '2024-08-14 20:26:26', '2024-08-14 20:26:26');

-- --------------------------------------------------------

--
-- Table structure for table `volunteers`
--

CREATE TABLE `volunteers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `profession` varchar(500) NOT NULL,
  `skills` text DEFAULT NULL,
  `experience` text DEFAULT NULL,
  `education` text DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `github` varchar(255) DEFAULT NULL,
  `volunteer_interest` text DEFAULT NULL,
  `availability` text DEFAULT NULL,
  `previous_volunteering_experience` text DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `cv_file` varchar(255) DEFAULT NULL,
  `languages_spoken` varchar(255) DEFAULT NULL,
  `emergency_contact` text DEFAULT NULL,
  `status` enum('pending','approve','reject') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `volunteers`
--

INSERT INTO `volunteers` (`id`, `user_id`, `name`, `email`, `phone`, `photo`, `address`, `date_of_birth`, `profession`, `skills`, `experience`, `education`, `facebook`, `twitter`, `linkedin`, `instagram`, `website`, `github`, `volunteer_interest`, `availability`, `previous_volunteering_experience`, `detail`, `cv_file`, `languages_spoken`, `emergency_contact`, `status`, `created_at`, `updated_at`) VALUES
(23, 2, 'Lymann', 'phylymann9@gmail.com', '+855855-31', '1726497483.jpg', 'Phnom Penh', '1970-01-01', 'volunteer', 'Expertise, Management Skills, Creativity, Adaptability, Negotiation, Critical Thinking, Leadership', NULL, 'bachelor  of computer science 2020 - 2024 scholarship from child\'s dream cambodia network supporting my education at university. norton university 2020 - 2024 scholarship from norton university awarded based on my high grades in the department. center of science and technology advanced development 2023 - 2024 scholarship from the center of science and technology advanced development (cstad), provided by the ministry of post and telecommunications and cbrd fund, covering the basic it and it expert courses. norton university basic it and it expert professional course 2023 - 2024 center of science and technology advanced development phy lymann phnom penh golden award: top 1 project team 2023 - 2024 i am honored to have received the golden award as part of the top 1 project team for the social kh project at cstad. paññāsāstra university of cambodia | phnom penh english: english based education thmor koul high shcool| battambang high school certificated expertise place of birth: battambang date of birth: 03/05/2001 gender: male nationality: khmer marital status: single language khmer(mother tongue) english korean (basic) skills summary problem-solving leadership 78 % 81 % php and laravel course 2021 - 2022 instinct institute java, html, css, javascript, jquery, database design 2020 - 2021 etec center paññāsāstra university of cambodia | phnom penh english: english based education inter-cultural study center english: english based education references mr. chen phirum position : deputy director of korea software hrd center phone : 012 998 919 email: phirum.iti@gmail.com expertise management skills creativity adaptability negotiation critical thinking leadership; university; university 2020 - 2024 scholarship from norton university awarded based on my high grades in the department; university basic it and it expert professional course 2023 - 2024 center of science and technology advanced development phy lymann phnom penh golden award: top 1 project team 2023 - 2024 i am honored to have received the golden award as part of the top 1 project team for the social kh project at cstad; university of cambodia | phnom penh english: english based education thmor koul high shcool| battambang high school certificated expertise place of birth: battambang date of birth: 03/05/2001 gender: male nationality: khmer marital status: single language khmer(mother tongue) english korean (basic) skills summary problem-solving leadership 78 % 81 % php and laravel course 2021 - 2022 instinct institute java, html, css, javascript, jquery, database design 2020 - 2021 etec center paññāsāstra university of cambodia | phnom penh english: english based education inter-cultural study center english: english based education references mr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/cvs/qRMBjfWxL0NDX8RXGdasRijPmIWWQ2e5gzGICRlt.pdf', 'Khmer, English, Korean', NULL, 'approve', '2024-09-16 10:17:30', '2024-09-18 04:29:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `causes`
--
ALTER TABLE `causes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `causes_user_id_foreign` (`user_id`);

--
-- Indexes for table `cause_comments`
--
ALTER TABLE `cause_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cause_comments_cause_id_foreign` (`cause_id`),
  ADD KEY `cause_comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `cause_donations`
--
ALTER TABLE `cause_donations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cause_faqs`
--
ALTER TABLE `cause_faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cause_partnerships_and_collaborations`
--
ALTER TABLE `cause_partnerships_and_collaborations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cause_partnerships_and_collaborations_cause_id_foreign` (`cause_id`);

--
-- Indexes for table `cause_photos`
--
ALTER TABLE `cause_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cause_replies`
--
ALTER TABLE `cause_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cause_replies_comment_id_foreign` (`comment_id`),
  ADD KEY `cause_replies_user_id_foreign` (`user_id`),
  ADD KEY `cause_replies_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `cause_reports`
--
ALTER TABLE `cause_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cause_reports_cause_id_foreign` (`cause_id`);

--
-- Indexes for table `cause_target_audiences`
--
ALTER TABLE `cause_target_audiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cause_target_audiences_cause_id_foreign` (`cause_id`),
  ADD KEY `cause_target_audiences_target_audience_category_id_foreign` (`target_audience_category_id`);

--
-- Indexes for table `cause_target_regions`
--
ALTER TABLE `cause_target_regions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cause_target_regions_cause_id_foreign` (`cause_id`),
  ADD KEY `cause_target_regions_target_region_id_foreign` (`target_region_id`);

--
-- Indexes for table `cause_user_bookmarks`
--
ALTER TABLE `cause_user_bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cause_user_bookmarks_cause_id_foreign` (`cause_id`),
  ADD KEY `cause_user_bookmarks_user_id_foreign` (`user_id`);

--
-- Indexes for table `cause_user_likes`
--
ALTER TABLE `cause_user_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cause_user_likes_user_id_foreign` (`user_id`),
  ADD KEY `cause_user_likes_cause_id_foreign` (`cause_id`);

--
-- Indexes for table `cause_videos`
--
ALTER TABLE `cause_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_photos`
--
ALTER TABLE `event_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_tickets`
--
ALTER TABLE `event_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_videos`
--
ALTER TABLE `event_videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_page_items`
--
ALTER TABLE `home_page_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `other_page_items`
--
ALTER TABLE `other_page_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partnership_and_collaboration_categories`
--
ALTER TABLE `partnership_and_collaboration_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photo_categories`
--
ALTER TABLE `photo_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_post_category_id_foreign` (`post_category_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specials`
--
ALTER TABLE `specials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `target_audience_categories`
--
ALTER TABLE `target_audience_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `target_regions`
--
ALTER TABLE `target_regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_categories`
--
ALTER TABLE `video_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `volunteers`
--
ALTER TABLE `volunteers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `volunteers_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `causes`
--
ALTER TABLE `causes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `cause_comments`
--
ALTER TABLE `cause_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cause_donations`
--
ALTER TABLE `cause_donations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `cause_faqs`
--
ALTER TABLE `cause_faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cause_partnerships_and_collaborations`
--
ALTER TABLE `cause_partnerships_and_collaborations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `cause_photos`
--
ALTER TABLE `cause_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cause_replies`
--
ALTER TABLE `cause_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cause_reports`
--
ALTER TABLE `cause_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cause_target_audiences`
--
ALTER TABLE `cause_target_audiences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `cause_target_regions`
--
ALTER TABLE `cause_target_regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cause_user_bookmarks`
--
ALTER TABLE `cause_user_bookmarks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cause_user_likes`
--
ALTER TABLE `cause_user_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `cause_videos`
--
ALTER TABLE `cause_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `event_photos`
--
ALTER TABLE `event_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `event_tickets`
--
ALTER TABLE `event_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_videos`
--
ALTER TABLE `event_videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `home_page_items`
--
ALTER TABLE `home_page_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `other_page_items`
--
ALTER TABLE `other_page_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `partnership_and_collaboration_categories`
--
ALTER TABLE `partnership_and_collaboration_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `photo_categories`
--
ALTER TABLE `photo_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `specials`
--
ALTER TABLE `specials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `target_audience_categories`
--
ALTER TABLE `target_audience_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `target_regions`
--
ALTER TABLE `target_regions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `video_categories`
--
ALTER TABLE `video_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `volunteers`
--
ALTER TABLE `volunteers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `causes`
--
ALTER TABLE `causes`
  ADD CONSTRAINT `causes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cause_comments`
--
ALTER TABLE `cause_comments`
  ADD CONSTRAINT `cause_comments_cause_id_foreign` FOREIGN KEY (`cause_id`) REFERENCES `causes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cause_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cause_partnerships_and_collaborations`
--
ALTER TABLE `cause_partnerships_and_collaborations`
  ADD CONSTRAINT `cause_partnerships_and_collaborations_cause_id_foreign` FOREIGN KEY (`cause_id`) REFERENCES `causes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cause_replies`
--
ALTER TABLE `cause_replies`
  ADD CONSTRAINT `cause_replies_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `cause_comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cause_replies_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cause_replies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cause_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cause_reports`
--
ALTER TABLE `cause_reports`
  ADD CONSTRAINT `cause_reports_cause_id_foreign` FOREIGN KEY (`cause_id`) REFERENCES `causes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cause_target_audiences`
--
ALTER TABLE `cause_target_audiences`
  ADD CONSTRAINT `cause_target_audiences_cause_id_foreign` FOREIGN KEY (`cause_id`) REFERENCES `causes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cause_target_audiences_target_audience_category_id_foreign` FOREIGN KEY (`target_audience_category_id`) REFERENCES `target_audience_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cause_target_regions`
--
ALTER TABLE `cause_target_regions`
  ADD CONSTRAINT `cause_target_regions_cause_id_foreign` FOREIGN KEY (`cause_id`) REFERENCES `causes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cause_target_regions_target_region_id_foreign` FOREIGN KEY (`target_region_id`) REFERENCES `target_regions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cause_user_bookmarks`
--
ALTER TABLE `cause_user_bookmarks`
  ADD CONSTRAINT `cause_user_bookmarks_cause_id_foreign` FOREIGN KEY (`cause_id`) REFERENCES `causes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cause_user_bookmarks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cause_user_likes`
--
ALTER TABLE `cause_user_likes`
  ADD CONSTRAINT `cause_user_likes_cause_id_foreign` FOREIGN KEY (`cause_id`) REFERENCES `causes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cause_user_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volunteers`
--
ALTER TABLE `volunteers`
  ADD CONSTRAINT `volunteers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
