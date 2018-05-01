VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form Form18 
   BorderStyle     =   0  'None
   Caption         =   "Assesment Report"
   ClientHeight    =   10470
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   15165
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
   Picture         =   "Form18.frx":0000
   ScaleHeight     =   10470
   ScaleWidth      =   15165
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSFlexGridLib.MSFlexGrid fgrid2 
      Height          =   7905
      Left            =   240
      TabIndex        =   12
      Top             =   1680
      Visible         =   0   'False
      Width           =   14655
      _ExtentX        =   25850
      _ExtentY        =   13944
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
   Begin VB.CommandButton Command1 
      Caption         =   "Generate Report Base on Result"
      Enabled         =   0   'False
      Height          =   495
      Left            =   240
      TabIndex        =   11
      Top             =   9720
      Width           =   3135
   End
   Begin VB.ComboBox Combo4 
      Height          =   345
      ItemData        =   "Form18.frx":4D0BE
      Left            =   11640
      List            =   "Form18.frx":4D0C0
      TabIndex        =   10
      Top             =   960
      Visible         =   0   'False
      Width           =   2655
   End
   Begin VB.ComboBox Combo3 
      Height          =   345
      ItemData        =   "Form18.frx":4D0C2
      Left            =   8880
      List            =   "Form18.frx":4D0C4
      TabIndex        =   8
      Top             =   960
      Width           =   2655
   End
   Begin VB.ComboBox Combo2 
      Height          =   345
      ItemData        =   "Form18.frx":4D0C6
      Left            =   5400
      List            =   "Form18.frx":4D0C8
      TabIndex        =   6
      Top             =   960
      Width           =   2655
   End
   Begin VB.ComboBox Combo1 
      Height          =   345
      ItemData        =   "Form18.frx":4D0CA
      Left            =   1680
      List            =   "Form18.frx":4D0D4
      TabIndex        =   5
      Top             =   960
      Width           =   2655
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Back to Main Menu"
      Height          =   495
      Left            =   12480
      TabIndex        =   4
      Top             =   9720
      Width           =   2175
   End
   Begin VB.CommandButton cmdfill 
      Caption         =   "Fill Grid"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   13320
      TabIndex        =   0
      Top             =   1320
      Visible         =   0   'False
      Width           =   975
   End
   Begin MSFlexGridLib.MSFlexGrid fgrid1 
      Height          =   7905
      Left            =   240
      TabIndex        =   1
      Top             =   1680
      Width           =   14415
      _ExtentX        =   25426
      _ExtentY        =   13944
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
   Begin VB.Label Label4 
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
      Left            =   8160
      TabIndex        =   9
      Top             =   1080
      Width           =   1695
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
      Left            =   4440
      TabIndex        =   7
      Top             =   1080
      Width           =   1695
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Report Type:"
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
      Left            =   240
      TabIndex        =   3
      Top             =   1080
      Width           =   1695
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
      Left            =   240
      TabIndex        =   2
      Top             =   1320
      Width           =   10935
   End
End
Attribute VB_Name = "Form18"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdfill_Click()
Set rs = Nothing
Call set_rec_getData(rs, cn, "SELECT *, c.name as custodian, d.name as technician FROM assessment_reports as a LEFT JOIN assessment_details as b ON a.rep_id = b.rep_id LEFT JOIN users as c ON a.custodian_id = c.user_id LEFT OUTER JOIN users as d ON a.technician_id = d.user_id LEFT OUTER JOIN room as e ON e.room_id = a.room_id")
Call fillfgrid
End Sub

