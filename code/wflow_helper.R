library(workflowr)

mode="run" # or setup
if(mode=="setup"){
  workflowr::wflow_start("/files/scRNA_Qualitycheck/", existing=T)  
  wflow_git_config(user.name = "achiocch", user.email = "andreas.chiocchetti@web.de", overwrite=T)
  wflow_git_remote("origin", 
                   user = "KJPMolgenlab",
                   repo  ="scSeq_UKW_2022", action="set_url")
  
  
}

wflow_build()

wflow_publish(c("./analysis/*", "./docs/*","./code/*"))

