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
      Left            =   255
      TabIndex        =   0
      Top             =   945
      Width           =   1695
      _extentx        =   2990
      _extenty        =   2778
      btype           =   2
      tx              =   ""
      enab            =   -1  'True
      font            =   "form19.frx":7E11
      coltype         =   1
      focusr          =   -1  'True
      bcol            =   14869218
      bcolo           =   14869218
      fcol            =   0
      fcolo           =   0
      mcol            =   12632256
      mptr            =   1
      micon           =   "form19.frx":7E39
      picn            =   "form19.frx":7E57
      pich            =   "form19.frx":D5AF
      umcol           =   -1  'True
      soft            =   0   'False
      picpos          =   0
      ngrey           =   0   'False
      fx              =   0
      hand            =   0   'False
      check           =   0   'False
      value           =   0   'False
   End
   Begin AdministratorSystem.chameleonButton Command1 
      Height          =   1575
      Left            =   2760
      TabIndex        =   1
      Top             =   960
      Width           =   1695
      _extentx        =   2990
      _extenty        =   2778
      btype           =   2
      tx              =   ""
      enab            =   -1  'True
      font            =   "form19.frx":12D07
      coltype         =   1
      focusr          =   -1  'True
      bcol            =   14869218
      bcolo           =   14869218
      fcol            =   0
      fcolo           =   0
      mcol            =   12632256
      mptr            =   1
      micon           =   "form19.frx":12D2F
      picn            =   "form19.frx":12D4D
      pich            =   "form19.frx":17F95
      umcol           =   -1  'True
      soft            =   0   'False
      picpos          =   0
      ngrey           =   0   'False
      fx              =   0
      hand            =   0   'False
      check           =   0   'False
      value           =   0   'False
   End
   Begin AdministratorSystem.chameleonButton Command3 
      Height          =   1575
      Left            =   5280
      TabIndex        =   2
      Top             =   960
      Width           =   1695
      _extentx        =   2990
      _extenty        =   2778
      btype           =   2
      tx              =   ""
      enab            =   -1  'True
      font            =   "form19.frx":1D1DD
      coltype         =   1
      focusr          =   -1  'True
      bcol            =   14869218
      bcolo           =   14869218
      fcol            =   0
      fcolo           =   0
      mcol            =   12632256
      mptr            =   1
      micon           =   "form19.frx":1D205
      picn            =   "form19.frx":1D223
      pich            =   "form19.frx":22013
      umcol           =   -1  'True
      soft            =   0   'False
      picpos          =   0
      ngrey           =   0   'False
      fx              =   0
      hand            =   0   'False
      check           =   0   'False
      value           =   0   'False
   End
End
Attribute VB_Name = "Form19"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Set rs = Nothing
Call set_rec_getData(rs, cn, "SELECT *,c.name as req,d.name as tech, cust_s.signature as cust_signature, admin.signature as admin_signature FROM request_peripherals as a LEFT JOIN users as c ON a.requisitioner = c.user_id left outer join accounts as cust_s on a.requisitioner = cust_s.user_id LEFT OUTER JOIN accounts as admin ON '" & current_id & "' = admin.user_id  LEFT OUTER JOIN users as d ON a.tech_id = d.user_id LEFT OUTER JOIN department as e ON e.dept_id = a.dept_id LEFT OUTER JOIN request_peripherals_details as f ON a.req_id = f.req_id LEFT OUTER JOIN department as g ON g.dept_id =e.dept_id where a.req_id ='" & selected_id & "'")
Set DataReport4.DataSource = rs
With DataReport4
            With .Sections("Section2").Controls
                .Item("label14").Caption = rs.Fields("req")
                 .Item("label15").Caption = rs.Fields("dept_name")
               .Item("label16").Caption = rs.Fields("purpose")
              .Item("label17").Caption = rs.Fields("designation")
               .Item("label18").Caption = rs.Fields("date_requested")
           End With
           If Not rs.Fields("date_approved") = "" Then
                With .Sections("Section5").Controls
                    .Item("date_approved").Caption = rs.Fields("date_approved")
                End With
           End If
           With .Sections("Section5").Controls
                .Item("label27").Caption = "Generated By: " & current_user_name & ", " & Date & " " & Time
            End With
