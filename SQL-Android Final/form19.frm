VERSION 5.00
Begin VB.Form Form19 
   BorderStyle     =   0  'None
   Caption         =   "Sub Menu"
   ClientHeight    =   2685
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7275
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "form19.frx":0000
   ScaleHeight     =   2685
   ScaleWidth      =   7275
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin AdministratorSystem.chameleonButton Command5 
      Height          =   1575
      Left            =   240
      TabIndex        =   0
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
      MICON           =   "form19.frx":7E11
      PICN            =   "form19.frx":7E2D
      PICH            =   "form19.frx":D582
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin AdministratorSystem.chameleonButton Command1 
      Height          =   1575
      Left            =   2760
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
      MICON           =   "form19.frx":12CD7
      PICN            =   "form19.frx":12CF3
      PICH            =   "form19.frx":17F39
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
      MICON           =   "form19.frx":1D17F
      PICN            =   "form19.frx":1D19B
      PICH            =   "form19.frx":21F89
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
Attribute VB_Name = "Form19"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Set rs = Nothing
Call set_rec_getData(rs, cn, "SELECT *,c.name as req,d.name as tech FROM request_peripherals as a LEFT JOIN users as c ON a.requisitioner = c.user_id LEFT OUTER JOIN users as d ON a.tech_id = d.user_id LEFT OUTER JOIN department as e ON e.dept_id = a.dept_id LEFT OUTER JOIN request_peripherals_details as f ON a.req_id = f.req_id LEFT OUTER JOIN department as g ON g.dept_id =e.dept_id where a.req_id ='" & selected_id & "'")
Set DataReport4.DataSource = rs
With DataReport4
            With .Sections("Section2").Controls
                .Item("label14").Caption = rs.Fields("req")
                 .Item("label15").Caption = rs.Fields("dept_name")
               .Item("label16").Caption = rs.Fields("purpose")
              .Item("label17").Caption = rs.Fields("designation")
               .Item("label18").Caption = rs.Fields("date_requested")
           End With
        End With
DataReport4.Show vbModal
End Sub

Private Sub Command2_Click()
If MsgBox("Are you sure you want to unassigned from room?", vbYesNo) = vbYes Then
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "delete FROM comp_details where comp_id = '" & selected_comp_id & "'")
    MsgBox "Computer Unassigned!", vbInformation
    Unload Me
End If
End Sub

Private Sub Command3_Click()
Unload Me
End Sub

Private Sub Command5_Click()
Set rs = Nothing
Call set_rec_getData(rs, cn, "SELECT *, c.name as custodian, d.name as technician FROM assessment_reports as a LEFT JOIN assessment_details as b ON a.rep_id = b.rep_id LEFT JOIN users as c ON a.custodian_id = c.user_id LEFT OUTER JOIN users as d ON a.technician_id = d.user_id LEFT OUTER JOIN room as e ON e.room_id = a.room_id where a.rep_id = '" & selected_id & "'")
Set DataReport2.DataSource = rs
   With DataReport2
            With .Sections("Section2").Controls
                .Item("label11").Caption = rs.Fields("date")
                 .Item("label12").Caption = rs.Fields("technician")
               .Item("label8").Caption = rs.Fields("custodian")
              .Item("label7").Caption = rs.Fields("room_name")
           End With
        End With
DataReport2.Show vbModal
End Sub

Private Sub Form_Load()
If report_type = "Request" Then
Command1.Enabled = True
Command5.Enabled = False
Else
Command1.Enabled = False
Command5.Enabled = True
End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
'Form18.cmdfill.Value = True
End Sub
