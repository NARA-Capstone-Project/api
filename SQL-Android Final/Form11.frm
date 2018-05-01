VERSION 5.00
Begin VB.Form Form11 
   BorderStyle     =   0  'None
   Caption         =   "Add Computer Form"
   ClientHeight    =   12300
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9645
   BeginProperty Font 
      Name            =   "Calibri"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form4"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form11.frx":0000
   ScaleHeight     =   12300
   ScaleWidth      =   9645
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox Text10 
      Height          =   495
      Left            =   600
      TabIndex        =   21
      Top             =   10080
      Width           =   8535
   End
   Begin VB.TextBox Text9 
      Height          =   495
      Left            =   600
      TabIndex        =   17
      Top             =   8160
      Width           =   8535
   End
   Begin VB.TextBox Text8 
      Height          =   495
      Left            =   600
      TabIndex        =   16
      Top             =   9120
      Width           =   8535
   End
   Begin VB.TextBox Text7 
      Height          =   495
      Left            =   600
      TabIndex        =   15
      Top             =   7200
      Width           =   8535
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   615
      Left            =   6840
      TabIndex        =   14
      Top             =   11160
      Width           =   2295
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Save"
      Height          =   615
      Left            =   4800
      TabIndex        =   13
      Top             =   11160
      Width           =   1935
   End
   Begin VB.TextBox Text6 
      Height          =   495
      Left            =   600
      TabIndex        =   9
      Top             =   6240
      Width           =   8535
   End
   Begin VB.TextBox Text5 
      Height          =   495
      Left            =   600
      TabIndex        =   8
      Top             =   5280
      Width           =   8535
   End
   Begin VB.TextBox Text4 
      Height          =   495
      Left            =   600
      TabIndex        =   5
      Top             =   4320
      Width           =   8535
   End
   Begin VB.TextBox Text3 
      Height          =   495
      Left            =   600
      TabIndex        =   4
      Top             =   3360
      Width           =   8535
   End
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   600
      TabIndex        =   1
      Top             =   2280
      Width           =   8535
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   600
      TabIndex        =   0
      Text            =   " "
      Top             =   1320
      Width           =   8535
   End
   Begin VB.Label Label11 
      BackStyle       =   0  'Transparent
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
      Left            =   360
      TabIndex        =   22
      Top             =   240
      Width           =   3735
   End
   Begin VB.Label Label10 
      BackStyle       =   0  'Transparent
      Caption         =   "Mouse:"
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
      Height          =   615
      Left            =   600
      TabIndex        =   20
      Top             =   7800
      Width           =   4215
   End
   Begin VB.Label Label9 
      BackStyle       =   0  'Transparent
      Caption         =   "VGA:"
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
      Height          =   615
      Left            =   600
      TabIndex        =   19
      Top             =   8760
      Width           =   4215
   End
   Begin VB.Label Label8 
      BackStyle       =   0  'Transparent
      Caption         =   "HDD:"
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
      Height          =   615
      Left            =   600
      TabIndex        =   18
      Top             =   9720
      Width           =   4215
   End
   Begin VB.Label Label7 
      BackStyle       =   0  'Transparent
      Caption         =   "Keyboard:"
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
      Height          =   615
      Left            =   600
      TabIndex        =   12
      Top             =   6840
      Width           =   4215
   End
   Begin VB.Label Label6 
      BackStyle       =   0  'Transparent
      Caption         =   "Ram:"
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
      Height          =   615
      Left            =   600
      TabIndex        =   11
      Top             =   5880
      Width           =   4215
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Monitor:"
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
      Height          =   615
      Left            =   600
      TabIndex        =   10
      Top             =   4920
      Width           =   4215
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Motherboard:"
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
      Height          =   615
      Left            =   600
      TabIndex        =   7
      Top             =   3960
      Width           =   4215
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Processor:"
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
      Height          =   615
      Left            =   600
      TabIndex        =   6
      Top             =   3000
      Width           =   4215
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Model:"
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
      Height          =   615
      Left            =   600
      TabIndex        =   3
      Top             =   1920
      Width           =   4215
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Operating System:"
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
      Height          =   615
      Left            =   600
      TabIndex        =   2
      Top             =   960
      Width           =   4215
   End
End
Attribute VB_Name = "Form11"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Combo1_KeyPress(KeyAscii As Integer)
KeyAscii = 0
Beep
End Sub

Private Sub Command1_Click()
If Text1.Text = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Text1.SetFocus
    Exit Sub
End If
If Text2.Text = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Text2.SetFocus
    Exit Sub
End If
If Text3.Text = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Text3.SetFocus
    Exit Sub
End If
If Text4.Text = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Text4.SetFocus
    Exit Sub
End If
If Text5.Text = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Text6.SetFocus
    Exit Sub
End If
If Text6.Text = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Text6.SetFocus
    Exit Sub
End If
If Text7.Text = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Text7.SetFocus
    Exit Sub
End If
If Text8.Text = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Text8.SetFocus
    Exit Sub
End If
If Text9.Text = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Text9.SetFocus
    Exit Sub
End If
If Text10.Text = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Text10.SetFocus
    Exit Sub
