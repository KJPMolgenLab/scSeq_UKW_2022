library(workflowr)

workflowr::wflow_start("/files/scRNA_Qualitycheck/", existing=T)
wflow_build()

