CREATE TABLE `Video` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` text,
  `desc` text,
  `creatorName` text,
  `dateCreated` datetime DEFAULT (now()),
  `subtitles` boolean,
  `likes` int,
  `dislikes` int,
  `watchedCount` int
);

CREATE TABLE `User` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` text UNIQUE NOT NULL,
  `videoLiked` boolean,
  `commentLiked` boolean,
  `videoId` int,
  `commentId` int
);

CREATE TABLE `Channel` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `ownerName` text,
  `followerName` text,
  `timeCreated` datetime DEFAULT (now()),
  `notification` text,
  `videoName` text,
  `videoId` int,
  `followerCount` int
);

CREATE TABLE `Playlist` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `ownerName` text,
  `name` text,
  `date` datetime DEFAULT (now()),
  `videoName` text,
  `videoId` int
);

CREATE TABLE `Daily` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `videoId` int,
  `videoWatched` int,
  `newFollower` int,
  `userID` int,
  `followerID` int
);

CREATE TABLE `Comment` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `comment` text,
  `time` datetime DEFAULT (now()),
  `userName` text,
  `videoId` int,
  `likes` int,
  `dislikes` int
);

CREATE TABLE `Messages` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `userOneName` text,
  `userTwoName` text,
  `blocked` boolean DEFAULT 0,
  `message` text,
  `time` datetime DEFAULT (now())
);

CREATE TABLE `Subtitles` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `videoId` int,
  `videoName` text,
  `userName` text,
  `subtitles` text,
  `time` datetime DEFAULT (now())
);

ALTER TABLE `Video` ADD FOREIGN KEY (`creatorName`) REFERENCES `User` (`id`);

ALTER TABLE `User` ADD FOREIGN KEY (`videoId`) REFERENCES `Video` (`id`);

ALTER TABLE `User` ADD FOREIGN KEY (`commentId`) REFERENCES `Comment` (`id`);

ALTER TABLE `Channel` ADD FOREIGN KEY (`ownerName`) REFERENCES `User` (`id`);

ALTER TABLE `Channel` ADD FOREIGN KEY (`followerName`) REFERENCES `User` (`name`);

ALTER TABLE `Channel` ADD FOREIGN KEY (`videoName`) REFERENCES `Video` (`name`);

ALTER TABLE `Channel` ADD FOREIGN KEY (`videoId`) REFERENCES `Video` (`id`);

ALTER TABLE `Playlist` ADD FOREIGN KEY (`ownerName`) REFERENCES `User` (`id`);

ALTER TABLE `Playlist` ADD FOREIGN KEY (`videoName`) REFERENCES `Video` (`name`);

ALTER TABLE `Playlist` ADD FOREIGN KEY (`videoId`) REFERENCES `Video` (`id`);

ALTER TABLE `Daily` ADD FOREIGN KEY (`videoId`) REFERENCES `Video` (`id`);

ALTER TABLE `Daily` ADD FOREIGN KEY (`userID`) REFERENCES `User` (`name`);

ALTER TABLE `Daily` ADD FOREIGN KEY (`followerID`) REFERENCES `User` (`name`);

ALTER TABLE `Comment` ADD FOREIGN KEY (`userName`) REFERENCES `User` (`name`);

ALTER TABLE `Comment` ADD FOREIGN KEY (`videoId`) REFERENCES `Video` (`id`);

ALTER TABLE `Messages` ADD FOREIGN KEY (`userOneName`) REFERENCES `User` (`name`);

ALTER TABLE `Messages` ADD FOREIGN KEY (`userTwoName`) REFERENCES `User` (`name`);

ALTER TABLE `Subtitles` ADD FOREIGN KEY (`videoId`) REFERENCES `Video` (`id`);

ALTER TABLE `Subtitles` ADD FOREIGN KEY (`videoName`) REFERENCES `Video` (`name`);

ALTER TABLE `Subtitles` ADD FOREIGN KEY (`userName`) REFERENCES `User` (`name`);
