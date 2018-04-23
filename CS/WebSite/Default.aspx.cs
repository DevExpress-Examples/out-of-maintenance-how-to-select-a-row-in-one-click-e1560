using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using System;

public partial class _Default : System.Web.UI.Page
{
    protected void cbCheck_Load(object sender, EventArgs e)
    {
        ASPxCheckBox cb = sender as ASPxCheckBox;

        GridViewDataItemTemplateContainer container = cb.NamingContainer as GridViewDataItemTemplateContainer;
        cb.ClientInstanceName = String.Format("cbCheck{0}", container.VisibleIndex);
        cb.Checked = grid.Selection.IsRowSelected(container.VisibleIndex);

        // This line doesn't work because RowClick event is fired when the checkbox is going to be checked
        // cb.ClientSideEvents.CheckedChanged = String.Format("function (s, e) {{ grid.SelectRowOnPage ({0}, s.GetChecked()); }}", container.VisibleIndex);
    }
}
