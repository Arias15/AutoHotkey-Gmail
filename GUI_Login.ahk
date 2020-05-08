

; #CODIGO SCRIPT#
global qu := Chr(191)
global nh := Chr(241)
global o := Chr(243) ; o con tilde
global a := Chr(225)
global ih := Chr(237)
MainForm()
MainForm(){
	Static User, Pass, RepDate


    Gui, font,bold
    Gui, Add, groupbox, yp+10 w280 h90, LOGIN
    Gui, font
    Gui, Add, Text, xp+20 yp+25, Usuario
    Gui, Add, edit, y+10 w110 Limit40 Lowercase vUser
    Gui, Add, Text, ym x+20 yp-23, Contrase`ña
    Gui, Add,edit, Password y+10 w110 Limit30 vPass
    Gui, font,bold
    Gui, Add, groupbox, w280 h85 y+30 xm, Opciones de Reporte 
    Gui, font
    Gui, Add, Text, xp+87 yp+25, Fecha de reporte
    Gui, Add, DateTime, y+10 wp20 h20 w110 vRepDate Section, dd/MM/yyyy
    GuiControl,, RepDate, %yest%
    Gui, Add, Button, default yp+45 w80 xm x45, Aceptar 
    Gui, Add, Button, x+55 w80, Cancelar
    Gui, Show
    
    return
    ButtonAceptar:
    {   Gui, Submit
        
        Sleep 300
        
        001:
        ie := ComObjCreate("InternetExplorer.Application")
        ie.Visible := true
        
        ie.Navigate("https://accounts.google.com/ServiceLogin?sacu=1&continue=https%3A%2F%2Faccounts.google.com%2FManageAccount&hl=en#identifier")

        Sleep, 600
        while ie.readyState != 4 || ie.document.readyState != "complete" || ie.busy
            Sleep, 100
            correo := ie.document.GetElementsByName("identifier")[0].Value := User 
        
            ie.document.getElementByID("identifierNext").click()
            ie.document.getElementByID("identifierNext").fireEvent("onclick") 
            ie.document.getElementByID("identifierNext").fireEvent("onchange")  

            Sleep, 300
            ie.document.getElementsByName("password")[0].Value := Pass
            Sleep, 300
            ie.document.getElementByID("identifierNext").click()
            ie.document.getElementByID("identifierNext").fireEvent("onclick") 
            ie.document.getElementByID("identifierNext").fireEvent("onchange")
            
            ie.Navigate("https://mail.google.com/mail/")
        
        ObjRelease(ie)

    }
	GuiClose:
	GuiEscape:
	ButtonCancelar:
	ExitApp
    
}

