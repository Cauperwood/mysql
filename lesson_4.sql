DROP DATABASE vk;
CREATE DATABASE vk;
USE vk;

#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Фамиль',
  `email` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `users_phone_idx` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`) VALUES ('1', 'Jamil', 'Champlin', 'mafalda12@example.com', '136');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`) VALUES ('2', 'Vivienne', 'Paucek', 'nweimann@example.net', '452871');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`) VALUES ('3', 'Lempi', 'Ruecker', 'ncarter@example.net', '750');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`) VALUES ('4', 'Carmine', 'Gottlieb', 'ajacobi@example.com', '326');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`) VALUES ('5', 'Tyler', 'Stokes', 'walsh.amani@example.net', '0');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`) VALUES ('6', 'Constantin', 'Kassulke', 'ashleigh35@example.org', '153214');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`) VALUES ('7', 'Esteban', 'Windler', 'btorphy@example.org', '314');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`) VALUES ('8', 'Hilbert', 'Gulgowski', 'margot38@example.org', '1');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`) VALUES ('9', 'Constance', 'Hudson', 'kovacek.fabiola@example.org', '37');
INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`) VALUES ('10', 'Aric', 'Schamberger', 'vlittel@example.org', '717');


#
# TABLE STRUCTURE FOR: media_types
#

DROP TABLE IF EXISTS `media_types`;

CREATE TABLE `media_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('1', 'est', '1970-08-07 04:25:14', '1975-06-09 23:09:46');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('2', 'maxime', '1981-07-08 06:38:08', '2001-01-21 23:31:30');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('3', 'veniam', '1971-07-03 22:09:42', '2003-03-13 18:15:49');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('4', 'eum', '1970-08-30 07:24:33', '1979-12-06 07:51:37');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('5', 'perferendis', '2018-11-22 10:03:54', '1977-03-27 01:47:47');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('6', 'officia', '1998-03-26 19:48:53', '2011-11-07 05:49:15');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('7', 'voluptatum', '1977-01-20 23:09:07', '2004-06-30 12:38:09');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('8', 'deserunt', '1986-03-01 13:02:02', '1972-12-30 10:10:30');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('9', 'sunt', '2009-11-30 02:44:40', '1978-10-25 12:14:02');
INSERT INTO `media_types` (`id`, `name`, `created_at`, `updated_at`) VALUES ('10', 'aperiam', '1991-03-03 02:05:25', '1998-10-22 04:52:44');

#
# TABLE STRUCTURE FOR: communities
#

DROP TABLE IF EXISTS `communities`;

CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `communities_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `communities` (`id`, `name`) VALUES ('4', 'aliquid');
INSERT INTO `communities` (`id`, `name`) VALUES ('8', 'aperiam');
INSERT INTO `communities` (`id`, `name`) VALUES ('9', 'dolore');
INSERT INTO `communities` (`id`, `name`) VALUES ('2', 'dolorem');
INSERT INTO `communities` (`id`, `name`) VALUES ('5', 'esse');
INSERT INTO `communities` (`id`, `name`) VALUES ('10', 'est');
INSERT INTO `communities` (`id`, `name`) VALUES ('1', 'fugit');
INSERT INTO `communities` (`id`, `name`) VALUES ('3', 'laborum');
INSERT INTO `communities` (`id`, `name`) VALUES ('6', 'omnis');
INSERT INTO `communities` (`id`, `name`) VALUES ('7', 'sed');


#
# TABLE STRUCTURE FOR: friend_requests
#

DROP TABLE IF EXISTS `friend_requests`;

CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint(20) unsigned NOT NULL,
  `target_user_id` bigint(20) unsigned NOT NULL,
  `status` enum('requested','approved','unfriended','declined') COLLATE utf8_unicode_ci DEFAULT NULL,
  `requested_at` datetime DEFAULT current_timestamp(),
  `confirmed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `initiator_user_id` (`initiator_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('1', '1', '0', '2006-09-28 03:27:10', '1991-04-27 05:24:08');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('2', '2', '0', '1989-12-27 23:32:38', '2012-09-23 22:04:31');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('3', '3', '0', '2013-03-09 03:51:49', '1971-11-07 01:35:40');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('4', '4', '0', '1995-07-06 07:41:16', '2018-10-28 09:16:37');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('5', '5', '0', '2000-01-04 07:18:26', '2017-08-30 00:56:16');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('6', '6', '0', '1985-07-15 15:44:13', '1970-07-14 17:08:53');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('7', '7', '0', '1994-01-03 20:18:38', '2004-08-30 15:54:15');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('8', '8', '0', '1971-06-22 22:57:56', '2004-10-03 09:43:47');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('9', '9', '0', '1985-01-31 19:33:55', '1970-08-19 09:02:07');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('10', '10', '0', '1978-06-03 13:34:33', '1996-09-10 18:53:05');


