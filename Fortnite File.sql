Create Database Fortnite		--creating a database

Use Fortnite		--using a database

-- Table to store player information
CREATE TABLE Player (
    PlayerID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    JoinDate DATE DEFAULT GETDATE(),
    TotalMatchesPlayed INT DEFAULT 0,
    TotalWins INT DEFAULT 0,
    [Level] INT
);

-- Table to store match information
CREATE TABLE [Match] (
    MatchID INT PRIMARY KEY IDENTITY(101,1),
    MatchDate DATETIME DEFAULT GETDATE(),
    MatchType VARCHAR(10) CHECK (MatchType IN ('Solo', 'Duo', 'Squad')) NOT NULL,
    DurationMinutes INT NOT NULL
);

-- Table to store weapons and their details
CREATE TABLE Weapon (
    WeaponID INT PRIMARY KEY IDENTITY(11,11),
    WeaponName VARCHAR(100) NOT NULL,
    WeaponType VARCHAR(20) CHECK (WeaponType IN ('Assault Rifle', 'Shotgun', 'Sniper', 'Pistol', 'SMG', 'Explosive')) NOT NULL,
    WeaponRarity VARCHAR(20) CHECK (WeaponRarity IN ('Common', 'Uncommon', 'Rare', 'Epic', 'Legendary', 'Mythic')) NOT NULL,
    WeaponDamage INT NOT NULL
);

-- Table to store skins and their details
CREATE TABLE Skins (
    SkinID INT PRIMARY KEY IDENTITY(1001,1),
    SkinName VARCHAR(100) NOT NULL,
    SkinRarity VARCHAR(20) CHECK (SkinRarity IN ('Common', 'Uncommon', 'Rare', 'Epic', 'Legendary', 'Mythic')) NOT NULL,
    Price MONEY NOT NULL
);

-- Table to track player ownership of skins
CREATE TABLE PlayerSkins (
    PlayerSkinID INT PRIMARY KEY IDENTITY(1,1),
    PlayerID INT NOT NULL,
    SkinID INT NOT NULL,
    AcquireDate DATE DEFAULT GETDATE(),
    CONSTRAINT FK_PLAYER_PLAYERS FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    CONSTRAINT FK_SKIN_PLAYERS FOREIGN KEY (SkinID) REFERENCES Skins(SkinID)
);

-- Table to store challenges and their details
CREATE TABLE Challenges (
    ChallengeID INT PRIMARY KEY IDENTITY(1,1),
    ChallengeName VARCHAR(100) NOT NULL,
    Description TEXT NOT NULL,
    Reward VARCHAR(50),
    ExpiryDate DATE NOT NULL
);

-- Table to track player participation in challenges
CREATE TABLE PlayerChallenges (
    PlayerChallengeID INT PRIMARY KEY IDENTITY(1,1),
    PlayerID INT NOT NULL,
    ChallengeID INT NOT NULL,
    Completed BIT DEFAULT 0,
    CONSTRAINT FK_PLAYER_PLAYERC FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    CONSTRAINT FK_CHALLENGE_PLAYERC FOREIGN KEY (ChallengeID) REFERENCES Challenges(ChallengeID)
);

-- Table to track player performance in each match
CREATE TABLE PlayerMatchStats (
    PlayerMatchStatsID INT PRIMARY KEY IDENTITY(1,1),
    PlayerID INT NOT NULL,
    MatchID INT NOT NULL,
    Kills INT DEFAULT 0,
    DamageDealt INT DEFAULT 0,
    DamageTaken INT DEFAULT 0,
    Placement INT NOT NULL,
    WeaponID INT,
    CONSTRAINT FK_PLAYER_PLAYERM FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    CONSTRAINT FK_MATCH_PLAYERM FOREIGN KEY (MatchID) REFERENCES [Match](MatchID),
    CONSTRAINT FK_WEAPON_PLAYERM FOREIGN KEY (WeaponID) REFERENCES Weapon(WeaponID)
);

