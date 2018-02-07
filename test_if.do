/* This do-file conducts testing for the
if statement embedded in the scf program
Date: 1/31/2018
Author: CR 
*/

do ~/bclm/crafkin/public_programs/scfses/scfses.ado
do ~/bclm/crafkin/handbook_scf/dofiles/gen_my_ses.do

use ~/bclm/crafkin/handbook_scf/data/table_data, clear 
set trace off 
qui { 
        scfses A1 [pw = trueWGT] if inrange(AGE,50,54) & YEAR == 2016, num(10) p(50)
        

        matrix coef = e(b)
        local coef = coef[1,1]
        
        matrix var = e(V)
        local se = var[1,1]
        local se = `se'^.5
        
        matrix dof = e(df_r)
        local dof = dof[1,1]

        matrix table = r(table) 
        local lb = table[5,1]
        local ub = table[6,1]
        
}
di "NEW PROGRAM: coef: `coef', SE: `se' , lb: `lb', ub: `ub', dof: `dof'" 


use ~/bclm/crafkin/handbook_scf/data/table_data, clear 
keep if YEAR == 2016
keep if inrange(AGE,50,54)  

qui {
        myses A1 , boot(10) q(50)


        matrix coef = e(b)
        local coef = coef[1,1]
        
        matrix var = e(V)
        local se = var[1,1]
        local se = `se'^.5
        
        matrix dof = e(df_r)
        local dof = dof[1,1]

        matrix table = r(table) 
        local lb = table[5,1]
        local ub = table[6,1]
        
      }
di "OLD PROGRAM: coef: `coef', SE: `se' , lb: `lb', ub: `ub', dof: `dof'" 
di "it works!"

/* test some other stuff */
scfses A1 [pw = trueWGT] if inrange(AGE,50,54) & YEAR == 2016, num(10) p(50) imp(5) repwt(wt1b) repnm(mm)



scfses A1 [pw = trueWGT] if inrange(AGE,50,54) & YEAR == 2016, num(25) p(50) imp(5) repwt(wt1b) repnm(mm) 
scfses A1 [pw = trueWGT] if inrange(AGE,50,60) & YEAR == 2013, num(25) p(50) imp(5) repwt(wt1b) repnm(mm) 

scfses A1 if inrange(AGE,50,54) & YEAR == 2016, num(25) p(50) imp(5) repwt(asdf) repnm(mm) 

keep if inrange(AGE,50,54) & YEAR == 2016
scfses A1 [pw = trueWGT] , num(10) p(50) 
