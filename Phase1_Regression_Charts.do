ssc install setroot, replace
ssc install estout, replace

setroot
use "data_clean.dta", clear

gen GENDER_F=(GENDER==1)
gen SCHOOL_NAT_PRIVATE=(SCHOOL_NAT==1)
gen SEL_2=(SEL==2)
gen SEL_3=(SEL==3)
gen SEL_4=(SEL==4)
gen SEL_IHE_2=(SEL_IHE==2)
gen SEL_IHE_3=(SEL_IHE==3)
gen SEL_IHE_4=(SEL_IHE==4)


global features AVG_S11 GENDER_F SCHOOL_NAT_PRIVATE SEL_2 SEL_3 SEL_4 SEL_IHE_2 SEL_IHE_3 SEL_IHE_4
// recast str100 $cat_features, force

// decode GENDER, generate (GENDER_CAT)
=======
global features AVG_S11 GENDER SCHOOL_NAT SEL SEL_IHE

eststo spec1: reg G_SC $features

local notes "This table reports regression for score of students on the saber pro test (G_SC) and the features of average score on the saber11 test (AVG_S11), gender (GENDER), private or public school (SCHOOL_NAT), socioeconomic level of the student (SEL), and the socioeconomic level of the school (SEL_IHE). Standard errors are reported in parantheses below estimates. Significance stars are as follows: * p < 0.05, ** p < 0.01, *** p < 0.001."

esttab spec1 using phase1_regtable.html, cells(b(star fmt(3)) se(fmt(3) par(( )))) title("Preliminary Regression Results") addnotes("Notes:`notes'") label replace
