VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form Form20 
   BorderStyle     =   0  'None
   ClientHeight    =   10215
   ClientLeft      =   4965
   ClientTop       =   420
   ClientWidth     =   10050
   LinkTopic       =   "Form20"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "Form21.frx":0000
   ScaleHeight     =   10215
   ScaleWidth      =   10050
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "Cancel"
      Height          =   510
      Left            =   8430
      TabIndex        =   7
      Top             =   270
      Width           =   1380
   End
   Begin VB.TextBox Text2 
      Height          =   420
      Left            =   8235
      TabIndex        =   6
      Top             =   975
      Width           =   1290
   End
   Begin MSFlexGridLib.MSFlexGrid fgrid1 
      Height          =   7365
      Left            =   525
      TabIndex        =   3
      Top             =   2115
      Width           =   9030
      _ExtentX        =   15928
      _ExtentY        =   12991
      _Version        =   393216
      FixedCols       =   0
      BackColorBkg    =   12632256
      TextStyleFixed  =   2
      FocusRect       =   2
      ScrollBars      =   2
      SelectionMode   =   1
      Appearance      =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.TextBox Text1 
      Height          =   420
      Left            =   1200
      TabIndex        =   2
      Top             =   960
      Width           =   5460
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "PC No. : "
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   405
      Left            =   7125
      TabIndex        =   5
      Top             =   1020
      Width           =   1155
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Double click to select:"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   11.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   405
      Left            =   495
      TabIndex        =   4
      Top             =   1665
      Width           =   7020
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Filter:"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   405
      Left            =   195
      TabIndex        =   1
      Top             =   1035
      Width           =   1155
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Select Room or Computer"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   20.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   465
      Left            =   270
      TabIndex        =   0
      Top             =   285
      Width           =   4605
   End
End
Attribute VB_Name = "Form20"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Unload Me
End Sub

Private Sub fgrid1_DblClick()
Dim id As Integer
'MsgBox "" '& fgrid1.TextMatrix(fgrid1, 0)
id = fgrid1.TextMatrix(fgrid1.Row, 0) 'selected room id or comp id

If Not Text2.Text = "" Then
    If form_type = "room" Then 'selected id = comp_id, id = from grid
            'check kung may nakaassign n na pc no
            Set rs = Nothing
            Call set_rec_getData(rs, cn, "select * from comp_details where room_id = '" & id & "' and pc_no = '" & Text2.Text & "'")
            If rs.RecordCount = 0 Then
                'check if nakaassign na sa room/if imomodify
                Set rs = Nothing
                Call set_rec_getData(rs, cn, "select * from comp_details where comp_id = '" & selected_id & "'")
                If rs.RecordCount > 0 Then
                    Set rs = Nothing
                    Call set_rec_getData(rs, cn, "update comp_details set room_id = '" & id & "', pc_no = '" & Text2.Text & "' where comp_id = '" & selected_id & "'")
                    MsgBox "Inserted Successfully!"
                Else
                    Set rs = Nothing
                    Call set_rec_getData(rs, cn, "insert into comp_details values('" & selected_id & "', '" & id & "', '" & Text2.Text & "', 'Working')")
                    MsgBox "Inserted Successfully!"
                End If
                Unload Me
            Else
                MsgBox "PC No already exists!", vbExclamation
            End If
            
    Else
    'selecting computer
        'check kung may nakaassign n na pc no
            Set rs = Nothing
            Call set_rec_getData(rs, cn, "select * from comp_details where room_id = '" & selected_id & "' and pc_no = '" & Text2.Text & "'")
            If rs.RecordCount = 0 Then
                Set rs = Nothing
                Call set_rec_getData(rs, cn, "insert into comp_details values('" & id & "', '" & selected_id & "', '" & Text2.Text & "', 'Working')")
                MsgBox "Inserted Successfully!"
                Unload Me
            Else
                MsgBox "PC No already exists!", vbExclamation
            End If
    End If
    
Else
    MsgBox "Please provide the PC No of the computer"
End If
End Sub

Private Sub Form_Load()
Set rs = Nothing
Set cn = Nothing
Call ConnectMySQL

If form_type = "computer" Then
    Label1.Caption = "Select Computer..."
    Call set_rec_getData(rs, cn, "select * from computers where not exists (select * from comp_details where comp_details.comp_id = computers.comp_id)")
    Call fillCompgrid
  Else
    Label1.Caption = "Select Room..."
    Call set_rec_getData(rs, cn, "select *, d.name as cust, e.name as tech from ( select room_name, concat_ws('',dept_name,'') as dept_name,room_id, building, floor, room_custodian_id as cust_id, room_technician_id as tech_id from (select r.room_custodian_id, r.room_technician_id, r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name' from room r left join department on department.dept_id = r.dept_id) as rooms) as rooms LEFT JOIN users as d ON rooms.cust_id = d.user_id LEFT JOIN users as e ON rooms.tech_id = e.user_id order by rooms.room_id desc")
    Call fillRoomgrid
