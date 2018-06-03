VERSION 5.00
Begin VB.Form Form21 
   BorderStyle     =   0  'None
   Caption         =   "Form21"
   ClientHeight    =   7455
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9765
   LinkTopic       =   "Form21"
   MaxButton       =   0   'False
   Picture         =   "Form22.frx":0000
   ScaleHeight     =   7455
   ScaleWidth      =   9765
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox Combo2 
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   630
      TabIndex        =   15
      Top             =   2925
      Width           =   8550
   End
   Begin VB.ComboBox Combo1 
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   405
      Left            =   585
      TabIndex        =   14
      Top             =   3840
      Width           =   8550
   End
   Begin VB.TextBox txtToolTip 
      Height          =   285
      Left            =   630
      TabIndex        =   13
      Text            =   "txtToolTip"
      Top             =   855
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Save"
      Height          =   615
      Left            =   4845
      TabIndex        =   12
      Top             =   6345
      Width           =   1935
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   615
      Left            =   6885
      TabIndex        =   11
      Top             =   6345
      Width           =   2295
   End
   Begin VB.TextBox Text4 
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   615
      MaxLength       =   13
      TabIndex        =   5
      Top             =   1830
      Width           =   8535
   End
   Begin VB.TextBox Text3 
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   600
      TabIndex        =   3
      Top             =   4815
      Width           =   8535
   End
   Begin VB.Label Label8 
      BackStyle       =   0  'Transparent
      Caption         =   "*"
      ForeColor       =   &H000000FF&
      Height          =   390
      Left            =   2685
      TabIndex        =   10
      Top             =   4425
      Width           =   690
   End
   Begin VB.Label Label7 
      BackStyle       =   0  'Transparent
      Caption         =   "*"
      ForeColor       =   &H000000FF&
      Height          =   390
      Left            =   1170
      TabIndex        =   9
      Top             =   3465
      Width           =   690
   End
   Begin VB.Label Label6 
      BackStyle       =   0  'Transparent
      Caption         =   "*"
      ForeColor       =   &H000000FF&
      Height          =   390
      Left            =   2145
      TabIndex        =   8
      Top             =   2415
      Width           =   690
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "*"
      ForeColor       =   &H000000FF&
      Height          =   390
      Left            =   2790
      TabIndex        =   7
      Top             =   1455
      Width           =   690
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "Computer Serial Number:"
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
      Top             =   1455
      Width           =   4215
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "Computer Specifications:"
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
      TabIndex        =   4
      Top             =   4455
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
      Left            =   570
      TabIndex        =   2
      Top             =   3480
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
      Left            =   585
      TabIndex        =   1
      Top             =   2445
      Width           =   4215
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
      Left            =   330
      TabIndex        =   0
      Top             =   165
      Width           =   3735
   End
End
Attribute VB_Name = "Form21"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Option Compare Text

Private Sub Combo1_KeyPress(KeyAscii As Integer)
    KeyAscii = AutoMatchCBBox(Combo1, KeyAscii)
End Sub

Private Sub Combo2_KeyPress(KeyAscii As Integer)
    KeyAscii = AutoMatchCBBox(Combo2, KeyAscii)
End Sub

Private Sub Command1_Click()

Dim specs() As String
specs = Split(Text3.Text, "/")
Dim count As Long
Dim idx As Long
Dim length As Integer

For idx = LBound(specs) To UBound(specs)
    If Not specs(idx) = "" Then
     count = count + 1
    End If
Next idx

length = CInt(count)



'check empty textboxes
If Text4.Text = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Text4.SetFocus
    Exit Sub
ElseIf Trim(Combo2.Text) = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Combo2.SetFocus
    Exit Sub
ElseIf Trim(Combo1.Text) = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Combo1.SetFocus
    Exit Sub
ElseIf Text3.Text = "" Then
    MsgBox "Empty fields not allowed", vbExclamation
    Text3.SetFocus
    Exit Sub
End If

'check serial number length - must be 12 - 13 chars
If Len(Text4.Text) < 12 Or Len(Text4.Text) > 13 Then
    MsgBox "Computer Serial Number must be 12-13 characters!"
    Text4.SetFocus
    selectalltext Text4
    Exit Sub
End If

'check if may kamuka
If form_type = "create" Then
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "select * from computers where comp_serial = '" & Text4.Text & "'")
    If rs.RecordCount > 0 Then
        MsgBox "Computer Serial already exists!", vbInformation
        Exit Sub
    Else
        'specs
    End If
ElseIf form_type = "modify" Then
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "select * from computers where comp_serial = '" & Text4.Text & "' and not comp_id = '" & selected_id & "'")
    If rs.RecordCount > 0 Then
        MsgBox "Computer Serial already exists!", vbInformation
        Exit Sub
    Else
        'specs
    End If
End If

'check text3 kung kumpleto ung required fields
If length < 8 Then
    MsgBox "Incomplete!"
    Text3.SetFocus
    selectalltext Text3
    Exit Sub
ElseIf length > 8 Then
    MsgBox "Exceed the number of requirements!"
    Text3.SetFocus
    selectalltext Text3
    Exit Sub
