VERSION 5.00
Begin VB.Form Form15 
   BorderStyle     =   0  'None
   Caption         =   "Room Information"
   ClientHeight    =   13440
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   16965
   BeginProperty Font 
      Name            =   "Calibri"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form15"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form15.frx":0000
   ScaleHeight     =   13440
   ScaleWidth      =   16965
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "Back to Main"
      Height          =   1215
      Left            =   14760
      TabIndex        =   7
      Top             =   1320
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Assigned Computers"
      Height          =   1215
      Left            =   13080
      TabIndex        =   6
      Top             =   1320
      Width           =   1575
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   10215
      Left            =   480
      ScaleHeight     =   10185
      ScaleWidth      =   16065
      TabIndex        =   3
      Top             =   2880
      Width           =   16095
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Computer Count:"
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
      Left            =   480
      TabIndex        =   5
      Top             =   1920
      Width           =   4215
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Room Schedule"
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
      Height          =   615
      Left            =   480
      TabIndex        =   4
      Top             =   2520
      Width           =   4215
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Custodian:"
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
      Left            =   480
      TabIndex        =   2
      Top             =   1680
      Width           =   4215
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "User ID:"
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
      Left            =   480
      TabIndex        =   1
      Top             =   1440
      Width           =   4215
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Room Name"
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
      Height          =   615
      Left            =   480
      TabIndex        =   0
      Top             =   1080
      Width           =   4215
   End
End
Attribute VB_Name = "Form15"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Unload Me
Form16.Show
End Sub

Private Sub Command2_Click()
Unload Me
Form12.Show
End Sub

Private Sub Form_Load()
Dim temp_room_id As String
Set rs = Nothing
Call set_rec_getData(rs, cn, "select * from room left join ( select room_name, concat_ws('',dept_name,'') as dept_name,room_id from (select r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name', r.room_schedule from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = room.room_id LEFT JOIN users as d ON room.room_custodian_id = d.user_id where room.room_id = '" & selected_id & "' order by room.room_id desc")
Label1.Caption = rs.Fields("room_name")
If rs.Fields("floor") = 1 Then
Label2.Caption = "1st Floor"
ElseIf rs.Fields("floor") = 2 Then
Label2.Caption = "2nd Floor "
ElseIf rs.Fields("floor") = 3 Then
Label2.Caption = "3rd Floor "
ElseIf rs.Fields("floor") = 4 Then
Label2.Caption = "4th Floor "
Else
Label2.Caption = rs.Fields("floor") & " Floor"
End If
Label2.Caption = Label2.Caption & rs.Fields("building") & " building"
Label3.Caption = Label3.Caption & " " & rs.Fields("name")
If IsNull(rs.Fields("room_schedule")) = False Then
Picture1.Picture = LoadPicture(App.Path & "\images\" & rs.Fields("room_schedule"))
Picture1.PaintPicture Picture1.Picture, 0, 0, Picture1.Width, Picture1.Height
End If
temp_room_id = rs.Fields(0)

Set rs = Nothing
Call set_rec_getData(rs, cn, "SELECT * from comp_details where room_id = '" & temp_room_id & "'")
Label5.Caption = Label5.Caption & " " & rs.RecordCount & " Units"
End Sub

