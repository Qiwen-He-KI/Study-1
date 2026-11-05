# Study-1

Title: Comparison of Loss in Life Expectancy (LLE) and Years of Life Lost (YLL): A Monte Carlo Simulation Study and Application to Cancer Registry Data

Author: Qiwen He, PhD Student in Biostatistics, Department of Medical Epidemiology and Biostatistics, Karolinska Institutet

Co-authors: Paul C. Lambert1, Paul W. Dickman, Therese M.-L. Andersson, Elisavet Syriopoulou

## Simulation Study

### Simulation, Estimation of LLE, and Calculation of YLL

The files `Main_code_scen_*.do` are the main Stata scripts for each simulation scenario. Each main file corresponds to one specific scenario and organizes the full simulation workflow. Within each script, two additional do-files are called: one for simulating the data under the specified scenario, and another for calculating the estimate of LLE and YLL. Specifically, the data simulation is performed using two scenario-specific do-files. The file `Simulation_scen_allconstant_v2.do` is used for all scenarios except Scenario 4, 5a, and 5b. For Scenario 4, the file `Simulation_scen_withyear_v2.do` is used, as this scenario incorporates the calendar year in the data-generating process. For Scenarios 5a and 5b, no additional data simulation is required. Instead, these scenarios are based on the data generated under the baseline scenario. Misclassification is then introduced using `Missclass_a.do` and `Missclass_b.do`, respectively, before calculating LLE and YLL. Moreover, the calculation of LLE and YLL is also performed using two scenario-specific do-files. The file `LLE_YLL_Calculation_allconstant_v2.do` is used for all scenarios except Scenario 4. For Scenario 4, the file `LLE_YLL_Calculation_withyear_v2.do` is used, as this scenario requires calculations that account for the calendar year.

## Monte Carlo Error Assessment and Selection of `n_sim`

This section describes the scripts used to assess Monte Carlo error and determine an appropriate number of simulation repetitions (`n_sim`). 

The file `True_value_allconstant_v2.do` is used to estimate the reference values of LLE and YLL from a very large simulated dataset. Because the dataset is sufficiently large, these estimates are treated as approximate true values for comparison. 

The file `Bias_analysis_allconstant_v2.do` is then used to calculate the estimated bias and Monte Carlo error across different values of `n_sim`. It also produces plots to visualize how the bias and Monte Carlo error change as the number of simulation repetitions increases. These results are used to guide the choice of an appropriate `n_sim` for the main simulation study.

## Comparison of LLE and YLL

The file `Comparison.do` is used to compare the estimates of LLE and YLL. This script performs paired t-tests to assess differences between the two measures, creates box plots to visualize their distributions, and conducts linear regression analyses to examine the relationship between LLE and YLL. These analyses provide an overall comparison of the two methods across the simulation results.

## Life Table and Population Mortality Data

This section describes the external life table and population mortality datasets used in the simulation study.

The population mortality data are stored in the following files:

- `popmort_sweden_2023.dta`: the original population mortality dataset, containing calendar year-specific mortality information for Sweden.
- `popmort_2016forall_1933_2023.dta`: derived from `popmort_sweden_2023.dta`. In this dataset, the death rates and one-year survival probabilities for all calendar years are replaced by the corresponding values from 2016.
- `popmort_sweden_only2016.dta`: derived from `popmort_sweden_2023.dta` by retaining only the records for calendar year 2016.

The life table data are stored in the following files:

- `life_table_combined.dta`: the combined life table dataset, which contains expected remaining life years (`_ex`).
- `life_table_only2016.dta`: derived from `life_table_combined.dta` by retaining only the records for calendar year 2016.

The original Swedish mortality data can also be downloaded from the Human Mortality Database: https://www.mortality.org/Country/Country?cntr=SWE