Private Sub Combo1_Click()
Combo2.Clear
Combo3.Clear
Combo4.Clear
Command1.Enabled = False
If Combo1.ListIndex = 0 Then
Set rs = Nothing
Call set_rec_getData(rs, cn, "SELECT *, c.name as custodian, d.name as technician FROM assessment_reports as a LEFT JOIN assessment_details as b ON a.rep_id = b.rep_id LEFT JOIN users as c ON a.custodian_id = c.user_id LEFT OUTER JOIN users as d ON a.technician_id = d.user_id LEFT OUTER JOIN room as e ON e.room_id = a.room_id")
fillfgrid
Combo2.Clear
Combo2.AddItem "Custodian"
Combo2.AddItem "Technician"
Combo2.AddItem "Date"
Combo2.AddItem "Room"
Combo2.AddItem "Report Type"


ElseIf Combo1.ListIndex = 1 Then
Set rs = Nothing
Call set_rec_getData(rs, cn, "SELECT *,c.name as req,d.name as tech FROM request_peripherals as a LEFT JOIN users as c ON a.requisitioner  = c.user_id LEFT OUTER JOIN users as d ON a.tech_id = d.user_id LEFT OUTER JOIN department as e ON e.dept_id = a.dept_id ")
fillfgrid2
Combo2.Clear
Combo2.AddItem "Custodian"
Combo2.AddItem "Status"
Combo2.AddItem "Date"
'Combo2.AddItem "Room"
ElseIf Combo1.ListIndex = 2 Then
Set rs = Nothing
Call set_rec_getData(rs, cn, "SELECT *, c.name as custodian, d.name as technician FROM assessment_reports as a LEFT JOIN assessment_details as b ON a.rep_id = b.rep_id LEFT JOIN users as c ON a.custodian_id = c.user_id LEFT OUTER JOIN users as d ON a.technician_id = d.user_id LEFT OUTER JOIN room as e ON e.room_id = a.room_id")
'fillfgrid3
End If
End Sub

Private Sub Combo1_KeyPress(KeyAscii As Integer)
KeyAscii = 0
End Sub

Private Sub Command1_Click()
If Not rs.RecordCount = 0 Then
rs.MoveFirst
Set DataReport3.DataSource = rs
   With DataReport3
            With .Sections("Section2").Controls
                .Item("label11").Caption = rs.Fields("date")
                 .Item("label12").Caption = rs.Fields("technician")
               .Item("label8").Caption = rs.Fields("custodian")
              .Item("label7").Caption = rs.Fields("room_name")
           End With
        End With
DataReport3.Show vbModal
Else
Beep
End If
End Sub

Private Sub Combo2_Click()
Set rs2 = Nothing
If Combo1.ListIndex = 0 Then
    If Combo2.ListIndex = 0 Then
        Call set_rec_getData2(rs2, cn, "SELECT * from users where role = 'Custodian'")
        If Not rs2.RecordCount = 0 Then
            Combo3.Clear
            Combo4.Clear
            rs2.MoveFirst
            While Not rs2.EOF
            Combo3.AddItem rs2.Fields("name")
            Combo4.AddItem rs2.Fields("user_id")
            rs2.MoveNext
            Wend
        End If
    ElseIf Combo2.ListIndex = 1 Then
        Call set_rec_getData2(rs2, cn, "SELECT * from users where role = 'Technician'")
        If Not rs2.RecordCount = 0 Then
            Combo3.Clear
            Combo4.Clear
            rs2.MoveFirst
            While Not rs2.EOF
            Combo3.AddItem rs2.Fields("name")
            Combo4.AddItem rs2.Fields("user_id")
            rs2.MoveNext
            Wend
        End If
    ElseIf Combo2.ListIndex = 2 Then
        Call set_rec_getData2(rs2, cn, "SELECT *, c.name as custodian, d.name as technician FROM assessment_reports as a LEFT JOIN assessment_details as b ON a.rep_id = b.rep_id LEFT JOIN users as c ON a.custodian_id = c.user_id LEFT OUTER JOIN users as d ON a.technician_id = d.user_id LEFT OUTER JOIN room as e ON e.room_id = a.room_id")
        If Not rs2.RecordCount = 0 Then
            Combo3.Clear
            rs2.MoveFirst
            While Not rs2.EOF
            Combo3.AddItem Format(rs2.Fields("date"), "YYYY-MM-DD")
            rs2.MoveNext
            Wend
        End If
    ElseIf Combo2.ListIndex = 3 Then
        Call set_rec_getData2(rs2, cn, "SELECT * from room")
        If Not rs2.RecordCount = 0 Then
            Combo3.Clear
            Combo4.Clear
            rs2.MoveFirst
            While Not rs2.EOF
            Combo3.AddItem rs2.Fields("room_name")
            Combo4.AddItem rs2.Fields("room_id")
            rs2.MoveNext
            Wend
        End If
    ElseIf Combo2.ListIndex = 4 Then
       Combo3.Clear
       Combo4.Clear
       Combo3.AddItem "Inventory Report"
       Combo3.AddItem "Repair Report"
    End If
