START TRANSACTION;
SET AUTOCOMMIT = 0;

CREATE TABLE Players (
	PlayerID varchar(50) NOT NULL,
	SkinModel varchar(50) NOT NULL DEFAULT "s_m_y_blackops_01",
	MeleeWeapon varchar(50) NOT NULL DEFAULT "WEAPON_BAT",
	PrimaryWeapon varchar(50) NOT NULL DEFAULT "WEAPON_ASSAULTRIFLE",
	SecondaryWeapon varchar(50) NOT NULL DEFAULT "WEAPON_PISTOL",
	Gadget1 varchar(50) NOT NULL DEFAULT "WEAPON_GRENADE",
	Gadget2 varchar(50) NOT NULL DEFAULT "WEAPON_SMOKEGRENADE",
	Kills INT UNSIGNED NOT NULL DEFAULT 0,
	Deaths INT UNSINGED NOT NULL DEFAULT 0,
	RP INT UNSIGNED NOT NULL DEFAULT 0,
	Banned TINYINT(1) NOT NULL DEFAULT 0,
	PRIMARY KEY (PlayerID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

COMMIT;