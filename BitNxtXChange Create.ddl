DROP TABLE IF EXISTS `Exchange`;
CREATE TABLE Exchange (
	`CompositeExchangepk` int(10) NOT NULL, 
	`pk` int(10) NOT NULL AUTO_INCREMENT, 
	`date` timestamp NOT NULL, 
	`modified` int(10), 
	`filledAmount` double, 
	PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `CompositeExchange`;
CREATE TABLE `CompositeExchange` (
	`Orderpk` int(10) NOT NULL, 
	`pk` int(10) NOT NULL AUTO_INCREMENT, 
	`date` timestamp NOT NULL, 
	`modified` timestamp NULL, 
	`ask` double NOT NULL, 
	`filledAmount` double NOT NULL, 
	`exchangeAmount` double NOT NULL, 
	`type` int(10), 
	PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `OrderAudit`;
CREATE TABLE `OrderAudit` (
	`Orderpk` int(10) NOT NULL, 
	`pk` int(10) NOT NULL AUTO_INCREMENT, 
	`date` timestamp NULL, 
	`field` varchar(255), 
	`description` varchar(255), 
	PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `NxtTransaction`;
CREATE TABLE NxtTransaction (
	`NxtCoinAccountInfopk` int(10) NOT NULL, 
	`pk` int(10) NOT NULL AUTO_INCREMENT, 
	`date` timestamp NOT NULL, 
	`modified` timestamp NULL, 
	`state` int(10), 
	`type` int(10), 
	`amount` double NOT NULL,
	`transactionHash` varchar(255),
	`address` varchar(255),
	PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `BtcTransaction`;
CREATE TABLE BtcTransaction (
	`BitCoinAccountInfopk` int(10) NOT NULL, 
	`pk` int(10) NOT NULL AUTO_INCREMENT, 
	`date` timestamp NOT NULL, 
	`modified` timestamp NULL, 
	`state` int(10), 
	`type` int(10), 
	`amount` double NOT NULL,
	`transactionHash` varchar(255),
	`address` varchar(255),
	PRIMARY KEY (pk)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `BitCoinAccountInfo`;
CREATE TABLE `BitCoinAccountInfo` (
	`Userpk` int(10) NOT NULL, 
	`pk` int(10) NOT NULL AUTO_INCREMENT, 
	`date` timestamp NULL, 
	`modified` timestamp NULL, 
	`accountNumber` varchar(255) NOT NULL, 
	`accountBalance` double, 
	PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `NxtCoinAccountInfo`;
CREATE TABLE `NxtCoinAccountInfo` (
	`Userpk` int(10) NOT NULL, 
	`pk` int(10) NOT NULL AUTO_INCREMENT, 
	`date` timestamp NULL, 
	`modified` timestamp NULL, 
	`accountNumber` varchar(255) NOT NULL, 
	`accountBalance` double, 
	PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `Order`;
CREATE TABLE `Order` (
	`Userpk` int(10) NOT NULL, 
	`pk` int(10) NOT NULL AUTO_INCREMENT, 
	`orderNumber` int(10) NOT NULL, 
	`date` timestamp NULL, 
	`modified` int(10), 
	`orderState` int(10), 
	PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
	`pk` int(10) NOT NULL AUTO_INCREMENT, 
	`email` varchar(255) NOT NULL, 
	`password` varchar(255) NOT NULL, 
	`date` timestamp NULL, 
	`modified` timestamp NULL, 
	PRIMARY KEY (`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `Exchange` 
	ADD INDEX `Exchange2CompositeExchange` (`CompositeExchangepk`), 
	ADD CONSTRAINT `Exchange2CompositeExchange` FOREIGN KEY (`CompositeExchangepk`) 
		REFERENCES CompositeExchange (`pk`); 
	

ALTER TABLE `CompositeExchange` 
	ADD INDEX `CompositeExchange2Order` (`Orderpk`), 
	ADD CONSTRAINT `CompositeExchange2Order` FOREIGN KEY (`Orderpk`) 
		REFERENCES `Order` (`pk`); 
	
	
	
ALTER TABLE `OrderAudit` 
	ADD INDEX `OrderAudit2Order` (`Orderpk`), 
	ADD CONSTRAINT `OrderAudit2Order` FOREIGN KEY (`Orderpk`) 
		REFERENCES `Order` (`pk`);
	
	
	
ALTER TABLE `NxtTransaction` 
	ADD INDEX `NxtTransaction2NxtAccount` (`NxtCoinAccountInfopk`), 
	ADD CONSTRAINT `NxtTransaction2NxtAccount` 
		FOREIGN KEY (`NxtCoinAccountInfopk`) 
	REFERENCES NxtCoinAccountInfo (`pk`) ;
	
	
ALTER TABLE `BtcTransaction` 
	ADD INDEX `BtcTransaction2BtcAccount` (`BitCoinAccountInfopk`), 
	ADD CONSTRAINT `BtcTransaction2BtcAccount` 
	FOREIGN KEY (`BitCoinAccountInfopk`) 
		REFERENCES BitCoinAccountInfo (`pk`); 
	

ALTER TABLE `BitCoinAccountInfo` 
	ADD INDEX `BitCoinAccountToUser` (`Userpk`), 
	ADD CONSTRAINT `BitCoinAccountToUser` 
	FOREIGN KEY (`Userpk`) 
		REFERENCES `User` (`pk`); 
	
	
ALTER TABLE `NxtCoinAccountInfo` 
	ADD INDEX NxtAccount2User (`Userpk`), 
	ADD CONSTRAINT `NxtAccount2User` 
	FOREIGN KEY (`Userpk`) 
		REFERENCES `User` (`pk`); 
	
	
ALTER TABLE `Order` 
	ADD INDEX Order2User (`Userpk`), 
	ADD CONSTRAINT `Order2User` 
	FOREIGN KEY (`Userpk`) 
		REFERENCES `User` (`pk`); 
	