ElseIf Combo1.ListIndex = 1 Then
    If Combo2.ListIndex = 0 Then
        Call set_rec_getData2(rs2, cn, "SELECT * from users where role = 'Custodian'")
        If Not rs2.RecordCount = 0 Then
            Combo3.Clear
            Combo4.Clear
            rs2.MoveFirst
            While Not rs2.EOF
            Combo3.AddItem rs2.Fields("name")
            Combo4.AddItem rs2.Fields("user_id")
            rs2.MoveNext
            Wend
        End If
    ElseIf Combo2.ListIndex = 1 Then
        Combo3.Clear
        Combo3.AddItem "Received"
        Combo3.AddItem "Issued"
        Combo3.AddItem "Cancelled"
    ElseIf Combo2.ListIndex = 2 Then
        Call set_rec_getData2(rs2, cn, "SELECT *,c.name as req,d.name as tech FROM request_peripherals as a LEFT JOIN users as c ON a.requisitioner  = c.user_id LEFT OUTER JOIN users as d ON a.tech_id = d.user_id LEFT OUTER JOIN department as e ON e.dept_id = a.dept_id ")
        If Not rs2.RecordCount = 0 Then
            Combo3.Clear
            rs2.MoveFirst
            While Not rs2.EOF
            Combo3.AddItem Format(rs2.Fields("date_requested"), "YYYY-MM-DD")
            rs2.MoveNext
            Wend
        End If
    ElseIf Combo2.ListIndex = 3 Then
        Call set_rec_getData2(rs2, cn, "SELECT * from room")
        If Not rs2.RecordCount = 0 Then
            Combo3.Clear
            Combo4.Clear
            rs2.MoveFirst
            While Not rs2.EOF
            Combo3.AddItem rs2.Fields("room_name")
            Combo4.AddItem rs2.Fields("room_id")
            rs2.MoveNext
            Wend
        End If
    End If
End If
End Sub

Private Sub Combo2_KeyPress(KeyAscii As Integer)
KeyAscii = 0
End Sub

Private Sub Combo3_Click()

Set rs = Nothing
If Combo1.ListIndex = 0 Then
If Combo2.ListIndex = 0 Then
Combo4.ListIndex = Combo3.ListIndex
    Call set_rec_getData(rs, cn, "SELECT *, c.name as custodian, d.name as technician FROM assessment_reports as a LEFT JOIN assessment_details as b ON a.rep_id = b.rep_id LEFT JOIN users as c ON a.custodian_id = c.user_id LEFT OUTER JOIN users as d ON a.technician_id = d.user_id LEFT OUTER JOIN room as e ON e.room_id = a.room_id where custodian_id = '" & Combo4.Text & "'")
    Command1.Enabled = True
    Call fillfgrid
