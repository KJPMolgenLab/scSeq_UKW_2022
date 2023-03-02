library(workflowr)

mode="run" # or setup
if(mode=="setup"){
  workflowr::wflow_start("/files/scRNA_Qualitycheck/", existing=T)
  wflow_git_config(user.name = "SheenYo", user.email = "afsheen.yousaf@kgu.de", overwrite=T)
  wflow_git_remote("origin",
                   user = "KJPMolgenlab",
                   repo  ="scSeq_UKW_2022", action="set_url")


}

wflow_build()
workflowr::wflow_publish(c("./analysis/*", "./docs/*","./code/*"))
source("git push origin master")