End With
'signatures
If IsNull(rs.Fields("cust_signature")) = False Then
    Set DataReport4.Sections("Section5").Controls.Item("Image3").Picture = LoadPicture(App.Path & "\" & rs.Fields("cust_signature"))
End If
If rs.Fields("req_status") = "Received" Then
    Set DataReport4.Sections("Section5").Controls.Item("Image4").Picture = LoadPicture(App.Path & "\" & rs.Fields("cust_signature"))
End If
If Not rs.Fields("date_approved") = "" Then
    Set DataReport4.Sections("Section5").Controls.Item("Image5").Picture = LoadPicture(App.Path & "\" & rs.Fields("admin_signature"))
End If

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

Private Sub command5_Click()
Set rs = Nothing
Set rs2 = Nothing
Set rs3 = Nothing
Set rs4 = Nothing
Printer.PaperSize = 1

Call set_rec_getData(rs, cn, "SELECT *,c.name as custodian, d.name as technician FROM assessment_reports as a LEFT JOIN assessment_details as b ON a.rep_id = b.rep_id left outer join comp_details on b.comp_id = comp_details.comp_id LEFT OUTER JOIN ( select room_custodian_id, room_technician_id, room_name, concat_ws('',dept_name,'') as dept_name,room_id from (select r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name', r.room_custodian_id, r.room_technician_id from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = a.room_id LEFT JOIN users as c ON rooms.room_custodian_id = c.user_id LEFT OUTER JOIN users as d ON rooms.room_technician_id = d.user_id where a.rep_id = '" & selected_id & "' order by comp_details.pc_no asc")
Call set_rec_getData2(rs2, cn, "SELECT cust_acc.signature as cust_signature,tech_acc.signature as tech_signature, curr_acc.signature as curr_signature from assessment_reports as a left outer join ( select room_custodian_id, room_technician_id, room_id from (select r.room_id,r.room_custodian_id, r.room_technician_id from room r left join department on department.dept_id = r.dept_id) as rooms) rooms on rooms.room_id = a.room_id LEFT JOIN users as c ON rooms.room_custodian_id = c.user_id LEFT JOIN accounts as cust_acc ON rooms.room_custodian_id = cust_acc.user_id LEFT JOIN accounts as tech_acc ON rooms.room_technician_id = tech_acc.user_id LEFT JOIN accounts as curr_acc ON '" & current_id & "' = curr_acc.user_id  where a.rep_id = '" & selected_id & "'")
Call set_rec_getData3(rs3, cn, "SELECT htech.signature as tech_sign, admin.signature as admin_sign from (select accounts.signature, users.user_id from users, accounts where users.user_id = accounts.user_id and users.role = 'Admin') as admin, (select accounts.signature, users.user_id from users, accounts where users.user_id = accounts.user_id and users.role = 'Main Technician') as htech")
Call set_rec_getData4(rs4, cn, "SELECT COUNT(*) as 'working' from assessment_details where rep_id= '" & selected_id & "' ")
Set DataReport2.DataSource = rs
   With DataReport2
    
            With .Sections("Section2").Controls
            .Item("label7").Caption = rs.Fields("technician")
               .Item("label6").Caption = rs.Fields("custodian")
               .Item("label4").Caption = rs.RecordCount
               .Item("working").Caption = rs4.Fields("working")
           End With
           With .Sections("Section4").Controls
            .Item("room_name").Caption = rs.Fields("room_name")
            .Item("date_done").Caption = "As Of " & rs.Fields("date")
            If rs.Fields("category") = "Repair Report" Then
                .Item("label3").Caption = "REPAIR REPORT"
            End If
            End With
            With .Sections("Section5").Controls
            .Item("genBy").Caption = "Generated By: " & current_user_name & ", " & Date & " " & Time
            End With
   End With
   'signatures
    Dim cust_signed As Integer
    Dim tech_signed As Integer
    Dim admin_signed As Integer
    
    cust_signed = rs.Fields("cust_signed")
    tech_signed = rs.Fields("htech_signed")
    admin_signed = rs.Fields("admin_signed")
   
   If cust_signed = 1 Then
        Set DataReport2.Sections("Section5").Controls.Item("Image21").Picture = LoadPicture(App.Path & "\" & rs2.Fields("cust_signature"))
   End If
   If admin_signed = 1 Then
    If current_role = "Admin" Then
                Set DataReport2.Sections("Section5").Controls.Item("Image20").Picture = LoadPicture(App.Path & "\" & rs2.Fields("curr_signature"))
    'else kunin ung pirma ng kahit sinong admin
    Else
        Do While Not rs3.EOF
            If IsNull(rs3.Fields("admin_sign")) = False Then
                Set DataReport2.Sections("Section5").Controls.Item("Image20").Picture = LoadPicture(App.Path & "\" & rs3.Fields("admin_sign"))
                Exit Do
            End If
        Loop
        
    End If
   End If
  If tech_signed = 1 Then
    If current_role = "Main Technician" Then
                Set DataReport2.Sections("Section5").Controls.Item("Image19").Picture = LoadPicture(App.Path & "\" & rs2.Fields("curr_signature"))
    'else kunin ung pirma ng kahit sinong tech
    Else
        Do While Not rs3.EOF
            If IsNull(rs3.Fields("tech_sign")) = False Then
                Set DataReport2.Sections("Section5").Controls.Item("Image19").Picture = LoadPicture(App.Path & "\" & rs3.Fields("tech_sign"))
                Exit Do
            End If
        Loop
    End If
   End If
    
    
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
