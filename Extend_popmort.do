// Filename..: Extend_popmort
// Study.....: Study 1 
// Author....: Qiwen He
// Date......: 2026/10/19
// Updated...: "date" by "whom"
// Purpose...: Fill the popmort between 1933 and 1949 based on the data in 1950
// Note......:
// --------------------------------------------------------------------// Data used...:
// Data created:
//---------------------------------------------------------------------// Stata Version: Stata 18.0/BE
// --------------------------------------------------------------------
// -- Main program ----------------------------------------------------

clear all

* Load original population mortality data
use "P:/SweCan/Site_specific/Qiwen_YLL/Study1/Data/uni_data/popmort_sweden_2023.dta", clear

*------------------------------------------------------------
* Copy 1950 mortality data to 1933–1949
*------------------------------------------------------------
preserve

keep if year == 1950

* Generate 17 copies for each sex-age combination
expand 17

bysort sex age: replace year = 1932 + _n

tempfile earlier_years
save `earlier_years'

restore

*------------------------------------------------------------
* Append earlier years to original data
*------------------------------------------------------------
append using `earlier_years'

sort year sex age

* Check uniqueness
isid year sex age

* Save as a new file
save "P:/SweCan/Site_specific/Qiwen_YLL/Study1/Data/uni_data/popmort_sweden_1933_2023.dta", replace

// -- End of File -----------------------------------------------------