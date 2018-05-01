Attribute VB_Name = "Module1"
Global report_type As String
Global comp_status As String
Global current_id As String
Global current_role As String
Global current_name As String
Global current_user_name As String
Global selected_id As String
Global selected_comp_id As String
Global selected_status As String
Global selected_request As String
Global selected_name As String
Global rs As New ADODB.Recordset
Global rs2 As New ADODB.Recordset
Global cn As New ADODB.Connection
Global form_type As String
Public Function ConnectMySQL()
Dim Server As String
Dim User As String
Dim Password As String
Dim Database As String
'On Error GoTo errhandler

cn.CursorLocation = adUseClient
Server = "192.168.0.12"
User = "user"
Password = "naraCapstone"
Database = "cict"
cn.Open "DRIVER={MySQL ODBC 5.3 Unicode Driver};Server=" & Server & ";UID=" & User & ";PWD=" & Password & ";Database=" & Database


Exit Function

errhandler:
If Err.Number = "-2147467259" Then
    MsgBox "Server is not running please try again later", vbExclamation
    End
Else
MsgBox Err.Description, vbCritical
End If
End Function

Public Sub set_rec_getData(ByRef sRecordset As ADODB.Recordset, ByRef sConnection As ADODB.Connection, ByVal sSQL As String)
With rs
    .CursorLocation = adUseClient
    .Open sSQL, sConnection, adOpenKeyset, adLockOptimistic
End With
End Sub
Public Sub set_rec_getData2(ByRef sRecordset As ADODB.Recordset, ByRef sConnection As ADODB.Connection, ByVal sSQL As String)
With rs2
    .CursorLocation = adUseClient
    .Open sSQL, sConnection, adOpenKeyset, adLockOptimistic
End With
End Sub
