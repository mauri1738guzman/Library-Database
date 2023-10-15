-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3308
-- Generation Time: Mar 19, 2023 at 10:45 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `AddressID` int(11) NOT NULL,
  `StreetAddress` varchar(255) NOT NULL,
  `City` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `ZipCode` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`AddressID`, `StreetAddress`, `City`, `State`, `ZipCode`) VALUES
(1, 'Spring', 'Tx', '44385', '78956'),
(2, 'Spring', 'Tx', '44385', '78956'),
(3, 'Spring', 'Tx', '44385', '78956'),
(4, 'Spring', 'Tx', '44385', '78956'),
(5, 'Spring', 'Tx', '44385', '78956'),
(6, 'Spring', 'Tx', '44385', '99999'),
(7, 'Spring', 'Tx', '44385', '99999'),
(8, 'Spring', 'Tx', '44385', '99999'),
(9, 'Spring', 'Tx', '44385', '99999'),
(10, 'Spring', 'Tx', '44385', '99999'),
(11, 'Spring', 'Tx', '44385', '99999'),
(12, 'Spring', 'Tx', '44385', '99999'),
(13, 'Spring', 'Tx', '44385', '99999'),
(14, 'Spring', 'Tx', '44385', '99999'),
(15, '3722', 'Spring', 'Tx', '77388'),
(16, '3722', 'Spring', 'Tx', '77388'),
(17, '3722', 'Spring', 'Tx', '12345'),
(18, '123 Random', 'Houston', 'TX', '77300'),
(19, '2416 Ridgebrook Ln', 'Pearland', 'TX', '77584'),
(20, '123 road', 'houston', 'tx', '12345'),
(21, '123 something rd', 'Houston', 'TX', '64068'),
(22, '3722 Nowhere', 'Summer', 'Tx', '77000'),
(23, '', '', '', ''),
(24, 'SomeWhere', 'Summer', 'Tx', '77000');

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `CheckoutID` int(11) NOT NULL,
  `MemberID` int(11) NOT NULL,
  `CopyID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `ReturnDate` datetime DEFAULT NULL,
  `TotalLateFee` float DEFAULT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `checkout`
--

INSERT INTO `checkout` (`CheckoutID`, `MemberID`, `CopyID`, `EmployeeID`, `StartDate`, `EndDate`, `ReturnDate`, `TotalLateFee`, `Status`) VALUES
(11, 11, 3, NULL, '2023-03-16 19:45:16', '2023-03-19 23:59:59', '2023-05-18 00:00:00', NULL, 2),
(12, 11, 8, NULL, '2023-03-17 14:31:39', '2023-03-20 23:59:59', '2023-03-19 12:42:14', 0, 2),
(13, 11, 3, NULL, '2023-03-17 15:15:23', '2023-03-20 23:59:59', '2023-03-19 12:42:14', 0, 2),
(14, 11, 3, NULL, '2023-03-17 15:16:31', '2023-03-20 23:59:59', '2023-03-19 12:42:14', NULL, 2),
(15, 11, 4, NULL, '2023-03-17 16:10:48', '2023-03-20 23:59:59', '2023-03-19 12:42:00', NULL, 2),
(16, 11, 1, NULL, '2023-03-19 12:26:42', '2023-03-22 23:59:59', '2023-03-19 12:42:16', NULL, 2),
(17, 11, 3, NULL, '2023-03-19 12:51:08', '2023-03-22 23:59:59', '2023-04-06 13:27:26', NULL, 2),
(18, 16, 3, NULL, '2023-03-19 00:00:00', '2023-03-22 00:00:00', '2023-04-06 13:27:26', NULL, 2),
(19, 11, 4, NULL, '2023-03-19 13:16:15', '2023-03-22 23:59:59', '2023-03-19 12:42:14', 0, 2),
(20, 16, 4, NULL, '2023-03-19 00:00:00', '2023-03-22 00:00:00', '2023-03-19 12:42:14', 0, 2),
(21, 16, 1, NULL, '2023-03-19 13:26:18', '2023-03-22 23:59:59', '2023-03-19 12:42:14', 0, 2),
(22, 11, 1, NULL, '2023-03-19 00:00:00', '2023-03-22 00:00:00', '2023-03-20 13:27:26', 0, 2),
(23, 11, 3, NULL, '2023-03-19 13:32:41', '2023-03-22 23:59:59', '2023-03-19 15:51:35', 0, 2),
(24, 11, 4, NULL, '2023-03-19 13:33:33', '2023-03-22 23:59:59', '2023-03-19 12:42:14', 0, 2),
(25, 11, 3, NULL, '2023-03-19 13:43:13', '2023-03-22 23:59:59', '2023-04-06 13:27:26', NULL, 2),
(26, 11, 3, NULL, '2023-03-19 15:04:33', '2023-03-22 23:59:59', '2023-03-19 15:52:20', 0, 2),
(27, 11, 3, NULL, '2023-03-19 00:00:00', '2023-03-22 00:00:00', '2023-04-06 13:27:26', NULL, 2),
(28, 11, 7, NULL, '2023-03-19 15:50:49', '2023-03-22 23:59:59', '2023-03-25 15:51:48', 3, 2),
(29, 11, 6, NULL, '2023-03-19 15:51:15', '2023-03-22 23:59:59', '2023-03-19 15:52:27', 0, 2);

--
-- Triggers `checkout`
--
DELIMITER $$
CREATE TRIGGER `calculate_late_fee` BEFORE UPDATE ON `checkout` FOR EACH ROW BEGIN
    IF NEW.ReturnDate > OLD.EndDate THEN
        SET NEW.TotalLateFee = DATEDIFF(NEW.ReturnDate, OLD.EndDate) * (
            SELECT LateFee FROM itemtype WHERE ItemTypeID = (
                SELECT TypeID FROM item WHERE ItemID = NEW.CopyID
            )
        );
    ELSE
        SET NEW.TotalLateFee = 0;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `copy`
--

CREATE TABLE `copy` (
  `CopyID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `LibraryID` int(11) NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `copy`
