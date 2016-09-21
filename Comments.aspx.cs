using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Comments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ChoosedPost"].ToString().Equals("") || Session["ChoosedPost"] == null)
            Response.Redirect("index.aspx");
        else
        Label1.Text = Session["ChoosedPost"].ToString();
        if (Session["LogedNick"] != null)
        {
            Panel1.Visible = true;
        }
        else Panel1.Visible = false;
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        if (!TextBoxAddComment.Text.Equals(""))
        {
            SqlDataSource1.InsertCommand = " INSERT INTO Komentarze(k_note, Uzytkownik_id_uzytkownik, Posty_id_posty)VALUES('" + TextBoxAddComment.Text + "', (SELECT DISTINCT[id_uzytkownik] FROM[Uzytkownik] WHERE u_nick = '" + Session["LogedNick"] + "')," + Session["ChoosedPost"] + ")";
            SqlDataSource1.Insert();
            Label2.Visible = false;
            DataBind();
            //LabelCommentAdded.Visible = true;
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "success", "setInterval(function(){location.href='Comments.aspx';},5000);", true);
        }
        else Label2.Visible = true;
    }

    protected void DataListCommentsofPost_EditCommand(object source, DataListCommandEventArgs e)
    {
        DataListCommentsofPost.SelectedIndex = e.Item.ItemIndex;
        DataListCommentsofPost.SelectedItem.FindControl("ButtonEdit").Visible = false;
        DataListCommentsofPost.SelectedItem.FindControl("ButtonDelete").Visible = false;
        DataListCommentsofPost.SelectedItem.FindControl("ButtonSave").Visible = true;
        DataListCommentsofPost.SelectedItem.FindControl("ButtonCancel").Visible = true;
        //DataListCommentsofPost.SelectedItem.FindControl("TextBox1").Visible = false;
        DataListCommentsofPost.SelectedItem.FindControl("TextBox2").Visible = true;
    }

    protected void DataListCommentsofPost_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        DataListCommentsofPost.SelectedIndex = e.Item.ItemIndex;
        string oldcoment = ((TextBox)(DataListCommentsofPost.SelectedItem.FindControl("TextBox1"))).Text;
        string newcoment = ((TextBox)(DataListCommentsofPost.SelectedItem.FindControl("TextBox2"))).Text;  
        int idkomentarz = int.Parse( ((Label)(DataListCommentsofPost.SelectedItem.FindControl("LabelIdKomentarze"))).Text);

        if (!oldcoment.Equals(newcoment))
        {
            SqlDataSource2.UpdateCommand = "UPDATE Komentarze SET k_note = '" + newcoment +
           "', k_data = GetDate() FROM Komentarze INNER JOIN Posty ON Komentarze.Posty_id_posty = Posty.id_posty INNER JOIN Uzytkownik ON Komentarze.Uzytkownik_id_uzytkownik = Uzytkownik.id_uzytkownik WHERE (Komentarze.id_komentarze = "
           + idkomentarz + ")";
            SqlDataSource2.Update();
            DataBind();
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "success", "setInterval(function(){location.href='Comments.aspx';},5000);", true);
        }
        
    }

    protected void DataListCommentsofPost_CancelCommand(object source, DataListCommandEventArgs e)
    {
        DataListCommentsofPost.SelectedItem.FindControl("TextBox2").Visible = false;
        DataListCommentsofPost.SelectedItem.FindControl("ButtonEdit").Visible = true;
        DataListCommentsofPost.SelectedItem.FindControl("ButtonDelete").Visible = true;
        DataListCommentsofPost.SelectedItem.FindControl("ButtonSave").Visible = false;
        DataListCommentsofPost.SelectedItem.FindControl("ButtonCancel").Visible = false;
    }

    protected void DataListCommentsofPost_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        DataListCommentsofPost.SelectedIndex = e.Item.ItemIndex;
        int idkomentarz = int.Parse(((Label)(DataListCommentsofPost.SelectedItem.FindControl("LabelIdKomentarze"))).Text);
        SqlDataSource2.UpdateCommand = "UPDATE Komentarze SET k_usun = 1 FROM Komentarze INNER JOIN Posty ON Komentarze.Posty_id_posty = Posty.id_posty INNER JOIN Uzytkownik ON Komentarze.Uzytkownik_id_uzytkownik = Uzytkownik.id_uzytkownik WHERE (Komentarze.id_komentarze = "
        + idkomentarz + ")";
        SqlDataSource2.Update();
        DataBind();
    }

}
