local sql = [[

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE IF NOT EXISTS `fsn_apartments` (
  `apt_id` int(11) NOT NULL AUTO_INCREMENT,
  `apt_owner` int(11) NOT NULL,
  `apt_inventory` text NOT NULL,
  `apt_cash` int(11) NOT NULL,
  `apt_outfits` text NOT NULL,
  `apt_utils` text NOT NULL,
  PRIMARY KEY (`apt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `fsn_bans` (
  `ban_identifier` varchar(255) NOT NULL,
  `ban_reason` text NOT NULL,
  `ban_id` int(11) NOT NULL,
  `ban_expire` int(11) NOT NULL,
  `ban_date` int(11) NOT NULL,
  `ban_admin` int(11) NOT NULL,
  PRIMARY KEY (`ban_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `fsn_characters` (
  `char_id` int(11) NOT NULL AUTO_INCREMENT,
  `steamid` text NOT NULL,
  `char_fname` text NOT NULL,
  `char_lname` text NOT NULL,
  `char_dob` varchar(10) NOT NULL,
  `char_desc` text NOT NULL,
  `char_twituname` varchar(20) NOT NULL DEFAULT 'notset',
  `char_licenses` text NOT NULL,
  `char_phone` text DEFAULT NULL,
  `char_contacts` text NOT NULL,
  `char_jailtime` int(11) NOT NULL DEFAULT 0,
  `char_money` int(11) NOT NULL,
  `char_bank` int(11) NOT NULL,
  `char_model` text NOT NULL,
  `mdl_extras` text NOT NULL,
  `char_details` varchar(65000) NOT NULL DEFAULT '[]',
  `char_inventory` text NOT NULL,
  `char_weapons` text NOT NULL,
  `char_police` int(11) NOT NULL DEFAULT 0,
  `char_ems` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`char_id`),
  KEY `char_id` (`char_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `fsn_properties` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `property_name` text NOT NULL,
  `property_xyz` text NOT NULL,
  `property_owner` int(11) NOT NULL,
  `property_coowners` text NOT NULL,
  `property_inventory` text NOT NULL,
  `property_weapons` text NOT NULL,
  `property_money` int(11) NOT NULL,
  `property_expiry` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `fsn_storageboxes` (
  `sbox_id` int(11) NOT NULL AUTO_INCREMENT,
  `sbox_details` text NOT NULL,
  `sbox_content` text NOT NULL,
  PRIMARY KEY (`sbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `fsn_textmessages` (
  `txt_id` int(11) NOT NULL AUTO_INCREMENT,
  `txt_sender` int(11) NOT NULL,
  `txt_reciever` int(11) NOT NULL,
  `txt_message` text NOT NULL,
  `txt_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`txt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `fsn_tickets` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `officer_id` int(11) NOT NULL,
  `officer_name` text NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `ticket_amount` int(11) NOT NULL,
  `ticket_jailtime` int(11) NOT NULL,
  `ticket_charges` text NOT NULL,
  `ticket_date` int(99) NOT NULL,
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `fsn_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `steamid` text NOT NULL,
  `identifiers` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `admin_lvl` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  `connections` int(11) NOT NULL,
  `banned` int(99) NOT NULL,
  `banned_r` text NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `fsn_vehicles` (
  `veh_id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) NOT NULL,
  `veh_spawnname` text DEFAULT NULL,
  `veh_plate` text NOT NULL,
  `veh_inventory` text NOT NULL,
  `veh_type` varchar(1) NOT NULL,
  `veh_status` int(11) NOT NULL DEFAULT 1,
  `veh_details` text DEFAULT NULL,
  `veh_displayname` text DEFAULT NULL,
  `veh_finance` text DEFAULT NULL,
  `veh_garage` varchar(50) DEFAULT '0',
  PRIMARY KEY (`veh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `fsn_warrants` (
  `war_id` int(11) NOT NULL AUTO_INCREMENT,
  `suspect_name` text NOT NULL,
  `officer_name` text NOT NULL,
  `war_charges` text NOT NULL,
  `war_times` text NOT NULL,
  `war_fine` text NOT NULL,
  `war_desc` text NOT NULL,
  `war_status` text NOT NULL,
  `war_date` int(99) NOT NULL,
  PRIMARY KEY (`war_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `fsn_whitelists` (
  `wl_id` int(11) NOT NULL AUTO_INCREMENT,
  `wl_title` text NOT NULL,
  `wl_owner` int(11) NOT NULL,
  `wl_access` text NOT NULL,
  `wl_bank` int(11) NOT NULL,
  PRIMARY KEY (`wl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

ALTER TABLE `fsn_vehicles` ADD IF NOT EXISTS `odometer` FLOAT(9,2) zerofill NOT NULL AFTER `veh_plate`;

INSERT IGNORE  INTO `fsn_whitelists` (`wl_id`, `wl_title`, `wl_owner`, `wl_access`, `wl_bank`) VALUES ('1', 'Premium Deluxe Motorsports', '-1', '{}', '0');
INSERT IGNORE INTO `fsn_whitelists` (`wl_id`, `wl_title`, `wl_owner`, `wl_access`, `wl_bank`) VALUES ('2', 'Mechanics', '-1', '{}', '0');
INSERT IGNORE INTO `fsn_whitelists` (`wl_id`, `wl_title`, `wl_owner`, `wl_access`, `wl_bank`) VALUES ('3', 'La Fuente Blanca', '-1', '{}', '0');
INSERT IGNORE INTO `fsn_whitelists` (`wl_id`, `wl_title`, `wl_owner`, `wl_access`, `wl_bank`) VALUES ('4', 'Los Santos Marina', '-1', '{}', '0');

]]

local timeout = 10 -- (seconds) you can increase this if your SQL server is really slow
local done = false
local start = 0
MySQL.ready(function ()
	MySQL.Async.execute(sql, {}, function(rc)
		done = true	
	end)
end)

local resources = {
	'fsn_spawnmanager',
  'fsn_admin',
  'fsn_apartments',
  'fsn_activities',
	'fsn_bank',
	'fsn_bankrobbery',
	'fsn_bennys',
  'fsn_bikerental',
  'fsn_boatshop',
	'fsn_builders',
	'fsn_cargarage',
	'fsn_carstore',
	'fsn_characterdetails',
	'fsn_clothing',
	'fsn_commands',
	'fsn_crafting',
	'fsn_criminalmisc',
	'fsn_customanimations',
	'fsn_customs',
	'fsn_doj',
	'fsn_doormanager',
	'fsn_emotecontrol',
	'fsn_ems',
	'fsn_entfinder',
	'fsn_errorcontrol',
	'fsn_evidence',
	'fsn_handling',
	'fsn_needs',
	'fsn_inventory',
	'fsn_inventory_dropping',
	'fsn_jail',
	'fsn_jewellerystore',
	'fsn_jobs',
	'fsn_licenses',
	'fsn_loadingscreen',
	'fsn_menu',
	'fsn_newchat',
	'fsn_notify',
	'fsn_phones',
	'fsn_playerlist',
	'fsn_police',
	'fsn_progress',
	'fsn_properties',
	'fsn_shootingrange',
	'fsn_steamlogin',
	'fsn_storagelockers',
	'fsn_store',
	--'fsn_store_guns',
	'fsn_stripclub',
	'fsn_teleporters',
	'fsn_timeandweather',
	'fsn_vehiclecontrol',
	'fsn_voicecontrol',
	'fsn_weaponcontrol',
}

Citizen.CreateThread(function()
	start = os.time()
	while true do
		Citizen.Wait(0)
		if not done then
			if start+timeout < os.time() then
				print('^1ERROR - MYSQL SERVER DID NOT RESPOND IN TIME - CHECK "mysql-async" IS INSTALLED AND CONFIGURED')
			end
		else
			for k,v in pairs(resources) do
				 ExecuteCommand('start '..v)
			end
			break
		end
	end
end)