ElseIf Combo2.ListIndex = 1 Then
Combo4.ListIndex = Combo3.ListIndex
    Call set_rec_getData(rs, cn, "SELECT *, c.name as custodian, d.name as technician FROM assessment_reports as a LEFT JOIN assessment_details as b ON a.rep_id = b.rep_id LEFT JOIN users as c ON a.custodian_id = c.user_id LEFT OUTER JOIN users as d ON a.technician_id = d.user_id LEFT OUTER JOIN room as e ON e.room_id = a.room_id where technician_id = '" & Combo4.Text & "'")
    Command1.Enabled = True
    Call fillfgrid
ElseIf Combo2.ListIndex = 2 Then
    Call set_rec_getData(rs, cn, "SELECT *, c.name as custodian, d.name as technician FROM assessment_reports as a LEFT JOIN assessment_details as b ON a.rep_id = b.rep_id LEFT JOIN users as c ON a.custodian_id = c.user_id LEFT OUTER JOIN users as d ON a.technician_id = d.user_id LEFT OUTER JOIN room as e ON e.room_id = a.room_id where `date` = '" & Combo3.Text & "'")
    Command1.Enabled = True
    Call fillfgrid
ElseIf Combo2.ListIndex = 3 Then
Combo4.ListIndex = Combo3.ListIndex
    Call set_rec_getData(rs, cn, "SELECT *, c.name as custodian, d.name as technician FROM assessment_reports as a LEFT JOIN assessment_details as b ON a.rep_id = b.rep_id LEFT JOIN users as c ON a.custodian_id = c.user_id LEFT OUTER JOIN users as d ON a.technician_id = d.user_id LEFT OUTER JOIN room as e ON e.room_id = a.room_id where e.room_id = '" & Combo4.Text & "'")
    Command1.Enabled = True
    Call fillfgrid
ElseIf Combo2.ListIndex = 4 Then

    Call set_rec_getData(rs, cn, "SELECT *, c.name as custodian, d.name as technician FROM assessment_reports as a LEFT JOIN assessment_details as b ON a.rep_id = b.rep_id LEFT JOIN users as c ON a.custodian_id = c.user_id LEFT OUTER JOIN users as d ON a.technician_id = d.user_id LEFT OUTER JOIN room as e ON e.room_id = a.room_id where category = '" & Combo3.Text & "'")
    Command1.Enabled = True
    Call fillfgrid
End If
ElseIf Combo1.ListIndex = 1 Then
If Combo2.ListIndex = 0 Then
Combo4.ListIndex = Combo3.ListIndex
    Call set_rec_getData(rs, cn, "SELECT *,c.name as req,d.name as tech FROM request_peripherals as a LEFT JOIN users as c ON a.requisitioner  = c.user_id LEFT OUTER JOIN users as d ON a.tech_id = d.user_id LEFT OUTER JOIN department as e ON e.dept_id = a.dept_id  where requisitioner = '" & Combo4.Text & "'")
    Command1.Enabled = True
    Call fillfgrid2
ElseIf Combo2.ListIndex = 1 Then
Combo4.ListIndex = Combo3.ListIndex
    Call set_rec_getData(rs, cn, "SELECT *,c.name as req,d.name as tech FROM request_peripherals as a LEFT JOIN users as c ON a.requisitioner  = c.user_id LEFT OUTER JOIN users as d ON a.tech_id = d.user_id LEFT OUTER JOIN department as e ON e.dept_id = a.dept_id  where req_status = '" & Combo3.Text & "'")
    Command1.Enabled = True
    Call fillfgrid2
ElseIf Combo2.ListIndex = 2 Then
    Call set_rec_getData(rs, cn, "SELECT *,c.name as req,d.name as tech FROM request_peripherals as a LEFT JOIN users as c ON a.requisitioner  = c.user_id LEFT OUTER JOIN users as d ON a.tech_id = d.user_id LEFT OUTER JOIN department as e ON e.dept_id = a.dept_id  where `date_requested` = '" & Combo3.Text & "'")
    Command1.Enabled = True
    Call fillfgrid2
