DROP TABLE IF EXISTS `words`;
DROP TABLE IF EXISTS `parts_of_speech`;
DROP TABLE IF EXISTS `workspaces`;

CREATE TABLE `parts_of_speech` (
  `pos_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) UNIQUE NOT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE `words` (
  `word_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) UNIQUE NOT NULL,
  `root_word` varchar(255),
  `part_of_speech` int(5) unsigned NOT NULL,
  `article` int(5) unsigned,
  PRIMARY KEY (`word_id`),
  CONSTRAINT `fk_part_of_speech` FOREIGN KEY (`part_of_speech`) REFERENCES `parts_of_speech` (`pos_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_article` FOREIGN KEY (`article`) REFERENCES `words` (`word_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE `workspaces` (
  `ws_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL UNIQUE,
  `token` varchar(255) NOT NULL UNIQUE,
  PRIMARY KEY (`ws_id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

INSERT INTO parts_of_speech (name) VALUES ("noun"), ("adjective"), ("adverb"), ("article");

INSERT INTO words (word, root_word, part_of_speech, article) VALUES
  ("a", NULL, (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "article"), NULL),
  ("an", NULL, (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "article"), NULL),
  ("the", NULL, (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "article"), NULL),
  ("genuine", "genuine", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("industrious", "industry", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("resourceful", "resource", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("resilient", "resilient", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("charitable", "charity", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("helpful", "help", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("accepting", "accept", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("worldly", "world", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("frank", "frank", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("open", "open", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("reliable", "rely", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("upright", "upright", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("truthful", "truth", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("generous", "generous", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("polite", "polite", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("hopeful", "hope", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("exstatic", "exstacy", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("caring", "care", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("humble", "humble", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("selfless", "selfless", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("modest", "modest", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("thoughtful", "thought", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("encouraging", "encourage", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("mindful", "mindful", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("discerning", "discern", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("graceful", "grace", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("distinguished", "distinguish", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("pleasant", "please", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("energetic", "energy", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("open-minded", "open-minded", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("giving", "give", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("exuberant", "exuberant", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("bright", "bright", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("brave", "brave", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("smart", "smart", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("wise", "wise", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("comforting", "comfort", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("respecful", "respect", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("extraordinary", "extra", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("outstanding", "outstand", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("amazing", "amaze", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("awesome", "awe", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("pretty", "pretty", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("beautiful", "beauty", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("funny", "fun", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("intelligent", "intelligence", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("charismatic", "charisma", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("cute", "cute", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("endearing", "endear", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("trustworthy", "trust", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("strong", "strength", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("agreeable", "agree", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("interesting", "interest", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("unique", "unique", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("fun", "fun", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("tactful", "tact", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("calming", "calm", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("honest", "honesty", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("useful", "use", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("capable", "able", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("impressive", "impress", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("loyal", "loyalty", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("lovable", "love", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adjective"), NULL),
  ("scholar", "scholar", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("genius", "genius", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("expert", "expert", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("beauty", "beauty", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("leader", "lead", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("wizard", "wizard", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("ace", "ace", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("virtuoso", "virtuoso", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("idol", "idol", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("mentor", "mentor", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("hero", "hero", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("innovator", "innovate", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("inspiration", "inspire", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("intellectual", "intelect", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("inventor", "invent", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("jewel", "jewel", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("motivator", "motivate", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("peacemaker", "peace", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("phenomenon", "phenomenon", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("polymath", "polymath", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("problem-solver", "problem-solver", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("prodigy", "prodigy", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("protege", "protege", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("self-starter", "start", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("trailblazer", "trailblazer", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL),
  ("winner", "win", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "noun"), NULL);

INSERT INTO words (word, root_word, part_of_speech, article) VALUES
  ("deliberately", "deliberate", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adverb"), (SELECT w.word_id FROM words w WHERE w.word = "a")),
  ("highly", "high", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adverb"), (SELECT w.word_id FROM words w WHERE w.word = "a")),
  ("effectively", "effect", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adverb"), (SELECT w.word_id FROM words w WHERE w.word = "an")),
  ("fiercely", "fierce", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adverb"), (SELECT w.word_id FROM words w WHERE w.word = "a")),
  ("famously", "fame", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adverb"), (SELECT w.word_id FROM words w WHERE w.word = "a")),
  ("extremely", "extreme", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adverb"), (SELECT w.word_id FROM words w WHERE w.word = "an")),
  ("especially", "special", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adverb"), (SELECT w.word_id FROM words w WHERE w.word = "an")),
  ("powerfully", "power", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adverb"), (SELECT w.word_id FROM words w WHERE w.word = "a")),
  ("perfectly", "perfect", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adverb"), (SELECT w.word_id FROM words w WHERE w.word = "a")),
  ("very", "very", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adverb"), (SELECT w.word_id FROM words w WHERE w.word = "a")),
  ("totally", "total", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adverb"), (SELECT w.word_id FROM words w WHERE w.word = "a")),
  ("completely", "complete", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adverb"), (SELECT w.word_id FROM words w WHERE w.word = "a")),
  ("fully", "full", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adverb"), (SELECT w.word_id FROM words w WHERE w.word = "a")),
  ("wildly", "wild", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adverb"), (SELECT w.word_id FROM words w WHERE w.word = "a")),
  ("ultimate", "ultimate", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adverb"), (SELECT w.word_id FROM words w WHERE w.word = "the")),
  ("supremely", "supreme", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adverb"), (SELECT w.word_id FROM words w WHERE w.word = "a")),
  ("loveably", "love", (SELECT pos.pos_id FROM parts_of_speech pos WHERE pos.name = "adverb"), (SELECT w.word_id FROM words w WHERE w.word = "a"));
 
