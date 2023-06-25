library(workflowr)

mode="run" # or setup
if(mode=="setup"){
  workflowr::wflow_start("/files/scRNA_Qualitycheck/", existing=T)
  wflow_git_config(user.name = "achiocch", user.email = "andreas.chiocchetti@web.de", overwrite=T)
  wflow_git_remote("origin",
                   user = "KJPMolgenlab",
                   repo  ="scSeq_UKW_2022", action="set_url")


}


workflowr::wflow_build("./analysis/*.Rmd")
workflowr::wflow_publish(c("./analysis/*", "./docs/*","./code/*"))

system("git push origin master")


#git@github.com:KJPMolgenLab/scSeq_UKW_2022.git
