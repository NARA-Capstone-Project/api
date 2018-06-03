VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form Form9 
   BorderStyle     =   0  'None
   Caption         =   "Computer Management Form"
   ClientHeight    =   10500
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   19920
   BeginProperty Font 
      Name            =   "Calibri"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form9.frx":0000
   ScaleHeight     =   10500
   ScaleWidth      =   19920
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command4 
      Caption         =   "Delete Computer"
      Enabled         =   0   'False
      Height          =   495
      Left            =   15000
      TabIndex        =   11
      Top             =   1455
      Width           =   2175
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Add New Computer"
      Height          =   495
      Left            =   17295
      TabIndex        =   10
      Top             =   1425
      Width           =   2175
   End
   Begin VB.CommandButton cmdfill 
      Caption         =   "Command4"
      Height          =   495
      Left            =   13020
      TabIndex        =   9
      Top             =   1350
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Generate Report Base on Result"
      Enabled         =   0   'False
      Height          =   495
      Left            =   360
      TabIndex        =   8
      Top             =   9705
      Width           =   3135
   End
   Begin VB.ComboBox Combo3 
      Height          =   345
      ItemData        =   "Form9.frx":261CB
      Left            =   5040
      List            =   "Form9.frx":261CD
      TabIndex        =   7
      Top             =   1560
      Visible         =   0   'False
      Width           =   2535
   End
   Begin VB.ComboBox Combo2 
      Height          =   345
      ItemData        =   "Form9.frx":261CF
      Left            =   5040
      List            =   "Form9.frx":261D1
      TabIndex        =   6
      Top             =   1080
      Width           =   2535
   End
   Begin VB.ComboBox Combo1 
      Height          =   345
      ItemData        =   "Form9.frx":261D3
      Left            =   1440
      List            =   "Form9.frx":261E0
      TabIndex        =   4
      Top             =   1080
      Width           =   2535
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Back to Main Menu"
      Height          =   495
      Left            =   17400
      TabIndex        =   2
      Top             =   9720
      Width           =   2175
   End
   Begin MSFlexGridLib.MSFlexGrid fgrid1 
      Height          =   7545
      Left            =   300
      TabIndex        =   0
      Top             =   2025
      Width           =   19215
      _ExtentX        =   33893
      _ExtentY        =   13309
      _Version        =   393216
      FixedCols       =   0
      BackColor       =   16777215
      BackColorSel    =   16711680
      ForeColorSel    =   16777215
      BackColorBkg    =   12632256
      TextStyleFixed  =   2
      FocusRect       =   2
      HighLight       =   2
      GridLinesFixed  =   1
      SelectionMode   =   1
      Appearance      =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Calibri"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Filter:"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   4200
      TabIndex        =   5
      Top             =   1200
      Width           =   1935
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Filter By:"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   360
      TabIndex        =   3
      Top             =   1200
      Width           =   1935
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Double click name to show menu"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   360
      TabIndex        =   1
      Top             =   1680
      Width           =   10935
   End
End
Attribute VB_Name = "Form9"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
    