-- Drop tables in reverse order of their dependencies
DROP TABLE IF EXISTS PlayerMatchStats;
DROP TABLE IF EXISTS PlayerChallenges;
DROP TABLE IF EXISTS PlayerSkins;
DROP TABLE IF EXISTS Challenges;
DROP TABLE IF EXISTS Weapon;
DROP TABLE IF EXISTS Skins;
DROP TABLE IF EXISTS [Match];
DROP TABLE IF EXISTS Player;

--INSERT VALUES INTO THE TABLES
INSERT INTO Player (Username, Email, JoinDate, TotalMatchesPlayed, TotalWins, [Level]) VALUES
('NinjaWarrior', 'ninja@email.com', '2024-01-01', 500, 75, 50),
('PixelQueen', 'pixel@email.com', '2024-01-02', 480, 68, 45),
('ShadowSniper', 'shadow@email.com', '2024-01-03', 520, 80, 55),
('LootMaster', 'loot@email.com', '2024-01-04', 450, 60, 40),
('StormChaser', 'storm@email.com', '2024-01-05', 490, 72, 48),
('BattleBoss', 'battle@email.com', '2024-01-06', 530, 85, 58),
('SkyRider', 'sky@email.com', '2024-01-07', 470, 65, 43),
('FortKnight', 'fort@email.com', '2024-01-08', 510, 78, 53),
('PixelPirate', 'pirate@email.com', '2024-01-09', 460, 63, 42),
('BushWookie', 'bush@email.com', '2024-01-10', 440, 58, 39),
('RocketRanger', 'rocket@email.com', '2024-01-11', 495, 73, 49),
('LlamaLegend', 'llama@email.com', '2024-01-12', 485, 70, 47),
('DriftKing', 'drift@email.com', '2024-01-13', 505, 76, 52),
('TiltedTrooper', 'tilted@email.com', '2024-01-14', 455, 62, 41),
('RiftRaider', 'rift@email.com', '2024-01-15', 525, 82, 56),
('BoogieBlaster', 'boogie@email.com', '2024-01-16', 445, 59, 38),
('ShieldShredder', 'shield@email.com', '2024-01-17', 500, 74, 50),
('StormSurvivor', 'survivor@email.com', '2024-01-18', 475, 67, 44),
('BuildMaster', 'build@email.com', '2024-01-19', 515, 79, 54),
('VictoryRoyale', 'victory@email.com', '2024-01-20', 535, 87, 59),
('SnapShooter', 'snap@email.com', '2024-01-21', 465, 64, 43),
('BattleRoyalty', 'royalty@email.com', '2024-01-22', 505, 77, 52),
('LootLegend', 'lootlegend@email.com', '2024-01-23', 495, 72, 48),
('StormStriker', 'striker@email.com', '2024-01-24', 480, 69, 46),
('NinjaNova', 'nova@email.com', '2024-01-25', 520, 81, 55),
('PixelProwler', 'prowler@email.com', '2024-01-26', 460, 63, 42),
('ShadowSpectre', 'spectre@email.com', '2024-01-27', 510, 78, 53),
('FortressDefender', 'fortress@email.com', '2024-01-28', 490, 71, 47),
('SkyScout', 'scout@email.com', '2024-01-29', 475, 66, 44),
('BattleBreaker', 'breaker@email.com', '2024-01-30', 525, 83, 57),
('LootHunter', 'hunter@email.com', '2024-01-31', 470, 65, 43),
('StormStalker', 'stalker@email.com', '2024-02-01', 500, 75, 50),
('NinjaNebula', 'nebula@email.com', '2024-02-02', 515, 79, 54),
('PixelPhoenix', 'phoenix@email.com', '2024-02-03', 485, 70, 47),
('ShadowShift', 'shift@email.com', '2024-02-04', 530, 84, 58),
('FortitudeFighter', 'fortitude@email.com', '2024-02-05', 495, 73, 49),
('SkyShredder', 'shredder@email.com', '2024-02-06', 480, 68, 45),
('BattleBringer', 'bringer@email.com', '2024-02-07', 520, 80, 55),
('LootLord', 'lord@email.com', '2024-02-08', 465, 64, 43),
('StormSage', 'sage@email.com', '2024-02-09', 505, 76, 51);

