
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


CREATE TABLE `ESPtable2` (
  `id` int(5) NOT NULL,
  `temp` int(5) NOT NULL,
  `humidity` int(5) NOT NULL,
  `temp_min` int(5) NOT NULL,
  `temp_max` int(5) NOT NULL,
  `weather` int(5) NOT NULL,
  `value_1` int(5) NOT NULL,
  `value_2` int(5) NOT NULL,
  `value_3` int(5) NOT NULL,
  `Value_4` int(5) NOT NULL,
  `Value_5` int(5) NOT NULL,
  `TEXT_1` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `ESPtable2` (`id`,`temp`, `humidity`, `temp_min`, `temp_max`, `weather`, `Value_1`, `Value_2`, `Value_3`, `Value_4`, `Value_5`, `TEXT_1`) VALUES
(0, 0, 0, 0, 0, 0, 0, 0, 0,0,0, 'Nebune!');

ALTER TABLE `ESPtable2`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `ESPtable2`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100000;
