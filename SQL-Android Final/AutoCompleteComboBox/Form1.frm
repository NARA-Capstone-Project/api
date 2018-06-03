VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Auto Match"
   ClientHeight    =   510
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   2715
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   510
   ScaleWidth      =   2715
   StartUpPosition =   2  'CenterScreen
   Begin VB.ComboBox cb1 
      Height          =   315
      Left            =   720
      TabIndex        =   0
      Text            =   "cb1"
      Top             =   120
      Width           =   1905
   End
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      Caption         =   "Date: "
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   160
      Width           =   495
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub cb1_KeyPress(KeyAscii As Integer)
   KeyAscii = AutoMatchCBBox(cb1, KeyAscii)
End Sub

Private Sub Form_Initialize()
    Dim count As Integer, index  As Integer, aDate As Date
    Randomize
    count = Int((25 - 5 + 1) * Rnd) + 5
    aDate = Date
    Do While count > 0
        Randomize
        cb1.AddItem Format(aDate + Int(365 * Rnd), "mmm dd, yyyy")
        count = count - 1
    Loop
    cb1.ListIndex = 0
End Sub

