VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form14 
   BorderStyle     =   0  'None
   Caption         =   "Edit Room"
   ClientHeight    =   7380
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9750
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
   Picture         =   "Form14.frx":0000
   ScaleHeight     =   7380
   ScaleWidth      =   9750
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox Combo8 
      Height          =   345
      Left            =   465
      TabIndex        =   19
      Top             =   2280
      Width           =   5700
   End
   Begin VB.ComboBox Combo7 
      Height          =   345
      ItemData        =   "Form14.frx":A5D68
      Left            =   7800
      List            =   "Form14.frx":A5D6F
      TabIndex        =   18
      Top             =   4695
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.ComboBox Combo6 
      Height          =   345
      ItemData        =   "Form14.frx":A5D76
      Left            =   7800
      List            =   "Form14.frx":A5D7D
      TabIndex        =   17
      Top             =   3960
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.ComboBox Combo5 
      Height          =   345
      ItemData        =   "Form14.frx":A5D84
      Left            =   7800
      List            =   "Form14.frx":A5D8B
      TabIndex        =   16
      Top             =   3240
      Visible         =   0   'False
      Width           =   735
   End
   Begin MSComDlg.CommonDialog cd1 
      Left            =   4560
      Top             =   3600
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Browse"
      Height          =   495
      Left            =   7320
      TabIndex        =   15
      Top             =   5520
      Width           =   1935
   End
   Begin VB.TextBox Text3 
      Height          =   495
      Left            =   480
      Locked          =   -1  'True
      TabIndex        =   13
      Text            =   " "
      Top             =   5520
      Width           =   6855
   End
   Begin VB.ComboBox Combo4 
      Height          =   345
      ItemData        =   "Form14.frx":A5D92
      Left            =   480
      List            =   "Form14.frx":A5D99
      TabIndex        =   11
      Top             =   4680
      Width           =   8655
   End
   Begin VB.ComboBox Combo3 
      Height          =   345
      ItemData        =   "Form14.frx":A5DA0
      Left            =   480
      List            =   "Form14.frx":A5DA7
      TabIndex        =   9
      Top             =   3960
      Width           =   8655
   End
   Begin VB.ComboBox Combo2 
      Height          =   345
      ItemData        =   "Form14.frx":A5DAE
      Left            =   480
      List            =   "Form14.frx":A5DB5
      TabIndex        =   7
      Top             =   3240
      Width           =   8655
   End
   Begin VB.ComboBox Combo1 
      Height          =   345
      ItemData        =   "Form14.frx":A5DBC
      Left            =   6240
      List            =   "Form14.frx":A5DC3
      TabIndex        =   6
      Top             =   2280
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   615
      Left            =   6960
      TabIndex        =   5
      Top             =   6240
      Width           =   2295
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Save"
      Height          =   615
      Left            =   4920
      TabIndex        =   4
      Top             =   6240
      Width           =   1935
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   480
      TabIndex        =   0
      Text            =   " "
      Top             =   1320
      Width           =   8535
   End
   Begin VB.Label Label7 
      BackStyle       =   0  'Transparent
      Caption         =   "Room Schedule:"
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
      Left            =   480
      TabIndex        =   14
      Top             =   5160
      Width           =   4215
   End
   Begin VB.Label Label6 
      BackStyle       =   0  'Transparent
      Caption         =   "Room Custodian"
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
      Left            =   480
      TabIndex        =   12
      Top             =   4440
      Width           =   4215
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "Room Technician"
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
      Left            =   480
      TabIndex        =   10
      Top             =   3720
      Width           =   4215
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Department:"
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
      Left            =   480
      TabIndex        =   8
      Top             =   3000
      Width           =   4215
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Floor:"
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
      Left            =   6240
      TabIndex        =   3
      Top             =   2040
      Width           =   4215
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Building:"
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
      Left            =   480
      TabIndex        =   2
      Top             =   1920
      Width           =   4215
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Room Name:"
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
      Left            =   480
      TabIndex        =   1
      Top             =   960
      Width           =   4215
   End
End
Attribute VB_Name = "Form14"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Combo1_KeyPress(KeyAscii As Integer)
KeyAscii = 0
Beep
End Sub

Private Sub Combo2_Click()
Combo5.ListIndex = Combo2.ListIndex
End Sub

Private Sub Combo2_KeyPress(KeyAscii As Integer)
KeyAscii = 0
Beep
End Sub

Private Sub Combo3_Click()
Combo6.ListIndex = Combo3.ListIndex
End Sub

Private Sub Combo3_KeyPress(KeyAscii As Integer)
KeyAscii = 0
Beep
End Sub

Private Sub Combo4_Click()
Combo7.ListIndex = Combo4.ListIndex
End Sub

Private Sub Combo4_KeyPress(KeyAscii As Integer)
KeyAscii = 0
Beep
End Sub



Private Sub Combo8_KeyPress(KeyAscii As Integer)
    KeyAscii = AutoMatchCBBox(Combo8, KeyAscii)
