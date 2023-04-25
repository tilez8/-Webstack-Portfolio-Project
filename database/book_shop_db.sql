-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2023 at 04:15 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `client_id`, `inventory_id`, `price`, `quantity`, `date_created`) VALUES
(4, 1, 1, 2500, 1, '2021-07-16 13:48:00'),
(8, 2, 3, 250, 2, '2023-04-25 16:50:19'),
(9, 2, 6, 300, 1, '2023-04-25 19:01:04'),
(10, 2, 10, 285, 1, '2023-04-25 19:04:58');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Educational', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt; Educational Books means Books that, when published, were intended primarily for sale to educational markets (i.e., K-12, higher education, continuing education, vocational, professional, self-study, and similar educational markets) for use in educational programs.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;  &lt;/p&gt;', 1, '2021-07-16 09:08:44'),
(2, 'Fiction', '&lt;p&gt;Fiction refers to literature created from the imagination. Mysteries, science fiction, romance, fantasy, chick lit, crime thrillers are all fiction genres.&lt;/p&gt;', 1, '2021-07-16 09:09:25'),
(3, 'Novels', '&lt;p&gt;a novel is a well-written fictional work, written in order to fascinate and entertain the readers with a story.&lt;/p&gt;', 1, '2021-07-16 09:09:46'),
(4, 'Biography', '&lt;p&gt;A book about a single person\'s life and work, but probably with a great deal, too, about their family and friends, relations and children, colleagues and acquaintances. The word \'biography\' means \'life-writing\': the two halves of the word derive from medieval Greek bios, \'life\', and graphia, \'writing\'.&lt;/p&gt;', 1, '2021-07-16 11:33:52');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(1, 'John', 'Smith', 'Male', '091023456789', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'Sample Address', '2021-07-16 10:34:48'),
(2, 'mebrahtom', 'kahsay', 'Male', '0974331977', 'mebrieka@gmail.com', 'd16d792b9cedbbfb8632aa36e9a41696', '', '2023-04-17 14:37:14');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(1, 1, 50, 250, '2021-07-16 10:02:39', '2023-04-17 17:51:48'),
(2, 2, 20, 350, '2021-07-16 10:09:08', '2023-04-17 17:51:44'),
(3, 3, 10, 250, '2021-07-16 12:05:54', '2023-04-17 17:51:38'),
(4, 4, 50, 199, '2021-07-16 13:12:10', '2023-04-17 17:51:31'),
(6, 6, 38, 300, '2023-04-17 18:09:22', NULL),
(7, 7, 50, 450, '2023-04-17 18:18:47', NULL),
(8, 8, 50, 350, '2023-04-17 18:29:07', NULL),
(9, 9, 25, 280, '2023-04-17 18:39:31', NULL),
(10, 10, 26, 285, '2023-04-17 18:48:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(5, 2, '', 'cod', 1, 199, 0, 0, '2023-04-18 15:03:56', NULL),
(6, 2, '', 'cod', 1, 285, 0, 1, '2023-04-18 15:05:24', '2023-04-25 13:45:31'),
(7, 2, '', 'cod', 2, 2070, 0, 0, '2023-04-25 13:49:34', NULL),
(8, 2, 'Addis ababa', 'cod', 2, 398, 0, 0, '2023-04-25 13:51:47', NULL),
(9, 2, '', 'Online Payment', 2, 285, 3, 1, '2023-04-25 13:55:15', '2023-04-25 13:56:15'),
(10, 2, 'Mexico', 'cod', 1, 350, 0, 1, '2023-04-25 14:05:10', '2023-04-25 14:05:27');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `quantity`, `price`, `total`) VALUES
(4, 5, 4, 1, 199, 199),
(5, 6, 10, 1, 285, 285),
(6, 7, 5, 9, 230, 2070),
(7, 8, 4, 2, 199, 398),
(8, 9, 10, 1, 285, 285),
(9, 10, 2, 1, 350, 350);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `title` varchar(250) NOT NULL,
  `author` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `title`, `author`, `description`, `status`, `date_created`) VALUES
