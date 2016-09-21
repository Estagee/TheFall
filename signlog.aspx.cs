using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class signlog : System.Web.UI.Page
{
    DataView dview;
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        login();
    }
    public void login()
    {
        dview = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

        if ((DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty) != null)
        {
            if (dview.Table.Rows[0]["u_blokada"].Equals("1"))
            {
                LabelBan.Text = "You have been banned!";
            }
            else
            {
                Session["LogedNick"] = ((DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty)).Table.Rows[0]["u_nick"];
                Response.Redirect("index.aspx");
            }
        }
        //dview = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        //for (int i = 0; i < dview.Count; i++)
        //{
        //    if (dview.Table.Rows[i]["u_nick"].Equals(TextBoxLogNick.Text))
        //    {
        //        for (int j = 0; j < dview.Count; j++)
        //        {
        //            if (dview.Table.Rows[j]["u_password"].Equals(TextBoxLogPassword.Text))
        //            {
        //                Session["LogedNick"] = dview.Table.Rows[i]["u_nick"];
        //                Response.Redirect("index.aspx");
        //            }
        //        }
        //    }
        //}
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Panel1.Visible == true)
        {
            Panel1.Visible = false;
            Panel2.Visible = true; // panel z rejestracja
            Button1.Text = "Log in";
        }
        else
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            Button1.Text = "Sign in";

        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Label13.Text = "";
        Label12.Text = "";
        register();
    }
    public void register()
    {
        dview = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        if (dview.Count != 0)
        {
            //Label13.Text = "This nick is busy";
            //Response.Redirect("index.aspx");
            //dview = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            for (int i = 0; i < dview.Count; i++)
            {
                if (dview.Table.Rows[i]["u_nick"].Equals(TextBoxSignNick.Text))
                {
                    Label13.Text = "This nick is busy";
                }
                if (dview.Table.Rows[i]["u_e_mail"].Equals(TextBoxSignEmail.Text))
                {
                    Label12.Text = "This e-mail is busy";
                }

            }
            //SELECT u_nick FROM Uzytkownik WHERE(u_nick = @u_nicks) OR(u_e_mail = @u_e_mails)
        }
        else
        {
            SqlDataSource2.Insert();
            Label1.Visible = true;
            //Response.Redirect("index.aspx");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "success", "setInterval(function(){location.href='index.aspx';},5000);", true);
        }
    }
}