-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2025 at 12:00 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `users_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `image_file` varchar(50) NOT NULL DEFAULT '',
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `image_file`, `date`) VALUES
(1, ' Life in CSE: -', '\"A Journey of Code, Logic & Innovation\"', 'Hey there, tech enthusias', 'Welcome to the world of Computer Science & Engineering (CSE) — a branch where creativity meets logic, and ideas turn into powerful digital solutions.\r\n\r\n🔍 What Makes CSE Special?\r\nCSE isn’t just about learning programming languages — it’s about solving real-world problems using technology. From developing websites and mobile apps to diving deep into data science, cybersecurity, AI, and machine learning — the possibilities are endless.\r\n\r\n🧠 What We Learn\r\nHere’s a glimpse of the knowledge we gain:\r\n\r\nProgramming in languages like C, C++, Python, Java\r\n\r\nWeb development, databases, and backend systems\r\n\r\nOperating systems, computer networks, and architecture\r\n\r\nData structures & algorithms for efficient coding\r\n\r\nEmerging technologies like AI, ML, Blockchain, and Cybersecurity\r\n\r\n👨‍💻 Beyond the Books\r\nCSE is more than theory — it’s about hands-on learning. We participate in:\r\n\r\nHackathons & coding competitions 🧠🔥\r\n\r\nOpen-source contributions 💻\r\n\r\nGroup projects and internships\r\n\r\nTech fests and community building\r\n\r\n🌟 Our Goal\r\nTo become the innovators, engineers, and leaders of tomorrow — creating solutions that make life smarter, safer, and more connected.\r\n\r\nWhether you\'re a fellow CSE student, a tech lover, or someone curious about our branch — thanks for reading. Stay tuned for more updates from our CSE journey!\r\n\r\n– Proud to be CSE!', 'coding.jpeg', '2025-04-18 01:04:15'),
(2, 'How to Become an Ethical Hacker: A Step-by-Step Journey to Cybersecurity Mastery  Tagline:', '\"Learn. Hack. Protect.\"', 'become-ethical-hacker-gui', 'Introduction\r\nIn today’s digital age, ethical hackers are the warriors who protect information, businesses, and people from cyber threats. If you dream of becoming one of these modern heroes, this guide is your first step into the exciting world of ethical hacking.\r\n\r\nStep 1: Build Strong Fundamentals\r\nBefore you hack, you must understand the basics.\r\n\r\nLearn about computers, operating systems (Windows, Linux).\r\n\r\nUnderstand how networks work (IP addresses, routers, firewalls).\r\n\r\nGet familiar with databases, websites, and servers.\r\n\r\n📚 Suggested Topics: Networking (TCP/IP), OS basics, Cybersecurity principles.\r\n\r\nStep 2: Master Programming Skills\r\nProgramming is the weapon of a hacker.\r\n\r\nStart with Python — powerful and easy for automating tasks.\r\n\r\nLearn HTML, JavaScript for web hacking.\r\n\r\nExplore Bash scripting for Linux systems.\r\n\r\nStep 3: Dive into Cybersecurity Concepts\r\nUnderstand what you are protecting and what the attackers want.\r\n\r\nLearn about malware, phishing, DoS attacks, encryption, and more.\r\n\r\nStudy real-world cyber attacks and how they were performed.\r\n\r\nStep 4: Get Hands-On with Tools\r\nA hacker’s toolkit is full of powerful software.\r\n\r\nPractice with tools like Nmap, Wireshark, Metasploit, Burp Suite.\r\n\r\nSet up your own lab with Virtual Machines (like Kali Linux + Windows).\r\n\r\nStep 5: Practice, Practice, Practice!\r\nReal skills are built by real practice.\r\n\r\nSolve Capture The Flag (CTF) challenges.\r\n\r\nTry platforms like Hack The Box, TryHackMe, OverTheWire.\r\n\r\nParticipate in ethical hacking competitions and bug bounty programs.\r\n\r\nStep 6: Get Certified\r\nProve your skills and boost your career.\r\n\r\nPopular Certifications:\r\n\r\nCEH (Certified Ethical Hacker)\r\n\r\nOSCP (Offensive Security Certified Professional)\r\n\r\nCompTIA Security+\r\n\r\nStep 7: Stay Updated and Keep Learning\r\nCybersecurity is always evolving. Stay sharp!\r\n\r\nFollow top blogs, news, and cybersecurity communities.\r\n\r\nExperiment with new tools, attend webinars, and network with professionals.\r\n\r\nConclusion\r\nBecoming an ethical hacker is a journey of passion, patience, and continuous learning. With the right mindset and dedication, you can turn your curiosity into a powerful force for good.\r\n🌟 Remember: In a world full of threats, be the shield, not the sword!\r\n\r\n', 'hacker.jpg', '2025-04-18 00:36:34'),
(3, 'INNOVATIVE CODERS 2.O', '\"Coding with smart Coders and Innovation with Creative mindset\"', 'innovativecoder', 'We are Innovative Coders 2.O — a team of passionate thinkers, builders, and problem-solvers driven by creativity and technology. With a mission to push the boundaries of what\'s possible, we combine cutting-edge code with bold ideas to create impactful solutions. Innovation isn\'t just in our name — it\'s in everything we do.', 'innovative.jpg', '2025-04-18 00:57:06'),
(15, ' Lamborghini: The Ultimate Symbol of Speed and Luxury', '\"Unleash the Bull. Rule the Roads.\"', 'lamborghini-speed-luxury', 'Introduction\r\nLamborghini — a name that is not just about cars but about a legend. A perfect blend of Italian craftsmanship and cutting-edge design, Lamborghini is a dream car for enthusiasts all around the world.\r\n\r\nHistory\r\nThe story of Lamborghini began in 1963 when Ferruccio Lamborghini founded the brand. The first model, the Lamborghini 350 GT, set a new standard for performance and luxury. Even today, Lamborghini is renowned for its bold designs and roaring engines.\r\n\r\nTop Models\r\n\r\nLamborghini Aventador: A powerhouse of extreme performance featuring an iconic V12 engine.\r\n\r\nLamborghini Huracán: The perfect blend of elegance and agility, ideal for those stepping into the world of supercars.\r\n\r\nLamborghini Revuelto (New 2024): With a plug-in hybrid powertrain, it represents the future of innovation and performance.\r\n\r\nLamborghini Urus: The world\'s fastest luxury SUV, combining practicality with Lamborghini\'s signature power.\r\n\r\nKey Features\r\n\r\nAerodynamic, futuristic designs\r\n\r\nHigh-performance naturally aspirated engines\r\n\r\nLuxurious, handcrafted interiors\r\n\r\nAdvanced driving dynamics and technology\r\n\r\nWhy Choose Lamborghini?\r\nLamborghini is not just a car; it\'s an emotion. It’s a rebellion against conventional car design. When you drive a Lamborghini, you don\'t just travel — you make a statement to the world about your power, passion, and style.\r\n\r\nConclusion\r\nLamborghini is not just about transportation; it\'s about creating unforgettable experiences with every drive. It\'s not just driving — it\'s living the dream.', 'lam1.jpg', '2025-04-18 00:28:28'),
(16, 'Bundelkhand University', 'Empowering Futures with Excellence in Education', 'Bundelkhand-University', 'Bundelkhand University: Empowering Futures with Excellence in Education\r\nNestled in the heart of Uttar Pradesh, Bundelkhand University (BU), Jhansi, stands tall as a symbol of academic excellence and holistic development. Established in 1975, BU has grown into one of the most reputed state universities, offering a diverse range of programs and a vibrant campus life that nurtures talent and ambition.\r\n\r\nA Legacy of Quality Education\r\nBundelkhand University is recognized for its commitment to delivering high-quality education across various fields. With over 200+ courses ranging from Science, Technology, Engineering, and Management to Arts, Law, Agriculture, and Medicine, the university caters to the dreams and aspirations of thousands of students each year.\r\n\r\nAccredited by NAAC with a \"B++\" Grade and recognized under UGC, BU ensures that its academic curriculum is always in sync with the latest industry trends and global standards.\r\n\r\nModern Infrastructure and Facilities\r\nBU boasts a sprawling, eco-friendly campus spread over 186 acres, equipped with:\r\n\r\nState-of-the-art laboratories\r\n\r\nWell-stocked libraries\r\n\r\nAdvanced research centers\r\n\r\nComfortable hostels\r\n\r\nSports complexes and cultural hubs\r\n\r\nThe campus offers the perfect environment for learning, innovation, and personal growth.\r\n\r\nFostering Research and Innovation\r\nResearch is the soul of Bundelkhand University. The institution encourages students and faculty to engage in research projects that address real-world challenges. Several departments have received grants from government bodies like DST, ICSSR, DBT, and others, showcasing BU’s growing reputation in research and development.\r\n\r\nCareer Opportunities and Placements\r\nBundelkhand University is committed to empowering students beyond academics. Through its Training and Placement Cell, BU organizes regular placement drives, internships, workshops, and industry interactions. Many students have secured positions in prestigious companies, government sectors, and higher educational institutions across India and abroad.\r\n\r\nA Hub of Cultural Diversity\r\nLife at BU is a celebration of diversity. Students from different states and backgrounds come together, making the university a melting pot of cultures, languages, and traditions. Annual events like \"Sanskriti\", technical fests, sports meets, and seminars make campus life vibrant and memorable.\r\n\r\nWhy Choose Bundelkhand University?\r\nWide range of UG, PG, diploma, and doctoral programs\r\n\r\nAffordable fee structure\r\n\r\nScholarships for deserving students\r\n\r\nFocus on research, innovation, and entrepreneurship\r\n\r\nStrong alumni network across various industries\r\n\r\nConclusion\r\nBundelkhand University is not just an educational institution; it is a place where dreams take flight and futures are built. Whether you aspire to become a scientist, a lawyer, a manager, a teacher, or an entrepreneur, BU provides the perfect launchpad for your ambitions.\r\n\r\nCome, be a part of Bundelkhand University — where education meets excellence!\r\n\r\n', 'bu.png', '2025-04-18 01:40:45');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
