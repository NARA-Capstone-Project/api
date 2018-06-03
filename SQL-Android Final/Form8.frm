VERSION 5.00
Begin VB.Form Form8 
   BorderStyle     =   0  'None
   Caption         =   "Sub Menu"
   ClientHeight    =   2685
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7320
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form8.frx":0000
   ScaleHeight     =   2685
   ScaleWidth      =   7320
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin AdministratorSystem.chameleonButton Command1 
      Height          =   1575
      Left            =   225
      TabIndex        =   0
      Top             =   975
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
      MICON           =   "Form8.frx":7E11
      PICN            =   "Form8.frx":7E2D
      PICH            =   "Form8.frx":C91D
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
      Left            =   2640
      TabIndex        =   1
      Top             =   960
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
      MICON           =   "Form8.frx":1140D
      PICN            =   "Form8.frx":11429
      PICH            =   "Form8.frx":1629D
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
      Left            =   5280
      TabIndex        =   2
      Top             =   960
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
      MICON           =   "Form8.frx":1B111
      PICN            =   "Form8.frx":1B12D
      PICH            =   "Form8.frx":1FF1B
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
Attribute VB_Name = "Form8"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim pass As String
Dim user As String


If selected_request = "reactivate" Then
    If MsgBox("Are you sure you want to reactivate " & selected_name & "?", vbYesNo) = vbYes Then
        Set rs = Nothing
        Call set_rec_getData(rs, cn, "update accounts set acc_status = 'Active', date_expire = DATE_ADD(now(), INTERVAL 5 month) where user_id = '" & selected_id & "'")
        Set rs = Nothing
        Call set_rec_getData(rs, cn, "delete from request_account where id = '" & selected_id & "'")
        MsgBox "User " & selected_name & " Activated!"
    End If
ElseIf selected_request = "account" Then
    form_type = "request"
    'modified - added setdata
    'MsgBox "Before you can approve Employee" & vbCrLf & "You must fill employee details", vbInformation
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "SELECT username, CAST(AES_DECRYPT(password, 'cictpassword') AS CHAR(50)) as pass from request_account where id = '" & selected_id & "'")
    pass = rs.Fields("pass")
    user = rs.Fields("username")
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "INSERT INTO accounts (user_id, username, password,date_created,date_expire,acc_status) VALUES ('" & selected_id & "', '" & user & "', AES_ENCRYPT('" & pass & "','cictpassword'), now()  ,DATE_ADD(now(), INTERVAL 5 month),'Active')")
    MsgBox "Account Approved!"
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "delete from request_account where id = '" & selected_id & "'")
    
End If
    Unload Me
End Sub

Private Sub Command2_Click()
If MsgBox("Are you sure you want to delete request of " & selected_name & "?", vbYesNo) = vbYes Then
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "delete from request_account where id = '" & selected_id & "'")
    
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
Form7.cmdfill.Value = True
End Sub
