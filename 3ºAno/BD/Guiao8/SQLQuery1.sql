DBCC FREEPROCCACHE;
DBCC DROPCLEANBUFFERS;

--1
select * from Production.WorkOrder;--2select * from Production.WorkOrder where WorkOrderID=1234;--3SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 10000 and 10010;
SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 1 and 72591;

--4
SELECT * FROM Production.WorkOrder WHERE StartDate = '2007-06-25';

--5
SELECT * FROM Production.WorkOrder WHERE ProductID = 757;

