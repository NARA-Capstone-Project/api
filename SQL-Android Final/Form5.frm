VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "ieframe.dll"
Begin VB.Form Form5 
   BorderStyle     =   0  'None
   Caption         =   "Main Form"
   ClientHeight    =   8955
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   17730
   BeginProperty Font 
      Name            =   "Calibri"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form5"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form5.frx":0000
   ScaleHeight     =   8955
   ScaleWidth      =   17730
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   6720
      Top             =   585
   End
   Begin VB.PictureBox Picture4 
      BorderStyle     =   0  'None
      Height          =   1560
      Left            =   540
      Picture         =   "Form5.frx":39053D
      ScaleHeight     =   104
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   126
      TabIndex        =   11
      Top             =   1395
      Width           =   1890
   End
   Begin AdministratorSystem.chameleonButton Command1 
      Height          =   600
      Left            =   16440
      TabIndex        =   10
      Top             =   480
      Width           =   735
      _ExtentX        =   1296
      _ExtentY        =   1058
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
      MICON           =   "Form5.frx":396719
      PICN            =   "Form5.frx":396735
      PICH            =   "Form5.frx":39A068
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.PictureBox Picture3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   1935
      Left            =   3240
      ScaleHeight     =   1935
      ScaleWidth      =   3375
      TabIndex        =   7
      Top             =   2520
      Width           =   3375
      Begin AdministratorSystem.chameleonButton Command4 
         Height          =   1935
         Left            =   0
         TabIndex        =   8
         Top             =   0
         Width           =   3375
         _ExtentX        =   5953
         _ExtentY        =   3413
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
         MICON           =   "Form5.frx":39DABF
         PICN            =   "Form5.frx":39DADB
         PICH            =   "Form5.frx":3A80B6
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
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      ForeColor       =   &H80000008&
      Height          =   2415
      Left            =   12840
      ScaleHeight     =   2415
      ScaleWidth      =   4215
      TabIndex        =   2
      Top             =   5760
      Width           =   4215
      Begin SHDocVwCtl.WebBrowser WebBrowser2 
         Height          =   4215
         Left            =   -360
         TabIndex        =   3
         Top             =   -360
         Width           =   6615
         ExtentX         =   11668
         ExtentY         =   7435
         ViewMode        =   0
         Offline         =   0
         Silent          =   0
         RegisterAsBrowser=   0
         RegisterAsDropTarget=   1
         AutoArrange     =   0   'False
         NoClientEdge    =   0   'False
         AlignLeft       =   0   'False
         NoWebView       =   0   'False
         HideFileNames   =   0   'False
         SingleClick     =   0   'False
         SingleSelection =   0   'False
         NoFolders       =   0   'False
         Transparent     =   0   'False
         ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
         Location        =   ""
      End
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      ForeColor       =   &H80000008&
      Height          =   3855
      Left            =   480
      ScaleHeight     =   3855
      ScaleWidth      =   2055
      TabIndex        =   0
      Top             =   4560
      Width           =   2055
      Begin SHDocVwCtl.WebBrowser WebBrowser1 
         Height          =   4935
         Left            =   -240
         TabIndex        =   1
         Top             =   -360
         Width           =   3135
         ExtentX         =   5530
         ExtentY         =   8705
         ViewMode        =   0
         Offline         =   0
         Silent          =   0
         RegisterAsBrowser=   0
         RegisterAsDropTarget=   1
         AutoArrange     =   0   'False
         NoClientEdge    =   0   'False
         AlignLeft       =   0   'False
         NoWebView       =   0   'False
         HideFileNames   =   0   'False
         SingleClick     =   0   'False
         SingleSelection =   0   'False
         NoFolders       =   0   'False
         Transparent     =   0   'False
         ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
         Location        =   ""
      End
   End
   Begin AdministratorSystem.chameleonButton Command2 
      Height          =   1935
      Left            =   6720
      TabIndex        =   4
      Top             =   2520
      Width           =   3375
      _ExtentX        =   5953
      _ExtentY        =   3413
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
      MICON           =   "Form5.frx":3B2BA6
      PICN            =   "Form5.frx":3B2BC2
      PICH            =   "Form5.frx":3BC8C9
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
      Height          =   1935
      Left            =   10200
      TabIndex        =   5
      Top             =   2520
      Width           =   3375
      _ExtentX        =   5953
      _ExtentY        =   3413
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
      MICON           =   "Form5.frx":3C6AC9
      PICN            =   "Form5.frx":3C6AE5
      PICH            =   "Form5.frx":3CFE45
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin AdministratorSystem.chameleonButton Command5 
      Height          =   1935
      Left            =   13680
      TabIndex        =   6
      Top             =   2520
      Width           =   3375
      _ExtentX        =   5953
      _ExtentY        =   3413
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
      MICON           =   "Form5.frx":3D96C0
      PICN            =   "Form5.frx":3D96DC
      PICH            =   "Form5.frx":3E123E
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Date: dd MMM, yyyy Time: HH:MM"
      BeginProperty Font 
         Name            =   "Carlito"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   7275
      TabIndex        =   13
      Top             =   630
      Width           =   4395
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "User: Name"
      BeginProperty Font 
         Name            =   "Carlito"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   645
      TabIndex        =   12
      Top             =   585
      Width           =   3405
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "You Must be logged in administrator account to use this button"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   495
      Left            =   3360
      TabIndex        =   9
      Top             =   4560
      Width           =   3135
   End
End
Attribute VB_Name = "Form5"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Form6.Show vbModal
End Sub


Private Sub Command2_Click()
Unload Me
Form9.Show
End Sub

Private Sub Command3_Click()
Unload Me
Form12.Show
End Sub

Private Sub Command4_Click()
Unload Me
Form1.Show
End Sub

Private Sub command5_Click()
Unload Me
Form18.Show
End Sub

Private Sub Form_Load()
frmbg.Show
WebBrowser1.Navigate (App.Path & "\37c90c9b7e57869a73196b689b20f056.gif")
WebBrowser2.Navigate (App.Path & "\lb.gif")
Set rs = Nothing
Set cn = Nothing
ConnectMySQL

Label2.Caption = "User: " & current_user_name

If current_role = "Admin" Then
Picture3.Enabled = True
Label1.Visible = False
Else
Picture3.Enabled = False
Label1.Visible = True
End If

End Sub

Private Sub Timer1_Timer()
Label3.Caption = "Date: " & Date & " Time: " & Time
End Sub