ElseIf Combo2.ListIndex = 3 Then
Combo4.ListIndex = Combo3.ListIndex
    Call set_rec_getData(rs, cn, "SELECT *, c.name as custodian, d.name as technician FROM assessment_reports as a LEFT JOIN assessment_details as b ON a.rep_id = b.rep_id LEFT JOIN users as c ON a.custodian_id = c.user_id LEFT OUTER JOIN users as d ON a.technician_id = d.user_id LEFT OUTER JOIN room as e ON e.room_id = a.room_id where e.room_id = '" & Combo4.Text & "'")
    Command1.Enabled = True
    Call fillfgrid2
End If
End If
End Sub

Private Sub Combo3_KeyPress(KeyAscii As Integer)
KeyAscii = 0
End Sub

Private Sub Command2_Click()
Unload Me
Form5.Show
End Sub

Private Sub fgrid1_DblClick()
If fgrid1.Cols = 2 Then
Beep
Else
selected_id = fgrid1.TextMatrix(fgrid1.Row, 5)
report_type = "Assesment"
Form19.Show vbModal
End If
End Sub

Private Sub fgrid2_DblClick()
If fgrid2.Cols = 2 Then
Beep
Else
selected_id = fgrid2.TextMatrix(fgrid2.Row, 6)
report_type = "Request"
Form19.Show vbModal
End If
End Sub

Private Sub Form_Load()
Set rs = Nothing
Set cn = Nothing
Call ConnectMySQL


End Sub
Public Sub fillfgrid()
fgrid2.Visible = False
fgrid1.Visible = True
fgrid1.Clear
fgrid1.FormatString = "Room Name                              " & vbTab & _
"Technician                                     " & vbTab & _
"Custodian                                      " & vbTab & _
"Date                                           " & vbTab & _
"Remarks                                                                              " & vbTab & _
"ID"
fgrid1.Rows = 1
If Not rs.RecordCount = 0 Then
    rs.MoveFirst
    Dim assto As String
   
    While Not rs.EOF
    'MsgBox rs.Fields("loan_status")
    
       fgrid1.AddItem rs.Fields("room_name") & vbTab & rs.Fields("technician") & vbTab & rs.Fields("custodian") & vbTab & rs.Fields("date") & vbTab & rs.Fields("remarks") & vbTab & rs.Fields("rep_id")
       
        rs.MoveNext
    Wend
End If

End Sub
Public Sub fillfgrid2()
fgrid2.Visible = True
fgrid1.Visible = False
fgrid2.Clear

fgrid2.FormatString = ""
fgrid2.FormatString = "Requisitioner                                                          " & vbTab & _
"Department                                  " & vbTab & _
"Request Status                     " & vbTab & _
"Purpose                   " & vbTab & _
"Date Requested                " & vbTab & _
"Date Approved                 " & vbTab & _
"ID"
fgrid2.Refresh
fgrid2.Rows = 1
If Not rs.RecordCount = 0 Then
    rs.MoveFirst
    Dim assto As String
   
    While Not rs.EOF
    'MsgBox rs.Fields("loan_status")
    
       fgrid2.AddItem rs.Fields("req") & vbTab & rs.Fields("dept_name") & vbTab & rs.Fields("req_status") & vbTab & rs.Fields("purpose") & vbTab & rs.Fields("date_requested") & vbTab & rs.Fields("date_approved") & vbTab & rs.Fields("req_id")
       
        rs.MoveNext
    Wend
End If

End Sub
Private Sub Text1_Change()
Set rs = Nothing
Call set_rec_getData(rs, cn, "SELECT *,a.room_id as r_id FROM room as a LEFT JOIN comp_details as b ON a.room_id = b.room_id LEFT JOIN department as c ON a.dept_id = c.dept_id LEFT JOIN users as d ON a.room_custodian_id = d.user_id   where `name` like '%" & Text1.Text & "%' or `building` like '%" & Text1.Text & "%' or `room_name` like '%" & Text1.Text & "%' order by a.room_id desc")

fillfgrid
End Sub