#
# TABLE STRUCTURE FOR: likes
#

DROP TABLE IF EXISTS `likes`;

CREATE TABLE `likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('1', '1', '1', '1981-06-30 10:45:18');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('2', '2', '2', '1978-03-04 14:23:19');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('3', '3', '3', '2017-06-17 23:36:13');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('4', '4', '4', '1985-09-04 02:38:33');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('5', '5', '5', '1978-10-25 02:42:21');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('6', '6', '6', '1978-12-18 18:43:37');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('7', '7', '7', '1995-02-27 03:06:12');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('8', '8', '8', '1984-11-17 02:08:29');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('9', '9', '9', '2002-08-10 03:42:21');
INSERT INTO `likes` (`id`, `user_id`, `media_id`, `created_at`) VALUES ('10', '10', '10', '1979-03-10 02:38:51');


#
# TABLE STRUCTURE FOR: media
#

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('1', '1', '1', 'Vel deserunt esse officiis quia facilis velit. Optio voluptatem sit quod quasi quaerat harum culpa. Veritatis sit consectetur provident unde ducimus est voluptatem. Fugiat dolorem eveniet sequi modi illum alias.', 'mollitia', 0, NULL, '1996-03-16 09:54:16', '1970-02-07 18:51:19');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('2', '2', '2', 'Et reiciendis quidem soluta optio. Aut quibusdam laudantium eum omnis ut. Repellat assumenda molestiae quia a excepturi consequatur.', 'nostrum', 0, NULL, '1994-04-02 13:37:43', '2003-01-30 19:50:08');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('3', '3', '3', 'Quo qui deleniti doloribus rem sint. Optio odit dignissimos at. Non id sunt ullam illum.', 'eos', 4584, NULL, '2014-10-21 10:47:30', '2006-10-26 14:02:40');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('4', '4', '4', 'Quia eum dolore ipsam. Itaque nihil asperiores vitae quidem iure. Consequatur voluptate natus quae rerum saepe nobis. Voluptatem quia et et et labore est.', 'aut', 2031, NULL, '1980-10-09 13:57:23', '2006-07-14 22:19:44');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('5', '5', '5', 'Voluptatum dolore sint quam quidem provident exercitationem. Impedit dolores voluptas eos quos maiores architecto voluptates molestiae. Qui rerum quisquam a ex dolorum qui veritatis.', 'qui', 0, NULL, '1989-11-13 07:17:44', '2007-04-19 15:21:29');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('6', '6', '6', 'Distinctio aspernatur dolore earum doloremque. Aspernatur consequatur quae animi explicabo dolores vitae ratione. Numquam explicabo qui sint tempore est. Occaecati nihil sunt qui excepturi autem veritatis neque.', 'blanditiis', 22, NULL, '2013-11-26 08:35:20', '2000-09-11 21:44:01');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('7', '7', '7', 'Explicabo enim saepe rerum et sunt et fuga. Commodi ut aut expedita ullam.', 'voluptatem', 567380, NULL, '2004-05-22 13:54:17', '1991-01-25 12:27:37');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('8', '8', '8', 'Provident sed dolorem ipsam beatae non. Eum ducimus nobis ut ea omnis. Aut labore nihil soluta aspernatur voluptatem eligendi placeat esse.', 'hic', 417, NULL, '1987-11-12 21:33:09', '2006-03-30 10:34:03');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('9', '9', '9', 'Assumenda ea quo dolore qui quia magni incidunt. Ab ipsam officia minima. Quasi voluptates sed facere nobis nam atque voluptate et. Rerum ad numquam illum quasi nobis. Adipisci libero fugiat maiores illo omnis vel.', 'odit', 5267, NULL, '1990-07-11 20:57:04', '2002-07-03 01:45:07');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `body`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES ('10', '10', '10', 'Autem dolores aliquid voluptatem reprehenderit. Vitae et quos aliquid et totam. Natus nihil architecto rerum quod fugit officiis. Aut reprehenderit quis vero rerum et.', 'aliquid', 117336, NULL, '2012-10-14 09:47:07', '1977-12-20 03:59:57');





#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `messages_from_user_id` (`from_user_id`),
  KEY `messages_to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('1', '1', '1', 'Velit minus dolorum quos neque. Officia ipsum voluptatibus ullam adipisci. Aspernatur totam similique placeat provident dolores.', '1973-12-02 10:31:31');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('2', '2', '2', 'Consectetur exercitationem non et non sed qui rerum. Quia aliquam aspernatur vitae vitae inventore animi. Harum porro pariatur neque in est suscipit.', '2018-12-16 12:24:01');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('3', '3', '3', 'Animi doloremque hic sit est. Provident sint omnis sed corporis autem. Eius id quia animi placeat eligendi quam. Rerum corporis et mollitia ut similique enim laudantium.', '1997-01-04 21:37:35');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('4', '4', '4', 'Eveniet est incidunt quia provident. Architecto aut tempora quod magnam.', '2006-05-28 15:55:20');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('5', '5', '5', 'Corrupti nihil vero dolorem ullam ea qui. Odio in eum quo consequatur alias repudiandae non. Dolorum expedita esse voluptatem maiores veniam. Omnis voluptatem occaecati adipisci temporibus repudiandae.', '1985-07-03 08:13:01');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('6', '6', '6', 'Quia nesciunt temporibus in excepturi est consequatur perferendis. Quia veniam necessitatibus magnam quos officia. Saepe sit non aspernatur et nemo.', '2004-04-03 09:46:38');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('7', '7', '7', 'Veniam sed et eaque et non sequi aut. Necessitatibus iure non voluptates porro sint laborum sed dicta.', '1990-07-28 06:41:12');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('8', '8', '8', 'Fugiat molestiae dolor repellat veritatis consequatur natus. Eligendi veritatis consequatur quas ducimus non temporibus. Necessitatibus eligendi aperiam sunt sit sint necessitatibus aut.', '1981-04-02 05:01:50');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('9', '9', '9', 'Rerum explicabo dolores facere suscipit ea enim minus nostrum. Consequuntur ratione nesciunt doloribus. Et omnis qui inventore magni dolores voluptas. Ut ut adipisci aut est.', '2015-03-17 13:12:03');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) VALUES ('10', '10', '10', 'Voluptas eos non qui esse et. Cum sit quod tempore fugiat eum iste quos. Ut ipsam perferendis nesciunt et omnis neque asperiores explicabo. Quis qui et porro assumenda ullam ratione nulla.', '1993-07-30 18:22:26');


