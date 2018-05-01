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
   Begin VB.CommandButton cmdfill 
      Caption         =   "Command4"
      Height          =   495
      Left            =   15720
      TabIndex        =   10
      Top             =   1320
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Generate Report Base on Result"
      Enabled         =   0   'False
      Height          =   495
      Left            =   360
      TabIndex        =   9
      Top             =   9720
      Width           =   3135
   End
   Begin VB.ComboBox Combo3 
      Height          =   345
      ItemData        =   "Form9.frx":261CB
      Left            =   5040
      List            =   "Form9.frx":261CD
      TabIndex        =   8
      Top             =   1560
      Width           =   2535
   End
   Begin VB.ComboBox Combo2 
      Height          =   345
      ItemData        =   "Form9.frx":261CF
      Left            =   5040
      List            =   "Form9.frx":261D1
      TabIndex        =   7
      Top             =   1080
      Width           =   2535
   End
   Begin VB.ComboBox Combo1 
      Height          =   345
      ItemData        =   "Form9.frx":261D3
      Left            =   1440
      List            =   "Form9.frx":261E0
      TabIndex        =   5
      Top             =   1080
      Width           =   2535
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Back to Main Menu"
      Height          =   495
      Left            =   17400
      TabIndex        =   3
      Top             =   9720
      Width           =   2175
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Add New Computer"
      Height          =   495
      Left            =   17280
      TabIndex        =   2
      Top             =   1320
      Width           =   2175
   End
   Begin MSFlexGridLib.MSFlexGrid fgrid1 
      Height          =   7545
      Left            =   360
      TabIndex        =   0
      Top             =   2040
      Width           =   19215
      _ExtentX        =   33893
      _ExtentY        =   13309
      _Version        =   393216
      FixedCols       =   0
      BackColor       =   16777215
      BackColorSel    =   12648447
      BackColorBkg    =   12632256
      TextStyleFixed  =   2
      FocusRect       =   2
      HighLight       =   2
      GridLinesFixed  =   1
      ScrollBars      =   2
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
      TabIndex        =   6
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
      TabIndex        =   4
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
Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN room as c ON b.room_id = c.room_id LEFT JOIN department as d ON d.dept_id = c.dept_id LEFT OUTER JOIN users as e ON e.user_id = c.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = c.room_technician_id order by a.comp_id desc ")
Call fillfgrid
End Sub

Private Sub Combo1_Click()
If Combo1.ListIndex = 0 Then
Combo2.Clear
Combo3.Clear
Combo2.AddItem "Working"
Combo2.AddItem "Not Working"
Combo2.AddItem "Missing"
Combo2.AddItem "No Status"
ElseIf Combo1.ListIndex = 1 Then
    Combo2.Clear
    Combo3.Clear
    Set rs2 = Nothing
    Call set_rec_getData2(rs2, cn, "SELECT * from room")
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
If Not Combo1.ListIndex = 0 Then
Combo3.ListIndex = Combo2.ListIndex
If Combo1.ListIndex = 1 Then
     Set rs = Nothing
    Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN room as c ON b.room_id = c.room_id LEFT JOIN department as d ON d.dept_id = c.dept_id LEFT OUTER JOIN users as e ON e.user_id = c.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = c.room_technician_id  where c.room_id ='" & Combo3.Text & "'")
    fillfgrid
    Command3.Enabled = True
ElseIf Combo1.ListIndex = 2 Then
     Set rs = Nothing
    Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN room as c ON b.room_id = c.room_id LEFT JOIN department as d ON d.dept_id = c.dept_id LEFT OUTER JOIN users as e ON e.user_id = c.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = c.room_technician_id where d.dept_id='" & Combo3.Text & "'")
    fillfgrid
    Command3.Enabled = True
