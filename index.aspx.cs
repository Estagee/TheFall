using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DaneZBazyDataList_ItemCommand(object source, DataListCommandEventArgs e)
    {
        DaneZBazyDataList.SelectedIndex = e.Item.ItemIndex;
        Session["ChoosedPost"] = ((Label)DaneZBazyDataList.SelectedItem.FindControl("LabelofSelectedItem")).Text.ToString();
        Response.Redirect("Comments.aspx?" + ((Label) DaneZBazyDataList.SelectedItem.FindControl("LabelofSelectedItem")).Text.ToString());
    }
}