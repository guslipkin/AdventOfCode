needed <- unique(renv::dependencies()$Package)

needed <- needed[!(needed %in% installed.packages())]

for(package in needed) {
  install.packages(package)
}