End If
Else
    If Combo2.Text = "No Status" Then
        Set rs = Nothing
        Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN room as c ON b.room_id = c.room_id LEFT JOIN department as d ON d.dept_id = c.dept_id LEFT OUTER JOIN users as e ON e.user_id = c.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = c.room_technician_id where comp_status is NULL")
    Else
        If Combo2.ListIndex = 0 Then
            Set rs = Nothing
            Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN room as c ON b.room_id = c.room_id LEFT JOIN department as d ON d.dept_id = c.dept_id LEFT OUTER JOIN users as e ON e.user_id = c.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = c.room_technician_id where comp_status = 'Working'")
        ElseIf Combo2.ListIndex = 1 Then
            Set rs = Nothing
            Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN room as c ON b.room_id = c.room_id LEFT JOIN department as d ON d.dept_id = c.dept_id LEFT OUTER JOIN users as e ON e.user_id = c.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = c.room_technician_id where comp_status = 'Not Working'")
         ElseIf Combo2.ListIndex = 1 Then
            Set rs = Nothing
            Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN room as c ON b.room_id = c.room_id LEFT JOIN department as d ON d.dept_id = c.dept_id LEFT OUTER JOIN users as e ON e.user_id = c.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = c.room_technician_id where comp_status = 'Missing'")
        End If
    End If
    fillfgrid
    Command3.Enabled = True
End If
End Sub

Private Sub Command1_Click()
form_type = "create"
Form11.Show vbModal
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
Set DataReport5.DataSource = rs
   With DataReport5
            With .Sections("Section4").Controls
            If Combo1.ListIndex = 0 Then
                .Item("label3").Caption = "Computer Status Report"
                .Item("label4").Caption = rs.Fields("comp_status")
            ElseIf Combo1.ListIndex = 1 Then
                .Item("label3").Caption = "Room Inventory Report "
                .Item("label4").Caption = rs.Fields("room_name")
            ElseIf Combo1.ListIndex = 2 Then
                .Item("label3").Caption = "Department Inventory Report "
                .Item("label4").Caption = rs.Fields("dept_name")
            End If
                .Item("label22").Caption = "As of " & Format(Now, "short date")
            End With
            With .Sections("Section2").Controls
             .Item("label8").Caption = "Total No. of Row: " & rs.RecordCount
            .Item("label6").Caption = rs.Fields("custodian")
            .Item("label7").Caption = rs.Fields("technician")
            End With
        End With
DataReport5.Show vbModal
Else
Beep
End If
End Sub

Private Sub fgrid1_DblClick()
selected_id = fgrid1.TextMatrix(fgrid1.Row, 11)
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
Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN room as c ON b.room_id = c.room_id LEFT JOIN department as d ON d.dept_id = c.dept_id LEFT OUTER JOIN users as e ON e.user_id = c.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = c.room_technician_id order by a.comp_id desc ")
Call fillfgrid
End Sub
Public Sub fillfgrid()
fgrid1.Clear
fgrid1.FormatString = "Department         " & vbTab & _
"Model                              " & vbTab & _
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
"Status                       " & vbTab & _
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
    If IsNull(rs.Fields("dept_id")) = True Then
    deptto = "Not assigned"
    Else
     deptto = rs.Fields("dept_name")
    End If
       fgrid1.AddItem deptto & vbTab & rs.Fields("model") & vbTab & rs.Fields("processor") & vbTab & rs.Fields("motherboard") & vbTab & rs.Fields("monitor") & vbTab & rs.Fields("ram") & vbTab & rs.Fields("kboard") & vbTab & rs.Fields("mouse") & vbTab & rs.Fields("vga") & vbTab & rs.Fields("hdd") & vbTab & rs.Fields("os") & vbTab & assto & vbTab & rs.Fields("comp_status") & vbTab & rs.Fields("c_id")
       
        rs.MoveNext
    Wend
End If

End Sub

Private Sub Text1_Change()
Set rs = Nothing
Call set_rec_getData(rs, cn, "SELECT *,a.comp_id as c_id,e.name as custodian, f.name as technician FROM computers as a LEFT JOIN comp_details as b ON a.comp_id = b.comp_id LEFT JOIN room as c ON b.room_id = c.room_id LEFT JOIN department as d ON d.dept_id = c.dept_id LEFT OUTER JOIN users as e ON e.user_id = c.room_custodian_id LEFT OUTER JOIN users as f ON f.user_id = c.room_technician_id where `os` like '%" & Text1.Text & "%' or `model` like '%" & Text1.Text & "%' or `processor` like '%" & Text1.Text & "%' or `motherboard` like '%" & Text1.Text & "%' order by a.comp_id desc ")


fillfgrid
End Sub