#
# TABLE STRUCTURE FOR: music
#

DROP TABLE IF EXISTS `music`;

CREATE TABLE `music` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `singer_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `song_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `album_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `music` (`id`, `singer_name`, `song_name`, `album_name`) VALUES ('1', 'ex', 'illo', 'temporibus');
INSERT INTO `music` (`id`, `singer_name`, `song_name`, `album_name`) VALUES ('2', 'recusandae', 'laudantium', 'aut');
INSERT INTO `music` (`id`, `singer_name`, `song_name`, `album_name`) VALUES ('3', 'laborum', 'rem', 'saepe');
INSERT INTO `music` (`id`, `singer_name`, `song_name`, `album_name`) VALUES ('4', 'facere', 'recusandae', 'quas');
INSERT INTO `music` (`id`, `singer_name`, `song_name`, `album_name`) VALUES ('5', 'totam', 'distinctio', 'suscipit');
INSERT INTO `music` (`id`, `singer_name`, `song_name`, `album_name`) VALUES ('6', 'voluptas', 'occaecati', 'et');
INSERT INTO `music` (`id`, `singer_name`, `song_name`, `album_name`) VALUES ('7', 'suscipit', 'neque', 'labore');
INSERT INTO `music` (`id`, `singer_name`, `song_name`, `album_name`) VALUES ('8', 'assumenda', 'doloremque', 'mollitia');
INSERT INTO `music` (`id`, `singer_name`, `song_name`, `album_name`) VALUES ('9', 'est', 'deleniti', 'officia');
INSERT INTO `music` (`id`, `singer_name`, `song_name`, `album_name`) VALUES ('10', 'suscipit', 'debitis', 'quia');


#
# TABLE STRUCTURE FOR: photo_albums
#

DROP TABLE IF EXISTS `photo_albums`;

CREATE TABLE `photo_albums` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('1', 'praesentium', '1');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('2', 'cum', '2');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('3', 'architecto', '3');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('4', 'et', '4');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('5', 'dolorem', '5');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('6', 'velit', '6');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('7', 'sint', '7');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('8', 'quam', '8');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('9', 'ad', '9');
INSERT INTO `photo_albums` (`id`, `name`, `user_id`) VALUES ('10', 'ut', '10');


#
# TABLE STRUCTURE FOR: photos
#

DROP TABLE IF EXISTS `photos`;

CREATE TABLE `photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('1', '1', '1');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('2', '2', '2');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('3', '3', '3');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('4', '4', '4');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('5', '5', '5');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('6', '6', '6');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('7', '7', '7');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('8', '8', '8');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('9', '9', '9');
INSERT INTO `photos` (`id`, `album_id`, `media_id`) VALUES ('10', '10', '10');