--

INSERT INTO `copy` (`CopyID`, `ItemID`, `LibraryID`, `Status`) VALUES
(1, 1, 1, 0),
(2, 1, 1, 0),
(3, 2, 1, 0),
(4, 4, 1, 0),
(5, 1, 1, 0),
(6, 23, 1, 0),
(7, 23, 1, 0),
(8, 17, 1, 0),
(9, 17, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` int(11) NOT NULL,
  `LibraryID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `Fname` varchar(255) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT 0,
  `Email` varchar(255) NOT NULL,
  `PhoneNum` int(11) NOT NULL,
  `Salary` float NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EmployeeID`, `LibraryID`, `AddressID`, `Fname`, `Lname`, `Active`, `Email`, `PhoneNum`, `Salary`, `Password`) VALUES
(1, 1, 19, 'Loc', 'Trinh', 1, 'admin@gmail.com', 123456789, 5000, '$2y$10$Tg/sbMAaHI.TfPsaz2kaJepxI8ZPUWrWV2v.lVZLonrJAJ9DfY/OG');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ItemID` int(11) NOT NULL,
  `TypeID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Available` tinyint(1) NOT NULL,
  `Description` text DEFAULT NULL,
  `SerialOrISBN` varchar(255) DEFAULT NULL,
  `Publisher` varchar(255) DEFAULT NULL,
  `ReplacementCost` float DEFAULT NULL,
  `ReplacementTime` datetime DEFAULT NULL,
  `Creator` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ItemID`, `TypeID`, `Name`, `Available`, `Description`, `SerialOrISBN`, `Publisher`, `ReplacementCost`, `ReplacementTime`, `Creator`) VALUES
(1, 1, 'Harry Potter and the Sorcerer\'s Stone', 1, 'Harry Potter spent ten long years living with Mr. and Mrs. Dursley, an aunt and uncle whose outrageous favoritism of their perfectly awful son Dudley leads to some of the most inspired dark comedy since Charlie and the Chocolate Factory. But fortunately for Harry, he\'s about to be granted a scholarship to a unique boarding school called THE HOGWORTS SCHOOL OF WITCHCRAFT AND WIZARDRY, where he will become a school hero at the game of Quidditch (a kind of aerial soccer played high above the ground on broomsticks), he will make some wonderful friends, and, unfortunately, a few terrible enemies. For although he seems to be getting your run-of-the-mill boarding school experience (well, ok, even that\'s pretty darn out of the ordinary), Harry Potter has a destiny that he was born to fulfill. A destiny that others would kill to keep him from. ', '0590353403', 'Bloomsbury', NULL, NULL, 'J. K. Rowling'),
(2, 1, 'Harry Potter and the Chamber of Secrets', 1, 'J.K. ROWLING is the author of the enduringly popular, era-defining Harry Potter seven-book series, which have sold over 600 million copies in 85 languages, been listened to as audiobooks for over one billion hours and made into eight smash hit movies. To accompany the series, she wrote three short companion volumes for charity, including Fantastic Beasts and Where to Find Them, which went on to inspire a new series of films featuring Magizoologist Newt Scamander. Harry’s story as a grown-up was continued in a stage play, Harry Potter and the Cursed Child, which J.K. Rowling wrote with playwright Jack Thorne and director John Tiffany.\r\n\r\nIn 2020, she returned to publishing for younger children with the fairy tale The Ickabog, the royalties for which she donated to her charitable trust, Volant, to help charities working to alleviate the social effects of the Covid 19 pandemic. Her latest children’s novel, The Christmas Pig, was published in 2021.\r\n\r\nJ.K. Rowling has received many awards and honours for her writing, including for her detective series written under the name Robert Galbraith. She supports a wide number of humanitarian causes through Volant, and is the founder of the international children’s care reform charity Lumos. J.K. Rowling lives in Scotland with her family.\r\n\r\n', '1338716530', 'Bloomsbury', NULL, NULL, 'J. K. Rowling'),
(4, 1, 'Harry Potter and the Prisoner of Azkaban', 1, '\r\n\r\n‘Welcome to the Knight Bus, emergency transport for the stranded witch or wizard. Just stick out your wand hand, step on board and we can take you anywhere you want to go.\'\r\n\r\nWhen the Knight Bus crashes through the darkness and screeches to a halt in front of him, it\'s the start of another far from ordinary year at Hogwarts for Harry Potter. Sirius Black, escaped mass-murderer and follower of Lord Voldemort, is on the run - and they say he is coming after Harry. In his first ever Divination class, Professor Trelawney sees an omen of death in Harry\'s tea leaves... But perhaps most terrifying of all are the Dementors patrolling the school grounds, with their soul-sucking kiss.\r\n\r\nHaving become classics of our time, the Harry Potter stories never fail to bring comfort and escapism. With their message of hope, belonging and the enduring power of truth and love, the story of the Boy Who Lived continues to delight generations of new listeners.    \r\n', '0545791340', 'Bloomsbury', NULL, NULL, 'J. K. Rowling'),
(5, 1, 'The Great Gatsby', 1, 'A classic novel by F. Scott Fitzgerald', '978-0743273565', 'Scribner', 9.99, NULL, ''),
(6, 1, 'To Kill a Mockingbird', 1, 'A Pulitzer Prize-winning novel by Harper Lee', '978-0446310789', 'J. B. Lippincott & Co.', 10.99, NULL, ''),
(7, 1, '1984', 1, 'A dystopian novel by George Orwell', '978-0451524935', 'Signet Classics', 8.99, NULL, ''),
(8, 1, 'The Catcher in the Rye', 1, 'A controversial novel by J.D. Salinger', '978-0316769488', 'Little, Brown and Company', 9.49, NULL, ''),
(9, 1, 'Pride and Prejudice', 1, 'A romantic novel by Jane Austen', '978-0486284736', 'Dover Publications', 7.99, NULL, ''),
(10, 1, 'Animal Farm', 1, 'A satirical novella by George Orwell', '978-0451526342', 'Signet Classics', 6.99, NULL, ''),
(11, 1, 'The Picture of Dorian Gray', 1, 'A novel by Oscar Wilde', '978-0486278070', 'Dover Publications', 8.49, NULL, ''),
(12, 1, 'Brave New World', 1, 'A dystopian novel by Aldous Huxley', '978-0060850524', 'Harper Perennial Modern Classics', 9.99, NULL, ''),
(13, 1, 'Lord of the Flies', 1, 'A novel by William Golding', '978-0399501487', 'Perigee Trade', 8.99, NULL, ''),
(14, 1, 'The Hobbit', 1, 'A fantasy novel by J.R.R. Tolkien', '978-0547928227', 'Mariner Books', 11.99, NULL, ''),
(15, 10, 'Apple - iPhone 14 128GB - Blue (Verizon)', 1, 'Description\r\niPhone 14. With the most impressive dual-camera system on iPhone. Capture stunning photos in low light and bright light. Get peace of mind with groundbreaking safety features.\r\nFeatures\r\n\r\n    6.1-inch Super Retina XDR display¹\r\n\r\n    Advanced camera system for better photos in any light\r\n\r\n    Cinematic mode now in 4K Dolby Vision up to 30 fps\r\n\r\n    Action mode for smooth, steady, handheld videos\r\n\r\n    Vital safety features—Emergency SOS via satellite² and Crash Detection\r\n\r\n    All-day battery life and up to 20 hours of video playback³\r\n\r\n    A15 Bionic chip with 5-core GPU for lightning-fast performance. Superfast 5G cellular⁴\r\n\r\n    Industry-leading durability features with Ceramic Shield and water resistance⁵\r\n\r\n    iOS 16 offers even more ways to personalize, communicate, and share⁶\r\n\r\n\r\n    ¹The display has rounded corners. When measured as a standard rectangular shape, the screen is 6.06 inches diagonally. Actual viewable area is less.\r\n\r\n    ²Emergency SOS via satellite is available in November 2022. Service is included for free for two years with the activation of any iPhone 14 model.\r\n\r\n    Connection and response times vary based on location, site conditions, and other factors. See apple.com/iphone-14 or apple.com/iphone-14-pro for more information.\r\n\r\n    ³Battery life varies by use and configuration; see apple.com/batteries for more information.\r\n\r\n    ⁴Data plan required. 5G is available in select markets and through select carriers. Speeds vary based on site conditions and carrier. For details on 5G support, contact your carrier and see apple.com/iphone/cellular.\r\n\r\n    ⁵iPhone 14 is splash, water, and dust resistant and was tested under controlled laboratory conditions with a rating of IP68 under IEC standard 60529 (maximum depth of 6 meters up to 30 minutes).\r\n\r\n    Splash, water, and dust resistance are not permanent conditions. Resistance might decrease as a result of normal wear. Do not attempt to charge a wet iPhone; refer to the user guide for cleaning and drying instructions. Liquid damage not covered under warranty.\r\n\r\n    ⁶Some features may not be available for all countries or all areas.\r\n\r\n\r\n    Accessories are sold separately.', '400065051137', 'BestBuy', 900, '0000-00-00 00:00:00', ''),
(17, 10, 'Apple - iPhone 14 Pro 128GB - Gold (AT&T)', 0, 'Description\r\niPhone 14 Pro. Capture incredible detail with a 48MP Main camera. Experience iPhone in a whole new way with Dynamic Island and Always-On display. And get peace of mind with groundbreaking safety features.\r\nFeatures\r\n\r\n    6.1-inch Super Retina XDR display¹ featuring Always-On and ProMotion\r\n\r\n    Dynamic Island, a magical new way to interact with iPhone\r\n\r\n    48MP Main camera for up to 4x greater resolution\r\n\r\n    Cinematic mode now in 4K Dolby Vision up to 30 fps\r\n\r\n    Action mode for smooth, steady, handheld videos\r\n\r\n    Vital safety features—Emergency SOS via satellite² and Crash Detection\r\n\r\n    All-day battery life and up to 23 hours of video playback³\r\n\r\n    A16 Bionic, the ultimate smartphone chip. Superfast 5G cellular⁴\r\n\r\n    Industry-leading durability features with Ceramic Shield and water resistance⁵\r\n\r\n    iOS 16 offers even more ways to personalize, communicate, and share⁶\r\n\r\n\r\n    ¹The display has rounded corners. When measured as a rectangle, the screen is 6.12 inches diagonally. Actual viewable area is less.\r\n\r\n    ²Emergency SOS via satellite is available in November 2022. Service is included for free for two years with the activation of any iPhone 14 model.\r\n\r\n    Connection and response times vary based on location, site conditions, and other factors. See apple.com/iphone-14 or apple.com/iphone-14-pro for more information.\r\n\r\n    ³Battery life varies by use and configuration; see apple.com/batteries for more information.\r\n\r\n    ⁴Data plan required. 5G is available in select markets and through select carriers. Speeds vary based on site conditions and carrier. For details on 5G support, contact your carrier and see apple.com/iphone/cellular.\r\n\r\n    ⁵iPhone 14 Pro is splash, water, and dust resistant and was tested under controlled laboratory conditions with a rating of IP68 under IEC standard 60529 (maximum depth of 6 meters up to 30 minutes).\r\n\r\n    Splash, water, and dust resistance are not permanent conditions. Resistance might decrease as a result of normal wear. Do not attempt to charge a wet iPhone; refer to the user guide for cleaning and drying instructions. Liquid damage not covered under warranty.\r\n\r\n    ⁶Some features may not be available for all countries or all areas.\r\n\r\n\r\n    Accessories are sold separately.', '400064872429', 'BestBuy', 900, '0000-00-00 00:00:00', 'Apple'),
(20, 10, 'Samsung - Galaxy S23 128GB - Lavender (Verizon)', 0, 'Meet Galaxy S23, the phone takes you out of the everyday and into the epic. Life doesn’t wait for the perfect lighting, but with Nightography, you are always ready to seize the moment and snap memories like a pro. See your content no matter the time of day on a display with a refresh rate up to 120Hz and Adaptive Vision Booster. Capture and create in rich detail, and then use Quick Share to share across devices without losing quality. Move past the mundane and embrace epic power with Galaxy S23.', '887276730707', 'BestBuy', 850, NULL, 'Samsung'),
(23, 7, ' Lenovo - Yoga 7i 16\" 2.5K Touch 2-in-1 Laptop - Intel Evo Platform - Core i5-1240P - 8GB Memory - 256GB SSD - Storm Grey', 0, 'The Lenovo™ Yoga™ 7i combines versatile portability and enhanced productivity, thanks to the boundary-breaking performance and responsiveness of 12th generation Intel® Core™ processors and vibrant WQXGA clarity with Intel® Iris® Xe graphics. Go anywhere with a sleek 2-in-1 metal chassis featuring thoughtful details including a webcam privacy shutter.', '196378902586', 'BestBuy', 950, NULL, 'Lenovo');

-- --------------------------------------------------------

--
-- Table structure for table `itemsubject`
--

CREATE TABLE `itemsubject` (
  `ItemID` int(11) NOT NULL,
  `SubjectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `itemtype`
--

CREATE TABLE `itemtype` (
  `ItemTypeID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `LateFee` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `itemtype`
--

INSERT INTO `itemtype` (`ItemTypeID`, `Name`, `LateFee`) VALUES
(1, 'Book', 1),
(2, 'Magazine', 0.25),
(3, 'E-book', 0.75),
(4, 'Audiobook', 1),
(5, 'DVD', 1.5),
(6, 'CD', 1.25),
(7, 'Laptop', 5),
(8, 'Tablet', 3),
(9, 'Camera', 2.5),
(10, 'Smartphone', 2),
(11, 'Graphic Novel', 0.75),
(12, 'Comic Book', 0.5);

-- --------------------------------------------------------

--
-- Table structure for table `library`
--

CREATE TABLE `library` (
  `LibraryID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `LibraryName` varchar(255) NOT NULL,
  `PhoneNum` varchar(10) NOT NULL,
  `Email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `library`
--

INSERT INTO `library` (`LibraryID`, `AddressID`, `LibraryName`, `PhoneNum`, `Email`) VALUES
(1, 1, 'UH', '123456', 'uh1@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `MemberID` int(11) NOT NULL,
  `MemberTypeID` int(11) NOT NULL,
  `AddressID` int(11) NOT NULL,
  `Lname` varchar(255) NOT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT 0,
  `Fname` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `PhoneNum` varchar(10) NOT NULL,
  `MemberStatus` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`MemberID`, `MemberTypeID`, `AddressID`, `Lname`, `Active`, `Fname`, `Email`, `Password`, `PhoneNum`, `MemberStatus`) VALUES
(3, 1, 9, 'huu', 1, 'loc', 'trhuloc@gmail.com', '', '123456789', NULL),
(4, 1, 10, 'huu', 1, 'loc', 'trhuloc@gmail.com', '$2y$10$BFXTEvxWc7mXWyGXslt26OPaPsmJb3QM9pQyw7HWn/aalYirPrhbi', '123456789', NULL),
(5, 1, 11, 'huu', 1, 'loc', 'trhuloc@gmail.com', '$2y$10$WRbih/LwqfLcc9zY2Sg9k.RKxnleouwbQNXC919Hvvwh9MSSjoJvu', '123456789', NULL),
(6, 1, 12, 'huu', 1, 'loc', 'trhuloc@gmail.com', '$2y$10$DZaZ/X8K38Ef5ZApm59IluTHw.UOcL0BkBWYROzRWx.xz96IY9Poq', '123456789', NULL),
(7, 1, 13, 'huu', 1, 'loc', 'loc@gmail.com', '$2y$10$8bDrRgS7EZlGlWf0MCCSE.N.HcuxGjm3eEwpfebnDaOR11EBoqCfa', '123456789', NULL),
(8, 1, 14, 'huu ', 1, 'loc', '123', '$2y$10$nXp8.pL/hLr3GDDshTX.OebR/SAo9pbUspMnEnGDBJgHvwMFWsP5i', '123456789', NULL),
(9, 1, 15, 'loc', 1, 'huu', 'trhulo0c@gmail.com', '$2y$10$TC/mypMrAtoGAzMaa3Lmzupk2p8jNfhOJuXQovW6OLqa11B3hrBMi', '123456789', NULL),
(10, 1, 16, 'loc', 1, 'huu', 'trhulo01c@gmail.com', '$2y$10$1MnViHyphYNKCS/QTDkbdek98CEYLbIIBu5TdgiZQh/89iNzQuoUG', '123456789', NULL),
(11, 1, 17, 'huuu', 1, 'loc', 'trhuloc9@gmail.com', '$2y$10$Tg/sbMAaHI.TfPsaz2kaJepxI8ZPUWrWV2v.lVZLonrJAJ9DfY/OG', '', NULL),
(12, 1, 18, 'abc', 1, 'carson', 'carson@gmail.com', '$2y$10$/VpmNz2D9X//GswFd3.LyefsjfvaAojmoiHnf26WVRntrLKHlKnZS', '123456789', NULL),
(13, 1, 19, 'Karunaratne', 1, 'Dinuk', 'dinukkarunartne747@gmail.com', '$2y$10$F4TEq9/grkG9A8/UtHR7ju6e08a3h4Q36TOvOhXl9EyTNOTy.4zzi', '8326094085', NULL),
(14, 1, 20, 'h', 1, 'f', 'email@gmail.com', '$2y$10$K/QxwayWJY42NBNHTSjIjOn8uz9UvEXxku7lS4nogRz6c4CyEJH7e', '1234567890', NULL),
(15, 1, 21, 'Ahmed', 1, 'Raheem', 'raheemahmed998@gmail.com', '$2y$10$bg33sE8FO8sYTUbYAd3.4ORRBz/K8IwXlTB6KCBCaIYK1xM6EmAbq', '0123456789', NULL),
(16, 1, 22, 'DoDo', 1, 'Mixi', 'domixi@gmail.com', '$2y$10$Tg/sbMAaHI.TfPsaz2kaJepxI8ZPUWrWV2v.lVZLonrJAJ9DfY/OG', '1234560000', NULL),
(18, 1, 24, 'Ngu', 1, 'Mixi', 'mixi@gmail.com', '$2y$10$qvcnHDFpaBE1TDNGt/Drt.hH.0jGMadAV8VRiMmmu8OwODNM7ypyW', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `membertype`
--

CREATE TABLE `membertype` (
  `MemberTypeID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `MaxBorrowingDays` int(11) NOT NULL,
  `MaxItems` int(11) NOT NULL,
  `ItemCount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membertype`
--

INSERT INTO `membertype` (`MemberTypeID`, `Name`, `MaxBorrowingDays`, `MaxItems`, `ItemCount`) VALUES
(1, 'Student', 3, 3, 0),
(2, 'Teacher', 5, 5, 0);

-- --------------------------------------------------------

-- Table structure for table notifications
--

DROP TABLE IF EXISTS notifications;
/!40101 SET @saved_cs_client     = @@character_set_client/;
/!50503 SET character_set_client = utf8mb4/;
CREATE TABLE notifications (
notificationID int NOT NULL,
message text NOT NULL,
memberID int NOT NULL,
PRIMARY KEY (notificationID),
KEY memberID_idx (memberID),
CONSTRAINT memberID FOREIGN KEY (memberID) REFERENCES member (MemberID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/!40101 SET character_set_client = @saved_cs_client/;

--
-- Dumping data for table notifications
--

LOCK TABLES notifications WRITE;
/!40000 ALTER TABLE notifications DISABLE KEYS/;
/!40000 ALTER TABLE notifications ENABLE KEYS/;
UNLOCK TABLES;




--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `ReservationID` int(11) NOT NULL,
  `MemberID` int(11) NOT NULL,
  `CopyID` int(11) NOT NULL,
  `ReservationDate` datetime NOT NULL,
  `ExpirationDate` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`ReservationID`, `MemberID`, `CopyID`, `ReservationDate`, `ExpirationDate`, `status`) VALUES
(6, 16, 3, '2023-03-19 12:53:44', '2023-03-29 23:59:59', 1),
(7, 16, 4, '2023-03-19 13:16:24', '2023-03-29 23:59:59', 1),
(8, 11, 1, '2023-03-19 13:26:46', '2023-03-29 23:59:59', 1),
(9, 11, 3, '2023-03-19 15:04:35', '2023-03-29 23:59:59', 1);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `SubjectID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`AddressID`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`CheckoutID`),
  ADD KEY `FK_MemberID_Checkout` (`MemberID`),
  ADD KEY `FK_CopyID_Checkout` (`CopyID`),
  ADD KEY `FK_EmployeeID_Checkout` (`EmployeeID`);

--
-- Indexes for table `copy`
--
ALTER TABLE `copy`
  ADD PRIMARY KEY (`CopyID`),
  ADD KEY `FK_ItemID_Copy` (`ItemID`),
  ADD KEY `FK_LibraryID_Copy` (`LibraryID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD KEY `FK_LibraryID_Employee` (`LibraryID`),
  ADD KEY `FK_AddressID_Employee` (`AddressID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ItemID`),
  ADD KEY `FK_TypeID_Item` (`TypeID`);

--
-- Indexes for table `itemsubject`
--
ALTER TABLE `itemsubject`
  ADD PRIMARY KEY (`ItemID`,`SubjectID`),
  ADD KEY `FK_SubjectID_ItemSubject` (`SubjectID`);

--
-- Indexes for table `itemtype`
--
ALTER TABLE `itemtype`
  ADD PRIMARY KEY (`ItemTypeID`);

--
-- Indexes for table `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`LibraryID`),
  ADD KEY `FK_AddressID_Library` (`AddressID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`MemberID`),
  ADD KEY `FK_MemberTypeID_Member` (`MemberTypeID`),
  ADD KEY `FK_AddressID_Member` (`AddressID`);

--
-- Indexes for table `membertype`
--
ALTER TABLE `membertype`
  ADD PRIMARY KEY (`MemberTypeID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ReservationID`),
  ADD KEY `FK_MemberID_Reservation` (`MemberID`),
  ADD KEY `FK_CopyID_Reservation` (`CopyID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`SubjectID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `AddressID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE `checkout`
  MODIFY `CheckoutID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `copy`
--
ALTER TABLE `copy`
  MODIFY `CopyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `itemtype`
--
ALTER TABLE `itemtype`
  MODIFY `ItemTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `library`
--
ALTER TABLE `library`
  MODIFY `LibraryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `MemberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `membertype`
--
ALTER TABLE `membertype`
  MODIFY `MemberTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `ReservationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `SubjectID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `FK_CopyID_Checkout` FOREIGN KEY (`CopyID`) REFERENCES `copy` (`CopyID`),
  ADD CONSTRAINT `FK_EmployeeID_Checkout` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  ADD CONSTRAINT `FK_MemberID_Checkout` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`);

--
-- Constraints for table `copy`
--
ALTER TABLE `copy`
  ADD CONSTRAINT `FK_ItemID_Copy` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`),
  ADD CONSTRAINT `FK_LibraryID_Copy` FOREIGN KEY (`LibraryID`) REFERENCES `library` (`LibraryID`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `FK_AddressID_Employee` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`),
  ADD CONSTRAINT `FK_LibraryID_Employee` FOREIGN KEY (`LibraryID`) REFERENCES `library` (`LibraryID`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_TypeID_Item` FOREIGN KEY (`TypeID`) REFERENCES `itemtype` (`ItemTypeID`);

--
-- Constraints for table `itemsubject`
--
ALTER TABLE `itemsubject`
  ADD CONSTRAINT `FK_ItemID_ItemSubject` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`),
  ADD CONSTRAINT `FK_SubjectID_ItemSubject` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`);

--
-- Constraints for table `library`
--
ALTER TABLE `library`
  ADD CONSTRAINT `FK_AddressID_Library` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `FK_AddressID_Member` FOREIGN KEY (`AddressID`) REFERENCES `address` (`AddressID`),
  ADD CONSTRAINT `FK_MemberTypeID_Member` FOREIGN KEY (`MemberTypeID`) REFERENCES `membertype` (`MemberTypeID`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_CopyID_Reservation` FOREIGN KEY (`CopyID`) REFERENCES `copy` (`CopyID`),
  ADD CONSTRAINT `FK_MemberID_Reservation` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