INSERT INTO [Match] (MatchDate, MatchType, DurationMinutes) VALUES
('2025-01-14 12:00:00', 'Solo', 22),
('2025-01-14 12:30:00', 'Duo', 24),
('2025-01-14 13:00:00', 'Squad', 26),
('2025-01-14 13:30:00', 'Solo', 21),
('2025-01-14 14:00:00', 'Duo', 23),
('2025-01-14 14:30:00', 'Squad', 25),
('2025-01-14 15:00:00', 'Solo', 20),
('2025-01-14 15:30:00', 'Duo', 22),
('2025-01-14 16:00:00', 'Squad', 24),
('2025-01-14 16:30:00', 'Solo', 19),
('2025-01-14 17:00:00', 'Duo', 21),
('2025-01-14 17:30:00', 'Squad', 23),
('2025-01-14 18:00:00', 'Solo', 18),
('2025-01-14 18:30:00', 'Duo', 20),
('2025-01-14 19:00:00', 'Squad', 22),
('2025-01-14 19:30:00', 'Solo', 17),
('2025-01-14 20:00:00', 'Duo', 19),
('2025-01-14 20:30:00', 'Squad', 21),
('2025-01-14 21:00:00', 'Solo', 16),
('2025-01-14 21:30:00', 'Duo', 18),
('2025-01-15 12:00:00', 'Squad', 25),
('2025-01-15 12:30:00', 'Solo', 20),
('2025-01-15 13:00:00', 'Duo', 22),
('2025-01-15 13:30:00', 'Squad', 24),
('2025-01-15 14:00:00', 'Solo', 19),
('2025-01-15 14:30:00', 'Duo', 21),
('2025-01-15 15:00:00', 'Squad', 23),
('2025-01-15 15:30:00', 'Solo', 18),
('2025-01-15 16:00:00', 'Duo', 20),
('2025-01-15 16:30:00', 'Squad', 22),
('2025-01-15 17:00:00', 'Solo', 17),
('2025-01-15 17:30:00', 'Duo', 19),
('2025-01-15 18:00:00', 'Squad', 21),
('2025-01-15 18:30:00', 'Solo', 16),
('2025-01-15 19:00:00', 'Duo', 18),
('2025-01-15 19:30:00', 'Squad', 20),
('2025-01-15 20:00:00', 'Solo', 15),
('2025-01-15 20:30:00', 'Duo', 17),
('2025-01-15 21:00:00', 'Squad', 19),
('2025-01-15 21:30:00', 'Solo', 14);