End Sub

Private Sub Command1_Click()
If Text1.Text = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Text1.SetFocus
    Exit Sub
End If
If Trim(Combo8.Text) = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Combo8.SetFocus
    Exit Sub
Else
    Dim selected_room_name As String
    selected_room_name = Combo2.Text & " " & Text1.Text
    Set rs2 = Nothing
    If form_type = "modify" Then
        Call set_rec_getData2(rs2, cn, "select rooms.room_name from room left join ( select room_name, room_id from (select CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name', r.room_id from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = room.room_id where rooms.room_name = '" & selected_room_name & "' and not room.room_id = '" & selected_id & "'")
        If Not rs2.RecordCount = 0 Then
            MsgBox selected_room_name & " room already exists!", vbExclamation
            Exit Sub
        End If
    Else
        Call set_rec_getData2(rs2, cn, "select rooms.room_name from room left join ( select room_name, room_id from (select CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name', r.room_id from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = room.room_id where rooms.room_name = '" & selected_room_name & "'")
        If Not rs2.RecordCount = 0 Then
            MsgBox selected_room_name & " room already exists!", vbExclamation
            Exit Sub
        End If
    End If
End If
If Trim(Combo1.Text) = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Combo1.SetFocus
    Exit Sub
End If
If Combo2.Text = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Combo2.SetFocus
    Exit Sub
End If
'If Combo3.Text = "" Then
'    MsgBox "Empty fields not allowed", vbExclamation
'    Combo3.SetFocus
'    Exit Sub
'End If
'If Combo4.Text = "" Then
'    MsgBox "Empty fields not allowed", vbExclamation
'    Combo4.SetFocus
'    Exit Sub
'End If
If form_type = "modify" Then
    Set rs = Nothing
    If Trim(Combo3.Text) = "" Or Trim(Combo4.Text) = "" Then
        If Trim(Combo3.Text) = "" Then
            Call set_rec_getData(rs, cn, "update room set dept_id = NULL, room_custodian_id = '" & Combo7.Text & "', room_technician_id = NULL, room_name = '" & Text1.Text & "',  building = '" & Trim(Combo8.Text) & "',floor = '" & Trim(Combo1.Text) & "',room_schedule = '" & image_name & "' where room_id = '" & selected_id & "'")
        End If
        If Trim(Combo4.Text) = "" Then
            Call set_rec_getData(rs, cn, "update room set dept_id = NULL, room_custodian_id = NULL, room_technician_id = '" & Combo6.Text & "', room_name = '" & Text1.Text & "',  building = '" & Trim(Combo8.Text) & "',floor = '" & Trim(Combo1.Text) & "',room_schedule = '" & image_name & "' where room_id = '" & selected_id & "'")
        End If
    Else
        Call set_rec_getData(rs, cn, "update room set dept_id = '" & Combo5.Text & "', room_custodian_id = '" & Combo7.Text & "', room_technician_id = '" & Combo6.Text & "', room_name = '" & Text1.Text & "',  building = '" & Trim(Combo8.Text) & "',floor = '" & Trim(Combo1.Text) & "',room_schedule = '" & image_name & "' where room_id = '" & selected_id & "'")
    End If
    
    MsgBox "Rooms Updated!", vbInformation
    Unload Me
ElseIf form_type = "create" Then
    Set rs = Nothing
    If Trim(Combo3.Text) = "" Or Trim(Combo4.Text) = "" Then
        If Trim(Combo3.Text) = "" Then
          Call set_rec_getData(rs, cn, "INSERT INTO room (dept_id, room_custodian_id,room_technician_id, room_name,building,floor,room_schedule) VALUES ('" & Combo5.Text & "', '" & Combo7.Text & "', NULL , '" & Text1.Text & "' , '" & Trim(Combo8.Text) & "' , '" & Trim(Combo1.Text) & "' , '" & image_name & "')")
        End If
        If Trim(Combo4.Text) = "" Then
            Call set_rec_getData(rs, cn, "INSERT INTO room (dept_id, room_custodian_id,room_technician_id, room_name,building,floor,room_schedule) VALUES ('" & Combo5.Text & "', NULL, '" & Combo6.Text & "' , '" & Text1.Text & "' , '" & Trim(Combo8.Text) & "' , '" & Trim(Combo1.Text) & "' , '" & image_name & "')")
        End If
    Else
       Call set_rec_getData(rs, cn, "INSERT INTO room (dept_id, room_custodian_id,room_technician_id, room_name,building,floor,room_schedule) VALUES ('" & Combo5.Text & "', '" & Combo7.Text & "', '" & Combo6.Text & "' , '" & Text1.Text & "' , '" & Trim(Combo8.Text) & "' , '" & Trim(Combo1.Text) & "' , '" & image_name & "')")
    End If
    
    MsgBox "Room Saved!", vbInformation
    Unload Me
End If
'INSERT INTO testtable VALUE(AES_ENCRYPT('mytext','passw'));
End Sub

