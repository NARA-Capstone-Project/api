VERSION 5.00
Begin VB.Form Form2 
   BorderStyle     =   0  'None
   Caption         =   "8"
   ClientHeight    =   3705
   ClientLeft      =   0
   ClientTop       =   -75
   ClientWidth     =   8205
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form2.frx":0000
   ScaleHeight     =   3705
   ScaleWidth      =   8205
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin AdministratorSystem.chameleonButton command1 
      Height          =   735
      Left            =   3480
      TabIndex        =   2
      Top             =   2640
      Width           =   1935
      _ExtentX        =   3413
      _ExtentY        =   1296
      BTYPE           =   3
      TX              =   "Login"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Calibri"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14869218
      BCOLO           =   14869218
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "Form2.frx":D240
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.TextBox Text2 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      IMEMode         =   3  'DISABLE
      Left            =   3480
      PasswordChar    =   "*"
      TabIndex        =   1
      Top             =   1800
      Width           =   4455
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   3480
      TabIndex        =   0
      Top             =   1080
      Width           =   4455
   End
   Begin AdministratorSystem.chameleonButton command2 
      Height          =   735
      Left            =   6000
      TabIndex        =   3
      Top             =   2640
      Width           =   1935
      _ExtentX        =   3413
      _ExtentY        =   1296
      BTYPE           =   3
      TX              =   "Cancel"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Calibri"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14869218
      BCOLO           =   14869218
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "Form2.frx":D25C
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.Label Label11 
      BackStyle       =   0  'Transparent
      Caption         =   "Log In"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   150
      TabIndex        =   4
      Top             =   165
      Width           =   3735
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Set rs = Nothing
Set cn = Nothing
Call ConnectMySQL
Call set_rec_getData(rs, cn, "SELECT a.user_id,username,role,password,b.name, AES_DECRYPT(password,'cictpassword') as pass FROM accounts as a LEFT JOIN users as b on a.user_id = b.user_id  where username ='" & Text1.Text & "' and AES_DECRYPT(password,'cictpassword') = '" & Text2.Text & "'")

If rs.RecordCount = 0 Then
MsgBox "User not Recognized!", vbExclamation
Text1.Text = ""
Text2.Text = ""
Text1.SetFocus
Else
If rs.Fields("role") = "Admin" Or rs.Fields("role") = "Main Technician" Then
current_role = rs.Fields("role")
current_id = rs.Fields("user_id")
current_name = rs.Fields("username")
current_user_name = rs.Fields("name")
Unload Me
Form5.Show
Else
MsgBox "You are not allowed to access the system", vbExclamation
Text1.Text = ""
Text2.Text = ""
Text1.SetFocus
Exit Sub
End If
End If
End Sub

Private Sub Command2_Click()
End
End Sub

Private Sub Text1_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then
Command1_Click
End If
End Sub

Private Sub Text2_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then
Command1_Click
End If
End Sub