End If
If form_type = "modify" Then
Set rs = Nothing
Call set_rec_getData(rs, cn, "update computers set os = '" & Text1.Text & "', model = '" & Text2.Text & "', processor = '" & Text3.Text & "', motherboard = '" & Text4.Text & "',  monitor = '" & Text5.Text & "',ram = '" & Text6.Text & "',kboard = '" & Text7.Text & "',mouse = '" & Text8.Text & "',vga = '" & Text9.Text & "',hdd = '" & Text10.Text & "' where comp_id = '" & selected_id & "'")
MsgBox "Computer Updated!", vbInformation
Unload Me
ElseIf form_type = "create" Then
Set rs = Nothing
Call set_rec_getData(rs, cn, "INSERT INTO computers (os, model,processor, motherboard,monitor,ram,kboard,mouse,vga,hdd) VALUES ('" & Text1.Text & "', '" & Text2.Text & "', '" & Text3.Text & "' , '" & Text4.Text & "' , '" & Text5.Text & "' , '" & Text6.Text & "' , '" & Text7.Text & "', '" & Text8.Text & "', '" & Text9.Text & "', '" & Text10.Text & "')")
MsgBox "Computer Saved!", vbInformation
Unload Me
ElseIf form_type = "profile" Then
current_user = Text3.Text
Set rs = Nothing
Call set_rec_getData(rs, cn, "INSERT INTO users (user_id, email,name, phone,role) VALUES ('" & Text1.Text & "', '" & Text5.Text & "', '" & Text2.Text & "' , '" & Text6.Text & "' ,'" & Combo1.Text & "')")
Set rs = Nothing
Call set_rec_getData(rs, cn, "INSERT INTO accounts (user_id, username, password,date_created,date_expire,acc_status) VALUES ('" & Text1.Text & "', '" & Text3.Text & "', AES_ENCRYPT('" & Text4.Text & "','cictpassword'), now()  ,DATE_SUB(now(), INTERVAL 5 month),'Active')")
MsgBox "Employees Saved!", vbInformation
Unload Me
ElseIf form_type = "request" Then
current_user = Text3.Text
Set rs = Nothing
Call set_rec_getData(rs, cn, "INSERT INTO users (user_id, email,name, phone,role) VALUES ('" & Text1.Text & "', '" & Text5.Text & "', '" & Text2.Text & "' , '" & Text6.Text & "' ,'" & Combo1.Text & "')")
Set rs = Nothing
Call set_rec_getData(rs, cn, "INSERT INTO accounts (user_id, username, password,date_created,date_expire,acc_status) VALUES ('" & Text1.Text & "', '" & Text3.Text & "', AES_ENCRYPT('" & Text4.Text & "','cictpassword'), now()  ,DATE_SUB(now(), INTERVAL 5 month),'Active')")
MsgBox "Employee Request Accepted!", vbInformation
Set rs = Nothing
Call set_rec_getData(rs, cn, "delete from request_account where id = '" & selected_id & "'")
Unload Me
End If
'INSERT INTO testtable VALUE(AES_ENCRYPT('mytext','passw'));
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Form_Load()
'Set cn = Nothing
Set rs = Nothing
'Call ConnectMySQL("192.168.1.5", "user", "1234", "cict")
If form_type = "create" Then
    Command1.Caption = "Save"
    label11.Caption = "Add Computer Form"
ElseIf form_type = "modify" Then
    Command1.Caption = "Update"
    label11.Caption = "Computer Modify Form"
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "SELECT * FROM computers where comp_id  ='" & selected_id & "'")
        If Not rs.RecordCount = 0 Then
            Text1.Text = rs.Fields("os")
            Text2.Text = rs.Fields("model")
            Text3.Text = rs.Fields("processor")
            Text4.Text = rs.Fields("motherboard")
            Text5.Text = rs.Fields("monitor")
            Text6.Text = rs.Fields("ram")
            Text7.Text = rs.Fields("kboard")
            Text8.Text = rs.Fields("mouse")
            Text9.Text = rs.Fields("vga")
            Text10.Text = rs.Fields("hdd")
            
        End If
ElseIf form_type = "profile" Then
    Command1.Caption = "Update"
     label11.Caption = "Employee Modify Form - " & selected_name
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "SELECT * FROM users LEFT JOIN accounts ON users.user_id = accounts.user_id where users.user_id ='" & current_id & "'")
    If Not rs.RecordCount = 0 Then
        Text1.Text = rs.Fields("user_id")
        Text2.Text = rs.Fields("name")
        Text3.Text = rs.Fields("username")
        Text4.Text = ""
        Text5.Text = rs.Fields("email")
        Text6.Text = rs.Fields("phone")
        Combo1.Text = rs.Fields("role")
        Combo1.Enabled = False
    End If
ElseIf form_type = "request" Then
    Command1.Caption = "Update"
     label11.Caption = "Add Employee Request Form - " & selected_name
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "SELECT *,CAST(AES_DECRYPT(password, 'cictpassword') AS CHAR(50)) as b from request_account where id = '" & selected_id & "'")
    
        Text4.Text = rs.Fields("b")
        Text4.Enabled = False
        Text1.Text = rs.Fields("id")
        Text1.Enabled = False
        Text3.Text = rs.Fields("username")
        Text3.Enabled = False
        
End If

End Sub

Private Sub Form_Unload(Cancel As Integer)
If Not form_type = "profile" Then
    Form9.cmdfill.Value = True
End If
If form_type = "request" Then
    Form7.cmdfill.Value = True
End If

End Sub