Private Sub Command2_Click()
Unload Me
End Sub

Private Sub Command3_Click()
On Error Resume Next
cd1.ShowOpen
Dim random As Integer
random = Rnd(10000)
image_name = random & "_" & cd1.FileTitle
FileCopy cd1.FileName, App.Path & "\images\" & image_name
Text3.Text = cd1.FileTitle
End Sub

Private Sub Form_Load()
Combo8.Clear
Set rs = Nothing
Call set_rec_getData(rs, cn, "Select distinct building from room")
If Not rs.RecordCount = 0 Then
 rs.MoveFirst
 While Not rs.EOF
    Combo8.AddItem Trim(rs.Fields("building"))
    rs.MoveNext
 Wend
End If
'combo 234 = depat, tech, cust
'combo 567 = ids

If Not current_role = "Admin" Then
    Combo4.Enabled = False
    Combo7.Enabled = False
End If
'department
 Set rs = Nothing
    Call set_rec_getData(rs, cn, "SELECT * FROM department")
    Combo2.Clear
    Combo5.Clear
    If Not rs.RecordCount = 0 Then
        rs.MoveFirst
        While Not rs.EOF
        Combo2.AddItem rs.Fields("dept_name")
        Combo5.AddItem rs.Fields("dept_id")
        rs.MoveNext
        Wend
    End If

'room tech
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "SELECT * FROM users where role = 'Technician'")
    Combo3.Clear
    Combo6.Clear
    If Not rs.RecordCount = 0 Then
        rs.MoveFirst
        While Not rs.EOF
            Combo3.AddItem rs.Fields("name")
            Combo6.AddItem rs.Fields("user_id")
        rs.MoveNext
        Wend
    End If
'room cust
     Set rs = Nothing
    Call set_rec_getData(rs, cn, "select * from users u where not exists(select null from room r where r.room_custodian_id = u.user_id) and role = 'Custodian'")
    Combo4.Clear
    Combo7.Clear
    If Not rs.RecordCount = 0 Then
        rs.MoveFirst
        While Not rs.EOF
        Combo4.AddItem rs.Fields("name")
        Combo7.AddItem rs.Fields("user_id")
        rs.MoveNext
        Wend
    End If
Combo1.Clear
Combo1.AddItem "1"
Combo1.AddItem "2"
Combo1.AddItem "3"
Combo1.AddItem "4"
Combo1.AddItem "5"
'Set cn = Nothing
Set rs = Nothing
'Call ConnectMySQL("192.168.1.5", "user", "1234", "cict")
If form_type = "create" Then
    Command1.Caption = "Save"
    Me.Caption = "Add Room Form"
ElseIf form_type = "modify" Then
    Command1.Caption = "Update"
    Me.Caption = "Room Modify Form"
    Set rs = Nothing
    'modify
    '( select dept_room, concat_ws('',dept_name,'') as dept_name,room_id from (select r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'dept_room' from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = room.room_id
    Call set_rec_getData(rs, cn, "SELECT * FROM ( select dept_room, room_name,room_custodian_id, room_technician_id,room_schedule, concat_ws('',dept_name,'') as dept_name,room_id, dept_id,floor, building from (select r.floor,department.dept_name,r.room_schedule, r.building, r.room_custodian_id, r.room_technician_id ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'dept_room',r.room_name, department.dept_id from room r left join department on department.dept_id = r.dept_id) as rooms) rooms where rooms.room_id = '" & selected_id & "'")
        If Not rs.RecordCount = 0 Then
            Combo2.Text = rs.Fields("dept_name")
            If IsNull(rs.Fields("dept_id")) = False Then
                Combo5.Text = rs.Fields("dept_id")
            End If
            Set rs2 = Nothing
            If IsNull(rs.Fields("room_custodian_id")) = False Then
                Call set_rec_getData2(rs2, cn, "SELECT * FROM users where user_id  ='" & rs.Fields("room_custodian_id") & "'")
                Combo4.Text = rs2.Fields("name")
                Combo7.Text = rs2.Fields("user_id")
            End If
            Set rs2 = Nothing
            If IsNull(rs.Fields("room_technician_id")) = False Then
                Call set_rec_getData2(rs2, cn, "SELECT * FROM users where user_id  ='" & rs.Fields("room_technician_id") & "'")
                Combo3.Text = rs2.Fields("name")
                Combo6.Text = rs2.Fields("user_id")
            End If
            If IsNull(rs.Fields("room_schedule")) = False Then
            Text3.Text = rs.Fields("room_schedule")
            End If
            Text1.Text = rs.Fields("room_name")
            Combo8.Text = rs.Fields("building")
            Combo1.Text = rs.Fields("floor")
            
        End If
End If

End Sub

Private Sub Form_Unload(Cancel As Integer)
If Not form_type = "profile" Then
    Form12.cmdfill.Value = True
End If
If form_type = "request" Then
    Form7.cmdfill.Value = True
End If

End Sub

