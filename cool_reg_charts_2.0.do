// ssc install setroot, replace
// ssc install estout, replace
ssc install asdoc,replace
setroot
use "df_stata.dta", clear

gen SEL_IHE_2 = (SEL_IHE==2)
gen SEL_IHE_3 = (SEL_IHE==3)
gen SEL_IHE_4 = (SEL_IHE==4)
gen OCC_FATHER_0 = (OCC_FATHER==5) // not used, for baseline
gen OCC_FATHER_1 = (OCC_FATHER==2) 
gen OCC_FATHER_2 = (OCC_FATHER==3)
gen OCC_FATHER_3 = (OCC_FATHER==4)
gen OCC_FATHER_4 = (OCC_FATHER==6)
gen OCC_FATHER_5 = (OCC_FATHER==7)
gen OCC_FATHER_6 = (OCC_FATHER==8)
gen OCC_FATHER_7 = (OCC_FATHER==9)
gen OCC_FATHER_8 = (OCC_FATHER==10)
gen OCC_FATHER_9 = (OCC_FATHER==11)
gen OCC_FATHER_10 = (OCC_FATHER==12)
gen MAT_S11xBIO_S11 = MAT_S11*BIO_S11

label variable MAT_S11 "MATH S11"
label variable ENG_S11 "English S11"
label variable CR_S11 "Critical Reading S11"
label variable CC_S11 "Citizen Competencies S11"
label variable BIO_S11 "Biology S11"
label variable SEL_IHE "Social Economic Level of Higher Level Institution"
label variable OCC_FATHER "Occupation Father"
label variable REVENUE "Revenue Level"

label variable SEL_IHE_2 "Socioeconomic Level of Higher Level Education Institution 2"
label variable SEL_IHE_3 "Socioeconomic Level of Higher Level Education Institution 3"
label variable SEL_IHE_4 "Socioeconomic Level of Higher Level Education Institution 4"
label variable OCC_FATHER_1 "OCC_FATHER Auxiliary or Administrative"
label variable OCC_FATHER_2 "OCC_FATHER Entrepreneur"
label variable OCC_FATHER_3 "OCC_FATHER Executive"
label variable OCC_FATHER_4 "OCC_FATHER Independent"
label variable OCC_FATHER_5 "OCC_FATHER Independent professional"
label variable OCC_FATHER_6 "OCC_FATHER Operator"
label variable OCC_FATHER_7 "OCC_FATHER Other occupation"
label variable OCC_FATHER_8 "OCC_FATHER Retired"
label variable OCC_FATHER_9 "OCC_FATHER Small entrepreneur"
label variable OCC_FATHER_10 "OCC_FATHER Technical or professional"


label variable MAT_S11xBIO_S11 "Math S11 x Bio S11"

global features MAT_S11 ENG_S11 CR_S11 CC_S11 BIO_S11 SEL_IHE_2 SEL_IHE_3 SEL_IHE_4 OCC_FATHER_1 OCC_FATHER_2  OCC_FATHER_3  OCC_FATHER_4  OCC_FATHER_5 OCC_FATHER_6 OCC_FATHER_7 OCC_FATHER_8 OCC_FATHER_9 OCC_FATHER_10 MAT_S11xBIO_S11

eststo spec1: reg G_SC $features

local notes "Regression results for G_SC on individual S11 tests, Socioeconomic Level of Higher Level Eduation Institution (SEL_IHE), Occuptation of Father (OCC_FATHER) and an ineration term for Math score in S11 with the Bio score in S11 exams. Reported under the beta estimate are the p-value, the 95% confidence interval, and standard error in that order. P values are in square brackets. Standard errors are reported in parantheses. Significance stars are as follows: * p < 0.05, ** p < 0.01, *** p < 0.001."

esttab spec1 using reg_table_final.html, cells(b(star fmt(3)) p(fmt(3)) ci(par fmt(3)) se(fmt(3) par(( )))) title("Regression Results Table") stats(r2_a N, labels("Adjusted R-Squared" "Observations") fmt(3 0)) addnotes("Notes:`notes'") label replace

asdoc reg G_SC $features, replace not label
