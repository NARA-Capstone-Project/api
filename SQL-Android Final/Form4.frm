VERSION 5.00
Begin VB.Form Form4 
   BorderStyle     =   0  'None
   Caption         =   "Add Employee Form"
   ClientHeight    =   9855
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   10050
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
   Picture         =   "Form4.frx":0000
   ScaleHeight     =   9855
   ScaleWidth      =   10050
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   615
      Left            =   6960
      TabIndex        =   15
      Top             =   8280
      Width           =   2295
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Save"
      Height          =   615
      Left            =   4920
      TabIndex        =   14
      Top             =   8310
      Width           =   1935
   End
   Begin VB.ComboBox Combo1 
      Height          =   345
      ItemData        =   "Form4.frx":14457
      Left            =   720
      List            =   "Form4.frx":14467
      TabIndex        =   13
      Top             =   7560
      Width           =   8535
   End
   Begin VB.TextBox Text6 
      Height          =   495
      Left            =   720
      MaxLength       =   11
      TabIndex        =   9
      Text            =   "09"
      Top             =   6600
      Width           =   8535
   End
   Begin VB.TextBox Text5 
      Height          =   495
      Left            =   720
      TabIndex        =   8
      Top             =   5640
      Width           =   8535
   End
   Begin VB.TextBox Text4 
      Height          =   495
      IMEMode         =   3  'DISABLE
      Left            =   720
      PasswordChar    =   "*"
      TabIndex        =   5
      Top             =   4680
      Width           =   8535
   End
   Begin VB.TextBox Text3 
      Height          =   495
      Left            =   720
      TabIndex        =   4
      Top             =   3720
      Width           =   8535
   End
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   720
      TabIndex        =   1
      Top             =   2640
      Width           =   8535
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   720
      TabIndex        =   0
      Top             =   1680
      Width           =   8535
   End
   Begin VB.Label Label8 
      BackStyle       =   0  'Transparent
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   495
      Left            =   360
      TabIndex        =   16
      Top             =   240
      Width           =   5415
   End
   Begin VB.Label Label7 
      BackStyle       =   0  'Transparent
      Caption         =   "Role"
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
      Left            =   720
      TabIndex        =   12
      Top             =   7200
      Width           =   4215
   End
   Begin VB.Label Label6 
      BackStyle       =   0  'Transparent
      Caption         =   "Phone:"
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
      Left            =   720
      TabIndex        =   11
      Top             =   6240
      Width           =   4215
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Email:"
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
      Left            =   720
      TabIndex        =   10
      Top             =   5280
      Width           =   4215
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Password:"
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
      Left            =   720
      TabIndex        =   7
      Top             =   4320
      Width           =   4215
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Username:"
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
      Left            =   720
      TabIndex        =   6
      Top             =   3360
      Width           =   4215
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Name:"
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
      Left            =   720
      TabIndex        =   3
      Top             =   2280
      Width           =   4215
   End
   Begin VB.Label Label1 
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
      Height          =   615
      Left            =   720
      TabIndex        =   2
      Top             =   1320
      Width           =   4215
   End
End
Attribute VB_Name = "Form4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Combo1_KeyPress(KeyAscii As Integer)
KeyAscii = 0
Beep
End Sub

Private Sub Command1_Click()
'check for empty texts
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
If Text3.Text = "" Then 'username
    'modified
    If form_type = "modify" Then
        Set rs = Nothing
        Call set_rec_getData(rs, cn, "SELECT * FROM accounts where user_id = '" & selected_id & "'")
        If Not rs.RecordCount = 0 Then
            MsgBox "Empty fields not allowed", vbExclamation
            Text3.SetFocus
            Exit Sub
        ElseIf Text3.Enabled = True Then 'user has no account but wil create by the admin
            MsgBox "Empty fields not allowed", vbExclamation
            Text3.SetFocus
            Exit Sub
        End If
    ElseIf form_type = "create" Then
        If Text3.Enabled = True Then 'admin wants to create an account for this user
            MsgBox "Empty fields not allowed", vbExclamation
            Text3.SetFocus
            Exit Sub
        End If
    Else 'if profile
        MsgBox "Empty fields not allowed", vbExclamation
        Text3.SetFocus
        Exit Sub
    End If
