using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Addpost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LogedNick"] == null || Session["LogedNick"].Equals(""))
        {
            Response.Redirect("index.aspx");
        }
        else {
            Button2.Visible = false;
            ImageButton1.Visible = false;
            //TextBoxLink.Text = "";
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        ImageButton1.ImageUrl = TextBoxLink.Text;
        ImageButton1.Visible = true;
        Button2.Visible = true;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        // p_data
        SqlDataSource1.InsertCommand = "INSERT INTO Posty(p_link, Uzytkownik_id_uzytkownik) VALUES('" + TextBoxLink.Text + "', (SELECT DISTINCT[id_uzytkownik] FROM[Uzytkownik] WHERE u_nick = '" + Session["LogedNick"] + "'))";
        SqlDataSource1.Insert();
        Label1.Visible = true;
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "success", "setInterval(function(){location.href='index.aspx';},5000);", true);
    }
}