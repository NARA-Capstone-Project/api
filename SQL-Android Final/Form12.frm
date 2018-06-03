VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form Form12 
   BorderStyle     =   0  'None
   Caption         =   "Room Management Form"
   ClientHeight    =   10815
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   15300
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
   Picture         =   "Form12.frx":0000
   ScaleHeight     =   10815
   ScaleWidth      =   15300
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "Back to Main Menu"
      Height          =   495
      Left            =   12840
      TabIndex        =   6
      Top             =   9840
      Width           =   2175
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Add New Room"
      Height          =   495
      Left            =   12960
      TabIndex        =   5
      Top             =   960
      Width           =   1815
   End
   Begin VB.TextBox Text1 
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
      Left            =   1200
      TabIndex        =   1
      Top             =   960
      Width           =   10095
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
      Left            =   11400
      TabIndex        =   0
      Top             =   960
      Visible         =   0   'False
      Width           =   975
   End
   Begin MSFlexGridLib.MSFlexGrid fgrid1 
      Height          =   8385
      Left            =   480
      TabIndex        =   2
      Top             =   1920
      Width           =   12255
      _ExtentX        =   21616
      _ExtentY        =   14790
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
      Left            =   480
      TabIndex        =   4
      Top             =   1080
      Width           =   735
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
      Left            =   480
      TabIndex        =   3
      Top             =   1560
      Width           =   10935
   End
End
Attribute VB_Name = "Form12"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdfill_Click()
Set rs = Nothing
'Call set_rec_getData(rs, cn, "SELECT *,a.room_id as r_id FROM room as a LEFT JOIN comp_details as b ON a.room_id = b.room_id LEFT JOIN department as c ON a.dept_id = c.dept_id LEFT JOIN users as d ON a.room_custodian_id = d.user_id order by a.room_id desc")
Call set_rec_getData(rs, cn, "select * from room left join ( select dept_room, concat_ws('',dept_name,'') as dept_name,room_id from (select r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'dept_room' from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = room.room_id LEFT JOIN users as d ON room.room_custodian_id = d.user_id order by room.room_id desc")
Call fillfgrid
End Sub

Private Sub Command1_Click()
form_type = "create"
Form14.Show vbModal
End Sub

Private Sub Command2_Click()
Unload Me
Form5.Show
End Sub

Private Sub fgrid1_DblClick()
selected_id = fgrid1.TextMatrix(fgrid1.Row, 5)
Form13.Show vbModal
End Sub

Private Sub Form_Load()
Set rs = Nothing
Set cn = Nothing
Call ConnectMySQL
'Call set_rec_getData(rs, cn, "SELECT *,a.room_id as r_id FROM room as a LEFT JOIN comp_details as b ON a.room_id = b.room_id LEFT JOIN department as c ON a.dept_id = c.dept_id LEFT JOIN users as d ON a.room_custodian_id = d.user_id order by a.room_id desc")
Call set_rec_getData(rs, cn, "select * from room left join ( select dept_room, concat_ws('',dept_name,'') as dept_name,room_id from (select r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'dept_room' from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = room.room_id LEFT JOIN users as d ON room.room_custodian_id = d.user_id order by room.room_id desc")
Call fillfgrid
End Sub
Public Sub fillfgrid()
fgrid1.Clear
fgrid1.FormatString = "Room Name                              " & vbTab & _
"Building                                        " & vbTab & _
"Floor            " & vbTab & _
"Department                                           " & vbTab & _
"Custodian                                                    " & vbTab & _
"ID"
fgrid1.Rows = 1
If Not rs.RecordCount = 0 Then
    rs.MoveFirst
    Dim assto As String
   
    While Not rs.EOF
    'MsgBox rs.Fields("loan_status")
    
       fgrid1.AddItem rs.Fields("dept_room") & vbTab & rs.Fields("building") & vbTab & rs.Fields("floor") & vbTab & rs.Fields("dept_name") & vbTab & rs.Fields("name") & vbTab & rs.Fields("room_id")
       
        rs.MoveNext
    Wend
End If

End Sub

Private Sub Text1_Change()
Set rs = Nothing
'Call set_rec_getData(rs, cn, "SELECT *,a.room_id as r_id FROM room as a LEFT JOIN comp_details as b ON a.room_id = b.room_id LEFT JOIN department as c ON a.dept_id = c.dept_id LEFT JOIN users as d ON a.room_custodian_id = d.user_id   where `name` like '%" & Text1.Text & "%' or `building` like '%" & Text1.Text & "%' or `room_name` like '%" & Text1.Text & "%' order by a.room_id desc")
Call set_rec_getData(rs, cn, "select * from room left join ( select dept_room, concat_ws('',dept_name,'') as dept_name,room_id from (select r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'dept_room' from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = room.room_id LEFT JOIN users as d ON room.room_custodian_id = d.user_id where d.name like '%" & Text1.Text & "%' or building like '%" & Text1.Text & "%' or rooms.dept_name like '%" & Text1.Text & "%' or rooms.dept_room like '%" & Text1.Text & "%' order by room.room_id desc")

fillfgrid
End Sub


