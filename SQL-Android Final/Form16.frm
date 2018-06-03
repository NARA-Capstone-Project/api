VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form Form16 
   BorderStyle     =   0  'None
   Caption         =   "Computers Available in"
   ClientHeight    =   10500
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   15120
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
   Picture         =   "Form16.frx":0000
   ScaleHeight     =   10500
   ScaleWidth      =   15120
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "Back Room Details"
      Height          =   495
      Left            =   12720
      TabIndex        =   4
      Top             =   9720
      Width           =   2175
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Assign New Computer"
      Height          =   735
      Left            =   12840
      TabIndex        =   3
      Top             =   1200
      Width           =   1815
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
      Left            =   12840
      TabIndex        =   0
      Top             =   2160
      Visible         =   0   'False
      Width           =   975
   End
   Begin MSFlexGridLib.MSFlexGrid fgrid1 
      Height          =   7905
      Left            =   360
      TabIndex        =   1
      Top             =   2280
      Width           =   12255
      _ExtentX        =   21616
      _ExtentY        =   13944
      _Version        =   393216
      FixedCols       =   0
      BackColor       =   16777215
      BackColorSel    =   16711680
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
      Caption         =   "Total Pc Count:"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   4920
      TabIndex        =   7
      Top             =   1440
      Width           =   3375
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Total Computers Working:"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   360
      TabIndex        =   6
      Top             =   1440
      Width           =   3375
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Room Name:"
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
      TabIndex        =   5
      Top             =   1080
      Width           =   12255
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Double click name to show menu"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   360
      TabIndex        =   2
      Top             =   2040
      Width           =   10935
   End
End
Attribute VB_Name = "Form16"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdfill_Click()
Set rs = Nothing
Call set_rec_getData(rs, cn, "SELECT * FROM comp_details as a LEFT JOIN computers as b ON a.comp_id = b.comp_id where a.room_id = '" & selected_id & "' and comp_status = 'Working'")
Label2.Caption = "Total Computers Working: " & rs.RecordCount & " Units"
Set rs = Nothing
Call set_rec_getData(rs, cn, "SELECT * FROM comp_details as a LEFT JOIN computers as b ON a.comp_id = b.comp_id where a.room_id = '" & selected_id & "' order by pc_no asc")
Label4.Caption = "Total Pc Count: " & rs.RecordCount & " Units"
Call fillfgrid
End Sub

Private Sub Command1_Click()
'form_type = "create"
form_type = "computer"
Form20.Show vbModal
End Sub

Private Sub Command2_Click()
Unload Me
Form15.Show
End Sub

Private Sub fgrid1_DblClick()
selected_comp_id = fgrid1.TextMatrix(fgrid1.Row, 3)
selected_status = fgrid1.TextMatrix(fgrid1.Row, 2)
Form17.Show vbModal
End Sub

Private Sub Form_Load()

Set cn = Nothing
Call ConnectMySQL
Set rs = Nothing
'modified
Call set_rec_getData(rs, cn, "SELECT * FROM ( select room_name, concat_ws('',dept_name,'') as dept_name,room_id from (select r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name' from room r left join department on department.dept_id = r.dept_id) as rooms) rooms where rooms.room_id = '" & selected_id & "'")
Me.Caption = Me.Caption & " " & rs.Fields("room_name")
Label1.Caption = "Room Name: " & rs.Fields("room_name")
Set rs = Nothing
'modified
Call set_rec_getData(rs, cn, "SELECT * FROM comp_details as a LEFT JOIN computers as b ON a.comp_id = b.comp_id where a.room_id = '" & selected_id & "' and comp_status = 'Working'")
Label2.Caption = "Total Computers Working: " & rs.RecordCount & " Units"
Set rs = Nothing
'modified
Call set_rec_getData(rs, cn, "SELECT * from computers left outer join comp_details on comp_details.comp_id = computers.comp_id where comp_details.room_id = '" & selected_id & "' order by pc_no asc")
Label4.Caption = "Total Pc Count: " & rs.RecordCount & " Units"
Call fillfgrid
End Sub

Public Sub fillfgrid()
fgrid1.Clear
fgrid1.FormatString = "PC No.         " & vbTab & _
"Specs                                                                                                                                                                                                      " & vbTab & _
"Status                          " & vbTab & _
"ID                   "
fgrid1.Rows = 1
If Not rs.RecordCount = 0 Then
    rs.MoveFirst
    Dim myspecs As String
    While Not rs.EOF
    'MsgBox rs.Fields("loan_status")
    
    myspecs = rs.Fields("model") & " " & rs.Fields("processor") & " " & rs.Fields("motherboard")
      fgrid1.AddItem rs.Fields("pc_no") & vbTab & myspecs & vbTab & rs.Fields("comp_status") & vbTab & rs.Fields("comp_id")
       
        rs.MoveNext
    Wend
End If

End Sub

Private Sub Text1_Change()
Set rs = Nothing
Call set_rec_getData(rs, cn, "SELECT *,a.room_id as r_id FROM room as a LEFT JOIN comp_details as b ON a.room_id = b.room_id LEFT JOIN department as c ON a.dept_id = c.dept_id LEFT JOIN users as d ON a.room_custodian_id = d.user_id   where `name` like '%" & Text1.Text & "%' or `building` like '%" & Text1.Text & "%' or `room_name` like '%" & Text1.Text & "%' order by a.room_id desc")

fillfgrid
End Sub

