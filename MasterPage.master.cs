using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["LogedNick"] != null)
        {
           Label1.Text = "Account, " + Session["LogedNick"];
            Label1.Visible = true;
            LinkButton1.Visible = true;
            LabelLogIn.Visible = false;
            LinkButtonAddpost.Visible = true;


        }

    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["LogedNick"] = null;
        Label1.Visible = false;
        LinkButton1.Visible = false;
        LabelLogIn.Visible = true;
        LinkButtonAddpost.Visible = false;
        Response.Redirect("index.aspx");
        
    }


}
