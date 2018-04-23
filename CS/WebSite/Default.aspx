﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to select a row in one click</title>

    <script language="javascript" type="text/javascript">
        function OnRowClick(s, e) {
            e.cancel = true;
            s.SelectRowOnPage(e.visibleIndex, !s._isRowSelected(e.visibleIndex));

            var cbSelName = "cbCheck" + e.visibleIndex;

            if (eval(cbSelName).GetInputElement() != null)
                eval(cbSelName).SetChecked(s._isRowSelected(e.visibleIndex));
        }    
    </script>

</head>
<body>
    <form id="frm" runat="server">
    <div>
        <dxwgv:ASPxGridView ID="grid" runat="server" ClientInstanceName="grid" AutoGenerateColumns="False"
            DataSourceID="sds" KeyFieldName="ProductID">
            <Columns>
                <dxwgv:GridViewDataTextColumn Caption="#" VisibleIndex="0">
                    <DataItemTemplate>
                        <dxe:ASPxCheckBox ID="cbCheck" runat="server" AutoPostBack="false" OnLoad="cbCheck_Load" />
                    </DataItemTemplate>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="2">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="QuantityPerUnit" VisibleIndex="3">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="4">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="UnitsInStock" VisibleIndex="5">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="UnitsOnOrder" VisibleIndex="6">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="ReorderLevel" VisibleIndex="7">
                </dxwgv:GridViewDataTextColumn>
            </Columns>
            <ClientSideEvents RowClick="OnRowClick" />
        </dxwgv:ASPxGridView>
        <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>"
            SelectCommand="SELECT [ProductID], [ProductName], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel] FROM [Products]">
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