INSERT INTO Weapon (WeaponName, WeaponType, WeaponRarity, WeaponDamage) VALUES
('Assault Rifle', 'Assault Rifle', 'Common', 30),
('Pump Shotgun', 'Shotgun', 'Uncommon', 80),
('Bolt-Action Sniper', 'Sniper', 'Rare', 105),
('Pistol', 'Pistol', 'Common', 24),
('Submachine Gun', 'SMG', 'Uncommon', 17),
('Rocket Launcher', 'Explosive', 'Epic', 110),
('Burst Assault Rifle', 'Assault Rifle', 'Rare', 27),
('Tactical Shotgun', 'Shotgun', 'Common', 67),
('Heavy Sniper', 'Sniper', 'Epic', 150),
('Hand Cannon', 'Pistol', 'Epic', 75),
('Compact SMG', 'SMG', 'Rare', 21),
('Grenade Launcher', 'Explosive', 'Rare', 100),
('SCAR', 'Assault Rifle', 'Legendary', 36),
('Double Barrel Shotgun', 'Shotgun', 'Epic', 114),
('Hunting Rifle', 'Sniper', 'Uncommon', 86),
('Dual Pistols', 'Pistol', 'Rare', 41),
('Tactical SMG', 'SMG', 'Rare', 18),
('Quad Launcher', 'Explosive', 'Legendary', 80),
('Infantry Rifle', 'Assault Rifle', 'Common', 45),
('Dragon"s Breath Shotgun', 'Shotgun', 'Epic', 152),
('Suppressed Sniper Rifle', 'Sniper', 'Epic', 100),
('Revolver', 'Pistol', 'Uncommon', 54),
('Drum Gun', 'SMG', 'Uncommon', 26),
('Proximity Grenade Launcher', 'Explosive', 'Rare', 70),
('Heavy Assault Rifle', 'Assault Rifle', 'Rare', 33),
('Combat Shotgun', 'Shotgun', 'Rare', 73),
('Automatic Sniper Rifle', 'Sniper', 'Rare', 40),
('Flint-Knock Pistol', 'Pistol', 'Uncommon', 90),
('Burst SMG', 'SMG', 'Common', 23),
('Boom Bow', 'Explosive', 'Legendary', 115),
('Tactical Assault Rifle', 'Assault Rifle', 'Rare', 22),
('Drum Shotgun', 'Shotgun', 'Uncommon', 50),
('Storm Scout Sniper Rifle', 'Sniper', 'Epic', 85),
('Six Shooter', 'Pistol', 'Uncommon', 34),
('Rapid Fire SMG', 'SMG', 'Uncommon', 13),
('Bottle Rockets', 'Explosive', 'Uncommon', 42),
('Scoped Assault Rifle', 'Assault Rifle', 'Rare', 26),
('Heavy Shotgun', 'Shotgun', 'Epic', 77),
('Suppressed Sniper Rifle', 'Sniper', 'Epic', 95),
('Scoped Revolver', 'Pistol', 'Rare', 42);

INSERT INTO Skins (SkinName, SkinRarity, Price) VALUES
('Default', 'Common', 0),
('Recruit', 'Common', 0),
('Jonesy', 'Uncommon', 800),
('Ramirez', 'Uncommon', 800),
('Skull Trooper', 'Epic', 1500),
('Red Knight', 'Legendary', 2000),
('Black Knight', 'Legendary', 2000),
('Raven', 'Legendary', 2000),
('Drift', 'Legendary', 2000),
('Omega', 'Legendary', 2000),
('Galaxy', 'Mythic', 2500),
('Peely', 'Epic', 1500),
('Fishstick', 'Rare', 1200),
('Midas', 'Legendary', 2000),
('Lynx', 'Legendary', 2000),
('Ice King', 'Legendary', 2000),
('Calamity', 'Legendary', 2000),
('Catalyst', 'Legendary', 2000),
('Vendetta', 'Legendary', 2000),
('Ultima Knight', 'Legendary', 2000),
('Aura', 'Rare', 1200),
('Crystal', 'Rare', 1200),
('Dynamo', 'Rare', 1200),
('Ghoul Trooper', 'Epic', 1500),
('Sparkle Specialist', 'Epic', 1500),
('Dark Voyager', 'Legendary', 2000),
('Rust Lord', 'Rare', 1200),
('The Reaper', 'Legendary', 2000),
('Zoey', 'Epic', 1500),
('Carbide', 'Legendary', 2000),
('Valor', 'Legendary', 2000),
('Teknique', 'Rare', 1200),
('Ragnarok', 'Legendary', 2000),
('Sun Strider', 'Epic', 1500),
('Fable', 'Epic', 1500),
('Dusk', 'Epic', 1500),
('Dire', 'Legendary', 2000),
('Onesie', 'Epic', 1500),
('Zenith', 'Legendary', 2000),
('The Prisoner', 'Legendary', 2000);