End If

'check kung tama yung nilagay na requirements sa text 3
'vga mouse, kboard
'If Not (specs(4) = "ok" Or specs(4) = "none") Then
'    MsgBox "Keyboard mus t be 'OK' or 'None'. Input: '" & specs(4) & "'"
'End If
'use output = Split(text3.text, /) = output(1) = para makuha ung data
'processor, motherboard, monitor, ram,keyboard(OK/None), mouse,(OK/None), vga, hdd

'saving
If form_type = "modify" Then
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "update computers set os = '" & Trim(Combo2.Text) & "', model = '" & Trim(Combo1.Text) & "', comp_serial = '" & Trim(Text4.Text) & "', processor = '" & Trim(specs(0)) & "', motherboard = '" & Trim(specs(1)) & "', monitor = '" & Trim(specs(2)) & "' , ram = '" & Trim(specs(3)) & "', kboard = '" & Trim(specs(4)) & "', mouse = '" & Trim(specs(5)) & "', vga = '" & Trim(specs(6)) & "', hdd = '" & Trim(specs(7)) & "'")
    MsgBox "Computer Updated!", vbInformation
    Unload Me
ElseIf form_type = "create" Then
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "INSERT INTO computers (os, model, comp_serial,processor, motherboard,monitor,ram,kboard,mouse,vga,hdd) VALUES ('" & Trim(Combo2.Text) & "', '" & Trim(Combo1.Text) & "', '" & Trim(Text4.Text) & "' , '" & Trim(specs(0)) & "' , '" & Trim(specs(1)) & "' , '" & Trim(specs(2)) & "'  ,'" & Trim(specs(3)) & "' ,'" & Trim(specs(4)) & "' ,'" & Trim(specs(5)) & "' , '" & Trim(specs(6)) & "', '" & Trim(specs(7)) & "')")
    MsgBox "Computer Saved!", vbInformation
    Unload Me
End If

End Sub

Private Sub selectalltext(box As TextBox)
 box.SelStart = 0
 box.SelLength = Len(box.Text)
End Sub
Private Sub Command2_Click()
Unload Me
End Sub



Private Sub Form_Load()

tooltip_text = "processor/motherboard serial/monitor serial/ram/keyboard(OK/None)/mouse(OK/None)/vga(BUILT-IN/NONE)/hdd-serial"
    
    With Me.txtToolTip
        .Visible = False
        .Appearance = 0
        .BackColor = &H80000018
    End With
    
Text3.ToolTipText = tooltip_text

Set rs = Nothing

'model combobox
Combo1.Clear
'laman ng combo1 box1
Set rs2 = Nothing
Call set_rec_getData2(rs2, cn, "select distinct model from computers")
If Not rs2.RecordCount = 0 Then
    rs2.MoveFirst
    While Not rs2.EOF
        Combo1.AddItem Trim(rs2.Fields("model"))
        rs2.MoveNext
    Wend
End If

'os combobox
Combo2.Clear
'laman ng combo1 box1
Set rs2 = Nothing
Call set_rec_getData2(rs2, cn, "select distinct os from computers")
If Not rs2.RecordCount = 0 Then
    rs2.MoveFirst
    While Not rs2.EOF
        Combo2.AddItem Trim(rs2.Fields("os"))
        rs2.MoveNext
    Wend
End If

If form_type = "create" Then
    Label11.Caption = "Add Computer Form"
Else
    Label11.Caption = "Computer Modify Form"
    Command1.Caption = "Update"
    Set rs = Nothing
    Call set_rec_getData(rs, cn, "SELECT * FROM computers where comp_id  ='" & selected_id & "'")
    If Not rs.RecordCount = 0 Then
    'processor/motherboard serial/monitor serial/ram/keyboard(OK/None)/mouse(OK/None)/vga(BUILT-IN/NONE)/hdd-serial
        Text4.Text = rs.Fields("comp_serial")
        Combo2.Text = rs.Fields("os")
        Combo1.Text = rs.Fields("model")
        Text3.Text = rs.Fields("processor") & "/" & rs.Fields("motherboard") & "/" & rs.Fields("monitor") & "/" & rs.Fields("ram") & "/" & rs.Fields("kboard") & "/" & rs.Fields("mouse") & "/" & rs.Fields("vga") & "/" & rs.Fields("hdd")
    End If
End If
End Sub


Private Sub Text3_GotFocus()
showtoolTip Text3
End Sub

Private Sub Text3_KeyPress(KeyAscii As Integer)
showtoolTip Text3
End Sub

Private Sub showtoolTip(pTB As TextBox)
    With Me.txtToolTip
        .Height = Me.TextHeight(pTB.ToolTipText)
        .Width = Me.TextWidth(pTB.ToolTipText) + 100
        .Left = pTB.Left
        .Top = pTB.Top + pTB.Height
        .Text = pTB.ToolTipText
        .ZOrder
        .Visible = True
    End With
End Sub
Private Sub Text3_LostFocus()
    Me.txtToolTip.Visible = False
End Sub

