VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form Form7 
   BorderStyle     =   0  'None
   Caption         =   "Employee Request Form"
   ClientHeight    =   9615
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   16710
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
   Picture         =   "Form7.frx":0000
   ScaleHeight     =   9615
   ScaleWidth      =   16710
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "Back to Employee Form"
      Height          =   495
      Left            =   14280
      TabIndex        =   5
      Top             =   8640
      Width           =   2175
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
      Left            =   960
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
      Left            =   15240
      TabIndex        =   0
      Top             =   1080
      Visible         =   0   'False
      Width           =   975
   End
   Begin MSFlexGridLib.MSFlexGrid fgrid1 
      Height          =   7425
      Left            =   240
      TabIndex        =   2
      Top             =   1815
      Width           =   13935
      _ExtentX        =   24580
      _ExtentY        =   13097
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
         Name            =   "Verdana"
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
      Left            =   240
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
      Left            =   240
      TabIndex        =   3
      Top             =   1440
      Width           =   10935
   End
End
Attribute VB_Name = "Form7"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdfill_Click()
Set rs = Nothing
Call set_rec_getData(rs, cn, "SELECT * FROM request_account order by date_request desc")
Call fillfgrid
End Sub



Private Sub Command2_Click()
Unload Me
Form1.Show
End Sub

Private Sub fgrid1_DblClick()
selected_id = fgrid1.TextMatrix(fgrid1.Row, 3)
selected_name = fgrid1.TextMatrix(fgrid1.Row, 0)
selected_request = fgrid1.TextMatrix(fgrid1.Row, 1)
If Not selected_id = "ID" Then
    Form8.Show vbModal
End If
End Sub

Private Sub Form_Load()
Set rs = Nothing
Set cn = Nothing
Call ConnectMySQL
Call set_rec_getData(rs, cn, "SELECT * FROM request_account order by date_request desc")
Call fillfgrid
End Sub
Public Sub fillfgrid()
fgrid1.Clear
fgrid1.FormatString = "Username                                                                                                     " & vbTab & _
"Request                           " & vbTab & _
"Request Date            " & vbTab & _
"ID"
fgrid1.Rows = 1
If Not rs.RecordCount = 0 Then
    rs.MoveFirst
    
    
    While Not rs.EOF
    'MsgBox rs.Fields("loan_status")
       fgrid1.AddItem rs.Fields("username") & vbTab & rs.Fields("request") & vbTab & rs.Fields("date_request") & vbTab & rs.Fields("id")
       
        rs.MoveNext
    Wend
End If

End Sub

Private Sub Text1_Change()
Set rs = Nothing
Call set_rec_getData(rs, cn, "SELECT * FROM request_account where `username` like '%" & Text1.Text & "%' order by username asc")

fillfgrid
End Sub