INSERT INTO PlayerSkins (PlayerID, SkinID, AcquireDate) VALUES
(1, 1001, '2024-01-01'),
(2, 1002, '2024-01-02'),
(3, 1003, '2024-01-03'),
(4, 1004, '2024-01-04'),
(5, 1005, '2024-01-05'),
(6, 1006, '2024-01-06'),
(7, 1007, '2024-01-07'),
(8, 1008, '2024-01-08'),
(9, 1009, '2024-01-09'),
(10, 1010, '2024-01-10'),
(11, 1011, '2024-01-11'),
(12, 1012, '2024-01-12'),
(13, 1013, '2024-01-13'),
(14, 1014, '2024-01-14'),
(15, 1015, '2024-01-15'),
(16, 1016, '2024-01-16'),
(17, 1017, '2024-01-17'),
(18, 1018, '2024-01-18'),
(19, 1019, '2024-01-19'),
(20, 1020, '2024-01-20'),
(1, 1021, '2024-01-21'),
(2, 1022, '2024-01-22'),
(3, 1023, '2024-01-23'),
(4, 1024, '2024-01-24'),
(5, 1025, '2024-01-25'),
(6, 1026, '2024-01-26'),
(7, 1027, '2024-01-27'),
(8, 1028, '2024-01-28'),
(9, 1029, '2024-01-29'),
(10, 1030, '2024-01-30'),
(11, 1031, '2024-01-31'),
(12, 1032, '2024-02-01'),
(13, 1033, '2024-02-02'),
(14, 1034, '2024-02-03'),
(15, 1035, '2024-02-04'),
(16, 1036, '2024-02-05'),
(17, 1037, '2024-02-06'),
(18, 1038, '2024-02-07'),
(19, 1039, '2024-02-08'),
(20, 1040, '2024-02-09');

INSERT INTO Challenges (ChallengeName, Description, Reward, ExpiryDate) VALUES
('Headshot Hunter', 'Get 10 headshot eliminations', '500 XP', '2025-01-21'),
('Build Master', 'Use 500 materials in a single match', '1000 XP', '2025-01-22'),
('Storm Survivor', 'Survive 10 storm phases', '750 XP', '2025-01-23'),
('Chest Collector', 'Open 20 chests', '600 XP', '2025-01-24'),
('Sniper Elite', 'Get 5 sniper eliminations', '800 XP', '2025-01-25'),
('Demolition Expert', 'Destroy 50 structures', '700 XP', '2025-01-26'),
('Supply Drop Raider', 'Search 3 supply drops', '900 XP', '2025-01-27'),
('Healing Hero', 'Heal 1000 health', '550 XP', '2025-01-28'),
('Distance Traveler', 'Travel 5000 meters', '650 XP', '2025-01-29'),
('Trap Master', 'Get 3 eliminations with traps', '850 XP', '2025-01-30'),
('Llama Finder', 'Find and open a Loot Llama', '1000 XP', '2025-01-31'),
('Pistol Pro', 'Get 10 pistol eliminations', '700 XP', '2025-02-01'),
('Fishing Fanatic', 'Catch 20 fish', '600 XP', '2025-02-02'),
('Vehicle Virtuoso', 'Drive vehicles for 10 minutes', '750 XP', '2025-02-03'),
('Upgrade Guru', 'Upgrade weapons 5 times', '800 XP', '2025-02-04'),
('Revive Specialist', 'Revive 5 teammates', '900 XP', '2025-02-05'),
('Campfire Cook', 'Heal with campfires', '550 XP', '2025-02-06'),
('Elimination Expert', 'Get 20 eliminations', '1000 XP', '2025-02-07'),
('Material Gatherer', 'Harvest 1000 of each material', '950 XP', '2025-02-08'),
('Victory Royale', 'Win a match', '2000 XP', '2025-02-09'),
('Shotgun Specialist', 'Get 15 shotgun eliminations', '750 XP', '2025-02-10'),
('Assault Rifleman', 'Deal 1000 damage with assault rifles', '700 XP', '2025-02-11'),
('SMG Sprayer', 'Get 25 SMG eliminations', '800 XP', '2025-02-12'),
('Explosive Expert', 'Deal 500 damage with explosives', '850 XP', '2025-02-13'),
('Sniper Spotter', 'Spot 50 enemies with a sniper scope', '600 XP', '2025-02-14'),
('Bush Camper', 'Hide in bushes for 10 minutes', '500 XP', '2025-02-15'),
('Glider Guru', 'Travel 1000 meters while gliding', '550 XP', '2025-02-16'),
('Emote Entertainer', 'Use 50 emotes', '450 XP', '2025-02-17'),
('Harvesting Hero', 'Harvest 1000 materials', '650 XP', '2025-02-18'),
('Vending Machine User', 'Use 5 vending machines', '700 XP', '2025-02-19'),
('Zipline Zoomer', 'Travel 500 meters on ziplines', '600 XP', '2025-02-20'),
('Reboot Rally', 'Reboot 3 teammates', '900 XP', '2025-02-21'),
('Bounty Hunter', 'Complete 5 bounties', '850 XP', '2025-02-22'),
('Crafting Connoisseur', 'Craft 10 items', '750 XP', '2025-02-23'),
('Foraged Food Finder', 'Consume 20 foraged items', '550 XP', '2025-02-24'),
('Trickshot Master', 'Get an elimination while in the air', '1000 XP', '2025-02-25'),
('Duo Dominator', 'Win 3 Duo matches', '1500 XP', '2025-02-26'),
('Squad Supremacy', 'Win 2 Squad matches', '1500 XP', '2025-02-27'),
('Solo Sovereign', 'Win 5 Solo matches', '2000 XP', '2025-02-28'),
('Battle Pass Completionist', 'Reach Battle Pass level 100', '5000 XP', '2025-03-01');

