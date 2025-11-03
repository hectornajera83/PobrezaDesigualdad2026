cd "C:\Users\juanc\Documents\Talleres y PAPIIT PUED\Taller movilidad 2026-1"
use "basered_ESRU23.dta", clear

codebook 
************************ TABLAS DE DISTRIBUCIÓN OCUPACIÓN Y EDUCACIÓN **************************
*Declaramos el ponderador
*svyset [pw=factor]

*Distribución de clase y educación grupos ponderados
*svy: tabulate clase, percent format(%9.2f)
*svy: tabulate clasep, percent format(%9.2f)
*svy: tabulate clasem, percent format(%9.2f)

*svy: tabulate educ, percent format(%9.2f)
*svy: tabulate educp, percent format(%9.2f)
*svy: tabulate educm, percent format(%9.2f)

********************TABLAS DE MOVILIDAD INTERGENERACIONAL ***************************
************************ TABLA DE MOVILIDAD LABORAL *****************************
tab clasep clase [aw=factor], matcell(freq1) matrow(names1) matcol(names2)
tab clasem clase [aw=factor], matcell(freq2) matrow(names3) matcol(names4)

 * Crear un archivo de Excel y exportar las tablas
putexcel set "tablas_ocupacion.xlsx", replace

* Exportar la primera tabla
putexcel A1 = "Tabla 1: clasep vs clasent"
putexcel A2 = matrix(names1), names
putexcel B2 = matrix(names2), names
putexcel B3 = matrix(freq1)

* Exportar la segunda tabla
putexcel A20 = "Tabla 2: clasem vs clasent"
putexcel A21 = matrix(names3), names
putexcel B21 = matrix(names4), names
putexcel B22 = matrix(freq2)

*************************TABLA DE MOVILIDAD EN EDUCACION ************************
tab educp educ [aw=factor], matcell(freq1) matrow(names1) matcol(names2) 
tab educm educ [aw=factor], matcell(freq2) matrow(names3) matcol(names4)

* Crear un archivo de Excel y exportar las tablas
putexcel set "tablas_educacion.xlsx", replace

* Exportar la primera tabla
putexcel A1 = "Tabla 1: educp vs educent"
putexcel A2 = matrix(names1), names
putexcel B2 = matrix(names2), names
putexcel B3 = matrix(freq1)

* Exportar la segunda tabla
putexcel A20 = "Tabla 2: educm vs educent"
putexcel A21 = matrix(names3), names
putexcel B21 = matrix(names4), names
putexcel B22 = matrix(freq2)

************************ TABLAS DE MOVILIDAD DE RECURSOS ************************
tab quintilecomp_or quintilecomp_act [aw=factor]

************************************************************************************
************************************************************************************
*********************** TABLAS DE MOVILIDAD DESAGREGADAS****************************

***--- TABLAS DE MOBILIDAD POR CLASE OCUPACIONAL ---***
* Hombres
tab clasep clase [aw=factor] if sexo == 1, matcell(freq1) matrow(names1) matcol(names2)

* Mujeres
tab clasep clase [aw=factor] if sexo == 2, matcell(freq2) matrow(names3) matcol(names4)

*Hombres
tab clasem clase [aw=factor] if sexo == 1, matcell(freq3) matrow(names5) matcol(names6)

* Mujeres
tab clasem clase [aw=factor] if sexo == 2, matcell(freq4) matrow(names7) matcol(names8)

*Crear un archivo Excel para exportar las tablas

putexcel set "tablas_desagregadas.xlsx", replace

*Exportar la primera tabla
putexcel A1 = "Tabla1: clasep vs clase Hombre"
putexcel A2 = matrix(names1), names
putexcel B2 = matrix(names2), names
putexcel B3 = matrix(freq1)

*Exportar la segunda tabla 
putexcel A15 = "Tabla2: clasep vs clase Mujer"
putexcel A16 = matrix(names3), names
putexcel B16 = matrix(names4), names
putexcel B17 = matrix(freq2)

*Exportar la tercera tabla
putexcel A30 = "Tabla3: clasem vs clase Hombre"
putexcel A31 = matrix(names5), names
putexcel B31 = matrix(names6), names
putexcel B32 = matrix(freq3)

*Exportar la cuarta tabla
putexcel A45 = "Tabla4: clasem vs clase Mujer"
putexcel A46 = matrix(names7), names
putexcel B46 = matrix(names8), names
putexcel B47 = matrix(freq4)

***--- TABLAS DE MOVILIDAD POR EDUCACIÓN ---***
*Hombres y Mujeres
tab educp educ [aw=factor] if sexo == 1
tab educp educ [aw=factor] if sexo == 2

*Hombres y Mujeres
tab educm educ [aw=factor] if sexo == 1
tab educm educ [aw=factor] if sexo == 2

***--- TABLAS DE QUINTILES ---***
*Hombres
tab quintilecomp_or quintilecomp_act [aw=factor] if sexo==1
*Mujeres 
tab quintilecomp_or quintilecomp_act [aw=factor] if sexo==2
