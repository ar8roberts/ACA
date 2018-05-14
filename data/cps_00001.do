* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

set more off

clear
quietly infix                 ///
  int     year       1-4      ///
  long    serial     5-9      ///
  byte    month      10-11    ///
  double  hwtfinl    12-21    ///
  double  cpsid      22-35    ///
  byte    asecflag   36-36    ///
  byte    hflag      37-37    ///
  double  asecwth    38-47    ///
  byte    pernum     48-49    ///
  double  wtfinl     50-63    ///
  double  cpsidp     64-77    ///
  double  asecwt     78-87    ///
  byte    empstat    88-89    ///
  byte    labforce   90-90    ///
  int     occ        91-94    ///
  byte    classwkr   95-96    ///
  int     uhrsworkt  97-99    ///
  int     uhrswork1  100-102  ///
  int     uhrswork2  103-105  ///
  byte    wkstat     106-107  ///
  int     fragem     108-111  ///
  int     frever     112-114  ///
  int     frbirthm   115-117  ///
  long    frbirthy   118-122  ///
  int     frage1     123-125  ///
  using `"cps_00001.dat"'

replace hwtfinl   = hwtfinl   / 10000
replace asecwth   = asecwth   / 10000
replace wtfinl    = wtfinl    / 10000
replace asecwt    = asecwt    / 10000

format hwtfinl   %10.4f
format cpsid     %14.0f
format asecwth   %10.4f
format wtfinl    %14.4f
format cpsidp    %14.0f
format asecwt    %10.4f

label var year      `"Survey year"'
label var serial    `"Household serial number"'
label var month     `"Month"'
label var hwtfinl   `"Household weight, Basic Monthly"'
label var cpsid     `"CPSID, household record"'
label var asecflag  `"Flag for ASEC"'
label var hflag     `"Flag for the 3/8 file 2014"'
label var asecwth   `"Annual Social and Economic Supplement Household weight"'
label var pernum    `"Person number in sample unit"'
label var wtfinl    `"Final Basic Weight"'
label var cpsidp    `"CPSID, person record"'
label var asecwt    `"Annual Social and Economic Supplement Weight"'
label var empstat   `"Employment status"'
label var labforce  `"Labor force status"'
label var occ       `"Occupation"'
label var classwkr  `"Class of worker"'
label var uhrsworkt `"Hours usually worked per week at all jobs"'
label var uhrswork1 `"Hours usually worked per week at main job"'
label var uhrswork2 `"Hours usually worked per week, other job(s)"'
label var wkstat    `"Full or part time status"'
label var fragem    `"Woman's age (in months) at birth of last child"'
label var frever    `"Number of live births ever had"'
label var frbirthm  `"Birth month of last/most recent child"'
label var frbirthy  `"Birth year of last/most recent child"'
label var frage1    `"Woman's age in months at birth of first child"'

label define month_lbl 01 `"January"'
label define month_lbl 02 `"February"', add
label define month_lbl 03 `"March"', add
label define month_lbl 04 `"April"', add
label define month_lbl 05 `"May"', add
label define month_lbl 06 `"June"', add
label define month_lbl 07 `"July"', add
label define month_lbl 08 `"August"', add
label define month_lbl 09 `"September"', add
label define month_lbl 10 `"October"', add
label define month_lbl 11 `"November"', add
label define month_lbl 12 `"December"', add
label values month month_lbl

label define asecflag_lbl 1 `"ASEC"'
label define asecflag_lbl 2 `"March Basic"', add
label values asecflag asecflag_lbl

label define hflag_lbl 0 `"5/8 file"'
label define hflag_lbl 1 `"3/8 file"', add
label values hflag hflag_lbl

label define empstat_lbl 00 `"NIU"'
label define empstat_lbl 01 `"Armed Forces"', add
label define empstat_lbl 10 `"At work"', add
label define empstat_lbl 12 `"Has job, not at work last week"', add
label define empstat_lbl 20 `"Unemployed"', add
label define empstat_lbl 21 `"Unemployed, experienced worker"', add
label define empstat_lbl 22 `"Unemployed, new worker"', add
label define empstat_lbl 30 `"Not in labor force"', add
label define empstat_lbl 31 `"NILF, housework"', add
label define empstat_lbl 32 `"NILF, unable to work"', add
label define empstat_lbl 33 `"NILF, school"', add
label define empstat_lbl 34 `"NILF, other"', add
label define empstat_lbl 35 `"NILF, unpaid, lt 15 hours"', add
label define empstat_lbl 36 `"NILF, retired"', add
label values empstat empstat_lbl