INSERT INTO PlayerChallenges (PlayerID, ChallengeID, Completed) VALUES
(1, 1, 1),
(2, 2, 0),
(3, 3, 1),
(4, 4, 0),
(5, 5, 1),
(6, 6, 0),
(7, 7, 1),
(8, 8, 0),
(9, 9, 1),
(10, 10, 0),
(11, 11, 1),
(12, 12, 0),
(13, 13, 1),
(14, 14, 0),
(15, 15, 1),
(16, 16, 0),
(17, 17, 1),
(18, 18, 0),
(19, 19, 1),
(20, 20, 0),
(1, 21, 1),
(2, 22, 1),
(3, 23, 0),
(4, 24, 1),
(5, 25, 0),
(6, 26, 1),
(7, 27, 0),
(8, 28, 1),
(9, 29, 0),
(10, 30, 1),
(11, 31, 0),
(12, 32, 1),
(13, 33, 0),
(14, 34, 1),
(15, 35, 0),
(16, 36, 1),
(17, 37, 0),
(18, 38, 1),
(19, 39, 0),
(20, 40, 1);

INSERT INTO PlayerMatchStats (PlayerID, MatchID, Kills, DamageDealt, DamageTaken, Placement, WeaponID) VALUES
(1, 101, 5, 500, 200, 1, 11),
(2, 102, 3, 300, 150, 5, 22),
(3, 103, 7, 700, 300, 2, 33),
(4, 104, 2, 200, 100, 10, 44),
(5, 105, 4, 400, 180, 3, 55),
(6, 106, 6, 600, 250, 1, 66),
(7, 107, 1, 100, 80, 15, 77),
(8, 108, 8, 800, 350, 1, 88),
(9, 109, 3, 300, 140, 7, 99),
(10, 110, 0, 50, 60, 20, 110),
(11, 111, 5, 500, 220, 2, 121),
(12, 112, 4, 400, 190, 4, 55),
(13, 113, 9, 900, 400, 1, 143),
(14, 114, 2, 200, 110, 12, 154),
(15, 115, 6, 600, 270, 3, 165),
(16, 116, 1, 100, 70, 18, 176),
(17, 117, 7, 700, 320, 2, 187),
(18, 118, 3, 300, 160, 8, 198),
(19, 119, 10, 1000, 450, 1, 209),
(20, 120, 0, 30, 40, 25, 220),
(1, 121, 6, 550, 220, 2, 22),
(2, 122, 4, 350, 170, 4, 33),
(3, 123, 8, 750, 320, 1, 44),
(4, 124, 3, 250, 120, 8, 55),
(5, 125, 5, 450, 200, 3, 66),
(6, 126, 7, 650, 270, 1, 77),
(7, 127, 2, 150, 90, 12, 88),
(8, 128, 9, 850, 370, 1, 99),
(9, 129, 4, 350, 160, 6, 110),
(10, 130, 1, 100, 70, 18, 121),
(11, 131, 6, 550, 240, 2, 132),
(12, 132, 5, 450, 210, 3, 143),
(13, 133, 10, 950, 420, 1, 154),
(14, 134, 3, 250, 130, 10, 165),
(15, 135, 7, 650, 290, 2, 176),
(16, 136, 2, 150, 80, 15, 187),
(17, 137, 8, 750, 340, 1, 198),
(18, 138, 4, 350, 180, 7, 209),
(19, 139, 11, 1050, 470, 1, 220),
(20, 140, 1, 80, 50, 22, 11);


