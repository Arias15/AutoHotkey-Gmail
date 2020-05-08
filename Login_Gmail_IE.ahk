001:
ie := ComObjCreate("InternetExplorer.Application")
 ie.Visible := true
 
ie.Navigate("https://accounts.google.com/ServiceLogin?sacu=1&continue=https%3A%2F%2Faccounts.google.com%2FManageAccount&hl=en#identifier")

 Sleep, 600
while ie.readyState != 4 || ie.document.readyState != "complete" || ie.busy
    Sleep, 100
    correo := ie.document.GetElementsByName("identifier")[0].Value := "gariasc@uni.pe" ;Object Name- Set array value
  
    ie.document.getElementByID("identifierNext").click()
    ie.document.getElementByID("identifierNext").fireEvent("onclick")  ; Sometimes needed in conjunction with click()
    ie.document.getElementByID("identifierNext").fireEvent("onchange")  ; Sometimes needed in conjunction with click()

    Sleep, 300
    ie.document.getElementsByName("password")[0].Value := "mamitatkm04"
    Sleep, 300
    ie.document.getElementByID("identifierNext").click()
    ie.document.getElementByID("identifierNext").fireEvent("onclick")  ; Sometimes needed in conjunction with click()
    ie.document.getElementByID("identifierNext").fireEvent("onchange")  ; Sometimes needed in conjunction with click()
    
    ie.Navigate("https://mail.google.com/mail/")
 
    ObjRelease(ie)
 
Return
