/*
Задача с датами

Таблица tCalendar ( Date date, WorkDay bit )
Заполнена датами, где некоторые дни отмечены как выходные – WorkDay = 0

Задание:

Для произвольной даты @d

Написать одно выражение TSQL, которое возвращает 3 предыдущих рабочих дня и 5 следующих рабочих дней.
*/

declare @tCalendar table ([Date] date, WorkDay bit)
declare @currDate date = '2021-10-25'
declare @RANG int = 0

insert into @tCalendar
values ('2021-10-18',1), ('2021-10-19',1), ('2021-10-20',1), ('2021-10-21',1) , ('2021-10-22',1)
, ('2021-10-23',0) , ('2021-10-24',0) , ('2021-10-25',1) , ('2021-10-26',1) ,  ('2021-10-27',1)
, ('2021-10-28',1) , ('2021-10-29',1), ('2021-10-30',0) , ('2021-10-31',0) , ('2021-11-01',1)

select @RANG = tbl.RANG from (
select t.Date, t.WorkDay
, ROW_NUMBER() over ( order by t.Date ) as RANG
from @tCalendar t
where 
t.WorkDay = 1 ) as tbl
where tbl.Date=@currDate

select * from (
select t.Date, t.WorkDay
, ROW_NUMBER() over ( order by t.Date ) as RANG
from @tCalendar t
where 
t.WorkDay = 1 ) as tbl
where (tbl.Date<@currDate and tbl.RANG between @RANG-3 and @RANG-1 )
or (tbl.Date>@currDate and tbl.RANG between @RANG+1 and @RANG+5)





