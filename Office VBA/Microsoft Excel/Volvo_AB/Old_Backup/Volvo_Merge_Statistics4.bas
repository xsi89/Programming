Attribute VB_Name = "Volvo_Merge_Statistics"
Sub Volvo_()

Dim StrCurrentfile As String
Dim intResult As Integer

Dim wb As Workbook


Set wb = ActiveWorkbook
Dim OWb As Workbook

Application.DisplayAlerts = True


intResult = Application.FileDialog(msoFileDialogFolderPicker).Show

If intResult = 0 Then

    MsgBox "User pressed cancel macro will stop!"

Exit Sub

Else

strDocPath = Application.FileDialog(msoFileDialogFolderPicker).SelectedItems(1) & "\"

End If

StrCurrentfile = Dir(strDocPath & "*.xls")
Do While StrCurrentfile <> ""




Set OWb = Workbooks.Open(strDocPath & StrCurrentfile)


OWb.Activate


Dim myname
'myname = Replace(ActiveWorkbook.Name, ".xls", "")
    ActiveSheet.Select
   ' ActiveSheet.Name = myname
    ActiveSheet.Name = "StatRowOne"

OWb.Sheets("StatRowOne").Copy
'ActiveSheet.Copy


wb.Activate

Dim ws As Worksheet
Set ws = ThisWorkbook.Sheets.Add(After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count))
ws.Name = "Tempo"





'Application.DisplayAlerts = False
'myLangFileN.Close SaveChanges:=False
'noLangFilen.CheckCompatibility = False
'noLangFilen.Close SaveChanges:=True

StrCurrentfile = Dir


Loop


End Sub


Sub mypathen()


 MsgBox ThisWorkbook.Name & Chr(10) & ThisWorkbook.Path & Chr(10) & ActiveSheet.Name



End Sub

Sub CombineFiles()
     
    Dim Path As String
    Dim FileName As String
    Dim Wkb As Workbook
    Dim ws As Worksheet
    
    
    
    
    
    intResult = Application.FileDialog(msoFileDialogFolderPicker).Show

If intResult = 0 Then

    MsgBox "User pressed cancel macro will stop!"

Exit Sub

Else

strDocPath = Application.FileDialog(msoFileDialogFolderPicker).SelectedItems(1) & "\"

End If
     
    Application.EnableEvents = False
    Application.ScreenUpdating = False

    FileName = Dir(strDocPath & "\*.xls", vbNormal)
    Do Until FileName = ""
        Set Wkb = Workbooks.Open(FileName:=strDocPath & "\" & FileName)
        For Each ws In Wkb.Worksheets
        
        
         Application.DisplayAlerts = False
    Dim sh As Worksheet
    For Each sh In Sheets
        If IsEmpty(sh.UsedRange) Then sh.Delete
    Next
    Application.DisplayAlerts = True
        
        WBname = Replace(FileName, ".xls", "")

       MsgBox WBname
      '      ws.Copy After:=ThisWorkbook.Sheets(ThisWorkbook.Sheets.Count)
            
        Next ws
        ActiveSheet.Name = (FileName)
        Wkb.Close False
        FileName = Dir()
    Loop
    Application.EnableEvents = True
    Application.ScreenUpdating = True
    
 
    
';;;;;;;;;;;Removes the Sheet name "Orders" from _TSP file ;;;;;;;;;;;;;;
'    Application.DisplayAlerts = False ' Alert prompt for delete sheet.
'    Sheets("Orders").Delete
'
'
'
'
'
'
'    Dim celltxt As String
'celltxt = ActiveSheet.Range("A1").Text
'If InStr(1, celltxt, "Teknotrans Number") Then
'
'ActiveSheet.Name = ""
'
'Else
'MsgBox ("N�got �r knas det finns ingen TSP fil")
'End If
'
'
'
'
    
    
    
    
    


' For Each sht In ActiveWorkbook.Worksheets
'    Set rng = sht.UsedRange
'    Set MyRange = rng
'
'        For Each MyCol In MyRange.Columns
'            For Each myCell In MyCol.Cells
'                If myCell.Interior.ColorIndex = xlNone Then
'
'
'                    'myCell.Font.ColorIndex = 1
'                    'Cells(myCell.Row, 2).Copy
'                   ' myCell.PasteSpecial Paste:=xlPasteFormulas, Operation:=xlNone, _
'                   ' SkipBlanks:=False, Transpose:=False
'                End If
'
'            Next
'        Next
'    Next
'
    
    
    
    
    
    
    
    
    






    
     
End Sub