End If
End Sub

Private Sub fillCompgrid()
    fgrid1.Clear
    fgrid1.FormatString = "Comp Id" & vbTab & _
    "Model      " & vbTab & _
    "Operating System  " & vbTab & _
    "Motherboard      " & vbTab & _
    "Processor        " & vbTab & _
    "RAM  " & vbTab & _
    "HDD   "
    fgrid1.Rows = 1
    If Not rs.RecordCount = 0 Then
     rs.MoveFirst
     Dim assto As String
    
     While Not rs.EOF
     'MsgBox rs.Fields("loan_status")
     
        fgrid1.AddItem rs.Fields("comp_id") & vbTab & rs.Fields("model") & vbTab & rs.Fields("os") & vbTab & rs.Fields("motherboard") & vbTab & rs.Fields("processor") & vbTab & rs.Fields("ram") & vbTab & rs.Fields("hdd")
        
         rs.MoveNext
     Wend
    End If
fgrid1.ColWidth(0) = 0

End Sub

Private Sub fillRoomgrid()
    fgrid1.Clear
    fgrid1.FormatString = "Room Id" & vbTab & _
    "Department    " & vbTab & _
    "Room           " & vbTab & _
    "Building                            " & vbTab & _
    "Floor  " & vbTab & _
    "Custodian                  " & vbTab & _
    "Technician                   "
    fgrid1.Rows = 1
    If Not rs.RecordCount = 0 Then
    rs.MoveFirst
    Dim assto As String
   
    While Not rs.EOF
    'MsgBox rs.Fields("loan_status")
    
       fgrid1.AddItem rs.Fields("room_id") & vbTab & rs.Fields("dept_name") & vbTab & rs.Fields("room_name") & vbTab & rs.Fields("building") & vbTab & rs.Fields("floor") & vbTab & rs.Fields("cust") & vbTab & rs.Fields("tech")
       
        rs.MoveNext
    Wend
End If
fgrid1.ColWidth(0) = 0
End Sub


Private Sub Text1_Change()
If Not Text1.Text = "" Then
    If form_type = "computer" Then
        Set rs = Nothing
        Call set_rec_getData(rs, cn, "select * from computers where not exists (select * from comp_details where comp_details.comp_id = computers.comp_id) and motherboard like '%" & Text1.Text & "%'")
        fillCompgrid
    Else
        Set rs = Nothing
        Call set_rec_getData(rs, cn, "select *, d.name as cust, e.name as tech from ( select room_name, concat_ws('',dept_name,'') as dept_name,room_id, building, floor, room_custodian_id as cust_id, room_technician_id as tech_id from (select r.room_custodian_id, r.room_technician_id, r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name' from room r left join department on department.dept_id = r.dept_id) as rooms) as rooms LEFT JOIN users as d ON rooms.cust_id = d.user_id LEFT JOIN users as e ON rooms.tech_id = e.user_id where d.name like '%" & Text1.Text & "%' or e.name like '%" & Text1.Text & "%' or room_name like '%" & Text1.Text & "%' or dept_name like '%" & Text1.Text & "%' or building like '%" & Text1.Text & "%' or floor like '%" & Text1.Text & "%' order by rooms.room_id desc")
        fillRoomgrid
    End If
Else
    If form_type = "computer" Then
        Set rs = Nothing
        Call set_rec_getData(rs, cn, "select * from computers where not exists (select * from comp_details where comp_details.comp_id = computers.comp_id)")
        fillCompgrid
    Else
        Set rs = Nothing
        Call set_rec_getData(rs, cn, "select *, d.name as cust, e.name as tech from ( select room_name, concat_ws('',dept_name,'') as dept_name,room_id, building, floor, room_custodian_id as cust_id, room_technician_id as tech_id from (select r.room_custodian_id, r.room_technician_id, r.floor,department.dept_name, r.building ,r.room_id, CONCAT_ws(' ',department.dept_name,r.room_name) as 'room_name' from room r left join department on department.dept_id = r.dept_id) as rooms) as rooms LEFT JOIN users as d ON rooms.cust_id = d.user_id LEFT JOIN users as e ON rooms.tech_id = e.user_id order by rooms.room_id desc")
        fillRoomgrid
    End If
End If


End Sub
