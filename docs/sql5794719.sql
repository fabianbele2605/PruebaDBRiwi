-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Servidor: sql5.freesqldatabase.com
-- Tiempo de generación: 12-08-2025 a las 14:20:07
-- Versión del servidor: 5.5.62-0ubuntu0.14.04.1
-- Versión de PHP: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sql5794719`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Customers`
--

CREATE TABLE `Customers` (
  `Identification_Number` bigint(20) NOT NULL,
  `Customer_Name` varchar(255) NOT NULL,
  `Address` text NOT NULL,
  `Phone` varchar(50) NOT NULL,
  `Email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Customers`
--

INSERT INTO `Customers` (`Identification_Number`, `Customer_Name`, `Address`, `Phone`, `Email`) VALUES
(7005498, 'Ashley Adams', '660 Marcus Camp Suite 262\nPort Stevenmouth, NC 10819', '(224)273-1751x2329', 'elambert@cook.info'),
(11426912, 'Chad Garcia', '195 Rollins Land Suite 478\nNorth Angelastad, IN 84674', '(530)211-7419', 'john27@schaefer.com'),
(25832528, 'Julia Davis', '0246 Brown Roads Suite 606\nNorth Luisburgh, WI 38462', '674-440-7862', 'barkerbrent@berg-dougherty.com'),
(30122773, 'Sean Hood', '7426 Middleton Hill Suite 303\nMillerview, CO 23232', '+1-348-069-6954x792', 'cynthiaevans@hernandez.com'),
(56103750, 'Joshua Delgado', '741 Morgan Underpass\nSouth Sheila, IL 16740', '101-802-6501x00181', 'greenbrandon@gmail.com'),
(61660425, 'Kyle Martinez', 'USS Greene\nFPO AA 26511', '676-110-6562x32575', 'haleronald@vargas-hernandez.info'),
(64271785, 'Tammy Jacobs', '57458 Collier Junctions Suite 288\nLake Nicholas, CT 00530', '227.597.0062', 'scottroger@gmail.com'),
(71585472, 'Pamela Herrera', '3416 Gregory Rapids Suite 629\nNorth Nicolehaven, IL 93329', '539.557.9029', 'cardenasthomas@yahoo.com'),
(79987146, 'Julie Dunn', '758 Ruth Mall\nBriggstown, MA 48538', '883-656-1878x6532', 'melissawebb@gmail.com'),
(87147005, 'Terry Watson', '0047 Lori Square\nEast Josechester, KS 29146', '(426)053-2668', 'kaiserwilliam@hotmail.com'),
(92651576, 'Katherine Dunn', '837 Schneider Spur Suite 656\nDarrellmouth, WI 33323', '6081126986', 'golson@davis.info'),
(97866586, 'Amy Woods', '247 Sheila Centers\nNorth Troybury, WA 43836', '2338512573', 'paul38@byrd.info'),
(112231541, 'Jennifer Phelps', '392 Smith Corners Apt. 737\nEast Angeltown, MO 64086', '248.695.2117', 'echristian@hotmail.com'),
(118434130, 'Marcia Randolph', '327 Roberts Neck\nGonzalezshire, WA 18952', '508.559.9292', 'huntrussell@smith.com'),
(149186547, 'Angel Daniel', 'USNS Davis\nFPO AP 78518', '(873)222-2692x09480', 'rmiller@boyer.com'),
(174039328, 'Autumn Webb', '198 Frazier Branch Suite 399\nSouth Sharon, AR 75490', '907-357-6151x4325', 'davidreed@hotmail.com'),
(179287266, 'Ryan Harrison', '66252 Trevor Harbor Apt. 887\nLake Ambertown, TN 81820', '001-320-723-6362x5909', 'carrie64@hotmail.com'),
(181982363, 'Robert Hicks', '1639 Delacruz Park\nEast Linda, DC 18242', '(335)290-8992', 'powelllarry@hotmail.com'),
(196811583, 'Kimberly Bennett', '70851 Daniel Station Apt. 975\nHernandezton, IL 77476', '(083)724-9058x016', 'smithmichelle@gmail.com'),
(204909440, 'Jason Pace', '19964 Edwards Pines\nSouth Jeremystad, AZ 79080', '001-517-371-6236x2223', 'tjohnson@yahoo.com'),
(215716832, 'Janice Alexander', '81268 Hamilton Fort\nFitzgeraldfort, ID 71489', '+1-411-073-0697x704', 'matthew55@leach-blackburn.com'),
(241114561, 'Gregory Anderson', '5395 Brandon Freeway Apt. 858\nNorth Melissa, OR 60184', '+1-282-173-3048x555', 'julie98@cortez.com'),
(243553915, 'Eric Klein', '0571 Carroll Cliffs\nDavisstad, WI 00721', '9179003714', 'acostajoshua@hotmail.com'),
(260613460, 'Jennifer Mendoza', '11916 Katherine Creek\nKathleenport, ND 68479', '203-605-2009x1103', 'susanchapman@gmail.com'),
(265881315, 'Jenna Scott', 'Unit 1694 Box 1865\nDPO AE 26667', '404-358-1223x371', 'rogerseric@hotmail.com'),
(268619593, 'Richard Lopez', '6875 Hill Forks\nTeresaland, AL 58910', '+1-418-560-8033x44588', 'justinallen@quinn.info'),
(291010345, 'Robert Rodriguez', '9483 Patricia Greens Suite 612\nWest Daniel, CT 37484', '562-175-6225x4306', 'steven70@gmail.com'),
(307805784, 'Madison Jones', 'USNS Ferguson\nFPO AP 50263', '149.766.5747', 'wattsdavid@morgan-wheeler.com'),
(311310607, 'Louis Gilbert', '530 Brown Corner\nThompsontown, WV 70738', '461.203.7672x451', 'pgreene@hotmail.com'),
(315164793, 'Morgan Leon', '853 Virginia Cape Suite 757\nWilsonport, SC 89614', '001-853-081-5933x565', 'miranda94@yahoo.com'),
(319413369, 'Marcus Martin', 'PSC 6227, Box 1600\nAPO AP 14578', '+1-071-678-3536x79738', 'jamesjenkins@harmon-randall.com'),
(325459789, 'Robert Smith', 'Unit 2774 Box 4368\nDPO AE 01041', '001-595-596-1706x9253', 'smithtimothy@wallace.com'),
(325603096, 'Jonathan Smith', '322 Smith Pines Suite 052\nLake Scotthaven, NM 11543', '796.397.5185x7448', 'debragriffin@hotmail.com'),
(326481119, 'Brandon Hester', '0169 Summers Vista\nWest Stuart, UT 98685', '836.687.2362x166', 'huertatracie@yahoo.com'),
(328037408, 'Kim Russell', '887 Kelley Walk Apt. 960\nEast Martha, CT 59649', '001-136-251-3102x24346', 'cindy11@wood.com'),
(333387701, 'Sarah Thompson', 'Unit 0218 Box 2805\nDPO AA 08015', '+1-444-121-3206x307', 'williamchavez@yahoo.com'),
(355405632, 'Sarah Martin', '5963 Strong Points\nLake Kayla, SC 51830', '406-810-6283', 'earllee@gmail.com'),
(355813998, 'Connor Wagner', '506 Brandy Rapid\nDawsonberg, RI 42470', '0195959907', 'haley03@boyd-harris.com'),
(357901640, 'Michael Evans', '921 Ramirez Mount\nNew Anthonyville, ND 52047', '6777129275', 'steven80@yahoo.com'),
(394523505, 'Gregory Howell', '036 Tyler Groves Suite 302\nDanielsfurt, WV 45483', '213-496-7129x11054', 'david12@young.org'),
(401149568, 'Andrew Johns', '62457 Booth Mews Apt. 453\nLake Vincentport, DE 49208', '894-499-5852x2479', 'lorinelson@hotmail.com'),
(444056964, 'Mark Ford', '07900 Friedman Ferry Suite 170\nSouth Christina, WV 53142', '+1-407-009-2402', 'millerricardo@hotmail.com'),
(475925688, 'Matthew Wilson', '42023 Barrett Path Suite 281\nJeremyborough, OH 72889', '(264)225-7425', 'matthew15@ramirez.com'),
(484837788, 'Tracy Simmons', '76775 Jennifer Orchard Apt. 758\nPort Lance, NH 53890', '0383343588', 'bryan30@williams.com'),
(492953650, 'Carol Lawson', '747 Miller Point\nGeorgeton, UT 90920', '783.291.2840', 'joneskelsey@hotmail.com'),
(494808313, 'Rebecca Avila', '78969 Mcguire Springs Suite 562\nPort Christopher, NJ 29478', '773.248.1617', 'pwilson@sanchez.com'),
(499561637, 'Bill Hopkins', '54675 Matthew Key\nTorresstad, ME 64087', '288-662-8572', 'briannaweeks@gmail.com'),
(505327194, 'Fernando Hunt', '9609 Conner Track Apt. 859\nKristenberg, MD 40765', '5863279231', 'abigailkelly@johnson.net'),
(511962082, 'Rachel Fisher', '38507 Newman Loop Suite 268\nTommyberg, UT 25108', '650-424-8808', 'bgarcia@johnson.org'),
(519768710, 'Angelica Gibbs', '68574 Coleman Villages Suite 522\nNorth Erikaton, CA 83413', '+1-378-867-9488x99135', 'yarnold@smith-bruce.com'),
(520620439, 'Nicole Mcdonald', '7229 Michelle Forges Suite 411\nHardyview, VT 06858', '+1-692-758-5774x3951', 'frederickmarshall@evans.biz'),
(520971718, 'Briana Wu', '534 Campbell View\nSandersland, FL 59798', '(177)732-3856x95766', 'rachelsmith@frey.com'),
(527088924, 'Jorge Thomas', '013 Tabitha Cliff\nStevenmouth, NJ 04089', '921-668-1704x3013', 'jason19@yahoo.com'),
(565067343, 'Elizabeth Singleton', '87020 Horton Valleys\nRodriguezfurt, WV 03348', '173.672.3805', 'jeffreyhahn@dawson-myers.biz'),
(569390187, 'Jasmine Kelly', '697 Reynolds Dam Apt. 423\nJacobland, MO 89387', '843-277-1394', 'fitzgeraldelizabeth@yahoo.com'),
(569906245, 'David Webb', '3613 Laura Ridges Suite 762\nSouth Theresa, VA 98493', '993.305.1410', 'stevenrodriguez@gmail.com'),
(573712035, 'Heather Collins', '7878 Nelson Stravenue\nNew Jacob, NE 62801', '+1-960-564-8502x177', 'thomashansen@hotmail.com'),
(594590875, 'Stephanie Acosta', '7067 Henderson Knoll\nJoshuashire, NJ 84213', '001-365-629-8075x05840', 'joshuahenderson@pierce-ramos.com'),
(599800533, 'Mariah Jackson', '558 Bryan Isle\nNew Raymond, AL 55316', '(382)120-4674', 'eperry@wilson.com'),
(603449840, 'Elizabeth Rodriguez', '3551 Rodriguez Port Apt. 808\nLake Charles, WI 24322', '(677)161-5260x6354', 'kathyrodriguez@thompson.biz'),
(622536043, 'Kim Stephens', '12967 Ryan Shoals Apt. 994\nPort Jesse, MO 86007', '(092)586-3570x54204', 'karen28@johnson.com'),
(623072602, 'Carlos Wood', '53828 Laura Spurs\nLauraville, DE 53316', '440-516-4972x0722', 'hillwilliam@hotmail.com'),
(625774276, 'Ralph Bush', '03975 Mills Square Apt. 322\nPort Claudia, MI 34792', '+1-866-778-9252x6524', 'bradleyamy@doyle.com'),
(626043010, 'Christopher Edwards', '32230 Jeffery Via Apt. 616\nWest Tanya, WA 77567', '(204)535-1285x920', 'pmcclain@castro-humphrey.com'),
(636808209, 'Timothy Wood', '836 Bates Points\nPort Andrewshire, GA 83721', '001-948-037-6474', 'christina78@yahoo.com'),
(643387222, 'Ryan Richards', '695 Francis Cliffs\nPort Bryantown, VT 33873', '001-398-345-1521x215', 'phillipcarter@hotmail.com'),
(644042817, 'Linda Shepard', '4947 Reynolds Islands\nKathleenburgh, DE 96988', '2931087130', 'munozcharles@yahoo.com'),
(667230218, 'Donald Young', '223 Dawson Mall Suite 571\nSmithburgh, MS 75952', '929-112-6985x483', 'stanleyhall@hotmail.com'),
(689720635, 'Kathleen Brady', 'Unit 6453 Box 5308\nDPO AA 48049', '2253893664', 'victoria31@gmail.com'),
(696739719, 'Sarah Clark', '04967 Nguyen Circle Suite 871\nLake Andrea, NY 87021', '853.981.8171', 'wsanchez@christian.com'),
(696962875, 'Miss Carrie Underwood', 'USNV Morris\nFPO AA 49085', '0792914312', 'amy45@hotmail.com'),
(708283326, 'Jonathan Cook', '657 Landry Way Suite 966\nRobinsonfurt, CA 22461', '0756633727', 'zjones@yahoo.com'),
(708960117, 'Shannon Horn', 'USNS Buchanan\nFPO AA 82885', '(297)388-2854', 'brian88@pitts-bush.com'),
(717643055, 'Cynthia Lee', '368 Jones Estates Apt. 059\nJonesstad, NY 59968', '+1-822-188-2029x6929', 'christinaflores@jones.org'),
(724330039, 'Meghan Nguyen', '259 Jared Manor\nBrownville, AZ 52844', '767.278.8207', 'hhughes@randolph-ingram.com'),
(724488250, 'Brett Odom', '952 Barbara Turnpike\nJacquelinebury, MO 71346', '550.725.0901', 'colemanjames@chavez.info'),
(729577216, 'Richard Weiss', '316 Robert Dam\nNorth Christina, MA 15552', '521-212-3209x2220', 'carla37@gmail.com'),
(747822485, 'Adam Mckinney', '572 Tammy Forest\nYoungside, SD 92567', '813.559.4153x962', 'fwilliams@lewis-wu.org'),
(763963140, 'Miguel Sharp MD', '47921 Johnson Expressway Suite 742\nOliviaport, PA 16931', '001-600-899-5324', 'sgeorge@ramos-acevedo.net'),
(778029406, 'Christine Curtis', '2480 Jesse Unions Suite 534\nEast Antonioshire, MS 71510', '554.861.0493x592', 'christopherferguson@acevedo-robertson.info'),
(779362405, 'John Price', 'PSC 5622, Box 3709\nAPO AA 38900', '546-202-9331x88558', 'daniel62@powell.com'),
(785949232, 'Raven Jordan', '6132 Spencer Corner Apt. 383\nLake Loriberg, MA 96874', '001-870-036-3211', 'rayalexa@yahoo.com'),
(796337665, 'Mr. Justin Cook', 'Unit 9907 Box 4757\nDPO AE 46640', '737.675.5823', 'ofritz@richards.com'),
(800125157, 'Bobby Luna', '2923 Michael Fords Suite 316\nDustinton, IN 31032', '001-549-919-1859', 'kathryn43@hotmail.com'),
(819212515, 'Erin Marshall', '04382 Edward Mountains Suite 369\nGeorgeberg, ME 94518', '793.145.6997x893', 'sethsmith@robinson.com'),
(830210363, 'Tony Pham', 'Unit 3715 Box 5620\nDPO AA 18266', '001-094-782-5703', 'kendrapena@yahoo.com'),
(843106189, 'Brian Morton', '431 Rodriguez Estate Suite 894\nNew Christopherview, TN 74616', '+1-352-961-6835x0739', 'garnold@bender-caldwell.com'),
(857630459, 'Valerie Brown', '2739 Hood Rest Apt. 962\nJohnburgh, UT 27169', '869.591.7228', 'qmcgee@gmail.com'),
(861461933, 'Sharon Ingram', '132 Vargas Turnpike\nDanielbury, DE 40715', '270.214.8473x8548', 'seanbishop@yahoo.com'),
(867865303, 'Jerry Greene', '60823 Lauren Wall Apt. 074\nNew Kellyside, MI 21097', '(703)649-5080x4789', 'jay56@white-wiggins.com'),
(892962448, 'Jason Luna', '204 Laura Hill\nCraigland, OK 08760', '600.123.2569x570', 'rodriguezrhonda@yahoo.com'),
(893866597, 'Joshua Neal', '1324 William Glens\nNew Jenniferland, IL 16679', '001-256-341-5493x0374', 'wheelerbrandon@hotmail.com'),
(896950954, 'Ryan Russell', '70003 Tiffany Drives\nRobertchester, IA 05998', '001-266-212-7928x22281', 'michael78@walters.com'),
(915064128, 'Blake Ford', '933 Casey Court Apt. 193\nLake Douglas, AL 33325', '276-740-5323x764', 'wrightsally@hotmail.com'),
(917844640, 'Christopher Gomez', '875 Jennifer Oval Suite 067\nWest Phillipmouth, IL 91337', '001-066-886-7181x1777', 'marcus34@hotmail.com'),
(959234562, 'Lindsay Garcia', '906 Justin Locks Apt. 838\nPort Timothyview, AR 68865', '001-158-358-0277', 'juliamatthews@carpenter.com'),
(962795476, 'Shelby Wolf', '613 Billy Radial Suite 171\nSouth Benjamin, WY 15230', '7506854443', 'daniel46@gmail.com'),
(965030358, 'Kyle Jackson', '24896 Helen Rapid Suite 758\nNew Joseph, MN 97017', '001-392-237-6541x8420', 'pwheeler@yahoo.com'),
(969677194, 'Michael Holt', '3499 David Lake Suite 745\nSouth Dylan, AK 03041', '882-041-3572', 'rmiller@hubbard-benitez.com'),
(975617669, 'Yolanda Hines', '812 Mccarthy Viaduct Apt. 376\nKristinamouth, AL 43563', '(659)333-4905', 'cscott@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Invoices`
--

CREATE TABLE `Invoices` (
  `Invoice_Number` varchar(10) NOT NULL,
  `Billing_Period` varchar(7) NOT NULL,
  `Billed_Amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Invoices`
--

INSERT INTO `Invoices` (`Invoice_Number`, `Billing_Period`, `Billed_Amount`) VALUES
('FAC1190', '2024-07', '40302.00'),
('FAC1208', '2024-07', '97457.00'),
('FAC1309', '2024-06', '153404.00'),
('FAC1328', '2024-07', '159093.00'),
('FAC1330', '2024-06', '165021.00'),
('FAC1462', '2024-07', '30813.00'),
('FAC1490', '2024-07', '104241.00'),
('FAC1513', '2024-06', '39792.00'),
('FAC1691', '2024-07', '17870.00'),
('FAC1760', '2024-07', '43148.00'),
('FAC1856', '2024-06', '45733.00'),
('FAC1904', '2024-06', '107189.00'),
('FAC1926', '2024-06', '116488.00'),
('FAC2139', '2024-07', '197548.00'),
('FAC2187', '2024-07', '186218.00'),
('FAC2190', '2024-07', '33428.00'),
('FAC2238', '2024-06', '129980.00'),
('FAC2382', '2024-06', '37708.00'),
('FAC2512', '2024-07', '153659.00'),
('FAC2909', '2024-06', '57259.00'),
('FAC3039', '2024-07', '88189.00'),
('FAC3104', '2024-07', '114319.00'),
('FAC3395', '2024-06', '102468.00'),
('FAC3529', '2024-06', '51911.00'),
('FAC3589', '2024-06', '163283.00'),
('FAC3660', '2024-06', '55572.00'),
('FAC3709', '2024-06', '179739.00'),
('FAC3888', '2024-07', '80735.00'),
('FAC3914', '2024-06', '106611.00'),
('FAC4082', '2024-07', '196509.00'),
('FAC4264', '2024-07', '27833.00'),
('FAC4305', '2024-06', '153650.00'),
('FAC4348', '2024-07', '124048.00'),
('FAC4380', '2024-06', '62979.00'),
('FAC4679', '2024-07', '110754.00'),
('FAC4680', '2024-06', '22294.00'),
('FAC4870', '2024-07', '196275.00'),
('FAC4962', '2024-06', '90456.00'),
('FAC5128', '2024-06', '37472.00'),
('FAC5210', '2024-06', '161137.00'),
('FAC5322', '2024-06', '20824.00'),
('FAC5390', '2024-06', '79808.00'),
('FAC5439', '2024-06', '41300.00'),
('FAC5492', '2024-07', '145586.00'),
('FAC5649', '2024-06', '102093.00'),
('FAC5678', '2024-07', '100426.00'),
('FAC5707', '2024-06', '179217.00'),
('FAC5756', '2024-06', '69026.00'),
('FAC6022', '2024-07', '54969.00'),
('FAC6122', '2024-07', '22161.00'),
('FAC6207', '2024-07', '75801.00'),
('FAC6223', '2024-06', '179265.00'),
('FAC6381', '2024-07', '134884.00'),
('FAC6577', '2024-06', '76145.00'),
('FAC6585', '2024-07', '163925.00'),
('FAC6693', '2024-07', '142010.00'),
('FAC6979', '2024-06', '42157.00'),
('FAC7018', '2024-06', '158030.00'),
('FAC7068', '2024-06', '39940.00'),
('FAC7110', '2024-06', '158138.00'),
('FAC7188', '2024-07', '52267.00'),
('FAC7289', '2024-06', '157001.00'),
('FAC7378', '2024-07', '58242.00'),
('FAC7474', '2024-07', '32072.00'),
('FAC7475', '2024-06', '87244.00'),
('FAC7503', '2024-07', '23411.00'),
('FAC7521', '2024-07', '61920.00'),
('FAC7543', '2024-06', '26817.00'),
('FAC7545', '2024-07', '160000.00'),
('FAC7561', '2024-06', '11359.00'),
('FAC7570', '2024-06', '17171.00'),
('FAC7850', '2024-07', '68367.00'),
('FAC7938', '2024-07', '167924.00'),
('FAC7964', '2024-07', '147864.00'),
('FAC7986', '2024-06', '128381.00'),
('FAC8010', '2024-06', '193307.00'),
('FAC8025', '2024-07', '14710.00'),
('FAC8033', '2024-06', '35669.00'),
('FAC8107', '2024-07', '58585.00'),
('FAC8140', '2024-06', '175018.00'),
('FAC8510', '2024-07', '98069.00'),
('FAC8571', '2024-07', '29482.00'),
('FAC8649', '2024-06', '147991.00'),
('FAC8663', '2024-07', '191634.00'),
('FAC8740', '2024-06', '127084.00'),
('FAC8752', '2024-06', '93635.00'),
('FAC8801', '2024-07', '165402.00'),
('FAC8875', '2024-06', '142787.00'),
('FAC8943', '2024-06', '49512.00'),
('FAC9210', '2024-06', '163844.00'),
('FAC9278', '2024-06', '166287.00'),
('FAC9310', '2024-07', '115066.00'),
('FAC9358', '2024-06', '87402.00'),
('FAC9524', '2024-06', '161529.00'),
('FAC9573', '2024-06', '51213.00'),
('FAC9634', '2024-06', '78561.00'),
('FAC9699', '2024-07', '94554.00'),
('FAC9872', '2024-06', '191436.00'),
('FAC9905', '2024-07', '138162.00'),
('FAC9956', '2024-07', '123720.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Transactions`
--

CREATE TABLE `Transactions` (
  `Transaction_ID` varchar(10) NOT NULL,
  `Transaction_Date_Time` double NOT NULL,
  `Transaction_Amount` decimal(15,2) NOT NULL,
  `Transaction_Status` enum('Pendiente','Fallida','Completada') NOT NULL,
  `Transaction_Type` varchar(50) NOT NULL DEFAULT 'Invoice Payment',
  `Platform_Used` enum('Nequi','Daviplata') NOT NULL,
  `Paid_Amount` decimal(15,2) NOT NULL,
  `Identification_Number` bigint(20) NOT NULL,
  `Invoice_Number` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Transactions`
--

INSERT INTO `Transactions` (`Transaction_ID`, `Transaction_Date_Time`, `Transaction_Amount`, `Transaction_Status`, `Transaction_Type`, `Platform_Used`, `Paid_Amount`, `Identification_Number`, `Invoice_Number`) VALUES
('TXN001', 1717254000, '38940.00', 'Pendiente', 'Pago de Factura', 'Nequi', '38940.00', 149186547, 'FAC7068'),
('TXN002', 1720544400, '75145.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '75145.00', 475925688, 'FAC6577'),
('TXN003', 1718290800, '179217.00', 'Fallida', 'Pago de Factura', 'Daviplata', '179217.00', 112231541, 'FAC5707'),
('TXN004', 1722016800, '51767.00', 'Fallida', 'Pago de Factura', 'Daviplata', '51767.00', 708283326, 'FAC7188'),
('TXN005', 1722164400, '156501.00', 'Completada', 'Pago de Factura', 'Daviplata', '156501.00', 959234562, 'FAC7289'),
('TXN006', 1721181600, '32428.00', 'Completada', 'Pago de Factura', 'Nequi', '32428.00', 243553915, 'FAC2190'),
('TXN007', 1722049200, '75301.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '75301.00', 7005498, 'FAC6207'),
('TXN008', 1718658000, '16870.00', 'Pendiente', 'Pago de Factura', 'Nequi', '16870.00', 724330039, 'FAC1691'),
('TXN009', 1720670400, '21794.00', 'Fallida', 'Pago de Factura', 'Nequi', '21794.00', 643387222, 'FAC4680'),
('TXN010', 1718856000, '193307.00', 'Completada', 'Pago de Factura', 'Daviplata', '193307.00', 215716832, 'FAC8010'),
('TXN011', 1717239600, '159093.00', 'Completada', 'Pago de Factura', 'Daviplata', '159093.00', 92651576, 'FAC1328'),
('TXN012', 1720828800, '174518.00', 'Pendiente', 'Pago de Factura', 'Nequi', '174518.00', 724488250, 'FAC8140'),
('TXN013', 1720112400, '110254.00', 'Fallida', 'Pago de Factura', 'Daviplata', '110254.00', 265881315, 'FAC4679'),
('TXN014', 1720774800, '162283.00', 'Pendiente', 'Pago de Factura', 'Nequi', '162283.00', 401149568, 'FAC3589'),
('TXN015', 1718989200, '22161.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '22161.00', 778029406, 'FAC6122'),
('TXN016', 1720458000, '195775.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '195775.00', 307805784, 'FAC4870'),
('TXN017', 1719475200, '20824.00', 'Fallida', 'Pago de Factura', 'Nequi', '20824.00', 484837788, 'FAC5322'),
('TXN018', 1720519200, '191134.00', 'Completada', 'Pago de Factura', 'Nequi', '191134.00', 962795476, 'FAC8663'),
('TXN019', 1718586000, '62979.00', 'Completada', 'Pago de Factura', 'Daviplata', '62979.00', 965030358, 'FAC4380'),
('TXN020', 1717902000, '36472.00', 'Fallida', 'Pago de Factura', 'Daviplata', '36472.00', 644042817, 'FAC5128'),
('TXN021', 1718535600, '127881.00', 'Completada', 'Pago de Factura', 'Nequi', '127881.00', 689720635, 'FAC7986'),
('TXN022', 1722326400, '26317.00', 'Fallida', 'Pago de Factura', 'Daviplata', '26317.00', 800125157, 'FAC7543'),
('TXN023', 1722060000, '147364.00', 'Pendiente', 'Pago de Factura', 'Nequi', '147364.00', 268619593, 'FAC7964'),
('TXN024', 1719381600, '153404.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '153404.00', 625774276, 'FAC1309'),
('TXN025', 1720364400, '14210.00', 'Completada', 'Pago de Factura', 'Nequi', '14210.00', 569906245, 'FAC8025'),
('TXN026', 1717891200, '49012.00', 'Completada', 'Pago de Factura', 'Daviplata', '49012.00', 328037408, 'FAC8943'),
('TXN027', 1719572400, '40302.00', 'Fallida', 'Pago de Factura', 'Daviplata', '40302.00', 969677194, 'FAC1190'),
('TXN028', 1719986400, '27833.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '27833.00', 796337665, 'FAC4264'),
('TXN029', 1722236400, '30313.00', 'Fallida', 'Pago de Factura', 'Nequi', '30313.00', 636808209, 'FAC1462'),
('TXN030', 1722042000, '134884.00', 'Fallida', 'Pago de Factura', 'Daviplata', '134884.00', 975617669, 'FAC6381'),
('TXN031', 1720018800, '28982.00', 'Completada', 'Pago de Factura', 'Nequi', '28982.00', 569390187, 'FAC8571'),
('TXN032', 1718488800, '158030.00', 'Pendiente', 'Pago de Factura', 'Nequi', '158030.00', 325459789, 'FAC7018'),
('TXN033', 1719234000, '196009.00', 'Fallida', 'Pago de Factura', 'Daviplata', '196009.00', 325603096, 'FAC4082'),
('TXN034', 1719093600, '68526.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '68526.00', 819212515, 'FAC5756'),
('TXN035', 1719162000, '165287.00', 'Completada', 'Pago de Factura', 'Nequi', '165287.00', 444056964, 'FAC9278'),
('TXN036', 1719590400, '178265.00', 'Fallida', 'Pago de Factura', 'Nequi', '178265.00', 717643055, 'FAC6223'),
('TXN037', 1721775600, '98069.00', 'Completada', 'Pago de Factura', 'Nequi', '98069.00', 30122773, 'FAC8510'),
('TXN038', 1722142800, '153150.00', 'Completada', 'Pago de Factura', 'Nequi', '153150.00', 622536043, 'FAC4305'),
('TXN039', 1717606800, '86902.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '86902.00', 747822485, 'FAC9358'),
('TXN040', 1719565200, '96457.00', 'Pendiente', 'Pago de Factura', 'Nequi', '96457.00', 857630459, 'FAC1208'),
('TXN041', 1717808400, '145586.00', 'Fallida', 'Pago de Factura', 'Daviplata', '145586.00', 204909440, 'FAC5492'),
('TXN042', 1721088000, '163425.00', 'Fallida', 'Pago de Factura', 'Nequi', '163425.00', 241114561, 'FAC6585'),
('TXN043', 1721977200, '186218.00', 'Pendiente', 'Pago de Factura', 'Nequi', '186218.00', 494808313, 'FAC2187'),
('TXN044', 1720764000, '159000.00', 'Fallida', 'Pago de Factura', 'Daviplata', '159000.00', 315164793, 'FAC7545'),
('TXN045', 1721613600, '94554.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '94554.00', 505327194, 'FAC9699'),
('TXN046', 1722009600, '152659.00', 'Fallida', 'Pago de Factura', 'Daviplata', '152659.00', 892962448, 'FAC2512'),
('TXN047', 1717624800, '165021.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '165021.00', 394523505, 'FAC1330'),
('TXN048', 1718031600, '115066.00', 'Completada', 'Pago de Factura', 'Daviplata', '115066.00', 763963140, 'FAC9310'),
('TXN049', 1717462800, '161029.00', 'Completada', 'Pago de Factura', 'Daviplata', '161029.00', 594590875, 'FAC9524'),
('TXN050', 1722240000, '167924.00', 'Completada', 'Pago de Factura', 'Nequi', '167924.00', 25832528, 'FAC7938'),
('TXN051', 1721865600, '147991.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '147991.00', 97866586, 'FAC8649'),
('TXN052', 1722009600, '124048.00', 'Completada', 'Pago de Factura', 'Nequi', '124048.00', 79987146, 'FAC4348'),
('TXN053', 1720929600, '138162.00', 'Completada', 'Pago de Factura', 'Nequi', '138162.00', 520620439, 'FAC9905'),
('TXN054', 1719550800, '161137.00', 'Fallida', 'Pago de Factura', 'Nequi', '161137.00', 260613460, 'FAC5210'),
('TXN055', 1718611200, '35669.00', 'Fallida', 'Pago de Factura', 'Daviplata', '35669.00', 511962082, 'FAC8033'),
('TXN056', 1720267200, '67867.00', 'Fallida', 'Pago de Factura', 'Nequi', '67867.00', 527088924, 'FAC7850'),
('TXN057', 1721955600, '58242.00', 'Fallida', 'Pago de Factura', 'Nequi', '58242.00', 181982363, 'FAC7378'),
('TXN058', 1717981200, '113319.00', 'Pendiente', 'Pago de Factura', 'Nequi', '113319.00', 87147005, 'FAC3104'),
('TXN059', 1720756800, '37708.00', 'Completada', 'Pago de Factura', 'Daviplata', '37708.00', 623072602, 'FAC2382'),
('TXN060', 1721509200, '54969.00', 'Pendiente', 'Pago de Factura', 'Nequi', '54969.00', 729577216, 'FAC6022'),
('TXN061', 1720497600, '51411.00', 'Completada', 'Pago de Factura', 'Daviplata', '51411.00', 696739719, 'FAC3529'),
('TXN062', 1721210400, '45233.00', 'Completada', 'Pago de Factura', 'Nequi', '45233.00', 520971718, 'FAC1856'),
('TXN063', 1717999200, '99926.00', 'Fallida', 'Pago de Factura', 'Nequi', '99926.00', 785949232, 'FAC5678'),
('TXN064', 1718902800, '31572.00', 'Completada', 'Pago de Factura', 'Nequi', '31572.00', 519768710, 'FAC7474'),
('TXN065', 1718352000, '123720.00', 'Pendiente', 'Pago de Factura', 'Nequi', '123720.00', 64271785, 'FAC9956'),
('TXN066', 1722279600, '17171.00', 'Fallida', 'Pago de Factura', 'Daviplata', '17171.00', 357901640, 'FAC7570'),
('TXN067', 1721743200, '56259.00', 'Fallida', 'Pago de Factura', 'Daviplata', '56259.00', 830210363, 'FAC2909'),
('TXN068', 1718938800, '196548.00', 'Fallida', 'Pago de Factura', 'Daviplata', '196548.00', 696962875, 'FAC2139'),
('TXN069', 1718924400, '93635.00', 'Completada', 'Pago de Factura', 'Daviplata', '93635.00', 896950954, 'FAC8752'),
('TXN070', 1721095200, '58585.00', 'Completada', 'Pago de Factura', 'Daviplata', '58585.00', 196811583, 'FAC8107'),
('TXN071', 1717714800, '86244.00', 'Completada', 'Pago de Factura', 'Daviplata', '86244.00', 893866597, 'FAC7475'),
('TXN072', 1721350800, '55572.00', 'Fallida', 'Pago de Factura', 'Nequi', '55572.00', 291010345, 'FAC3660'),
('TXN073', 1718967600, '50713.00', 'Fallida', 'Pago de Factura', 'Nequi', '50713.00', 915064128, 'FAC9573'),
('TXN074', 1719702000, '129480.00', 'Completada', 'Pago de Factura', 'Nequi', '129480.00', 11426912, 'FAC2238'),
('TXN075', 1720054800, '41657.00', 'Completada', 'Pago de Factura', 'Daviplata', '41657.00', 174039328, 'FAC6979'),
('TXN076', 1718467200, '126084.00', 'Completada', 'Pago de Factura', 'Daviplata', '126084.00', 565067343, 'FAC8740'),
('TXN077', 1717502400, '190936.00', 'Fallida', 'Pago de Factura', 'Nequi', '190936.00', 333387701, 'FAC9872'),
('TXN078', 1719021600, '78561.00', 'Fallida', 'Pago de Factura', 'Nequi', '78561.00', 355405632, 'FAC9634'),
('TXN079', 1721750400, '162844.00', 'Completada', 'Pago de Factura', 'Nequi', '162844.00', 71585472, 'FAC9210'),
('TXN080', 1719691200, '80235.00', 'Fallida', 'Pago de Factura', 'Nequi', '80235.00', 708960117, 'FAC3888'),
('TXN081', 1718686800, '158138.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '158138.00', 626043010, 'FAC7110'),
('TXN082', 1717704000, '101593.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '101593.00', 326481119, 'FAC5649'),
('TXN083', 1719043200, '103741.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '103741.00', 599800533, 'FAC1490'),
('TXN084', 1720076400, '41300.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '41300.00', 492953650, 'FAC5439'),
('TXN085', 1718812800, '89956.00', 'Completada', 'Pago de Factura', 'Daviplata', '89956.00', 573712035, 'FAC4962'),
('TXN086', 1720864800, '165402.00', 'Completada', 'Pago de Factura', 'Nequi', '165402.00', 56103750, 'FAC8801'),
('TXN087', 1720101600, '106689.00', 'Pendiente', 'Pago de Factura', 'Nequi', '106689.00', 867865303, 'FAC1904'),
('TXN088', 1718380800, '22411.00', 'Completada', 'Pago de Factura', 'Nequi', '22411.00', 355813998, 'FAC7503'),
('TXN089', 1719482400, '11359.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '11359.00', 118434130, 'FAC7561'),
('TXN090', 1717858800, '79808.00', 'Pendiente', 'Pago de Factura', 'Nequi', '79808.00', 779362405, 'FAC5390'),
('TXN091', 1720231200, '42648.00', 'Pendiente', 'Pago de Factura', 'Nequi', '42648.00', 499561637, 'FAC1760'),
('TXN092', 1717408800, '101468.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '101468.00', 179287266, 'FAC3395'),
('TXN093', 1719007200, '115488.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '115488.00', 667230218, 'FAC1926'),
('TXN094', 1721970000, '61920.00', 'Completada', 'Pago de Factura', 'Daviplata', '61920.00', 311310607, 'FAC7521'),
('TXN095', 1721782800, '141510.00', 'Fallida', 'Pago de Factura', 'Nequi', '141510.00', 319413369, 'FAC6693'),
('TXN096', 1720483200, '39792.00', 'Pendiente', 'Pago de Factura', 'Daviplata', '39792.00', 861461933, 'FAC1513'),
('TXN097', 1720519200, '87689.00', 'Completada', 'Pago de Factura', 'Daviplata', '87689.00', 61660425, 'FAC3039'),
('TXN098', 1720242000, '178739.00', 'Fallida', 'Pago de Factura', 'Nequi', '178739.00', 603449840, 'FAC3709'),
('TXN099', 1722092400, '105611.00', 'Fallida', 'Pago de Factura', 'Daviplata', '105611.00', 917844640, 'FAC3914'),
('TXN100', 1720699200, '141787.00', 'Fallida', 'Pago de Factura', 'Daviplata', '141787.00', 843106189, 'FAC8875');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`Identification_Number`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indices de la tabla `Invoices`
--
ALTER TABLE `Invoices`
  ADD PRIMARY KEY (`Invoice_Number`);

--
-- Indices de la tabla `Transactions`
--
ALTER TABLE `Transactions`
  ADD PRIMARY KEY (`Transaction_ID`),
  ADD KEY `Identification_Number` (`Identification_Number`),
  ADD KEY `Invoice_Number` (`Invoice_Number`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Transactions`
--
ALTER TABLE `Transactions`
  ADD CONSTRAINT `Transactions_ibfk_1` FOREIGN KEY (`Identification_Number`) REFERENCES `Customers` (`Identification_Number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Transactions_ibfk_2` FOREIGN KEY (`Invoice_Number`) REFERENCES `Invoices` (`Invoice_Number`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
