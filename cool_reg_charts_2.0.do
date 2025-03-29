ssc install setroot, replace
ssc install estout, replace

setroot
// cd "C:\Users\Richard Hong\Desktop\Skool\Year 3\STA302\"
use "df_stata.dta", clear

// gen GENDER_F=(GENDER_M==1)
// gen SCHOOL_NAT_PRIVATE=(SCHOOL_NAT==1)
// gen SEL_2=(SEL==2)
// gen SEL_3=(SEL==3)
// gen SEL_4=(SEL==4)
gen SEL_IHE_2=(SEL_IHE==2)
gen SEL_IHE_3=(SEL_IHE==3)
gen SEL_IHE_4=(SEL_IHE==4)

// gen EDU_MOTHERxPEOPLE_HOUSE = EDU_MOTHER * PEOPLE_HOUSE

global features MAT_S11 ENG_S11 CR_S11 CC_S11 BIO_S11 SEL_IHE_2 SEL_IHE_3 SEL_IHE_4 REVENUE OCC_FATHER

// =======
reg G_SC $features

eststo spec1: reg G_SC $features

local notes "This table reports regression for score of students on the saber pro test (G_SC) and the features of average score on the saber11 test (AVG_S11), gender (GENDER), private or public school (SCHOOL_NAT), socioeconomic level of the student (SEL), and the socioeconomic level of the school (SEL_IHE). Standard errors are reported in parantheses below estimates. Significance stars are as follows: * p < 0.05, ** p < 0.01, *** p < 0.001."

esttab spec1 using akiuysgd.html, cells(b(star fmt(3)) se(fmt(3) par(( )))) title("Preliminary Regression Results") addnotes("Notes:`notes'") label replace
