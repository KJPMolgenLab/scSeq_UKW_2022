library(workflowr)

mode="run" # or setup
if(mode=="setup"){
  workflowr::wflow_start("/files/scRNA_Qualitycheck/", existing=T)
  wflow_git_config(user.name = "SheenYo", user.email = "afsheen.yousaf@kgu.de", overwrite=T)
  wflow_git_remote("origin",
                   user = "KJPMolgenlab",
                   repo  ="scSeq_UKW_2022", action="set_url")


}

workflowr::wflow_build("./analysis/01_QC_scRNA.Rmd")
workflowr::wflow_build("./analysis/02_Clustering_scRNA.Rmd")
workflowr::wflow_build("./analysis/03_TrajectoryAnalysis_scRNA.Rmd")
workflowr::wflow_build("./analysis/04_GenotypeAnalysis_scRNA.Rmd")

workflowr::wflow_publish(c("./analysis/*", "./docs/*","./code/*"))
source("git push origin master")


#git@github.com:KJPMolgenLab/scSeq_UKW_2022.git