label define labforce_lbl 0 `"NIU"'
label define labforce_lbl 1 `"No, not in the labor force"', add
label define labforce_lbl 2 `"Yes, in the labor force"', add
label values labforce labforce_lbl

label define classwkr_lbl 00 `"NIU"'
label define classwkr_lbl 10 `"Self-employed"', add
label define classwkr_lbl 13 `"Self-employed, not incorporated"', add
label define classwkr_lbl 14 `"Self-employed, incorporated"', add
label define classwkr_lbl 20 `"Works for wages or salary"', add
label define classwkr_lbl 21 `"Wage/salary, private"', add
label define classwkr_lbl 22 `"Private, for profit"', add
label define classwkr_lbl 23 `"Private, nonprofit"', add
label define classwkr_lbl 24 `"Wage/salary, government"', add
label define classwkr_lbl 25 `"Federal government employee"', add
label define classwkr_lbl 26 `"Armed forces"', add
label define classwkr_lbl 27 `"State government employee"', add
label define classwkr_lbl 28 `"Local government employee"', add
label define classwkr_lbl 29 `"Unpaid family worker"', add
label define classwkr_lbl 99 `"Missing/Unknown"', add
label values classwkr classwkr_lbl

label define uhrsworkt_lbl 997 `"Hours vary"'
label define uhrsworkt_lbl 999 `"NIU"', add
label values uhrsworkt uhrsworkt_lbl

label define uhrswork1_lbl 000 `"0 hours"'
label define uhrswork1_lbl 997 `"Hours vary"', add
label define uhrswork1_lbl 999 `"NIU/Missing"', add
label values uhrswork1 uhrswork1_lbl

label define uhrswork2_lbl 997 `"Hours vary"'
label define uhrswork2_lbl 998 `"Missing"', add
label define uhrswork2_lbl 999 `"NIU"', add
label values uhrswork2 uhrswork2_lbl

label define wkstat_lbl 10 `"Full-time schedules"'
label define wkstat_lbl 11 `"Full-time hours (35+), usually full-time"', add
label define wkstat_lbl 12 `"Part-time for non-economic reasons, usually full-time"', add
label define wkstat_lbl 13 `"Not at work, usually full-time"', add
label define wkstat_lbl 14 `"Full-time hours, usually part-time for economic reasons"', add
label define wkstat_lbl 15 `"Full-time hours, usually part-time for non-economic reasons"', add
label define wkstat_lbl 20 `"Part-time for economic reasons"', add
label define wkstat_lbl 21 `"Part-time for economic reasons, usually full-time"', add
label define wkstat_lbl 22 `"Part-time hours, usually part-time for economic reasons"', add
label define wkstat_lbl 40 `"Part-time for non-economic reasons, usually part-time"', add
label define wkstat_lbl 41 `"Part-time hours, usually part-time for non-economic reasons"', add
label define wkstat_lbl 42 `"Not at work, usually part-time"', add
label define wkstat_lbl 50 `"Unemployed, seeking full-time work"', add
label define wkstat_lbl 60 `"Unemployed, seeking part-time work"', add
label define wkstat_lbl 99 `"NIU, blank, or not in labor force"', add
label values wkstat wkstat_lbl

label define frever_lbl 000 `"0"'
label define frever_lbl 001 `"1"', add
label define frever_lbl 002 `"2"', add
label define frever_lbl 003 `"3"', add
label define frever_lbl 004 `"4"', add
label define frever_lbl 005 `"5"', add
label define frever_lbl 006 `"6"', add
label define frever_lbl 007 `"7"', add
label define frever_lbl 008 `"8"', add
label define frever_lbl 009 `"9"', add
label define frever_lbl 010 `"10"', add
label define frever_lbl 011 `"11"', add
label define frever_lbl 012 `"12"', add
label define frever_lbl 013 `"13"', add
label define frever_lbl 014 `"14"', add
label define frever_lbl 015 `"15"', add
label define frever_lbl 016 `"16"', add
label define frever_lbl 017 `"17"', add
label define frever_lbl 018 `"18"', add
label define frever_lbl 019 `"19"', add
label define frever_lbl 020 `"20"', add
label define frever_lbl 999 `"NIU"', add
label values frever frever_lbl

label define frbirthm_lbl 001 `"January"'
label define frbirthm_lbl 002 `"February"', add
label define frbirthm_lbl 003 `"March"', add
label define frbirthm_lbl 004 `"April"', add
label define frbirthm_lbl 005 `"May"', add
label define frbirthm_lbl 006 `"June"', add
label define frbirthm_lbl 007 `"July"', add
label define frbirthm_lbl 008 `"August"', add
label define frbirthm_lbl 009 `"September"', add
label define frbirthm_lbl 010 `"October"', add
label define frbirthm_lbl 011 `"November"', add
label define frbirthm_lbl 012 `"December"', add
label define frbirthm_lbl 999 `"NIU"', add
label values frbirthm frbirthm_lbl


