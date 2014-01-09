ALTER TABLE Exchange DROP FOREIGN KEY Exchange2CompositeExchange;
ALTER TABLE CompositeExchange DROP FOREIGN KEY CompositeExchange2Order;
ALTER TABLE OrderAudit DROP FOREIGN KEY OrderAudit2Order;
ALTER TABLE NxtTransaction DROP FOREIGN KEY NxtTransaction2NxtAccount;
ALTER TABLE BtcTransaction DROP FOREIGN KEY BtcTransaction2BtcAccount;
ALTER TABLE BitCoinAccountInfo DROP FOREIGN KEY BitCoinAccountToUser;
ALTER TABLE NxtCoinAccountInfo DROP FOREIGN KEY NxtAccount2User;
ALTER TABLE `Order` DROP FOREIGN KEY Order2User;
DROP TABLE IF EXISTS Exchange;
DROP TABLE IF EXISTS CompositeExchange;
DROP TABLE IF EXISTS OrderAudit;
DROP TABLE IF EXISTS NxtTransaction;
DROP TABLE IF EXISTS BtcTransaction;
DROP TABLE IF EXISTS BitCoinAccountInfo;
DROP TABLE IF EXISTS NxtCoinAccountInfo;
DROP TABLE IF EXISTS `Order`;
DROP TABLE IF EXISTS `User`;

