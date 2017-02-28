load data infile '[acs_root_dir]/packages/ref-currency/sql/common/currencies.dat'
into table currencies
replace
fields terminated by "," optionally enclosed by "'"
(codeA,codeN,minor_unit,note,default_name)
