using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account : System.Web.UI.Page
{
    DataView dvSql;
    public String dsadas = "sadsdaads";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LogedNick"] == null || Session["LogedNick"].Equals(""))
        {
            Response.Redirect("index.aspx");
        }
        else {
            dvSql = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql in dvSql)
            {
                LabelNick.Text = drvSql["u_nick"].ToString();
                LabelEmail.Text = drvSql["u_e_mail"].ToString();
                if (drvSql["u_admin"].Equals("1")) ButtonAdmin.Visible = true;
                else ButtonAdmin.Visible = false;
            }
        }
    }



    protected void ButtonChangePassword_Click(object sender, EventArgs e)
    {
        PanelChangePassword.Visible = true;
        PanelChangeemail.Visible = false;
    }

    protected void ButtonChangeEmail_Click(object sender, EventArgs e)
    {
        PanelChangeemail.Visible = true;
        PanelChangePassword.Visible = false;
    }

    protected void ButtonCancelPassword_Click(object sender, EventArgs e)
    {
        PanelChangePassword.Visible = false;
        PanelChangeemail.Visible = false;
        DataBind();
        Response.Redirect("Account.aspx");
    }

    protected void ButtonSavePassword_Click(object sender, EventArgs e)
    {
        SqlDataSource1.UpdateCommand = "UPDATE Uzytkownik SET u_password = @u_password WHERE u_nick = '" + Session["LogedNick"] + "'";
        SqlDataSource1.Update();
        LabelChangePassword.Visible = true;
        PanelChangePassword.Visible = false;
        DataBind();
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "success", "setInterval(function(){location.href='Account.aspx';},3000);", true);
    }

    protected void ButtonCancelEmail_Click(object sender, EventArgs e)
    {
        PanelChangePassword.Visible = false;
        PanelChangeemail.Visible = false;
        DataBind();
        Response.Redirect("Account.aspx");
    }

    protected void ButtonSaveEmail_Click(object sender, EventArgs e)
    {
        dvSql = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        if (dvSql.Count != 0)
        {
            LabelEmailBusy.Visible = true;
        }
        else
        {
            SqlDataSource1.UpdateCommand = "UPDATE Uzytkownik SET u_e_mail = @u_e_mail WHERE u_nick = '" + Session["LogedNick"] + "'";
            SqlDataSource1.Update();
            LabelChangeEmail.Visible = true;
            PanelChangeemail.Visible = false;
            DataBind();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "success", "setInterval(function(){location.href='Account.aspx';},3000);", true);
        }
    }

    protected void DaneZBazyDataList_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        DaneZBazyDataList.SelectedIndex = e.Item.ItemIndex;
        int idkomentarz = int.Parse(((Label)(DaneZBazyDataList.SelectedItem.FindControl("LabelofSelectedItem"))).Text);
        SqlDataSource3.UpdateCommand = "UPDATE Posty SET p_usun = 1 WHERE (Posty.id_posty = "
        + idkomentarz + "); UPDATE Komentarze SET k_usun=1 WHERE (Posty_id_posty = " + idkomentarz + ")";
        SqlDataSource3.Update();
        DataBind();
    }

    protected void ButtonYourPost_Click(object sender, EventArgs e)
    {
        DataBind();
        PanelPosts.Visible = true;
        PanelAccount.Visible = false;
        PanelComments.Visible = false;
        PanelAdmin.Visible = false;
    }

    protected void ButtonAccount_Click(object sender, EventArgs e)
    {
        DataBind();
        PanelPosts.Visible = false;
        PanelAccount.Visible = true;
        PanelComments.Visible = false;
        PanelAdmin.Visible = false;
    }



    protected void DataListCommentsofPost_CancelCommand(object source, DataListCommandEventArgs e)
    {
        DataList1.SelectedItem.FindControl("TextBox2").Visible = false;
        DataList1.SelectedItem.FindControl("ButtonEdit").Visible = true;
        DataList1.SelectedItem.FindControl("ButtonDelete").Visible = true;
        DataList1.SelectedItem.FindControl("ButtonSave").Visible = false;
        DataList1.SelectedItem.FindControl("ButtonCancel").Visible = false;
    }

    protected void DataListCommentsofPost_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        DataList1.SelectedIndex = e.Item.ItemIndex;
        int idkomentarz = int.Parse(((Label)(DataList1.SelectedItem.FindControl("LabelIdKomentarze"))).Text);
        SqlDataSource4.UpdateCommand = "UPDATE Komentarze SET k_usun = 1 FROM Komentarze INNER JOIN Posty ON Komentarze.Posty_id_posty = Posty.id_posty INNER JOIN Uzytkownik ON Komentarze.Uzytkownik_id_uzytkownik = Uzytkownik.id_uzytkownik WHERE (Komentarze.id_komentarze = "
        + idkomentarz + ")";
        SqlDataSource4.Update();
        DataBind();
    }

    protected void DataListCommentsofPost_EditCommand(object source, DataListCommandEventArgs e)
    {
        DataList1.SelectedIndex = e.Item.ItemIndex;
        DataList1.SelectedItem.FindControl("ButtonEdit").Visible = false;
        DataList1.SelectedItem.FindControl("ButtonDelete").Visible = false;
        DataList1.SelectedItem.FindControl("ButtonSave").Visible = true;
        DataList1.SelectedItem.FindControl("ButtonCancel").Visible = true;
        //DataListCommentsofPost.SelectedItem.FindControl("TextBox1").Visible = false;
        DataList1.SelectedItem.FindControl("TextBox2").Visible = true;
    }

    protected void DataListCommentsofPost_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        DataList1.SelectedIndex = e.Item.ItemIndex;
        string oldcoment = ((TextBox)(DataList1.SelectedItem.FindControl("TextBox1"))).Text;
        string newcoment = ((TextBox)(DataList1.SelectedItem.FindControl("TextBox2"))).Text;
        int idkomentarz = int.Parse(((Label)(DataList1.SelectedItem.FindControl("LabelIdKomentarze"))).Text);

        if (!oldcoment.Equals(newcoment))
        {
            SqlDataSource4.UpdateCommand = "UPDATE Komentarze SET k_note = '" + newcoment +
           "', k_data = GetDate() FROM Komentarze INNER JOIN Posty ON Komentarze.Posty_id_posty = Posty.id_posty INNER JOIN Uzytkownik ON Komentarze.Uzytkownik_id_uzytkownik = Uzytkownik.id_uzytkownik WHERE (Komentarze.id_komentarze = "
           + idkomentarz + ")";
            SqlDataSource4.Update();
            DataBind();
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "success", "setInterval(function(){location.href='Comments.aspx';},5000);", true);
        }
    }

    protected void ButtonYourComments_Click(object sender, EventArgs e)
    {
        DataBind();
        PanelPosts.Visible = false;
        PanelAccount.Visible = false;
        PanelComments.Visible = true;
        //admin
    }

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "przejdzdo")
        {
            DataList1.SelectedIndex = e.Item.ItemIndex;
            Session["ChoosedPost"] = ((Label)DataList1.SelectedItem.FindControl("LabelIdPosty")).Text.ToString();
            Response.Redirect("Comments.aspx?" + ((Label)DataList1.SelectedItem.FindControl("LabelIdPosty")).Text.ToString());
        }
    }

    protected void DaneZBazyDataList_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "ShowComments")
        {
            DaneZBazyDataList.SelectedIndex = e.Item.ItemIndex;
            Session["ChoosedPost"] = ((Label)DaneZBazyDataList.SelectedItem.FindControl("LabelofSelectedItem")).Text.ToString();
            Response.Redirect("Comments.aspx?" + ((Label)DaneZBazyDataList.SelectedItem.FindControl("LabelofSelectedItem")).Text.ToString());
        }

    }

    protected void ButtonAdmin_Click(object sender, EventArgs e)
    {
        DataBind();
        PanelPosts.Visible = false;
        PanelAccount.Visible = false;
        PanelComments.Visible = false;
        PanelAdmin.Visible = true;
    }


    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlDataSource7.Delete();
        GridView2.DataBind();
    }
}