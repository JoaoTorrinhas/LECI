--a
select * from authors

--b
select au_fname, au_lname, phone from authors

--c
select au_fname, au_lname, phone from authors order by au_fname, au_lname 

--d
select au_fname as first_name, au_lname as last_name, phone as telephone from authors order by au_fname, au_lname

--e
select au_fname as first_name, au_lname as last_name, phone as telephone 
from authors where state = 'CA' and au_lname != 'Ringer' order by au_fname, au_lname

--f
select pub_name from publishers where pub_name like '%Bo%'

--g
select pub_name from publishers,titles where type = 'Business'

--h
select pub_name, sum(ytd_sales) as total_sales
from publishers, titles
where titles.pub_id = publishers.pub_id
group by pub_name

--i
select pub_name, title, sum(ytd_sales) as total_sales
from publishers, titles
where publishers.pub_id = titles.pub_id
group by pub_name, title
order by pub_name

--j
select title, stor_name from titles, stores, sales
where stor_name = 'Bookbeat' AND sales.stor_id = stores.stor_id AND titles.title_id = sales.title_id
group by title, stor_name;

--k
select au_fname, au_lname, COUNT(distinct type) as nume_differentTypes
from titleauthor, authors, titles
where titleauthor.au_id = authors.au_id AND titles.title_id = titleauthor.title_id
group by au_fname, au_lname
having COUNT(distinct type) > 1;

--l
select type as tipo_livro, pub_name as editora, avg(titles.price) as media_preço, sum(ytd_sales) as total_vendas
from titles join publishers on titles.pub_id = publishers.pub_id
group by type, pub_name
having avg(titles.price) is not null;


--m
select title, advance, average
from titles JOIN (select titles.type, AVG(advance) as average
				  from titles
				  where advance IS NOT NULL
				  group by titles.type) AS grp
	ON titles.type = grp.type AND advance > 1.5*average;

--n
select title, au_fname+' '+au_lname as name, sum(ytd_sales) as money_made
from authors join titleauthor on authors.au_id = titleauthor.au_id join titles on titles.title_id = titleauthor.title_id join sales on titles.title_id = sales.title_id
group by title, au_fname+' '+au_lname
order by title, au_fname+' '+au_lname

--o
select distinct titles.title, ytd_sales, 
				ytd_sales*price as facturacao,
				ytd_sales*royalty*price/100 as auths_revenue,
				ytd_sales*price*(100-royalty)/100 as pub_revenue
from titles, sales
where titles.title_id = sales.title_id;

--p
select distinct titles.title, au_fname+' '+au_lname as name, ytd_sales, 
				ytd_sales*price as facturacao,
				ytd_sales*royalty*price/100 as auths_revenue,
				ytd_sales*price*(100-royalty)/100 as pub_revenue
from titles, sales, titleauthor, authors
where titles.title_id = sales.title_id and titles.title_id = titleauthor.title_id and titleauthor.au_id = authors.au_id;


--q
SELECT stor_name, COUNT(DISTINCT title) as different
FROM stores, sales, titles
WHERE stores.stor_id = sales.stor_id AND sales.title_id = titles.title_id
GROUP BY stor_name
HAVING COUNT(DISTINCT title) = (SELECT COUNT(title) FROM titles) ;

--r
SELECT stor_name, sum(qty) AS sum_qty
FROM sales JOIN stores
ON sales.stor_id=stores.stor_id
GROUP BY stor_name
HAVING sum(qty) > (	SELECT avg(sum_qty)
						FROM (	SELECT sum(qty) AS sum_qty, stor_id AS stid
								FROM sales
								GROUP BY stor_id) as T
					);

--s
select title 
from titles
except
select title
from titles, stores, sales
where stores.stor_id = sales.stor_id AND titles.title_id = sales.title_id AND stores.stor_name = 'Bookbeat';

--t
(select pub_name, stor_name
from stores, publishers )
except
(select pub_name, stor_name
from publishers JOIN (	select pub_id AS ppid, sales.stor_id, stor_name
						from titles JOIN sales
						ON titles.title_id=sales.title_id
						JOIN stores
						ON sales.stor_id=stores.stor_id) AS T			
ON pub_id=ppid);