End If
If Text4.Text = "" Then
    'modified
    If form_type = "modify" Then
        Set rs = Nothing
        Call set_rec_getData(rs, cn, "SELECT * FROM accounts where user_id = '" & selected_id & "'")
        If Not rs.RecordCount = 0 Then
            MsgBox "Empty fields not allowed", vbExclamation
            Text4.SetFocus
            Exit Sub
        ElseIf Text4.Enabled = True Then 'admin wants to create an account for this user
            MsgBox "Empty fields not allowed", vbExclamation
            Text4.SetFocus
            Exit Sub
        End If
    ElseIf form_type = "create" Then
        If Text4.Enabled = True Then 'admin wants to create an account for this user
            MsgBox "Empty fields not allowed", vbExclamation
            Text4.SetFocus
            Exit Sub
        End If
    Else 'if profile
        MsgBox "Empty fields not allowed", vbExclamation
        Text4.SetFocus
        Exit Sub
    End If
End If
'modified
'If Text5.Text = "" Then
 '   MsgBox "Empty fields not allowed", vbExclamation
  '  Text5.SetFocus
   ' Exit Sub
'End If
If Text6.Text = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Text6.SetFocus
    Exit Sub
Else
    Dim isValid As Boolean
    isValid = Text6.Text Like "[09]##########"
    If Not isValid Then
        Text6.SetFocus
        MsgBox "Set valid mobile number", vbExclamation
        Exit Sub
    End If
End If
If Combo1.Text = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Combo1.SetFocus
    Exit Sub
End If
'modified
'Set rs = Nothing
'Call set_rec_getData(rs, cn, "SELECT * FROM users where user_id = '" & Text1.Text & "'")
'If rs.RecordCount = 1 Then
'    MsgBox "UserID Already Exist", vbExclamation
'    Text1.Text = ""
'    Text1.SetFocus
'    Exit Sub
'End If
'Set rs = Nothing
'Call set_rec_getData(rs, cn, "SELECT * FROM users where name = '" & Text2.Text & "'")
'If rs.RecordCount = 1 Then
'    MsgBox "Name Already Exist", vbExclamation
'    Text2.Text = ""
'    Text2.SetFocus
'    Exit Sub
'End If
'Set rs = Nothing
'Call set_rec_getData(rs, cn, "SELECT * FROM accounts where username = '" & Text3.Text & "'")
'If rs.RecordCount = 1 Then
'    MsgBox "Username Already Exist", vbExclamation
'    Text3.Text = ""
'    Text3.SetFocus
'    Exit Sub
'End If


Set rs = Nothing
'modifed lahat ng may if else na form type
'checking ng may kamuka
'users id
    If form_type = "create" Then
        Call set_rec_getData(rs, cn, "SELECT * FROM users where user_id = '" & Text1.Text & "'")
    ElseIf form_type = "modify" Then
        Call set_rec_getData(rs, cn, "SELECT * FROM users where user_id = '" & Text1.Text & "' and not user_id = '" & selected_id & "'")
    Else
        Call set_rec_getData(rs, cn, "SELECT * FROM users where user_id = '" & Text1.Text & "' and not user_id = '" & current_id & "'")
    
    End If
    If rs.RecordCount >= 1 Then
        MsgBox "UserID Already Exist", vbExclamation
        Text1.Text = ""
        Text1.SetFocus
        Exit Sub
    End If
Set rs = Nothing
'name
    If form_type = "create" Then
        Call set_rec_getData(rs, cn, "SELECT * FROM users where name = '" & Text2.Text & "'")
    ElseIf form_type = "modify" Then
        Call set_rec_getData(rs, cn, "SELECT * FROM users where name = '" & Text2.Text & "'  and not user_id = '" & selected_id & "'")
    Else 'profile
        Call set_rec_getData(rs, cn, "SELECT * FROM users where name = '" & Text2.Text & "'  and not user_id = '" & current_id & "'")
    
    End If
    If rs.RecordCount >= 1 Then
        MsgBox "Name Already Exist", vbExclamation
        Text2.Text = ""
        Text2.SetFocus
        Exit Sub
    End If
    
