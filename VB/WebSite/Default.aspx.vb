Imports Microsoft.VisualBasic
Imports DevExpress.Web
Imports System

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub cbCheck_Load(ByVal sender As Object, ByVal e As EventArgs)
		Dim cb As ASPxCheckBox = TryCast(sender, ASPxCheckBox)

		Dim container As GridViewDataItemTemplateContainer = TryCast(cb.NamingContainer, GridViewDataItemTemplateContainer)
		cb.ClientInstanceName = String.Format("cbCheck{0}", container.VisibleIndex)
		cb.Checked = grid.Selection.IsRowSelected(container.VisibleIndex)

		' This line doesn't work because RowClick event is fired when the checkbox is going to be checked
		' cb.ClientSideEvents.CheckedChanged = String.Format("function (s, e) {{ grid.SelectRowOnPage ({0}, s.GetChecked()); }}", container.VisibleIndex);
	End Sub
End Class