Private Sub cmdfill_Click()
Set rs = Nothing
'Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN room as c ON b.room_id = c.room_id LEFT JOIN department as d ON d.dept_id = c.dept_id LEFT OUTER JOIN users as e ON e.user_id = c.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = c.room_technician_id order by a.comp_id desc ")
Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN ( select room_name, concat_ws('',dept_name,'') as dept_name,room_id,room_custodian_id,room_technician_id, building, dept_id, floor  from (select r.room_custodian_id, r.room_technician_id,r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name', r.dept_id from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = b.room_id LEFT OUTER JOIN users as e ON e.user_id = rooms.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = rooms.room_technician_id order by b.pc_no asc ")
Call fillfgrid
End Sub

Private Sub Combo1_Click()
If Combo1.ListIndex = 0 Then
    Combo2.Clear
    Combo3.Clear
    Combo2.AddItem "Working"
    Combo2.AddItem "Defective"
    Combo2.AddItem "Missing"
    Combo2.AddItem "No Status"
ElseIf Combo1.ListIndex = 1 Then
    Combo2.Clear
    Combo3.Clear
    Set rs2 = Nothing
    'modified
    Call set_rec_getData2(rs2, cn, "SELECT * from  ( select room_name, room_id from (select r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name' from room r left join department on department.dept_id = r.dept_id) as rooms) as rooms")
    If Not rs2.RecordCount = 0 Then
    rs2.MoveFirst
    While Not rs2.EOF
    Combo2.AddItem rs2.Fields("room_name")
    Combo3.AddItem rs2.Fields("room_id")
    rs2.MoveNext
    Wend
    End If
ElseIf Combo1.ListIndex = 2 Then
    Combo2.Clear
    Combo3.Clear
    Set rs2 = Nothing
    Call set_rec_getData2(rs2, cn, "SELECT * from department")
    If Not rs2.RecordCount = 0 Then
    rs2.MoveFirst
    While Not rs2.EOF
    Combo2.AddItem rs2.Fields("dept_name")
    Combo3.AddItem rs2.Fields("dept_id")
    rs2.MoveNext
    Wend
    End If
End If
End Sub

Private Sub Combo2_Click()
If Combo1.Text = "" Then
    Combo2.Clear
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN ( select room_name, concat_ws('',dept_name,'') as dept_name,room_id,room_custodian_id,room_technician_id, building, dept_id, floor  from (select r.room_custodian_id, r.room_technician_id,r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name', r.dept_id from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = b.room_id LEFT OUTER JOIN users as e ON e.user_id = rooms.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = rooms.room_technician_id order by b.pc_no asc ")
    Call fillfgrid
Else
    If Not Combo1.ListIndex = 0 Then
        Combo3.ListIndex = Combo2.ListIndex
        If Combo1.ListIndex = 1 Then 'status
             Set rs = Nothing
             'modified
            Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN ( select room_name, concat_ws('',dept_name,'') as dept_name,room_id,room_custodian_id,room_technician_id, building, dept_id, floor  from (select r.room_custodian_id, r.room_technician_id,r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name', r.dept_id from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = b.room_id LEFT OUTER JOIN users as e ON e.user_id = rooms.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = rooms.room_technician_id  where rooms.room_id ='" & Combo3.Text & "' order by b.pc_no asc")
            If Not rs.RecordCount = 0 Then
                Command3.Enabled = True
            Else
                Command3.Enabled = False
            End If
            fillfgrid
        ElseIf Combo1.ListIndex = 2 Then 'room
             Set rs = Nothing
             'modified
            Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN ( select room_name, concat_ws('',dept_name,'') as dept_name,room_id,room_custodian_id,room_technician_id, building, dept_id, floor  from (select r.room_custodian_id, r.room_technician_id,r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name', r.dept_id from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = b.room_id LEFT OUTER JOIN users as e ON e.user_id = rooms.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = rooms.room_technician_id where rooms.dept_id='" & Combo3.Text & "' order by b.pc_no asc")
            fillfgrid
            If Not rs.RecordCount = 0 Then
                Command3.Enabled = True
            Else
                Command3.Enabled = False
            End If
        End If
    Else
        If Combo2.Text = "No Status" Then
            Set rs = Nothing
            'modified
            Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN ( select room_name, concat_ws('',dept_name,'') as dept_name,room_id,room_custodian_id,room_technician_id, building, dept_id, floor  from (select r.room_custodian_id, r.room_technician_id,r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name', r.dept_id from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = b.room_id LEFT OUTER JOIN users as e ON e.user_id = rooms.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = rooms.room_technician_id where comp_status is NULL order by b.pc_no asc")
        Else
            If Combo2.ListIndex = 0 Then
                Set rs = Nothing
                'modified
                Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN ( select room_name, concat_ws('',dept_name,'') as dept_name,room_id,room_custodian_id,room_technician_id, building, dept_id, floor  from (select r.room_custodian_id, r.room_technician_id,r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name', r.dept_id from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = b.room_id LEFT OUTER JOIN users as e ON e.user_id = rooms.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = rooms.room_technician_id where comp_status = 'Working'")
            ElseIf Combo2.ListIndex = 1 Then
                Set rs = Nothing
                'modified
                Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN ( select room_name, concat_ws('',dept_name,'') as dept_name,room_id,room_custodian_id,room_technician_id, building, dept_id, floor  from (select r.room_custodian_id, r.room_technician_id,r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name', r.dept_id from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = b.room_id LEFT OUTER JOIN users as e ON e.user_id = rooms.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = rooms.room_technician_id where comp_status = 'Defective'")
             ElseIf Combo2.ListIndex = 1 Then
                Set rs = Nothing
                Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id ( select room_name, concat_ws('',dept_name,'') as dept_name,room_id,room_custodian_id,room_technician_id, building, dept_id, floor  from (select r.room_custodian_id, r.room_technician_id,r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name', r.dept_id from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = b.room_id LEFT OUTER JOIN users as e ON e.user_id = rooms.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = rooms.room_technician_id where comp_status = 'Missing'")
            End If
        End If
        fillfgrid
        If Not rs.RecordCount = 0 Then
                Command3.Enabled = True
            Else
                Command3.Enabled = False
            End If
    End If

End If
End Sub



Private Sub Command1_Click()
form_type = "create"
'Form11.Show vbModal
Form21.Show vbModal
End Sub

Private Sub Command2_Click()
Unload Me
Form5.Show
End Sub

Private Sub Command3_Click()

If Combo1.Text = "" Then
    Beep
Exit Sub
End If
If Not rs.RecordCount = 0 Then
    rs.MoveFirst
    If Combo1.ListIndex = 1 Then 'room
        Set rs2 = Nothing 'working
        Call set_rec_getData2(rs2, cn, "SELECT COUNT(*) as 'working' from comp_details where room_id = '" & Combo3.Text & "' and comp_status = 'Working'")
        Set rs3 = Nothing 'defective
        Call set_rec_getData3(rs3, cn, "SELECT COUNT(*) as 'defective' from comp_details where room_id = '" & Combo3.Text & "' and comp_status = 'Defective'")
        Set rs4 = Nothing 'missibg
        Call set_rec_getData4(rs4, cn, "SELECT COUNT(*) as 'missing' from comp_details where room_id = '" & Combo3.Text & "' and comp_status = 'Missing'")
        
        Set DataReport5.DataSource = rs
           With DataReport5
           'header
                    With .Sections("Section4").Controls
                        .Item("label4").Caption = "Room: " & rs.Fields("room_name")
                    End With
            'cust and tech
                    With .Sections("Section2").Controls
                     .Item("label8").Caption = "Total No. of Row: " & rs.RecordCount
                    .Item("label6").Caption = rs.Fields("custodian")
                    .Item("label7").Caption = rs.Fields("technician")
                    End With
            'gen details
                    With .Sections("Section3").Controls
                        .Item("genBy").Caption = "Generated By: " & current_user_name & ", " & Date & " " & Time
                    End With
            'pc counts
                    With .Sections("Section5").Controls
                        .Item("working").Caption = rs2.Fields("working")
                        .Item("defective").Caption = rs3.Fields("defective")
                        .Item("missing").Caption = rs4.Fields("missing")
                    End With
                End With
        DataReport5.Show vbModal
    
    
    Else 'department status
        'if no status
        If Combo2.Text = "No Status" Then
            Set rs = Nothing
            Call set_rec_getData(rs, cn, "SELECT *,'No Status' as comp_status, a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN ( select room_name, concat_ws('',dept_name,'') as dept_name,room_id,room_custodian_id,room_technician_id, building, dept_id, floor  from (select r.room_custodian_id, r.room_technician_id,r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name', r.dept_id from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = b.room_id LEFT OUTER JOIN users as e ON e.user_id = rooms.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = rooms.room_technician_id where comp_status is NULL order by b.pc_no asc")
        End If
        Set DataReport3.DataSource = rs
        With DataReport3
           'header
                    With .Sections("Section4").Controls
                        If Combo1.ListIndex = 0 Then 'status
                            .Item("label4").Caption = "By Computer Status: " & Combo2.Text
                        Else ' department
                            .Item("label4").Caption = "By Department: " & Combo2.Text
                        End If
                    End With
            'cust and tech
                    With .Sections("Section2").Controls
                     .Item("label8").Caption = "Total No. of Row: " & rs.RecordCount
                    .Item("label6").Caption = ""
                    .Item("label7").Caption = ""
                    End With
            'gen details
                    With .Sections("Section3").Controls
                        .Item("genBy").Caption = "Generated By: " & current_user_name & ", " & Date & " " & Time
                    End With
                End With
        DataReport3.Show vbModal
    
    End If
    
Else
    Beep
End If
End Sub



Private Sub Command4_Click()
If MsgBox("Are you sure you want to delete computer ?", vbYesNo) = vbYes Then
    Set rs2 = Nothing
    Call set_rec_getData2(rs2, cn, "delete FROM computers where comp_id = '" & selected_id & "'")
    Set rs = Nothing
    Call set_rec_getData2(rs2, cn, "delete FROM comp_details where comp_id = '" & selected_id & "'")
    MsgBox "Computer Deleted!", vbInformation
    Set rs = Nothing
    'Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN room as c ON b.room_id = c.room_id LEFT JOIN department as d ON d.dept_id = c.dept_id LEFT OUTER JOIN users as e ON e.user_id = c.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = c.room_technician_id order by a.comp_id desc ")
    Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN ( select room_name, concat_ws('',dept_name,'') as dept_name,room_id,room_custodian_id,room_technician_id, building, dept_id, floor  from (select r.room_custodian_id, r.room_technician_id,r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name', r.dept_id from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = b.room_id LEFT OUTER JOIN users as e ON e.user_id = rooms.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = rooms.room_technician_id order by b.pc_no asc ")
    Call fillfgrid
End If
End Sub

Private Sub fgrid1_Click()
selected_id = fgrid1.TextMatrix(fgrid1.Row, 14)
command4.Enabled = True
End Sub


Private Sub fgrid1_DblClick()
selected_id = fgrid1.TextMatrix(fgrid1.Row, 14)
If fgrid1.TextMatrix(fgrid1.Row, 10) = "Not assigned" Then
    comp_status = "Not assigned"
    Form10.Show vbModal
Else
    comp_status = "Assigned"
    Form10.Show vbModal
End If
End Sub



Private Sub Form_Load()
Set rs = Nothing
Set cn = Nothing
Call ConnectMySQL
'modified
Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN ( select room_name, concat_ws('',dept_name,'') as dept_name,room_id,room_custodian_id,room_technician_id, building, dept_id, floor  from (select r.room_custodian_id, r.room_technician_id,r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name', r.dept_id from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = b.room_id LEFT OUTER JOIN users as e ON e.user_id = rooms.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = rooms.room_technician_id order by b.pc_no asc ")
Call fillfgrid
End Sub
Public Sub fillfgrid()
fgrid1.Clear
fgrid1.FormatString = "Department         " & vbTab & _
"Model           " & vbTab & _
"CPU Serial            " & vbTab & _
"Processor            " & vbTab & _
"Motherboard            " & vbTab & _
"Monitor                             " & vbTab & _
"Ram            " & vbTab & _
"kboard           " & vbTab & _
"Mouse              " & vbTab & _
"VGA                    " & vbTab & _
"HDD             " & vbTab & _
"Operating System       " & vbTab & _
"Assigned to                        " & vbTab & _
"Status                 " & vbTab & _
"ID"
fgrid1.Rows = 1
If Not rs.RecordCount = 0 Then
    rs.MoveFirst
    Dim assto As String
   Dim depttp As String
    While Not rs.EOF
    'MsgBox rs.Fields("loan_status")
    If IsNull(rs.Fields("room_id")) = True Then
    assto = "Not assigned"
    Else
     assto = "Flr#" & rs.Fields("floor") & "-" & rs.Fields("building") & "-" & rs.Fields("room_name")
    End If
    If IsNull(rs.Fields("room_id")) = True Then
    deptto = "Not assigned"
    Else
     deptto = rs.Fields("dept_name")
    End If
       fgrid1.AddItem deptto & vbTab & rs.Fields("model") & vbTab & rs.Fields("comp_serial") & vbTab & rs.Fields("processor") & vbTab & rs.Fields("motherboard") & vbTab & rs.Fields("monitor") & vbTab & rs.Fields("ram") & vbTab & rs.Fields("kboard") & vbTab & rs.Fields("mouse") & vbTab & rs.Fields("vga") & vbTab & rs.Fields("hdd") & vbTab & rs.Fields("os") & vbTab & assto & vbTab & rs.Fields("comp_status") & vbTab & rs.Fields("c_id")
       
        rs.MoveNext
    Wend
End If
fgrid1.ColWidth(14) = 0

End Sub

Private Sub Text1_Change()
Set rs = Nothing
Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN ( select room_name, concat_ws('',dept_name,'') as dept_name,room_id,room_custodian_id,room_technician_id, building, dept_id, floor  from (select r.room_custodian_id, r.room_technician_id,r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name', r.dept_id from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = b.room_id LEFT OUTER JOIN users as e ON e.user_id = rooms.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = rooms.room_technician_id where `os` like '%" & Text1.Text & "%' or `model` like '%" & Text1.Text & "%' or `processor` like '%" & Text1.Text & "%' or `motherboard` like '%" & Text1.Text & "%' order by b.pc_no asc ")

fillfgrid
End Sub
