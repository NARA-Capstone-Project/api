VERSION 5.00
Begin VB.Form Form10 
   BorderStyle     =   0  'None
   Caption         =   "Sub Menu"
   ClientHeight    =   2670
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   8985
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "form10.frx":0000
   ScaleHeight     =   2670
   ScaleWidth      =   8985
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin AdministratorSystem.chameleonButton Command1 
      Height          =   1680
      Left            =   2700
      TabIndex        =   0
      Top             =   840
      Width           =   1650
      _ExtentX        =   2910
      _ExtentY        =   2963
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
      MICON           =   "form10.frx":87BE
      PICN            =   "form10.frx":87DA
      PICH            =   "form10.frx":D44E
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
      Height          =   1650
      Left            =   7020
      TabIndex        =   1
      Top             =   825
      Width           =   1860
      _ExtentX        =   3281
      _ExtentY        =   2910
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
      MICON           =   "form10.frx":120C2
      PICN            =   "form10.frx":120DE
      PICH            =   "form10.frx":16ECC
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin AdministratorSystem.chameleonButton command4 
      Height          =   1665
      Left            =   405
      TabIndex        =   2
      Top             =   900
      Width           =   1860
      _ExtentX        =   3281
      _ExtentY        =   2937
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
      MICON           =   "form10.frx":1BCBA
      PICN            =   "form10.frx":1BCD6
      PICH            =   "form10.frx":20FE7
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin AdministratorSystem.chameleonButton command5 
      Height          =   1455
      Left            =   4950
      TabIndex        =   3
      Top             =   975
      Width           =   1650
      _ExtentX        =   2910
      _ExtentY        =   2566
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
      MICON           =   "form10.frx":262F8
      PICN            =   "form10.frx":26314
      PICH            =   "form10.frx":2BB52
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
Attribute VB_Name = "Form10"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
form_type = "modify"
Unload Me
Form21.Show vbModal
'Form11.Show vbModal
End Sub

Private Sub Command2_Click()
If MsgBox("Are you sure you want to delete computer ?", vbYesNo) = vbYes Then
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "delete FROM computers where comp_id = '" & selected_id & "'")
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "delete FROM comp_details where comp_id = '" & selected_id & "'")
    MsgBox "Computer Deleted!", vbInformation
    Unload Me
End If
End Sub

Private Sub Command3_Click()
Unload Me
End Sub

Private Sub Command4_Click()
'check if nakaassign na sa room
Set rs = Nothing
Call set_rec_getData(rs, cn, "select * from comp_details where comp_id = '" & selected_id & "'")
If rs.RecordCount = 0 Then
    form_type = "room"
    Form20.Show vbModal
Else
    If MsgBox("Computer already assigned to a room. Upon reassigning to a new room, the system will remove it from the last room it was assigned. Continue?", vbYesNo) = vbYes Then
        form_type = "room"
        Form20.Show vbModal
    End If
End If

Unload Me
End Sub

Private Sub command5_Click()
If MsgBox("Are you sure you want to remove computer to assigned room?", vbYesNo) = vbYes Then
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "delete FROM comp_details where comp_id = '" & selected_id & "'")
    MsgBox "Computer Removed!", vbInformation
    Unload Me
End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
Form9.cmdfill.Value = True
Form9.Combo1.Text = ""
Form9.Combo2.Text = ""
Form9.Combo3.Text = ""
End Sub