#
# TABLE STRUCTURE FOR: profiles
#

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `hometown` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('1', NULL, '1974-12-28', '1', '2017-03-26 20:50:04', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('2', NULL, '1979-04-18', '2', '2010-05-30 03:32:10', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('3', NULL, '2015-06-03', '3', '1998-12-24 08:43:20', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('4', NULL, '1970-03-11', '4', '2002-03-19 11:51:03', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('5', NULL, '1973-06-13', '5', '2018-06-14 12:22:23', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('6', NULL, '1992-08-24', '6', '1987-03-10 15:55:46', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('7', NULL, '2000-12-05', '7', '1989-05-27 10:25:22', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('8', NULL, '2016-07-10', '8', '1987-04-16 13:47:36', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('9', NULL, '2012-09-27', '9', '1993-11-05 08:49:08', NULL);
INSERT INTO `profiles` (`user_id`, `gender`, `birthday`, `photo_id`, `created_at`, `hometown`) VALUES ('10', NULL, '1984-12-18', '10', '1976-02-09 07:27:55', NULL);


#
# TABLE STRUCTURE FOR: user_d
#

DROP TABLE IF EXISTS `user_d`;

CREATE TABLE `user_d` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name_d` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

INSERT INTO `user_d` (`id`, `name_d`) VALUES (1, 'incidunt');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (2, 'quae');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (3, 'quam');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (4, 'et');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (5, 'fugit');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (6, 'ea');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (7, 'vitae');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (8, 'et');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (9, 'similique');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (10, 'sit');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (11, 'consequuntur');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (12, 'sit');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (13, 'inventore');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (14, 'adipisci');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (15, 'laborum');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (16, 'ut');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (17, 'quasi');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (18, 'qui');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (19, 'recusandae');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (20, 'consequuntur');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (21, 'doloribus');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (22, 'neque');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (23, 'repellendus');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (24, 'reprehenderit');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (25, 'quam');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (26, 'est');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (27, 'possimus');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (28, 'error');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (29, 'dolores');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (30, 'placeat');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (31, 'minima');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (32, 'minima');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (33, 'consequuntur');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (34, 'voluptatibus');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (35, 'atque');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (36, 'enim');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (37, 'hic');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (38, 'eum');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (39, 'maiores');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (40, 'et');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (41, 'velit');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (42, 'autem');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (43, 'est');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (44, 'dicta');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (45, 'voluptas');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (46, 'nihil');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (47, 'eum');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (48, 'deserunt');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (49, 'velit');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (50, 'sed');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (51, 'facilis');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (52, 'animi');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (53, 'minus');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (54, 'assumenda');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (55, 'ullam');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (56, 'est');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (57, 'ut');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (58, 'molestiae');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (59, 'accusamus');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (60, 'nobis');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (61, 'quidem');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (62, 'quia');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (63, 'tenetur');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (64, 'expedita');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (65, 'non');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (66, 'quia');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (67, 'sequi');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (68, 'reiciendis');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (69, 'alias');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (70, 'est');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (71, 'qui');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (72, 'repellendus');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (73, 'id');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (74, 'blanditiis');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (75, 'nulla');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (76, 'et');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (77, 'architecto');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (78, 'occaecati');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (79, 'animi');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (80, 'ut');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (81, 'deserunt');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (82, 'deserunt');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (83, 'nesciunt');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (84, 'qui');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (85, 'corrupti');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (86, 'asperiores');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (87, 'atque');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (88, 'aut');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (89, 'aut');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (90, 'praesentium');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (91, 'nesciunt');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (92, 'libero');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (93, 'libero');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (94, 'sint');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (95, 'asperiores');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (96, 'esse');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (97, 'aut');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (98, 'et');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (99, 'amet');
INSERT INTO `user_d` (`id`, `name_d`) VALUES (100, 'magnam');


#
# TABLE STRUCTURE FOR: user_m
#

DROP TABLE IF EXISTS `user_m`;

CREATE TABLE `user_m` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name_m` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

INSERT INTO `user_m` (`id`, `name_m`) VALUES (1, 'nulla');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (2, 'corporis');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (3, 'pariatur');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (4, 'iusto');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (5, 'explicabo');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (6, 'iste');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (7, 'officiis');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (8, 'sunt');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (9, 'sed');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (10, 'non');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (11, 'aut');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (12, 'dolore');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (13, 'rerum');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (14, 'quasi');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (15, 'quis');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (16, 'nesciunt');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (17, 'placeat');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (18, 'similique');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (19, 'corrupti');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (20, 'aliquid');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (21, 'et');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (22, 'id');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (23, 'sit');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (24, 'quae');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (25, 'delectus');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (26, 'assumenda');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (27, 'ipsa');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (28, 'adipisci');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (29, 'minima');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (30, 'reiciendis');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (31, 'tempora');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (32, 'a');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (33, 'laboriosam');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (34, 'occaecati');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (35, 'distinctio');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (36, 'hic');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (37, 'est');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (38, 'ea');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (39, 'ipsum');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (40, 'et');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (41, 'quia');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (42, 'optio');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (43, 'ut');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (44, 'veritatis');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (45, 'ea');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (46, 'tenetur');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (47, 'laborum');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (48, 'cupiditate');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (49, 'dolores');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (50, 'nesciunt');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (51, 'quibusdam');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (52, 'ad');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (53, 'ratione');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (54, 'consequatur');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (55, 'quae');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (56, 'itaque');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (57, 'minima');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (58, 'magni');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (59, 'eveniet');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (60, 'non');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (61, 'ab');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (62, 'illum');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (63, 'eveniet');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (64, 'nobis');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (65, 'quam');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (66, 'expedita');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (67, 'voluptatem');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (68, 'ratione');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (69, 'quia');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (70, 'et');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (71, 'et');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (72, 'tenetur');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (73, 'sequi');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (74, 'qui');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (75, 'vel');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (76, 'sunt');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (77, 'vero');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (78, 'eveniet');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (79, 'eius');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (80, 'delectus');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (81, 'quam');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (82, 'aut');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (83, 'itaque');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (84, 'quas');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (85, 'consequuntur');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (86, 'consequatur');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (87, 'ad');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (88, 'repellendus');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (89, 'neque');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (90, 'dolorem');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (91, 'voluptatibus');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (92, 'sit');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (93, 'autem');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (94, 'mollitia');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (95, 'mollitia');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (96, 'ut');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (97, 'id');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (98, 'incidunt');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (99, 'sit');
INSERT INTO `user_m` (`id`, `name_m`) VALUES (100, 'non');




#
# TABLE STRUCTURE FOR: users_communities
#

DROP TABLE IF EXISTS `users_communities`;

CREATE TABLE `users_communities` (
  `user_id` bigint(20) unsigned NOT NULL,
  `community_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('1', '1');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('2', '2');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('3', '3');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('4', '4');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('5', '5');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('6', '6');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('7', '7');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('8', '8');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('9', '9');
INSERT INTO `users_communities` (`user_id`, `community_id`) VALUES ('10', '10');

-- задание 2

select * from users
order by firstname 

-- задание 3

ALTER TABLE profiles DROP age;
ALTER TABLE profiles add age INT NOT NULL DEFAULT 18;

ALTER TABLE users DROP is_active;
ALTER TABLE users add is_active BIT NOT NULL DEFAULT 1;

-- попытка №1

SELECT user_id, age
	CASE 
		WHEN age < 18
		THEN 0
	END permission,
FROM profiles;

-- попытка №2

-- INSERT INTO users (is_active) SELECT age FROM profiles WHERE age < '18' VALUES ('0');
-- SELECT user_id FROM profiles 
-- WHERE age < 18
-- INSERT INTO `users` (`is_active`) VALUES (0) where ;

-- Задание 4

-- lesson_6 task_1

INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `created_at`) 
VALUES 

('15', '1', '4', 'Velit minus dolorum quos neque. Officia ipsum voluptatibus ullam adipisci. Aspernatur totam similique placeat provident dolores.', '1973-12-02 10:31:31');


SELECT from_user_id, COUNT(from_user_id ) as cnt
from messages 
WHERE to_user_id = 4
GROUP BY from_user_id ORDER by cnt DESC limit 1 




 

 