'username
Set rs = Nothing
    If form_type = "create" Then
        If Text3.Enabled = True Then
            Call set_rec_getData(rs, cn, "SELECT * FROM accounts where username = '" & Text3.Text & "'")
            If rs.RecordCount >= 1 Then
                MsgBox "Username Already Exist", vbExclamation
                Text3.Text = ""
                Text3.SetFocus
                Exit Sub
            End If

        End If
    ElseIf form_type = "modify" Then
        If Text3.Enabled = True Then
            Call set_rec_getData(rs, cn, "SELECT * FROM accounts where username = '" & Text3.Text & "'  and not user_id = '" & selected_id & "'")
             If rs.RecordCount >= 1 Then
                MsgBox "Username Already Exist", vbExclamation
                Text3.Text = ""
                Text3.SetFocus
                Exit Sub
            End If
        End If
    Else 'profile
        Call set_rec_getData(rs, cn, "SELECT * FROM accounts where username = '" & Text3.Text & "'  and not user_id = '" & current_id & "'")
         If rs.RecordCount >= 1 Then
                MsgBox "Username Already Exist", vbExclamation
                Text3.Text = ""
                Text3.SetFocus
                Exit Sub
        End If
    End If

'phone

Set rs = Nothing
    If form_type = "create" Then
        If Text6.Enabled = True Then
            Call set_rec_getData(rs, cn, "SELECT * FROM users where phone = '" & Text6.Text & "'")
            If rs.RecordCount >= 1 Then
                MsgBox "Phone Already Registered", vbExclamation
                Text6.Text = "09"
                Text6.SetFocus
                Exit Sub
            End If

        End If
    ElseIf form_type = "modify" Then
        If Text6.Enabled = True Then
            Call set_rec_getData(rs, cn, "SELECT * FROM users where phone = '" & Text6.Text & "'  and not user_id = '" & selected_id & "'")
             If rs.RecordCount >= 1 Then
                MsgBox "Phone Already Registered", vbExclamation
                Text6.Text = "09"
                Text6.SetFocus
                Exit Sub
            End If
        End If
    Else 'profile
        If Text6.Enabled = True Then
            Call set_rec_getData(rs, cn, "SELECT * FROM users where phone = '" & Text6.Text & "'  and not user_id = '" & selected_id & "'")
             If rs.RecordCount >= 1 Then
                MsgBox "Phone Already Registered", vbExclamation
                Text6.Text = "09"
                Text6.SetFocus
                Exit Sub
            End If
        End If
    End If
    
'inserting and updating
If form_type = "modify" Then
    'admin wants to create account for this one
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "update users set user_id = '" & Text1.Text & "', email = '" & Text5.Text & "', name = '" & Text2.Text & "', phone = '" & Text6.Text & "',  role = '" & Combo1.Text & "' where user_id = '" & selected_id & "'")
    Set rs = Nothing
    'check kung may account
    Call set_rec_getData(rs, cn, "SELECT * FROM accounts where user_id = '" & selected_id & "'")
        If Not rs.RecordCount = 0 Then
            Set rs = Nothing
            Call set_rec_getData(rs, cn, "update accounts set user_id = '" & Text1.Text & "', username = '" & Text3.Text & "', password = AES_ENCRYPT('" & Text4.Text & "','cictpassword') where user_id = '" & selected_id & "'")
        Else
            'walang account pero gusto ni admin bigyan ng account
            If Text3.Enabled = True Then
                Set rs = Nothing
                Call set_rec_getData(rs, cn, "INSERT INTO accounts (user_id, username, password,date_created,date_expire,acc_status) VALUES ('" & Text1.Text & "', '" & Text3.Text & "', AES_ENCRYPT('" & Text4.Text & "','cictpassword'), now()  ,DATE_ADD(now(), INTERVAL 5 month),'Active')")
            End If
        End If
    MsgBox "Employees Updated!", vbInformation
    Unload Me
ElseIf form_type = "create" Then
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "INSERT INTO users (user_id, email,name, phone,role) VALUES ('" & Text1.Text & "', '" & Text5.Text & "', '" & Text2.Text & "' , '" & Text6.Text & "' ,'" & Combo1.Text & "')")
    'admin wants to create an account for this user
    If Text3.Enabled = True Then
        Set rs = Nothing
        Call set_rec_getData(rs, cn, "INSERT INTO accounts (user_id, username, password,date_created,date_expire,acc_status) VALUES ('" & Text1.Text & "', '" & Text3.Text & "', AES_ENCRYPT('" & Text4.Text & "','cictpassword'), now()  ,DATE_ADD(now(), INTERVAL 5 month),'Active')")
    End If
    MsgBox "Employees Saved!", vbInformation
    Unload Me
