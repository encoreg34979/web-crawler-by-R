# 下載所需要的資料
start <- as.Date("2018-10-01")
end <- as.Date("2018-10-31")

url <- "http://data.coa.gov.tw/Service/OpenData/FromM/FarmTransData.aspx?FOTT=CSV"  #原本的下載網址
# 根據資料來源說明 FOTT是資料下載格式 StartDate和EndDate分別是開始時間與結束時間
# download.file(url, destfile = "result.csv", method = "libcurl") #destfile 文件存放地址

theDate <- start
while(theDate <= end){
  year <- as.integer(format(theDate,"%Y")) - 1911
  month_Date <- format(theDate,".%m.%d")
  chinese_Date <- paste0(year,month_Date)
  download.file(paste0(url,"&StartDate=", chinese_Date, "&EndDate=", chinese_Date), destfile = paste0("download/",chinese_Date, ".csv"))
  theDate <- theDate + 1
}