--Queries

--a) Select all players and order them by total wins:
SELECT Username, TotalWins FROM PLAYER
ORDER BY TotalWins DESC

--b) Find the top 5 players with the highest level:
SELECT TOP(5) Username, [Level] FROM PLAYER
ORDER BY Level DESC

--c) List all weapons of 'Legendary' rarity:
SELECT WeaponName, WeaponRarity, WeaponDamage FROM WEAPON
WHERE WeaponRarity = 'Legendary'

--d) Count the number of matches for each match type:
SELECT MatchType, COUNT(*) AS [Count Of Match Type] FROM [MATCH]
GROUP BY MatchType

--e) Find players who have completed at least one challenge:
SELECT DISTINCT p.Username, COUNT(pc.Completed) AS [Challenges Completed] FROM PLAYER AS p
JOIN PLAYERCHALLENGES AS pc ON p.PLAYERID = pc.PLAYERID
GROUP BY pc.Completed, p.Username
HAVING pc.Completed >= 1

--f) Calculate the average match duration for each match type:
SELECT MatchType, AVG(DurationMinutes) AS [Average Duration] FROM [MATCH]
GROUP BY MatchType

--g) Find the most used weapon in matches:
SELECT TOP(1) w.WeaponName, COUNT(pms.WeaponID) AS [Use Count] FROM WEAPON w
JOIN PlayerMatchStats pms ON w.WeaponID = pms.WeaponID
GROUP BY w.WeaponName
ORDER BY [Use Count] DESC

--h) List players who own the 'Galaxy' skin:
SELECT p.Username, s.SkinName FROM PLAYER p
JOIN PLAYERSKINS ps ON p.PlayerID = ps.PlayerID
JOIN SKINS s ON s.SkinID = ps.SkinID
WHERE s.SkinName = 'Galaxy'


--i) Calculate the win rate for each player:
SELECT Username, TotalWins, TotalMatchesPlayed,ROUND(CAST(TotalWins AS FLOAT) / NULLIF(TotalMatchesPlayed, 0) * 100,2) AS WinRate
FROM Player
ORDER BY WinRate DESC;

--j) List challenges that no player has completed yet:
SELECT c.ChallengeName, c.Description, pc.Completed FROM Challenges c
JOIN PlayerChallenges pc ON pc.ChallengeID = c.ChallengeID
WHERE pc.Completed = 0