(1, 1, 1, 'CakePHP: From Novice to professional', 'David Golding', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-07-16 09:43:11'),
(2, 1, 1, 'Murach\\\'s PHP and MySQL', 'Joel Murach, Ray Harris', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-07-16 10:08:53'),
(3, 1, 2, 'English Grammar in Use', 'Raymond Murphy, Surai Pongtongcharoen', '&lt;p&gt;&lt;span style=\\&quot;text-align: justify;\\&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non ultrices tortor. Sed at ligula non lectus tempor bibendum a nec ante. Maecenas iaculis vitae nisi eu dictum. Duis sit amet enim arcu. Etiam blandit vulputate magna, non lobortis velit pharetra vel. Morbi sollicitudin lorem sed augue suscipit, eu commodo tortor vulputate. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent eleifend interdum est, at gravida erat molestie in. Vestibulum et consectetur dui, ac luctus arcu. Curabitur et viverra elit. Cras ac eleifend ipsum, ac suscipit leo. Vivamus porttitor ac risus eu ultricies. Morbi malesuada mi vel luctus sagittis. Ut vestibulum porttitor est, id rutrum libero. Mauris at lacus vehicula, aliquam purus quis, pharetra lorem.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-07-16 12:03:08'),
(4, 1, 2, 'English Grammar for Dummies', 'Geraldine Woods', '&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Ut et urna sapien. Nulla lacinia sagittis felis id cursus. Etiam eget lacus quis enim aliquet dignissim. Nulla vel elit ultrices, venenatis quam sed, rutrum magna. Pellentesque ultricies non lorem hendrerit vestibulum. Maecenas lacinia pharetra nisi, at pharetra nunc placerat nec. Maecenas luctus dolor in leo malesuada, vel aliquet metus sollicitudin. Curabitur sed pellentesque sem, in tincidunt mi. Aliquam sodales aliquam felis, eget tristique felis dictum at. Proin leo nisi, malesuada vel ex eu, dictum pellentesque mauris. Quisque sit amet varius augue.&lt;/p&gt;&lt;p style=\\&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\\&quot;&gt;Sed quis imperdiet est. Donec lobortis tortor id neque tempus, vel faucibus lorem mollis. Fusce ut sollicitudin risus. Aliquam iaculis tristique nunc vel feugiat. Sed quis nulla non dui ornare porttitor eu vitae nisi. Curabitur at quam ut libero convallis mattis vel eget mauris. Vivamus vitae lectus ligula. Nulla facilisi. Vivamus tristique maximus nulla, vel mollis felis blandit posuere. Curabitur mi risus, rutrum non magna at, molestie gravida magna. Aenean neque sapien, volutpat a ullamcorper nec, iaculis quis est.&lt;/p&gt;', 1, '2021-07-16 13:11:17'),
(6, 2, 3, 'Mrs Dalloway', 'Virginia Woolf', 'Mrs. Dalloway is a novel by Virginia Woolf published on 14 May 1925. It details a day in the life of Clarissa Dalloway, a fictional upper-class woman in post-First World War England. It is one of Woolf\\\'s best-known novels. The working title of Mrs. Dalloway was The Hours', 1, '2023-04-17 18:08:46'),
(7, 2, 4, 'Start-up Nation', 'Saul Singer , Dan Senor', '&lt;p&gt;Start-Up Nation addresses the trillion dollar question: How is it that Israel -- a country of 7.1 million, only 60 years old, surrounded by enemies, in a constant state of war since its founding, with no natural resources-- produces more start-up companies than large, peaceful, and stable nations like Japan, China, India, Korea, Canada and the UK?&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;With the savvy of foreign policy insiders, Senor and Singer examine the lessons of the country\\\'s adversity-driven culture, which flattens hierarchy and elevates informality-- all backed up by government policies focused on innovation. In a world where economies as diverse as Ireland, Singapore and Dubai have tried to re-create the \\&quot;Israel effect\\&quot;, there are entrepreneurial lessons well worth noting. As America reboots its own economy and can-do spirit, there\\\'s never been a better time to look at this remarkable and resilient nation for some impressive, surprising clues.&lt;/p&gt;', 1, '2023-04-17 18:18:19'),
(8, 3, 5, 'The Foxglove King', 'HANNAH WHITTEN', '&lt;p&gt;In this romantic new fantasy series from author Hannah Whitten, a young woman\\\'s secret power to raise the dead plunges her into the dangerous and glamorous world of the Sainted King\\\'s royal court.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;When Lore was thirteen, she escaped a cult in the catacombs beneath the city of Dellaire. And in the ten years since, she&rsquo;s lived by one rule: don&rsquo;t let them find you. Easier said than done, when her death magic ties her to the city.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Mortem, the magic born from death, is a high-priced and illicit commodity in Dellaire, and Lore&rsquo;s job running poisons keeps her in food, shelter, and relative security. But when a run goes wrong and Lore&rsquo;s power is revealed, she&rsquo;s taken by the Presque Mort, a group of warrior-monks sanctioned to use Mortem working for the Sainted King. Lore fully expects a pyre, but King August has a different plan. Entire villages on the outskirts of the country have been dying overnight, seemingly at random. Lore can either use her magic to find out what&rsquo;s happening and who in the King&rsquo;s court is responsible, or die.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Lore is thrust into the Sainted King&rsquo;s glittering court, where no one can be believed and even fewer can be trusted. Guarded by Gabriel, a duke-turned-monk, and continually running up against Bastian, August&rsquo;s ne&rsquo;er-do-well heir, Lore tangles in politics, religion, and forbidden romance as she attempts to navigate a debauched and opulent society.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;But the life she left behind in the catacombs is catching up with her. And even as Lore makes her way through the Sainted court above, they might be drawing closer than she thinks.&lt;/p&gt;', 1, '2023-04-17 18:28:31'),
(9, 3, 6, 'The White Road', 'Sarah Lotz', '&lt;p&gt;If you missed this terrific book when it was first published, this is the perfect opportunity to dive into an action-driven thriller with a twist of Stephen King. Simon is fueled by adrenaline but has little purpose in his life. His business partner pushes him to explore a cave system hoping to document the remains of three lost spelunkers, so Simon hires a surly guide and climbs down into the claustrophobic caves, where they soon find themselves trapped by rising water. Simon makes it out and goes on to make an attempt at climbing Everest to document the bodies of climbers who didn&rsquo;t make it, but he&rsquo;s haunted, either by a real, malevolent spirit, or a creeping paranoia. As the mountain pushes him to the limit, the question of what&rsquo;s happening &mdash; and how he&rsquo;ll survive &mdash; is the sort of white-knuckle adventure you&rsquo;ll love.&lt;br&gt;&lt;/p&gt;', 1, '2023-04-17 18:39:08'),
(10, 4, 7, 'Steve Jobs', 'Walter Isaacson', '&lt;p&gt;Walter Isaacson&rsquo;s &ldquo;enthralling&rdquo; (The New Yorker) worldwide bestselling biography of Apple cofounder Steve Jobs.&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-size: 1rem;\\&quot;&gt;Based on more than forty interviews with Steve Jobs conducted over two years&mdash;as well as interviews with more than 100 family members, friends, adversaries, competitors, and colleagues&mdash;Walter Isaacson has written a riveting story of the roller-coaster life and searingly intense personality of a creative entrepreneur whose passion for perfection and ferocious drive revolutionized six industries: personal computers, animated movies, music, phones, tablet computing, and digital publishing.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-size: 1rem;\\&quot;&gt;At a time when America is seeking ways to sustain its innovative edge, Jobs stands as the ultimate icon of inventiveness and applied imagination. He knew that the best way to create value in 21st century was to connect creativity with technology. He built a company where leaps of the imagination were combined with remarkable feats of engineering.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-size: 1rem;\\&quot;&gt;Although Jobs cooperated with the author, he asked for no control over what was written. He put nothing off-limits. He encouraged the people he knew to speak honestly. And Jobs speaks candidly, sometimes brutally so, about the people he worked with and competed against. His friends, foes, and colleagues provide an unvarnished view of the passions, perfectionism, obsessions, artistry, devilry, and compulsion for control that shaped his approach to business and the innovative products that resulted.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-size: 1rem;\\&quot;&gt;Driven by demons, Jobs could drive those around him to fury and despair. But his personality and products were interrelated, just as Apple&rsquo;s hardware and software tended to be, as if part of an integrated system. His tale is instructive and cautionary, filled with lessons about innovation, character, leadership, and values.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=\\&quot;font-size: 1rem;\\&quot;&gt;Steve Jobs is the inspiration for the movie of the same name starring Michael Fassbender, Kate Winslet, Seth Rogen, and Jeff Daniels, directed by Danny Boyle with a screenplay by Aaron Sorkin.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2023-04-17 18:47:31');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(1, 3, 8500, '2021-07-16 11:18:12'),
(3, 5, 199, '2023-04-18 15:03:56'),
(4, 6, 285, '2023-04-18 15:05:24'),
(5, 7, 2070, '2023-04-25 13:49:35'),
(6, 8, 398, '2023-04-25 13:51:47'),
(7, 9, 285, '2023-04-25 13:55:15'),
(8, 10, 350, '2023-04-25 14:05:10');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Programming', '&lt;p&gt;Sample Sub Category&lt;/p&gt;', 1, '2021-07-16 09:10:44'),
(2, 1, 'Grammar', '&lt;p&gt;Sample Sub 102&lt;/p&gt;', 1, '2021-07-16 09:11:05'),
(3, 2, 'Literary', '&lt;p&gt;Sample Sub 103&lt;/p&gt;', 1, '2021-07-16 09:11:36'),
(4, 2, 'Historical', '&lt;p&gt;Sample 104&lt;/p&gt;', 1, '2021-07-16 09:12:51'),
(5, 3, 'Fantasy', '&lt;p&gt;Sample Sub 105&lt;/p&gt;', 1, '2021-07-16 09:13:28'),
(6, 3, 'Action and Adventure', '&lt;p&gt;Sample Sub 106&lt;/p&gt;', 1, '2021-07-16 09:13:49'),
(7, 4, 'Technocrats', '&lt;p&gt;Technocrats&lt;/p&gt;', 1, '2021-07-16 11:34:22'),
(8, 4, 'Book Writers', '&lt;p&gt;Book Writers&lt;br&gt;&lt;/p&gt;', 1, '2023-04-17 17:26:18');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Online Book Shop'),
(6, 'short_name', 'Books'),
(11, 'logo', 'uploads/1626397500_book_logo.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1626397620_books.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(4, 'John', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', NULL, NULL, 0, '2021-06-19 08:36:09', '2021-06-19 10:53:12'),
(5, 'Mebrahtom', 'Kahsay', 'mebrieka', 'Pa$$w0rd', NULL, NULL, 0, '2021-06-19 10:01:51', '2023-04-25 17:41:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