ElseIf form_type = "profile" Then
    current_user = Text3.Text
    Set rs = Nothing
    'Call set_rec_getData(rs, cn, "INSERT INTO users (user_id, email,name, phone,role) VALUES ('" & Text1.Text & "', '" & Text5.Text & "', '" & Text2.Text & "' , '" & Text6.Text & "' ,'" & Combo1.Text & "')")
    Call set_rec_getData(rs, cn, "UPDATE users  set email = '" & Text5.Text & "', name = '" & Text2.Text & "', phone = '" & Text6.Text & "',  role = '" & Combo1.Text & "' where user_id = '" & Text1.Text & "'")
    Set rs = Nothing
    'Call set_rec_getData(rs, cn, "INSERT INTO accounts (user_id, username, password,date_created,date_expire,acc_status) VALUES ('" & Text1.Text & "', '" & Text3.Text & "', AES_ENCRYPT('" & Text4.Text & "','cictpassword'), now()  ,DATE_SUB(now(), INTERVAL 5 month),'Active')")
    Call set_rec_getData(rs, cn, "UPDATE accounts set username = '" & Text3.Text & "', password = AES_ENCRYPT('" & Text4.Text & "','cictpassword') where user_id = '" & Text1.Text & "'")
    MsgBox "Employees Saved!", vbInformation
    Unload Me
ElseIf form_type = "request" Then
    current_user = Text3.Text
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "INSERT INTO users (user_id, email,name, phone,role) VALUES ('" & Text1.Text & "', '" & Text5.Text & "', '" & Text2.Text & "' , '" & Text6.Text & "' ,'" & Combo1.Text & "')")
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "INSERT INTO accounts (user_id, username, password,date_created,date_expire,acc_status) VALUES ('" & Text1.Text & "', '" & Text3.Text & "', AES_ENCRYPT('" & Text4.Text & "','cictpassword'), now()  ,DATE_ADD(now(), INTERVAL 5 month),'Active')")
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
    If MsgBox("Do you also want to create an account for the user you're about to create?", vbYesNo) = vbNo Then
        Text3.Enabled = False
        Text4.Enabled = False
    End If
    Command1.Caption = "Save"
    Label8.Caption = "Add Employee Form"
ElseIf form_type = "modify" Then
    Command1.Caption = "Update"
    Label8.Caption = "Employee Modify Form - " & selected_name
    'modified
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "SELECT * FROM users where user_id ='" & selected_id & "'")
        If Not rs.RecordCount = 0 Then
            Text1.Text = rs.Fields("user_id")
            Text2.Text = rs.Fields("name")
            Text5.Text = rs.Fields("email")
            Text6.Text = rs.Fields("phone")
            Combo1.Text = rs.Fields("role")
            Text1.Locked = True
        End If
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "SELECT * FROM accounts where user_id = '" & selected_id & "'")
        If rs.RecordCount = 0 Then 'no account yet
            If MsgBox("User " & selected_name & " doesn't have an account yet, create one?", vbYesNo) = vbNo Then
                Text3.Text = "'No Account'"
                Text4.Text = "'No Account'"
                Text3.Enabled = False
                Text4.Enabled = False
            End If
        Else
            Text3.Text = rs.Fields("username")
            Text4.Text = ""
        End If
    
ElseIf form_type = "profile" Then
    Command1.Caption = "Update"
    Label8.Caption = "Employee Modify Form - " & selected_name
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "SELECT * FROM users LEFT JOIN accounts on accounts.user_id = users.user_id where users.user_id ='" & current_id & "'")
    If Not rs.RecordCount = 0 Then
        Text1.Text = rs.Fields("user_id")
        Text2.Text = rs.Fields("name")
        Text3.Text = rs.Fields("username")
        Text4.Text = ""
        Text5.Text = rs.Fields("email")
        Text6.Text = rs.Fields("phone")
        Combo1.Text = rs.Fields("role")
        Combo1.Enabled = False
            Text1.Locked = True
    End If
    
ElseIf form_type = "request" Then
    Command1.Caption = "Update"
    Label8.Caption = "Add Employee Request Form - " & selected_name
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "SELECT *,CAST(AES_DECRYPT(password, 'cictpassword') AS CHAR(50)) as b from request_account where id = '" & selected_id & "'")
    
        Text4.Text = rs.Fields("b")
        Text4.Enabled = False
        Text1.Text = rs.Fields("id")
        Text1.Enabled = False
        Text3.Text = rs.Fields("username")
        Text3.Enabled = False
            Text1.Locked = True
        
End If

End Sub

Private Sub Form_Unload(Cancel As Integer)
If Not form_type = "profile" Then
    Form1.cmdfill.Value = True
End If
If Not form_type = "request" Then
    Form7.cmdfill.Value = True
End If

End Sub

