VERSION 5.00
Begin VB.Form Form3 
   BorderStyle     =   0  'None
   Caption         =   "Sub Menu"
   ClientHeight    =   2670
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7290
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form3.frx":0000
   ScaleHeight     =   2670
   ScaleWidth      =   7290
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin AdministratorSystem.chameleonButton Command1 
      Height          =   1575
      Left            =   360
      TabIndex        =   0
      Top             =   840
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   2778
      BTYPE           =   2
      TX              =   ""
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Calibri"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
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
      MICON           =   "Form3.frx":7E11
      PICN            =   "Form3.frx":7E2D
      PICH            =   "Form3.frx":CAA1
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin AdministratorSystem.chameleonButton Command2 
      Height          =   1575
      Left            =   2745
      TabIndex        =   1
      Top             =   825
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   2778
      BTYPE           =   2
      TX              =   ""
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Calibri"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
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
      MICON           =   "Form3.frx":11715
      PICN            =   "Form3.frx":11731
      PICH            =   "Form3.frx":165C0
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin AdministratorSystem.chameleonButton Command3 
      Height          =   1575
      Left            =   5400
      TabIndex        =   2
      Top             =   840
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   2778
      BTYPE           =   2
      TX              =   ""
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Calibri"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
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
      MICON           =   "Form3.frx":1B44F
      PICN            =   "Form3.frx":1B46B
      PICH            =   "Form3.frx":20259
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
form_type = "modify"
Unload Me
Form4.Show vbModal
End Sub

Private Sub Command2_Click()
If MsgBox("Are you sure you want to delete user " & selected_name & "?", vbYesNo) = vbYes Then
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "delete FROM accounts where user_id = '" & selected_id & "'")
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "delete FROM users where user_id = '" & selected_id & "'")
    
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "update room set room_custodian_id = NULL where room_custodian_id = '" & selected_id & "'")
    
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "update room set room_technician_id = NULL where room_technician_id = '" & selected_id & "'")
    MsgBox "Records Deleted!", vbInformation
    Unload Me
End If
End Sub

Private Sub Command3_Click()
Unload Me
End Sub

Private Sub Form_Load()
Me.Caption = "Sub menu form for Employee " & selected_name
End Sub

Private Sub Form_Unload(Cancel As Integer)
Form1.cmdfill.Value = True
End Sub
